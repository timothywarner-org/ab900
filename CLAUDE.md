# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **content-only repository** for an AB-900 certification study buddy powered by GitHub Copilot agents, plus instructor materials for Tim Warner's O'Reilly Live Learning session. There is no application code, no build system, and no tests. The primary artifacts are agent definitions, skill specs, prompt templates, MCP server configurations, and distilled Microsoft Learn course content.

## Architecture

```text
.github/
  agents/ab900-cert-buddy-agent.agent.md   # Main Copilot agent definition
  skills/
    ab900-item-creator/SKILL.md            # Exam question generation skill
    ab900-scenario-walkthrough/SKILL.md    # Scenario-based walkthrough skill
    ab900-study-planner/SKILL.md           # Personalized study plan skill
  prompts/
    ab900-practice-questions.prompt.md     # Prompt template for practice questions
    ab900-scenario-walkthrough.prompt.md   # Prompt template for scenario walkthroughs
    ab900-study-planner.prompt.md          # Prompt template for personalized study plans
  copilot-instructions.md                  # Copilot workspace instructions + rename table
  workflows/
    validate.yml                           # CI validation pipeline (non-blocking)
    mlc-config.json                        # Markdown link checker config
.vscode/
  mcp.json                                 # MCP server definitions (workspace-scoped)
  extensions.json                          # Recommended VS Code extensions
  settings.json                            # VS Code workspace settings
docs/
  module-01-security-foundations.md        # Distilled from MS Learn: Zero Trust, Defender, Entra
  module-02-core-services-admin.md         # Distilled from MS Learn: admin center, Exchange/Teams/SP
  module-03-data-protection-governance.md  # Distilled from MS Learn: Purview, DLP, DSPM, eDiscovery
  module-04-copilot-and-agents.md          # Distilled from MS Learn: Copilot arch, agent types, licensing
  module-05-copilot-admin-tasks.md         # Distilled from MS Learn: license mgmt, PAYG, prompts
  module-06-agent-admin-tasks.md           # Distilled from MS Learn: agent creation, approval, lifecycle
  demo-scripts.md                          # Live demo scripts for O'Reilly session
  session-opener-governance.md             # 10-min maker-spectrum + governance opener
  exam-traps-cheatsheet.md                # Common exam pitfalls, task-first lookup
  portal-reference.md                      # Portals by exam DOMAIN, with verification caveats
  PORTAL-CHEAT-SHEET.md                   # Portals by PORTAL, one block each, per-portal traps
  new-features-deep-dive.md               # Recent feature changes
  session-agenda.md                        # Full session agenda
  tenant-setup-guide.md                    # Lab tenant setup
  (no deck here -- the single deck lives at the repo root)
references/
  ab900-objectives.md                      # AB-900 skills-measured reference (current)
  fictional-companies.md                   # Microsoft fictional company names for scenarios
  style-guide.md                           # Microsoft Writing Style Guide key principles
shared-resources/
  references/                              # Exam guide, practice questions, skills breakdown
  scripts/                                 # PowerShell helpers + demo-tenant provisioning
    Deploy-AB900Foundry.ps1                # Azure AI Foundry demo env (idempotent, verified live)
    Initialize-AB900PurviewDemo.ps1        # Purview DLP/labels/retention via Security & Compliance PS
  templates/                               # Deployment checklist, DLP policy template
slides/workspace/                          # Deck build tooling (build-deck.js) + background assets
images/banner.png                          # README banner
segment-01-core-m365-services/             # Segment 1: demos, labs, slides, resources
segment-02-data-protection-governance/     # Segment 2: demos, labs, slides, resources
segment-03-copilot-administration/         # Segment 3: demos, labs, slides, resources
segment-04-agents-exam-prep/              # Segment 4: demos, labs, slides, resources
course-plan-july-2026.md                   # Live session plan (4 x 50-min segments)
warner-ab900-July-2026.pptx                # THE deck -- exactly one, always at the root
README.md / QUICKSTART.md / FAQ.md         # Repo front door and onboarding
CONTRIBUTING.md / LICENSE                  # Contribution guidance and license
```

