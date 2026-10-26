"""Render the README banner and GitHub social preview for a Tim Warner live-training repo.

Usage:
    python scripts/make_banner.py --spec images/brand.json --out images

Why this exists:
    Every course repo in the Pearson live-training series shares one visual identity:
    the same night-sky palette, eyebrow line, gradient title, capability hub, and
    TechTrainerTim.com footer. Only the words and the hub's five nodes change per course,
    and those live in a small JSON spec. Keeping the art in code (not a design file)
    means a new course gets a matching banner in one command, and a diff shows exactly
    what changed.

    GitHub renders an <img> SVG with the *viewer's* fonts, so a hand-built SVG banner
    looks different on every machine. We compose the art as SVG, then rasterize it once
    with headless Chromium so every learner sees identical pixels.

Requirements:
    Python 3.10+, Playwright for Python with Chromium, and the Inter and Inter Display
    font families installed. The starfield uses a fixed seed, so re-renders are
    byte-stable for Git.

Outputs (into --out):
    banner.png          1600x568, shown at width=800 in the README (2x for HiDPI)
    social-preview.png  1280x640, GitHub's recommended Open Graph size
    banner.svg, social-preview.svg   the vector sources, kept for review

Accessibility:
    Every hub node carries a text label, so no meaning rides on color alone
    (red/green safe). Body text contrast stays above WCAG AA on the dark background.
"""
from __future__ import annotations

import argparse
import html
import json
import math
import random
import sys
from pathlib import Path

# One palette for the whole series, defined once, so courses can't drift apart.
BG_LEFT = "#0A0F24"
BG_RIGHT = "#1B1340"
INK = "#F8FAFC"
MUTED = "#A5B4FC"
EYEBROW = "#7DD3FC"
NODE_FILL = "#111735"


def esc(text: str) -> str:
    """Escape course text for SVG, so an ampersand in a title can't break the file."""
    return html.escape(text, quote=False)


def icon(kind: str, x: float, y: float, color: str) -> str:
    """Draw a small glyph centered on (x, y). Paths avoid font-dependent symbols."""
    stroke = f'fill="none" stroke="{color}" stroke-width="2.4" stroke-linejoin="round" stroke-linecap="round"'
    if kind == "braces":
        return (f'<text x="{x}" y="{y + 7}" text-anchor="middle" font-family="DejaVu Sans Mono" '
                f'font-weight="700" font-size="19" fill="{color}">{{}}</text>')
    if kind == "prompt":
        return (f'<text x="{x}" y="{y + 7}" text-anchor="middle" font-family="DejaVu Sans Mono" '
                f'font-weight="700" font-size="19" fill="{color}">&gt;_</text>')
    if kind == "doc":
        return (f'<g {stroke}><path d="M{x-8} {y-11} h11 l6 6 v16 h-17 z"/>'
                f'<path d="M{x-4} {y} h9 M{x-4} {y+5} h9"/></g>')
    if kind == "db":
        return (f'<g {stroke}><ellipse cx="{x}" cy="{y-8}" rx="10" ry="4"/>'
                f'<path d="M{x-10} {y-8} v15 a10 4 0 0 0 20 0 v-15"/>'
                f'<path d="M{x-10} {y} a10 4 0 0 0 20 0"/></g>')
    if kind == "shield":
        return (f'<g {stroke}><path d="M{x} {y-12} l10 4 v6 c0 7 -5 11 -10 13 c-5 -2 -10 -6 -10 -13 v-6 z"/>'
                f'<path d="M{x-4} {y} l3 3 l6 -6"/></g>')
    if kind == "key":
        return (f'<g {stroke}><circle cx="{x-5}" cy="{y}" r="5.5"/>'
                f'<path d="M{x+0.5} {y} h11 M{x+7.5} {y} v5 M{x+11} {y} v4"/></g>')
    if kind == "bot":
        return (f'<g {stroke}><rect x="{x-10}" y="{y-6}" width="20" height="15" rx="4"/>'
                f'<path d="M{x} {y-6} v-5"/><circle cx="{x}" cy="{y-12}" r="1.6" fill="{color}"/>'
                f'<circle cx="{x-4}" cy="{y+1}" r="1.6" fill="{color}" stroke="none"/>'
                f'<circle cx="{x+4}" cy="{y+1}" r="1.6" fill="{color}" stroke="none"/></g>')
    if kind == "pulse":
        return (f'<polyline {stroke} points="{x-12},{y+1} {x-6},{y+1} {x-3},{y-8} {x+2},{y+9} '
                f'{x+5},{y+1} {x+12},{y+1}"/>')
    raise ValueError(f"Unknown icon kind: {kind}")


