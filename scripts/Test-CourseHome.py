"""Check the Pearson course-home documents, the starter files, and the public boundary.

Run ``python scripts/Test-CourseHome.py`` from any working directory.

WHY this exists: the course home is what Pearson learners open first, from a fresh
public clone. A broken anchor, a starter file that drifted, or an instructor file
that slipped into the public index is invisible on the author's machine (where the
ignored files exist) and obvious to every learner. This script checks only tracked
public files, so it needs no instructor installation, publisher assets, tenant, or
cloud access. Same contract as the context-engineering-with-mcp course home.

Exit code 0 on success, 1 with one FAIL line on the first problem found.
"""
from html import unescape
from html.parser import HTMLParser
from pathlib import Path
import csv
import hashlib
import io
import re
import subprocess
import sys
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]

# The learner front door. Each must be tracked and every local link in it must work.
COURSE_HOME_DOCS = ["README.md", "TUTORIALS.md", "AGENTS.md", "NOTICE.md", "starter-files/README.md",
                    "handouts/README.md", "evidence/README.md"]
# Documents written for the Pearson course home, held to the repository writing rules
# in full. README.md is checked from its byline to the end (see PEARSON_SECTION), so the
# banner HTML and badge URLs above the byline are exempt.
STRICT_DOCS = ["TUTORIALS.md", "AGENTS.md", "NOTICE.md", "starter-files/README.md", "handouts/README.md",
               "evidence/README.md"]
PEARSON_SECTION = (r"^Tim Warner \| Pearson Enterprise Live Training", r"\Z")

# The series identity: every Pearson course repo ships the same two generated images, at
# the same sizes, from a tracked generator and spec. GitHub shows the social preview when
# the repo link is shared, and the README shows the banner at width 800 (2x for HiDPI).
BRAND_IMAGES = {"images/banner.png": (1600, 568), "images/social-preview.png": (1280, 640)}
BRAND_SOURCES = ["images/brand.json", "scripts/make_banner.py"]
EVIDENCE = "evidence/2026-10-26-agent-tests.csv"

STARTER_FILES = {
    "starter-files/contoso-service-guide.txt",
    "starter-files/agent-instructions.txt",
    "starter-files/agent-test-cases.csv",
    "starter-files/synthetic-sharing-report.csv",
}
# The handouts Pearson distributes in the session Resources widget (sent October 19,
# 2026). Learners must get the same bytes here, so any re-export or edit fails the
# check. Corrections belong in handouts/README.md, never in the PDFs.
HANDOUTS = {
    "handouts/01-Admin-Portal-Map.pdf": "265776fd1964070b47392a2b61d210e35eb2c235f4554712d9b20aa1adbc01ca",
    "handouts/02-Admin-and-Purview-Walkthrough.pdf": "bb39e9f4e6c5766df2043c8e0d2ac71007f0a3a76258ea0ec69df58df996a269",
    "handouts/03-Sample-DLP-and-DSPM-Configurations.pdf": "85fb67fd9d30354872bdc865bc08531316c53da4e71630fe7d119f999770e85a",
    "handouts/04-Starter-Agent-Configuration.pdf": "c8932ebc5e61f8ffde6ab76651af1a7b87385cced5e3fae75fb0fe642d5fe9ce",
}
TEST_HEADER = ["ID", "Category", "Prompt", "Acceptance criterion", "Observed result", "Status"]
MARKER = "SERVICE-ORCHID-42"

# Same list the repository's validate.yml uses, so local and CI agree.
CONTRACTIONS = re.compile(
    r"\b(don't|doesn't|won't|wouldn't|shouldn't|couldn't|isn't|aren't|wasn't|weren't|hasn't|"
    r"haven't|hadn't|can't|it's|that's|there's|here's|what's|who's|let's|we're|they're|you're|"
    r"I'm|we've|they've|you've|I've|we'll|they'll|you'll|I'll)\b", re.IGNORECASE)


def require(condition: bool, message: str) -> None:
    """Keep validation active even when Python runs with -O (assert would be stripped)."""
    if not condition:
        raise ValueError(message)


class Document(HTMLParser):
    """Collect explicit anchors and HTML links, including HTML embedded in Markdown."""
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.links: list[str] = []
        self.ids: set[str] = set()

    def handle_starttag(self, tag, attrs) -> None:
        attributes = dict(attrs)
        if attributes.get("id"):
            self.ids.add(attributes["id"])
        if tag == "a" and attributes.get("href"):
            self.links.append(attributes["href"])
        if tag == "img" and attributes.get("src"):
            self.links.append(attributes["src"])


