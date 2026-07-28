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
  exam-traps-cheatsheet.md                # Common exam pitfalls
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
  scripts/                                 # PowerShell helpers (license assign, usage report)
  templates/                               # Deployment checklist, DLP policy template
slides/workspace/                          # Deck build tooling (build-deck.js) + background assets
images/banner.png                          # README banner
segment-01-core-m365-services/             # Segment 1: demos, labs, slides, resources
segment-02-data-protection-governance/     # Segment 2: demos, labs, slides, resources
segment-03-copilot-administration/         # Segment 3: demos, labs, slides, resources
segment-04-agents-exam-prep/              # Segment 4: demos, labs, slides, resources
course-plan-july-2026.md                   # Live session plan (4 x 50-min segments)
warner-ab900.pptx                          # THE deck -- exactly one, always at the root
README.md / QUICKSTART.md / FAQ.md         # Repo front door and onboarding
CONTRIBUTING.md / LICENSE                  # Contribution guidance and license
```

The course plan file is named by delivery month. It was `course-plan-april-2026.md` and is now `course-plan-july-2026.md`. When a new delivery is scheduled, rename the file and update every reference in `README.md` and this file.

## Deck Rule: Exactly One PPTX

The repository holds **exactly one** deck, `warner-ab900.pptx` at the root. Do **NOT** create a second, per-delivery, or archival copy. Two decks previously drifted apart and one grew to 41 MB of uncompressed PNG backgrounds while the other stayed at 1 MB.

- Update the existing deck in place. Git history is the archive.
- Edit with `python-pptx` at the **run** level (`run.text`), never by assigning to `shape.text_frame.text` -- that assignment destroys font face, size, color, bold, and any animation timing bound to the run. Tim's layouts, colors, fonts, and slide order must survive byte-for-byte.
- The deck currently has **NO** authored speaker notes. All 46 notes slides are empty. If notes are ever added, use the `tim-warner-voice` skill so they sound like Tim.
- Before embedding images, recompress them. Background PNGs are what caused the 41 MB bloat.

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

The O'Reilly session runs 4 x 50-min segments with 10-min breaks. The segment plan in `course-plan-july-2026.md` does NOT follow the exam domain order -- it leads with Copilot (the draw), then agents, then data protection (heaviest domain), then admin/identity/security wrap-up with exam prep. The `segment-0{1-4}-*` folder names follow exam domain grouping, not delivery order, so folder numbers and live segment numbers deliberately differ.

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

## Default Behaviors

When editing agent or skill content, preserve these defaults:

- If the user does not specify a domain, the agent picks one from the AB-900 study guide in `references/ab900-objectives.md`.
- If the user does not specify a portal, scenario walkthroughs default to the Microsoft 365 admin center (admin.microsoft.com).
- Questions and walkthroughs always reference current portal navigation paths per the portal accuracy rules above.
- If a portal path, price, feature status, or GA date cannot be verified against Microsoft Learn, OMIT the claim or mark it inline as needing verification. Never invent a UI location, button label, or version number. A confident wrong portal path delivered live is worse than an omission.