The course plan file is named by delivery month. It was `course-plan-april-2026.md` and is now `course-plan-july-2026.md`. When a new delivery is scheduled, rename the file and update every reference in `README.md` and this file.

## Commands

There is no build, no test suite, and no package manager. The only executable checks are content validation. Run these before pushing -- they are the same checks `validate.yml` runs, but locally and faster.

**Full local validation (all four CI checks):**

```bash
# 1. Retired terminology (see the known false positives section below before "fixing" hits)
grep -rnE 'compliance\.microsoft\.com|Azure AD[^C]|\bAAD\b|Azure Active Directory|AI hub|per message|Billing > Billing policies|Azure AI Studio' --include="*.md" . | grep -v '^./.git'

# 2. Non-ASCII punctuation -- MUST return zero
python -c "import glob; [print(f) for f in glob.glob('**/*.md',recursive=True) if '.git' not in f and any(c in open(f,encoding='utf-8',errors='replace').read() for c in '\u2013\u2014\u2018\u2019\u201c\u201d')]"

# 3. Contractions (excludes CONTRIBUTING.md, style-guide.md, fictional-companies.md)
grep -rnEi "\b(don't|isn't|doesn't|won't|can't|it's|you're|we're|that's|didn't|aren't)\b" --include="*.md" .

# 4. Broken internal links -- MUST return zero
python -c "
import re,os,glob
for f in glob.glob('**/*.md',recursive=True):
    if '.git' in f: continue
    d=os.path.dirname(f)
    for m in re.finditer(r'\[([^\]]*)\]\(([^)]+)\)', open(f,encoding='utf-8',errors='replace').read()):
        t=m.group(2).split('#')[0].strip()
        if t and not t.startswith(('http','mailto:')) and not os.path.exists(os.path.normpath(os.path.join(d,t))):
            print(f'{f} -> {t}')"
```

**External link check** (283 URLs; run serially or expect HTTP 429 rate-limiting from learn.microsoft.com, which is NOT breakage):

```bash
grep -rhoE 'https?://[^ )>"`]+' --include="*.md" . | sed 's/[.,;:]*$//' | sort -u > /tmp/urls.txt
cat /tmp/urls.txt | xargs -P 5 -I{} sh -c 'echo "$(curl -s -o /dev/null -w "%{http_code}" -L --max-time 20 -A "Mozilla/5.0" "{}") {}"' | grep -v '^200'
```

Expected non-200 responses that are NOT defects: **403** from login-gated portals (entra.microsoft.com, portal.azure.com) and microsoft.com marketing pages, **401** from Graph API example URLs, **000** from placeholders (`https://<tenant>`, `yourdomain.sharepoint.com`), **429** from rate-limiting.

**Cross-reference chain check** (tool IDs, agent, skills, prompts):

```bash
python -c "
import json,glob,re
ids=set(json.load(open('.vscode/mcp.json',encoding='utf-8'))['servers'].keys())
used=set()
for f in glob.glob('.github/**/*.md',recursive=True):
    used |= set(re.findall(r'ab900buddy-[a-z0-9]+', open(f,encoding='utf-8',errors='replace').read()))
print('undefined tool IDs:', used-ids or 'none')
agent=open('.github/agents/ab900-cert-buddy-agent.agent.md',encoding='utf-8').read()
skills={re.search(r'^name:\s*(\S+)',open(p,encoding='utf-8').read(),re.M).group(1) for p in glob.glob('.github/skills/*/SKILL.md')}
print('skills not referenced in agent body:', [s for s in skills if s not in agent] or 'none')"
```

**Reading the deck safely.** The deck is often open in PowerPoint, which locks the file. Copy it before reading with `python-pptx`, and never write to it while a `~$` lock file is present:

```bash
cp warner-ab900-July-2026.pptx /tmp/deck.pptx   # use a Windows-native path on Windows
python -c "from pptx import Presentation; p=Presentation(r'C:\path\to\deck.pptx'); print(len(p.slides))"
```

**Demo-tenant provisioning.** Both scripts are idempotent and support `-WhatIf`. Always dry-run first:

```powershell
./shared-resources/scripts/Deploy-AB900Foundry.ps1 -WhatIf
./shared-resources/scripts/Initialize-AB900PurviewDemo.ps1 -UserPrincipalName <admin>@<tenant> -WhatIf
```

`Initialize-AB900PurviewDemo.ps1` connects to Microsoft 365 even under `-WhatIf`, deliberately: the connection is read-only and every existence check depends on it. A dry run that skips connecting reports hypothetical creates for objects that may already exist.

## Deck Rule: Exactly One PPTX

The repository holds **exactly one** deck, `warner-ab900-July-2026.pptx` at the root. Do **NOT** create a second, per-delivery, or archival copy. Two decks previously drifted apart and one grew to 41 MB of uncompressed PNG backgrounds while the other stayed at 1 MB.

- Update the existing deck in place. Git history is the archive.
- Edit with `python-pptx` at the **run** level (`run.text`), never by assigning to `shape.text_frame.text` -- that assignment destroys font face, size, color, bold, and any animation timing bound to the run. Tim's layouts, colors, fonts, and slide order must survive byte-for-byte.
- The deck is **59 slides**. Slides **1-13 are O'Reilly housekeeping front matter**; AB-900 content starts at slide **14**. The slide-to-segment remap table lives in `course-plan-july-2026.md`.
- Speaker notes are essentially **unauthored** (1 of 59 slides has any note text). If notes are added, use the `tim-warner-voice` skill so they sound like Tim.
- **Recompress images before embedding them.** Background PNGs caused the 41 MB bloat once and an 11 MB regression in July 2026. Run `slides/workspace/Compress-DeckImages.ps1 -WhatIf` to check, then without `-WhatIf` to fix. It rewrites only `ppt/media/*` and never parses slide XML, so layouts, fonts, colors, and animation timings survive byte-for-byte.
- **Close PowerPoint before any scripted write.** A `~$` lock file means the app will overwrite your result on its next save. The compression script refuses to run while the lock exists; apply the same rule to any `python-pptx` write.

## Exam Currency

All content in this repository targets the **Skills measured as of July 22, 2026** version of the AB-900 study guide. Verified against Microsoft Learn on July 26, 2026.

- The certification is **Microsoft 365 Certified: Copilot and Agent Administration Fundamentals**. Exam AB-900 is **generally available** -- it is NOT in beta. Remove any beta scoring, beta discount, or "(beta)" title references you encounter.
- Domain weights are unchanged: Domain 1 at 30-35%, Domain 2 at 35-40% (heaviest), Domain 3 at 25-30%.
- The July 22, 2026 change log records THREE Minor changes and ZERO Major changes: "Identify the core objects of Microsoft 365 services", "Identify the core security features of Microsoft 365 services", and "Identify and monitor oversharing in SharePoint in Microsoft 365".
- Exam logistics: 45 minutes exam duration (roughly 65 minutes seat time), passing score 700 or greater out of 1000, English only, retake after 24 hours. Microsoft does NOT publish an AB-900-specific question count; the generic Microsoft statement is 40-60 questions for most exams. Fundamentals certifications do NOT expire, so AB-900 requires NO renewal. Microsoft Learn access during the exam is NOT available on Fundamentals exams.
- Exam scope rule: most questions cover generally available features; preview features may appear when commonly used.

Wording changes from the July 22, 2026 refresh that must be reflected in generated content:

| Older wording | Current wording |
|---------------|-----------------|
| Exchange Online admin center, distribution lists | Exchange admin center, distribution groups |
| SharePoint in Microsoft 365 admin center | SharePoint admin center (the SERVICE is still "SharePoint in Microsoft 365") |
| restricted site access | restricted access control |
| Content explorer | Data Explorer (the old tool is now "Content Explorer (classic)") |
| Content search as a standalone solution | Content search in Microsoft Purview eDiscovery |
| Microsoft 365 Defender | Microsoft Defender XDR |
| Copilot pay-as-you-go, generic | monthly license model compared to pay-as-you-go, including SharePoint |

Do NOT blanket-replace "SharePoint in Microsoft 365" -- it is still correct for the service and appears verbatim in current objectives. Only correct it where it modifies "admin center". Likewise, "Microsoft Entra" without "ID" is correct in the audience profile (the product family and admin center), while "Microsoft Entra ID" is correct for the identity service in skill bullets.

### Knowledge Corpus (docs/module-*.md)

The `docs/module-*.md` files are distilled CliffsNotes from the official AB-900T00 Microsoft Learn course (2 learning paths, 6 modules, ~35 content units). Use these as the local knowledge base when generating content, answering questions, or building course materials. They map to the exam as follows:

| File | Exam Domain |
|------|-------------|
| module-01, module-02 | Domain 1 (30-35%) |
| module-03 | Domain 2 (35-40%) -- **heaviest** |
| module-04, module-05, module-06 | Domain 3 (25-30%) |

### Live Session Structure

The O'Reilly session runs a 10-min governance opener plus 4 x 50-min segments with 10-min breaks.

**Segment order follows EXAM DOMAIN order and matches the `segment-0{1-4}-*` folder names.** Folder numbers and live segment numbers are the SAME. This was changed on July 28, 2026; an earlier plan led with Copilot and deliberately diverged from the folders. Do not reintroduce that split.

| Slot | Topic | Domain |
|------|-------|--------|
| Opener | No-Code, Low-Code, Pro-Code: Who Builds What, and Who Governs It | framing |
| 1 | Core Features and Objects of Microsoft 365 Services | 1 (30-35%) |
| 2 | Data Protection and Governance for Microsoft 365 and Copilot | 2 (35-40%) |
| 3 | Copilot Features and Administration | 3 (25-30%) |
| 4 | Agent Administration and Exam Success | 3 (25-30%) + logistics |

The opener script is `docs/session-opener-governance.md`. Its framing is Tim's: **the exam is governance, not building.**

**The deck is still in the OLD order.** `warner-ab900-July-2026.pptx` was built when Copilot led, so slide numbers do NOT match segment numbers until the deck is reordered. The remap table lives in `course-plan-july-2026.md` under "Deck remap". Demo IDs already follow domain numbering (Demo 1x = Segment 1, Demo 2x = Segment 2), so those line up correctly.

### How It Works

The **ab900-cert-buddy-agent** orchestrates three skills:

- **ab900-item-creator**: Generates exam-realistic AB-900 practice questions (multiple-choice, scenario-first stems, 4 options, rationale for each). Supports "hint" (eliminate a distractor) and "skip" (reveal the answer) during interactive delivery.
- **ab900-scenario-walkthrough**: Delivers guided scenario walkthroughs that map to AB-900 domain objectives, walking the user through realistic administrative situations step by step.
- **ab900-study-planner**: Generates personalized study plans based on user confidence ratings across the three AB-900 domains.

All three skills enforce a strict grounding chain: **Microsoft Learn first** (accessed via the Microsoft Learn MCP server or Copilot web search) -> **Context7 for M365 admin PowerShell and Graph API syntax** -> **MarkItDown for user-supplied documents**.

Questions use a **two-phase interactive delivery**: Phase 1 presents only the stem and choices (no answer), then the agent waits for the user to reply. Phase 2 reveals the correct answer, 2-sentence-per-choice rationale, and references. Users can type "hint" to eliminate a distractor, "skip" to reveal the answer, or an unrecognized input triggers a prompt for A/B/C/D.