def stars(width: int, height: int, count: int, seed: int) -> str:
    """Scatter a fixed starfield. A seed keeps re-renders byte-stable for Git."""
    rng = random.Random(seed)
    dots = []
    for _ in range(count):
        cx, cy = rng.uniform(0, width), rng.uniform(0, height * 0.78)
        r, o = rng.choice([0.8, 1.0, 1.3, 1.7]), rng.uniform(0.15, 0.6)
        dots.append(f'<circle cx="{cx:.1f}" cy="{cy:.1f}" r="{r}" fill="#E0E7FF" opacity="{o:.2f}"/>')
    return "".join(dots)


def grid(width: int, height: int, horizon: float) -> str:
    """Retro perspective floor: a quiet 80s nod that fades out before the text."""
    vx = width * 0.5
    lines = [f'<line x1="{vx}" y1="{horizon}" x2="{vx + i * width / 9:.1f}" y2="{height}"/>' for i in range(-14, 15)]
    # Horizontal rungs get closer together toward the horizon, like real perspective.
    for k in range(1, 9):
        y = horizon + (height - horizon) * (k / 8) ** 1.8
        lines.append(f'<line x1="0" y1="{y:.1f}" x2="{width}" y2="{y:.1f}"/>')
    return f'<g stroke="url(#gridFade)" stroke-width="1.2" opacity="0.55">{"".join(lines)}</g>'


def hub(spec: dict, cx: float, cy: float, radius: float, scale: float = 1.0) -> str:
    """The course's center concept with five labeled nodes on an orbit, read clockwise from the top."""
    nodes = spec["nodes"]
    parts = [f'<circle cx="{cx}" cy="{cy}" r="{radius}" fill="none" stroke="#818CF8" '
             f'stroke-opacity="0.35" stroke-width="1.5" stroke-dasharray="4 8"/>']
    node_h = 56 * scale
    step = 360 / len(nodes)
    for i, (label, color, kind) in enumerate(nodes):
        # Size each node to its own label so long names never overflow the box.
        node_w = (54 + len(label) * 13.2 + 20) * scale
        angle = math.radians(-90 + i * step)
        nx, ny = cx + radius * math.cos(angle), cy + radius * math.sin(angle)
        parts.append(f'<line x1="{cx}" y1="{cy}" x2="{nx:.1f}" y2="{ny:.1f}" stroke="{color}" '
                     f'stroke-opacity="0.55" stroke-width="2"/>')
        px, py = cx + radius * 0.55 * math.cos(angle), cy + radius * 0.55 * math.sin(angle)
        parts.append(f'<circle cx="{px:.1f}" cy="{py:.1f}" r="{4 * scale}" fill="{color}"/>')
        x0, y0 = nx - node_w / 2, ny - node_h / 2
        parts.append(f'<rect x="{x0:.1f}" y="{y0:.1f}" width="{node_w:.1f}" height="{node_h:.1f}" rx="{14 * scale}" '
                     f'fill="{NODE_FILL}" stroke="{color}" stroke-width="2"/>')
        parts.append(icon(kind, x0 + 28 * scale, ny, color))
        parts.append(f'<text x="{x0 + 54 * scale:.1f}" y="{ny + 6 * scale:.1f}" font-family="Inter" font-weight="700" '
                     f'font-size="{17 * scale:.1f}" letter-spacing="1.5" fill="{INK}">{esc(label)}</text>')
    hub_r = 80 * scale
    label = spec["hub"]
    # Shrink the center label for longer words so it always sits inside the ring.
    size = min(44, 230 / max(len(label), 3)) * scale
    parts.append(f'<circle cx="{cx}" cy="{cy}" r="{hub_r + 26 * scale}" fill="url(#hubGlow)"/>')
    parts.append(f'<circle cx="{cx}" cy="{cy}" r="{hub_r}" fill="#0E1433" stroke="url(#titleGrad)" stroke-width="4"/>')
    parts.append(f'<text x="{cx}" y="{cy + size * 0.33:.1f}" text-anchor="middle" font-family="Inter Display" '
                 f'font-weight="800" font-size="{size:.1f}" fill="{INK}">{esc(label)}</text>')
    return "".join(parts)


