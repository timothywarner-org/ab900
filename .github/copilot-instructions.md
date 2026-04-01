# Copilot instructions

## Repository purpose

- This repo defines GitHub Copilot agent behavior and AB-900 skills. There is no app code; the primary artifacts are agent definitions and skill specs.

## Key locations

- Agent definition: .github/agents/ab900-cert-buddy-agent.agent.md
- Skills: .github/skills/\*/SKILL.md
- Prompts: .github/prompts/ab900-practice-questions.prompt.md, .github/prompts/ab900-scenario-walkthrough.prompt.md, .github/prompts/ab900-study-planner.prompt.md
- MCP servers (workspace only): .vscode/mcp.json

## Skill and agent conventions

- Each skill file is a single YAML frontmatter block followed by Markdown.
- The skill name used by agents must match the YAML frontmatter name in the skill file, not the folder name.
- Agent files use YAML frontmatter with tools and skills lists. Keep tool IDs scoped to MCP servers defined in .vscode/mcp.json.
- Prompt files (in .github/prompts/) reference agents by the `name` field in the agent's YAML frontmatter via the `agent:` key. The current value is `ab900-cert-buddy-agent`. If the agent is renamed, update all prompt files that reference it.
- Current skills:
  - ab900-item-creator (exam item generation)
  - ab900-scenario-walkthrough (scenario-based walkthrough delivery)
  - ab900-study-planner (personalized study plan generation)

## Grounding and validation rules

- Questions must be grounded in Microsoft Learn content first. Use the Microsoft Learn MCP server (mcp__claude_ai_Microsoft_Learn_MCP_Server) to retrieve current Learn documentation when available; this server provides microsoft_docs_search and microsoft_docs_fetch tools for grounding content in official MS Learn documentation.
- Use Context7 (ab900buddy-context7) when M365 admin PowerShell or Graph API syntax accuracy matters.
- Use MarkItDown (ab900buddy-markitdown) to convert user-supplied PDFs or Office documents to markdown for analysis.
- If a request mixes questions and scenario walkthroughs, split the output and apply the correct skill to each section.
- Grounding chain: Microsoft Learn first (via MS Learn MCP or web search) -> Context7 for M365 admin syntax -> MarkItDown for user documents.

## MCP server IDs

- ab900buddy-context7 -- Context7 (M365 PowerShell and Graph API syntax)
- ab900buddy-markitdown -- MarkItDown (PDF and Office doc conversion)
- ab900buddy-mslearn -- Microsoft Learn MCP (@microsoft/learn-cli); provides microsoft_docs_search, microsoft_docs_fetch, and microsoft_code_sample_search

Note: In Claude Code, the Microsoft Learn MCP server (mcp__claude_ai_Microsoft_Learn_MCP_Server) is also available at the user level and provides the same tools.

## Terminology (non-negotiable)

Always use current Microsoft product names. Never use a retired name, even if the user does. Silently map to the current name.

| Deprecated | Current |
| --- | --- |
| Azure AD | Microsoft Entra ID |
| AAD | Microsoft Entra ID |
| Azure Active Directory | Microsoft Entra ID |
| compliance.microsoft.com | purview.microsoft.com |
| Azure AI Studio | Azure AI Foundry |
| AI hub | DSPM for AI (classic) |
| per message (Copilot Studio) | per Copilot Credit |
| Billing > Billing policies (Copilot) | Copilot > Billing & usage |

If Microsoft Learn shows a different current name than what appears above, prefer the Learn name.

## Portal accuracy rules

These navigation paths are authoritative for AB-900 content. Always use the exact path shown.

- DSPM for AI: purview.microsoft.com > **Solutions** > **DSPM for AI (classic)**
- Copilot pay-as-you-go billing: admin.microsoft.com > **Copilot** > **Billing & usage**
- Agent approval queue: admin.microsoft.com > **Agents** > **All agents** > **Requests**
- Researcher and Analyst: these built-in Copilot experiences require a separate block from the agent toggle and are NOT governed by the general agent on/off toggle in the admin center

## Interactive question delivery

When the user asks for a practice question (one or more items):

1. Present **only** the metadata, scenario stem, and answer choices.
2. Do **NOT** include the correct answer, rationale, or references in the same message.
3. Wait for the user to reply with their answer.
4. After the user replies, reveal the correct answer, full rationale (2 sentences per choice), and references.

This rule applies to all question-generation skills and prompts in this workspace.

## Authoring guidance

- Keep instructions and outputs in plain ASCII (avoid curly quotes and en dashes).
- Prefer Microsoft style UI labels and instruction wording.
- No contractions; avoid negatives unless required.
- Use fictional companies from references/fictional-companies.md (Contoso, Fabrikam, Tailwind Traders, etc.) for scenario context in questions.
- Every rationale explanation must be exactly 2 sentences (why correct/incorrect + context).
- Distractors must reference real Microsoft 365 services, portals, or settings (never invent fake ones).