def read_document(path: Path) -> tuple[list[str], set[str]]:
    """Return (links, anchor ids), resolving GitHub-style heading slugs. Code blocks are skipped."""
    source = path.read_text(encoding="utf-8-sig")
    source = re.sub(r"^```[^\n]*\n.*?^```\s*$", "", source, flags=re.MULTILINE | re.DOTALL)
    parsed = Document()
    parsed.feed(source)
    links = re.findall(r"!?\[[^\]]*\]\(\s*(<[^>]+>|[^\s)]+)(?:\s+\"[^\"]*\")?\s*\)", source)
    parsed.links.extend(value.strip("<>") for value in links)
    duplicates: dict[str, int] = {}
    for title in re.findall(r"^#{1,6}\s+(.+?)(?:\s+#+)?\s*$", source, flags=re.MULTILINE):
        title = re.sub(r"\[([^\]]+)\]\([^)]+\)", r"\1", title)
        slug = re.sub(r"[^\w\s-]", "", unescape(title).lower()).replace(" ", "-")
        count = duplicates.get(slug, 0)
        duplicates[slug] = count + 1
        parsed.ids.add(f"{slug}-{count}" if count else slug)
    return parsed.links, parsed.ids


def tracked_paths() -> list[str]:
    """Use the Git index, so an accidental private addition fails before it is pushed."""
    result = subprocess.run(["git", "-C", str(ROOT), "ls-files", "-z"], check=True, capture_output=True)
    return [value for value in result.stdout.decode("utf-8").split("\0") if value]


def check_privacy(paths: list[str]) -> None:
    """Reject instructor operations, publisher files, and credentials without reading them."""
    for name in paths:
        parts = Path(name).parts
        require(not {".local", ".pearson-build", ".git-pearson", "correspondence"} & set(parts),
                f"Private path is tracked: {name}")
        require(not name.startswith("deliveries/2026-10-pearson/"),
                f"Private Pearson delivery file is tracked: {name}")
        require(not re.search(r"(^|/)\.env(?:\.|$)|\.(pem|key|pfx|p12)$", name, re.IGNORECASE),
                f"Credential file is tracked: {name}")
        # Office writes a ~$ owner file (it carries the editor's name) while a document is open.
        require(not re.search(r"(^|/)~\$", name), f"Office lock file is tracked: {name}")
        require(not re.search(r"Start-Presenter|submitted-files\.json|cvent-polls|current-runbook", name),
                f"Instructor operations must remain local: {name}")
        require(not re.search(r"(Copilot-and-Agent-Administration-Fundamentals-v\d+|Warner-Copilot-Agent-Administration)", name),
                f"Publisher deck or handout is tracked: {name}")
    for name in (".local/instructor/private.txt", "deliveries/2026-10-pearson/README.md",
                 ".pearson-build/2026-10/notes.txt", ".git-pearson/config"):
        ignored = subprocess.run(["git", "-C", str(ROOT), "check-ignore", "--quiet", "--no-index", "--", name])
        require(ignored.returncode == 0, f"Private path is not ignored: {name}")


def check_documents(paths: list[str]) -> int:
    """Every local link and anchor in the course-home documents must work in a fresh clone."""
    checked = 0
    for name in COURSE_HOME_DOCS:
        require(name in paths, f"Course-home document is not tracked: {name}")
        source = ROOT / name
        for value in read_document(source)[0]:
            url = urlsplit(unescape(value))
            if url.scheme in ("http", "https", "mailto", "data"):
                continue
            require(not url.scheme and not url.netloc,
                    f"Machine-specific or unsupported link in {name}: {value}")
            target = (source.parent / unquote(url.path)).resolve() if url.path else source
            require(target.is_relative_to(ROOT), f"Link leaves the repository in {name}: {value}")
            relative = target.relative_to(ROOT).as_posix()
            require(".local" not in Path(relative).parts and not relative.startswith("deliveries/2026-10-pearson"),
                    f"Public navigation depends on private material in {name}: {value}")
            require(target.exists(), f"Broken link in {name}: {value}")
            # An ignored local file must not hide a file that is missing from a learner clone.
            require(relative in paths or (target.is_dir() and any(p.startswith(relative + "/") for p in paths)),
                    f"Link in {name} depends on an untracked file: {value}")
            if url.fragment and target.suffix.lower() == ".md":
                require(unquote(url.fragment) in read_document(target)[1],
                        f"Broken anchor in {name}: {value}")
            checked += 1
    return checked