def chips(items: list[str], x: float, y: float, size: float) -> str:
    """Pill row naming what the course actually uses, so the banner informs, not decorates."""
    out, cursor = [], x
    for text in items:
        w = len(text) * size * 0.56 + size * 1.6
        out.append(f'<rect x="{cursor:.1f}" y="{y}" width="{w:.1f}" height="{size * 2:.1f}" rx="{size}" '
                   f'fill="#1E2550" fill-opacity="0.85" stroke="#6366F1" stroke-opacity="0.6"/>')
        out.append(f'<text x="{cursor + w / 2:.1f}" y="{y + size * 1.36:.1f}" text-anchor="middle" '
                   f'font-family="Inter" font-weight="600" font-size="{size}" fill="#E0E7FF">{esc(text)}</text>')
        cursor += w + size * 0.7
    return "".join(out)


def defs() -> str:
    return f"""
<defs>
  <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
    <stop offset="0" stop-color="{BG_LEFT}"/><stop offset="1" stop-color="{BG_RIGHT}"/>
  </linearGradient>
  <radialGradient id="glowA" cx="0.12" cy="0.2" r="0.55">
    <stop offset="0" stop-color="#0EA5E9" stop-opacity="0.28"/><stop offset="1" stop-color="#0EA5E9" stop-opacity="0"/>
  </radialGradient>
  <radialGradient id="glowB" cx="0.82" cy="0.5" r="0.5">
    <stop offset="0" stop-color="#8B5CF6" stop-opacity="0.35"/><stop offset="1" stop-color="#8B5CF6" stop-opacity="0"/>
  </radialGradient>
  <radialGradient id="hubGlow">
    <stop offset="0.6" stop-color="#22D3EE" stop-opacity="0.35"/><stop offset="1" stop-color="#22D3EE" stop-opacity="0"/>
  </radialGradient>
  <linearGradient id="titleGrad" x1="0" y1="0" x2="1" y2="0">
    <stop offset="0" stop-color="#22D3EE"/><stop offset="0.55" stop-color="#818CF8"/><stop offset="1" stop-color="#E879F9"/>
  </linearGradient>
  <linearGradient id="gridFade" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#22D3EE" stop-opacity="0"/><stop offset="1" stop-color="#A78BFA" stop-opacity="0.9"/>
  </linearGradient>
</defs>"""


def frame(spec: dict, width: int, height: int, horizon: float, body: str) -> str:
    return (f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
            f'viewBox="0 0 {width} {height}">{defs()}'
            f'<rect width="{width}" height="{height}" fill="url(#bg)"/>'
            f'<rect width="{width}" height="{height}" fill="url(#glowA)"/>'
            f'<rect width="{width}" height="{height}" fill="url(#glowB)"/>'
            f'{stars(width, height, 90, seed=spec.get("seed", 1042))}{grid(width, height, horizon)}{body}</svg>')


def title_block(lines: list[str], accent: str, x: float, first_y: float, size: float, leading: float) -> tuple[str, float]:
    """White title lines, then the accent line in the series gradient. Returns SVG and the next y."""
    out, y = [], first_y
    for line in lines:
        out.append(f'<text x="{x}" y="{y:.1f}" font-family="Inter Display" font-weight="800" '
                   f'font-size="{size}" fill="{INK}">{esc(line)}</text>')
        y += leading
    out.append(f'<text x="{x}" y="{y:.1f}" font-family="Inter Display" font-weight="800" '
               f'font-size="{size}" fill="url(#titleGrad)">{esc(accent)}</text>')
    return "".join(out), y


