# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **content-only repository** for an AB-900 certification study buddy powered by GitHub Copilot agents. There is no application code, no build system, and no tests. The primary artifacts are agent definitions, skill specs, prompt templates, and MCP server configurations.

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
  copilot-instructions.md                  # Copilot workspace instructions + rename table
  workflows/
    validate.yml                           # CI validation pipeline (non-blocking)
    mlc-config.json                        # Markdown link checker config
.vscode/
  mcp.json                                 # MCP server definitions (workspace-scoped)
  extensions.json                          # Recommended VS Code extensions
  settings.json                            # VS Code workspace settings
references/
  ab900-objectives.md                      # AB-900 skills-measured reference (current)
  fictional-companies.md                   # Microsoft fictional company names for scenarios
  style-guide.md                           # Microsoft Writing Style Guide key principles
```

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

The Microsoft Learn MCP server (`mcp__claude_ai_Microsoft_Learn_MCP_Server`) is configured at the user level in Claude Code and may be auto-available. It provides `microsoft_docs_search` and `microsoft_docs_fetch` tools for grounding content in official Microsoft Learn documentation. This server is the primary grounding source for all AB-900 content.

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

## Default Behaviors

When editing agent or skill content, preserve these defaults:

- If the user does not specify a domain, the agent picks one from the AB-900 study guide in `references/ab900-objectives.md`.
- If the user does not specify a portal, scenario walkthroughs default to the Microsoft 365 admin center (admin.microsoft.com).
- Questions and walkthroughs always reference current portal navigation paths per the portal accuracy rules above.