### MCP Servers

Defined in `.vscode/mcp.json` with IDs:

- `ab900buddy-context7` -- Context7 (version-specific docs and snippets for M365 admin PowerShell and Graph API)
- `ab900buddy-markitdown` -- MarkItDown (convert PDFs and Office docs to markdown for analysis)
- `ab900buddy-mslearn` -- Microsoft Learn MCP (`@microsoft/learn-cli`); provides `microsoft_docs_search`, `microsoft_docs_fetch`, and `microsoft_code_sample_search` tools for grounding content in official Microsoft Learn documentation. This is the primary grounding source for all AB-900 content.

In Claude Code, the Microsoft Learn MCP server (`mcp__claude_ai_Microsoft_Learn_MCP_Server`) is also available at the user level and provides the same tools.

The Azure MCP server is intentionally excluded. AB-900 is a Microsoft 365 administration exam, not an Azure infrastructure exam.

### Cross-Reference Dependencies

- **Prompt files** reference the agent via `agent: ab900-cert-buddy-agent` in YAML frontmatter. If the agent `name` field changes, update all `.github/prompts/*.prompt.md` files.
- **Agent file** references skills by their YAML frontmatter `name` (not folder name) in its Markdown **body**, not in frontmatter. There is no `skills:` frontmatter key. If a skill is renamed, update every mention in the agent body.
- **Tool IDs** in agent and prompt files must match server IDs in `.vscode/mcp.json`.

## Authoring Conventions

- **Skill files**: YAML frontmatter (`name`, `description`) followed by Markdown body. The `name` field in frontmatter is the canonical skill identifier (not the folder name).
- **Prompt files**: YAML frontmatter with `name`, `description`, `agent`, and `tools` fields followed by Markdown body.
- **Agent files**: YAML frontmatter with `name`, `description`, `argument-hint`, and a `tools` list. Skills are referenced in the Markdown body, NOT in frontmatter. Tool IDs must match MCP server IDs from `.vscode/mcp.json`.
- **Plain ASCII only** -- no curly quotes, no en dashes, no em dashes. Use straight quotes and `--`.
- **No contractions** in any generated content.
- **Microsoft style** -- use official UI labels, sentence-style capitalization, and Microsoft instruction formatting.
- **Current terminology only** -- never use deprecated Microsoft 365 product names or portal URLs. A full rename table lives in `copilot-instructions.md`.
- Negatives only when required; if used, **CAP** + **bold** the negative word.
- Distractors in questions must reference real Microsoft 365 services, portals, or settings (never invent fake ones).
- **Rationale depth** -- every choice explanation must be exactly 2 sentences (why correct/incorrect + context).
- **Fictional companies** -- use names from `references/fictional-companies.md` (Contoso, Fabrikam, Tailwind Traders, etc.) for scenario context in questions and walkthroughs.

## Portal Accuracy Rules

These navigation paths are authoritative for AB-900 content. Always use the exact path shown. Never use deprecated portal URLs or navigation paths. All four rules below were reverified against Microsoft Learn on July 26, 2026.

- **DSPM for AI**: purview.microsoft.com > **Solutions** > **DSPM for AI (classic)**
  - This label is still current and is the wording the July 22, 2026 exam objectives use, so it remains the exam answer.
  - IMPORTANT NUANCE ADDED JULY 2026: a NEW unified **Data Security Posture Management (DSPM)** solution reached general availability in May 2026 at purview.microsoft.com > **Solutions** > **DSPM**. DSPM for AI and DSPM have converged, and Microsoft states most new features go to the new version only. A learner in the portal today sees THREE entries: **DSPM**, **Data Security Posture Management (classic)**, and **DSPM for AI (classic)**.
  - Teaching rule: teach **DSPM for AI (classic)** as the exam answer, and show the new unified **DSPM** in any live portal demo so the tenant matches the slide. Microsoft has published NO retirement date for the classic experience, so do not state one.
  - Never use the Microsoft Purview compliance portal; purview.microsoft.com is the current portal.