def banner(spec: dict) -> str:
    """Wide README banner: title block left, course hub right."""
    w, h = 1600, 568
    b = spec["banner"]
    size, leading = b["title_size"], b["title_leading"]
    title, last_y = title_block(b["title_lines"], b["title_accent"], 86, b["title_top"], size, leading)
    tag_y = last_y + 54
    text = (f'<text x="90" y="{b["title_top"] - size - 8:.1f}" font-family="Inter" font-weight="700" font-size="21" '
            f'letter-spacing="5" fill="{EYEBROW}">{esc(spec["eyebrow"])}</text>'
            f'{title}'
            f'<text x="90" y="{tag_y:.1f}" font-family="Inter" font-weight="500" font-size="27" '
            f'fill="{MUTED}">{esc(spec["tagline"])}</text>'
            f'{chips(spec["chips"], 90, tag_y + 30, 17)}'
            f'<text x="90" y="526" font-family="Inter" font-weight="600" font-size="20" '
            f'fill="#C7D2FE" opacity="0.85">{esc(spec["footer"])}</text>')
    # A wider orbit keeps long labels (MONITORING, RESOURCES) clear of the hub ring.
    return frame(spec, w, h, 476, text + hub(spec, b["hub_x"], 286, b.get("hub_radius", 190)))


def social(spec: dict) -> str:
    """1280x640 Open Graph card: stacked title so the hub keeps clear space."""
    w, h = 1280, 640
    s = spec["social"]
    size, leading = s["title_size"], s["title_leading"]
    title, last_y = title_block(s["title_lines"], s["title_accent"], 70, s["title_top"], size, leading)
    text = (f'<text x="76" y="{s["title_top"] - size - 12:.1f}" font-family="Inter" font-weight="700" font-size="21" '
            f'letter-spacing="5" fill="{EYEBROW}">{esc(spec["eyebrow"])}</text>'
            f'{title}'
            f'<text x="76" y="{last_y + 56:.1f}" font-family="Inter" font-weight="500" font-size="25" '
            f'fill="{MUTED}">{esc(spec["tagline"])}</text>'
            f'<text x="76" y="586" font-family="Inter" font-weight="600" font-size="21" '
            f'fill="#C7D2FE" opacity="0.85">{esc(spec["footer"])}</text>')
    return frame(spec, w, h, 520, text + hub(spec, s["hub_x"], 318, s["hub_radius"], scale=s["hub_scale"]))


def render(svg: str, out: Path, width: int, height: int) -> None:
    """Rasterize with headless Chromium so installed fonts resolve exactly once."""
    from playwright.sync_api import sync_playwright  # Imported late: only needed to render.
    page_html = f'<html><body style="margin:0;background:#000">{svg}</body></html>'
    with sync_playwright() as p:
        browser = p.chromium.launch()
        try:
            page = browser.new_page(viewport={"width": width, "height": height})
            page.set_content(page_html)
            page.evaluate("document.fonts.ready")
            page.screenshot(path=str(out), clip={"x": 0, "y": 0, "width": width, "height": height})
        finally:
            browser.close()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--spec", type=Path, required=True, help="Course brand spec (JSON)")
    parser.add_argument("--out", type=Path, required=True, help="Folder for banner.png and social-preview.png")
    args = parser.parse_args()
    try:
        spec = json.loads(args.spec.read_text(encoding="utf-8"))
        args.out.mkdir(parents=True, exist_ok=True)
        for name, svg, size in (("banner", banner(spec), (1600, 568)), ("social-preview", social(spec), (1280, 640))):
            (args.out / f"{name}.svg").write_text(svg, encoding="utf-8")
            render(svg, args.out / f"{name}.png", *size)
            print(f"Wrote {args.out / (name + '.png')}")
        return 0
    except Exception as error:  # Surface one clear failure line for a build step.
        print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
