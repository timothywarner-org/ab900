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
references/
  ab900-objectives.md                      # AB-900 skills-measured reference (current)
  fictional-companies.md                   # Microsoft fictional company names for scenarios
  style-guide.md                           # Microsoft Writing Style Guide key principles
shared-resources/
  references/                              # Exam guide, practice questions, skills breakdown
  scripts/                                 # PowerShell helpers (license assign, usage report)
  templates/                               # Deployment checklist, DLP policy template
segment-01-core-m365-services/             # Segment 1: demos, labs, slides, resources
segment-02-data-protection-governance/     # Segment 2: demos, labs, slides, resources
segment-03-copilot-administration/         # Segment 3: demos, labs, slides, resources
segment-04-agents-exam-prep/              # Segment 4: demos, labs, slides, resources
course-plan.md                             # Live session plan (4 x 50-min segments)
```

### Knowledge Corpus (docs/module-*.md)

The `docs/module-*.md` files are distilled CliffsNotes from the official AB-900T00 Microsoft Learn course (2 learning paths, 6 modules, ~35 content units). Use these as the local knowledge base when generating content, answering questions, or building course materials. They map to the exam as follows:

| File | Exam Domain |
|------|-------------|
| module-01, module-02 | Domain 1 (30-35%) |
| module-03 | Domain 2 (35-40%) -- **heaviest** |
| module-04, module-05, module-06 | Domain 3 (25-30%) |

### Live Session Structure

The O'Reilly session runs 4 x 50-min segments with 10-min breaks. The segment plan in `course-plan.md` does NOT follow the exam domain order -- it leads with Copilot (the draw), then agents, then data protection (heaviest domain), then admin/identity/security wrap-up with exam prep.

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
- **Agent file** references skills by their YAML frontmatter `name` (not folder name). If a skill is renamed, update the agent's `skills` list.
- **Tool IDs** in agent and prompt files must match server IDs in `.vscode/mcp.json`.

## Authoring Conventions

- **Skill files**: YAML frontmatter (`name`, `description`) followed by Markdown body. The `name` field in frontmatter is the canonical skill identifier (not the folder name).
- **Prompt files**: YAML frontmatter with `name`, `description`, `agent`, and `tools` fields followed by Markdown body.
- **Agent files**: YAML frontmatter with `tools` and `skills` lists. Tool IDs must match MCP server IDs from `.vscode/mcp.json`.
- **Plain ASCII only** -- no curly quotes, no en dashes, no em dashes. Use straight quotes and `--`.
- **No contractions** in any generated content.
- **Microsoft style** -- use official UI labels, sentence-style capitalization, and Microsoft instruction formatting.
- **Current terminology only** -- never use deprecated Microsoft 365 product names or portal URLs. A full rename table lives in `copilot-instructions.md`.
- Negatives only when required; if used, **CAP** + **bold** the negative word.
- Distractors in questions must reference real Microsoft 365 services, portals, or settings (never invent fake ones).
- **Rationale depth** -- every choice explanation must be exactly 2 sentences (why correct/incorrect + context).
- **Fictional companies** -- use names from `references/fictional-companies.md` (Contoso, Fabrikam, Tailwind Traders, etc.) for scenario context in questions and walkthroughs.

## Portal Accuracy Rules

These navigation paths are authoritative for AB-900 content. Always use the exact path shown. Never use deprecated portal URLs or navigation paths.

- **DSPM for AI**: purview.microsoft.com > **Solutions** > **DSPM for AI (classic)**
  - Never use compliance.microsoft.com; purview.microsoft.com is the current portal.
- **Copilot pay-as-you-go billing**: admin.microsoft.com > **Copilot** > **Billing & usage**
  - Never use "Billing > Billing policies" -- that path is deprecated for Copilot billing.
- **Agent approval queue**: admin.microsoft.com > **Agents** > **All agents** > **Requests**
- **Researcher and Analyst**: these built-in Copilot experiences require a separate administrative block and are NOT governed by the general agent on/off toggle in the Microsoft 365 admin center.

## CI Validation

The `validate.yml` workflow runs on PRs to main (non-blocking, continue-on-error). It checks:

1. **Retired terminology** -- flags `compliance.microsoft.com`, `Azure AD`, `AAD`, `Azure Active Directory`, `AI hub`, `per message`, `Billing > Billing policies`, `Azure AI Studio` (excludes copilot-instructions.md, CLAUDE.md, CONTRIBUTING.md, style-guide.md, fictional-companies.md)
2. **Non-ASCII characters** -- curly quotes, em dashes, en dashes
3. **Contractions** -- common contractions like don't, isn't, etc. (excludes CONTRIBUTING.md, style-guide.md, fictional-companies.md)
4. **Markdown link check** -- broken links via gaurav-nelson/github-action-markdown-link-check

To check locally before pushing, grep for the retired terms pattern:
```bash
grep -rn --include="*.md" -E 'compliance\.microsoft\.com|Azure AD[^C]|\bAAD\b|Azure Active Directory|AI hub|per message|Billing > Billing policies|Azure AI Studio' .
```

## Default Behaviors

When editing agent or skill content, preserve these defaults:

- If the user does not specify a domain, the agent picks one from the AB-900 study guide in `references/ab900-objectives.md`.
- If the user does not specify a portal, scenario walkthroughs default to the Microsoft 365 admin center (admin.microsoft.com).
- Questions and walkthroughs always reference current portal navigation paths per the portal accuracy rules above.