- **Copilot pay-as-you-go billing**: admin.microsoft.com > **Copilot** > **Billing & usage**
  - CONFIRMED CORRECT. The Billing policies tab holds the policies; the Pay-as-you-go services tab connects them to services. An alternate entry point is Copilot > **Settings** > **User access** > **Copilot pay-as-you-go billing**.
  - Never use "Billing > Billing policies" -- that path is deprecated for Copilot billing. The Billing node covers Microsoft 365 Backup, SharePoint storage, and High Volume Email, and only surfaces a redirect link for Copilot.
  - The SharePoint agent path admin.microsoft.com > **Org settings** > **Pay-as-you-go services** is LEGACY. An admin with a policy there must select **Disconnect previous billing** before linking a new Copilot-node billing policy.
- **Agent approval queue**: admin.microsoft.com > **Agents** > **All agents** > **Requests**
  - CONFIRMED CORRECT AND AUTHORITATIVE. This path appears in multiple current Microsoft Learn articles. **Agents** is a top-level node in the Microsoft 365 admin center, NOT nested under Copilot.
  - The path "admin.microsoft.com > Copilot > Agents > Requested agents tab" is STALE on both counts and must be corrected wherever it appears. The tab is named **Requests**, not "Requested agents".
  - Three request states appear under Requests: **Pending review**, **Pending update**, and **Pending activate**. Primary actions are **Publish to store** and **Reject submission**; for a Pending update the button is **Update in store**.
  - Related current paths: agent inventory at **Agents** > **All agents** > **Registry**; agent policy at **Agents** > **Settings**; MCP tool approval at **Agents** > **Tools** > **Requests**.
  - Only **AI Administrator** and **Global Administrator** can approve agent requests or assign ownership. Global Reader and other reader roles can view but not act.
- **Researcher and Analyst**: the CONCLUSION in earlier material was right but the MECHANISM was wrong. Restate using Microsoft's current wording.
  - Microsoft states that Researcher and Analyst "are part of the core Copilot chat experience and will not fall under any agent-related settings." They are available in Microsoft 365 Copilot Chat under **Tools** and remain accessible even when Copilot agents are disabled for some or all users.
  - Do NOT say they merely "require a separate block" -- say they are core chat Tools that agent settings do not govern.
  - To disable one, an admin uses the **Block** action on the individual agent (Microsoft 365 admin center > **Agents** > **All agents** > select the agent > **Block**). The **Edit users** panel is DISABLED for them, so granular per-user or per-group assignment is NOT possible; blocking is tenant-wide only.
  - Both are generally available (June 2, 2025) and both require a Microsoft 365 Copilot license. There is no separate add-on. They are preinstalled and pre-pinned for licensed users, and end users cannot unpin Researcher.

### Additional current paths worth pinning