def check_writing_rules() -> int:
    """Plain ASCII and no contractions, the rules validate.yml warns on for every Markdown file."""
    texts = {name: (ROOT / name).read_text(encoding="utf-8") for name in STRICT_DOCS}
    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    start = re.search(PEARSON_SECTION[0], readme, flags=re.MULTILINE)
    end = re.search(PEARSON_SECTION[1], readme, flags=re.MULTILINE)
    require(start and end and start.start() < end.start(), "README.md is missing its Pearson course-home section")
    texts["README.md (Pearson section)"] = readme[start.start():end.start()]
    for name, text in texts.items():
        for number, line in enumerate(text.splitlines(), start=1):
            # Build each message only on failure: an f-string is evaluated before require() runs.
            bad = [ch for ch in line if ord(ch) > 127]
            if bad:
                require(False, f"Non-ASCII character {bad[0]!r} in {name}:{number}")
            hit = CONTRACTIONS.search(line)
            if hit:
                require(False, f"Contraction {hit.group(0)!r} in {name}:{number}")
    return len(texts)


def check_starter_files(paths: list[str]) -> int:
    """The synthetic fixtures the demos and tutorials depend on must be present and intact."""
    for name in sorted(STARTER_FILES):
        require(name in paths, f"Starter file is not tracked: {name}")
        data = (ROOT / name).read_bytes()
        require(all(b < 128 for b in data), f"Starter file is not plain ASCII: {name}")
    guide = (ROOT / "starter-files/contoso-service-guide.txt").read_text(encoding="ascii")
    require(MARKER in guide, f"Service guide is missing the test marker {MARKER}")
    rows = list(csv.reader(io.StringIO((ROOT / "starter-files/agent-test-cases.csv").read_text(encoding="ascii"))))
    require(rows[0] == TEST_HEADER, f"Unexpected test matrix header: {rows[0]}")
    require([r[0] for r in rows[1:]] == [f"T0{i}" for i in range(1, 9)], "Test matrix must hold T01 to T08 in order")
    # Learners record their own results. The instructor's observed run lives in evidence/.
    require(all(r[TEST_HEADER.index("Status")] == "NOT RUN" for r in rows[1:]),
            "Every starter test row must stay NOT RUN; observed results belong in evidence/")
    report = list(csv.reader(io.StringIO((ROOT / "starter-files/synthetic-sharing-report.csv").read_text(encoding="ascii"))))
    require(all(r[0].startswith("SYNTHETIC EXERCISE") for r in report[1:]),
            "Every sharing-report row must be labeled as a synthetic exercise")
    return len(STARTER_FILES)


def check_handouts(paths: list[str]) -> int:
    """Every distributed handout is tracked and byte-identical to what Pearson received."""
    for name, expected in sorted(HANDOUTS.items()):
        require(name in paths, f"Handout is not tracked: {name}")
        actual = hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
        if actual != expected:
            require(False, f"Handout differs from the distributed copy: {name} ({actual})")
    return len(HANDOUTS)


def png_size(path: Path) -> tuple[int, int]:
    """Read width and height from the PNG header, so the check needs no imaging library."""
    data = path.read_bytes()[:24]
    require(data[:8] == b"\x89PNG\r\n\x1a\n" and data[12:16] == b"IHDR", f"Not a PNG file: {path.name}")
    return int.from_bytes(data[16:20], "big"), int.from_bytes(data[20:24], "big")


def check_brand(paths: list[str]) -> int:
    """The series banner and social preview exist at their sizes, with the generator that made them."""
    for name, expected in BRAND_IMAGES.items():
        require(name in paths, f"Brand image is not tracked: {name}")
        actual = png_size(ROOT / name)
        if actual != expected:
            require(False, f"{name} is {actual[0]}x{actual[1]}, expected {expected[0]}x{expected[1]}")
    for name in BRAND_SOURCES:
        require(name in paths, f"Brand source is not tracked: {name}")
    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    require(readme.lstrip().startswith("<div align=\"center\">") and "images/banner.png" in readme.split("# ", 1)[0],
            "README.md must open with the series banner above the title")
    require(EVIDENCE in paths, f"Evidence record is not tracked: {EVIDENCE}")
    require(all(b < 128 for b in (ROOT / EVIDENCE).read_bytes()), f"Evidence record is not plain ASCII: {EVIDENCE}")
    return len(BRAND_IMAGES)


def main() -> int:
    """Keep public checks independent from the instructor's local environment."""
    try:
        paths = tracked_paths()
        check_privacy(paths)
        links = check_documents(paths)
        docs = check_writing_rules()
        starters = check_starter_files(paths)
        handouts = check_handouts(paths)
        brand = check_brand(paths)
        print(f"PASS: {len(COURSE_HOME_DOCS)} course-home documents and {links} local links/anchors checked.")
        print(f"PASS: {brand} series brand images at their sizes, with generator, spec, and evidence record.")
        print(f"PASS: {docs} documents meet the ASCII and no-contraction rules.")
        print(f"PASS: {starters} starter files present, ASCII, and intact.")
        print(f"PASS: {handouts} handouts match the copies Pearson distributes.")
        print(f"PASS: {len(paths)} tracked paths respect the public/private boundary.")
        return 0
    except (OSError, ValueError, subprocess.CalledProcessError, IndexError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