- **Copilot usage report**: admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Copilot**, then the **Usage** tab. Sibling reports under the same node: **Credits** and **Agents**.
- **Copilot Dashboard**: opened from the **Viva Insights** app in Microsoft Teams or the Viva Insights web app, NOT from the Microsoft 365 admin center. The previous admin-center control to enable the dashboard (and the PowerShell equivalent) is **no longer available**; access is now governed by enabling or disabling the **Viva Insights web app**, which is ON by default. NOTE a live Microsoft-side conflict: the Copilot reporting page still says "Enable the Copilot Dashboard" and links to the Viva page stating the control was removed. The Viva page is product-specific and more recent, so it wins.
- **Content search**: purview.microsoft.com > **Solutions** > **eDiscovery** > **Content Search**. Classic standalone Content Search retired August 31, 2025.
- **Data explorer**: purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Data explorer**. The older tool is now **Content Explorer (classic)** under Data Lifecycle Management > Explorers.
- **Data access governance reports**: SharePoint admin center > **Reports** > **Data access governance**.
- **Restricted access control (RAC)**: SharePoint admin center > **Policies** > **Access control** > **Site-level access restriction** for tenant enablement; per site under **Sites** > **Active sites** > select site > **Settings** > **Restricted site access**.
- **Restricted content discovery (RCD)**: SharePoint admin center > **Sites** > **Active sites** > select site > **Settings** > **Restrict content discovery**. RAC controls ACCESS; RCD controls DISCOVERABILITY without changing permissions.
- **Restricted SharePoint Search is retiring.** Microsoft blocks new enablement starting July 31, 2026 and directs customers to restricted content discovery. Do NOT present it as a current recommendation.
- **Copilot billing unit**: the unit of consumption is the **Copilot Credit** at $0.01 per credit. Consumption is per-feature (classic answer 1, generative answer 2, agent action 5, tenant graph grounding 10), so do NOT assert that one message equals one credit. The Azure meter is still named "Copilot Studio", and some Microsoft Learn pages still say "per message". Both vocabularies are live in current Microsoft documentation.

## CI Validation

The `validate.yml` workflow runs on PRs to main. It is non-blocking: the job sets `continue-on-error: true` and each step emits `::warning::` rather than failing. Treat findings as a review checklist, not a gate. It checks:

1. **Retired terminology** -- flags `compliance.microsoft.com`, `Azure AD`, `AAD`, `Azure Active Directory`, `AI hub`, `per message`, `Billing > Billing policies`, `Azure AI Studio` (excludes copilot-instructions.md, CLAUDE.md, CONTRIBUTING.md, style-guide.md, fictional-companies.md)
2. **Non-ASCII characters** -- curly quotes, em dashes, en dashes
3. **Contractions** -- common contractions like don't, isn't, etc. (excludes CONTRIBUTING.md, style-guide.md, fictional-companies.md)
4. **Markdown link check** -- broken links via gaurav-nelson/github-action-markdown-link-check, configured by `.github/workflows/mlc-config.json`

To check locally before pushing, grep for the retired terms pattern:
```bash
grep -rn --include="*.md" -E 'compliance\.microsoft\.com|Azure AD[^C]|\bAAD\b|Azure Active Directory|AI hub|per message|Billing > Billing policies|Azure AI Studio' .
```

### Known false positives in the terminology rule

Two of the eight patterns produce legitimate warnings that should NOT be "fixed" blindly:

- **`per message`** is only PARTIALLY retired. "Copilot Credits" is correct for Microsoft 365 Copilot Chat and SharePoint agents, but the Microsoft 365 Copilot pay-as-you-go Meters page still documents the meter at "$0.01 per message". Content that quotes or explains that documentation conflict will trip this rule. Keep the content and note the conflict; do not silently rewrite a direct quotation of Microsoft documentation.
- **`compliance.microsoft.com`** trips whenever content teaches learners which portal is retired. Phrase it as "the Microsoft Purview compliance portal is retired; use purview.microsoft.com" rather than spelling out the retired host, which keeps the teaching point and clears the rule.

Also note that the non-ASCII rule flags en dashes, but the official AB-900 study guide writes its percentage ranges with en dashes (for example, 30-35%). When quoting the study guide verbatim, convert those to plain hyphens to satisfy house style.

## Provisioning Boundary (what can and cannot be automated)

Established July 27, 2026 against Tim's techtrainertim.com tenant. Do not re-derive this.

- **Microsoft Purview compliance solutions are NOT Azure resources.** DLP, sensitivity labels, retention, and DSPM for AI are Microsoft 365 tenant features provisioned by licensing. There is no ARM template and no `az` command. The Azure resource type `Microsoft.Purview/accounts` is a **different product** (data governance for Azure data estates) and is **NOT** on the AB-900 exam.
- **The scripted path is PowerShell, not MCP.** Use `Connect-IPPSSession` from the **ExchangeOnlineManagement** module for Purview compliance objects, and the Microsoft Graph PowerShell SDK for identity and licensing. `Connect-ExchangeOnline` does **NOT** expose the DLP, label, or retention cmdlets -- that mistake produces "term not recognized" errors.
- **Genuinely portal-only, no documented PowerShell:** DSPM for AI, Compliance Manager, Insider Risk Management, Communication Compliance, Data Explorer, Activity Explorer, the agent approval queue, and Copilot pay-as-you-go billing.
- **ExchangeOnlineManagement version floor is 3.2.0** (full REST support for Security & Compliance began there). Do **NOT** chase the newest module before a delivery: 3.5.0 to 3.9.2 need PowerShell 7.4.0+, while 3.10.0+ needs PowerShell 7.6.0+ for .NET 10 assemblies.

### Azure OpenAI model deployment (cost real time to learn)

`az cognitiveservices account list-models` returns models that **cannot be deployed**. The catalog's `deprecation.inference` date does **NOT** predict deployability -- as of July 2026 both `gpt-4o-mini` and `gpt-4.1-mini` advertise 2027 retirement yet are rejected with `ServiceModelDeprecating`. Separately, `gpt-5.4-mini` had zero quota in this subscription. Always walk a **fallback list** of candidates rather than trusting the catalog.

**Reasoning-model smoke tests need a large token budget.** gpt-5 family models spend tokens on internal reasoning before emitting visible text. `max_completion_tokens: 60` returns an empty string and looks like a broken deployment. Budget 800 or more.

## Verification Discipline

This repository is teaching material delivered live to paying learners. A confident wrong portal path is worse than an omission.

**Adversarial verification is not optional for factual sweeps.** In two grounding passes this session, **33 of 44** and **8 of 28** proposed "corrections" were rejected by verifiers that re-fetched the cited Microsoft Learn page. Unverified single-pass edits inject errors at a high rate. When correcting facts at scale, have a second pass try to **refute** each change and default to REFUTED on uncertainty.

**Known Microsoft-side documentation conflicts.** These are real and currently live. Name the conflict rather than silently picking a side:

- **Copilot Dashboard:** the Copilot reporting page still says "Enable the Copilot Dashboard" and links to the Viva page stating that control **was removed**. The Viva page is product-specific and more recent, so it wins. Access is now governed by enabling or disabling the Viva Insights web app.
- **Agent settings templates:** the same Learn article calls it **Security templates** in its overview bullet and **Policy templates** in the section heading. The live nav path is **Agents > Settings > Templates**.
- **"Copilot Studio SDK" does not exist.** Current documentation names the **Microsoft 365 Agents SDK**. Microsoft's own Agents FAQ says "Copilot Studio SDK" in one bullet and contradicts itself two answers later.
- **Restricted content discovery toggle:** Learn shows two labels for the same control, "Restrict content from Microsoft 365 Copilot" and "Restrict content discovery". Navigate to it live rather than committing to one on a slide.

**Facts that vary by tenant -- verify before asserting on stage:** the sensitivity label scheme (classic `+ Create a label` versus modern `+ Create` then `Label`), how many DSPM entries appear under Solutions (one or three), and the Researcher per-user query limit (a figure of 25 per month appears in course notes but could **not** be reconfirmed on Microsoft Learn on July 28, 2026).

## Default Behaviors

When editing agent or skill content, preserve these defaults:

- If the user does not specify a domain, the agent picks one from the AB-900 study guide in `references/ab900-objectives.md`.
- If the user does not specify a portal, scenario walkthroughs default to the Microsoft 365 admin center (admin.microsoft.com).
- Questions and walkthroughs always reference current portal navigation paths per the portal accuracy rules above.
- If a portal path, price, feature status, or GA date cannot be verified against Microsoft Learn, OMIT the claim or mark it inline as needing verification. Never invent a UI location, button label, or version number. A confident wrong portal path delivered live is worse than an omission.
