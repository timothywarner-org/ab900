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

### Identity and portals

| Deprecated | Current |
| --- | --- |
| Azure AD | Microsoft Entra ID |
| AAD | Microsoft Entra ID |
| Azure Active Directory | Microsoft Entra ID |
| Azure AD Connect | Microsoft Entra Connect |
| compliance.microsoft.com | purview.microsoft.com |
| Microsoft Purview compliance portal | Microsoft Purview portal |
| Office 365 Security & Compliance Center | Microsoft Defender portal, Microsoft Purview portal, or Exchange admin center |
| Microsoft 365 Defender (and Microsoft 365 Defender portal) | Microsoft Defender XDR (service), Microsoft Defender portal (portal) |
| Azure AI Studio | Microsoft Foundry |
| Exchange Online admin center | Exchange admin center |
| SharePoint in Microsoft 365 admin center | SharePoint admin center (the service remains "SharePoint in Microsoft 365") |
| Cloud apps / All cloud apps (Conditional Access) | Resources (formerly cloud apps) / All resources (formerly 'All cloud apps') |

### Microsoft Purview

| Deprecated | Current |
| --- | --- |
| AI hub | Data Security Posture Management (DSPM) for AI |
| Content explorer | Data explorer (the older tool is "Content Explorer (classic)") |
| Classification (navigation node) | Classifiers |
| Content search (standalone solution) | Content search in Microsoft Purview eDiscovery |
| eDiscovery (Standard) / eDiscovery (Premium) | eDiscovery (one solution; premium features per case) |
| Collections (eDiscovery) | Statistics |
| Jobs (eDiscovery) | Processes |
| Data Estate Insights | Reports (Unified Catalog > Health management) |
| Privacy Risk Management in Purview | Microsoft Priva portal |
| Restricted SharePoint Search (RSS) | Restricted Content Discovery (RCD) |
| restricted site access | restricted access control (RAC) |

### Copilot, agents, and billing

| Deprecated | Current |
| --- | --- |
| Copilot for Microsoft 365 | Microsoft 365 Copilot |
| Copilot with commercial data protection | Microsoft 365 Copilot Chat (with enterprise data protection) |
| Microsoft Graph connectors | Microsoft 365 Copilot connectors |
| Copilot Studio lite | Agent Builder in Microsoft 365 Copilot |
| Teams Toolkit | Microsoft 365 Agents Toolkit |
| Copilot Studio Kit | Copilot Agent Kit (rename in progress) |
| Agent Mode in Excel | Edit with Copilot in Excel (Agent Mode persists in PowerPoint) |
| Message packs | Copilot Studio capacity packs (25,000 Copilot Credits per pack) |
| Billing > Billing policies (Copilot) | Copilot > Billing & usage |
| Org settings > Pay-as-you-go (SharePoint agents) | Copilot > Billing & usage > Pay-as-you-go services > SharePoint agents |
| Requested agents tab | Requests tab (Agents > All agents) |
| Copilot > Agents | Agents > All agents (Agents is a top-level node) |
| Integrated apps (as the agent management surface) | Agents section of the Copilot Control System |
| Manage agents page | Agent Registry (Agents > All agents > Registry) |
| agent catalog / organizational catalog | Agent Store |
| 300-seat minimum for Microsoft 365 Copilot | No seat minimum; 300-seat MAXIMUM on Copilot Business SKUs |

**Billing unit nuance.** "Copilot Credits" is the correct unit for Microsoft 365 Copilot Chat and SharePoint agents at $0.01 per credit. The Microsoft 365 Copilot pay-as-you-go Meters page still documents the Copilot Studio meter as "$0.01 per message", and the Azure invoice meter name is still "Copilot Studio". Both vocabularies are live in current Microsoft documentation, so "per message" is NOT a blanket-retired phrase. Never assert that one message equals one credit.

If Microsoft Learn shows a different current name than what appears above, prefer the Learn name.

## Portal accuracy rules

These navigation paths are authoritative for AB-900 content. Always use the exact path shown.

- DSPM for AI: purview.microsoft.com > **Solutions** > **DSPM for AI (classic)**. The Purview portal also lists a unified **DSPM** entry (generally available May 2026) and **Data Security Posture Management (classic)**. The exam objective wording still says "DSPM for AI".
- Oversharing and data risk review: DSPM for AI (classic) > **Data risk assessments**. There is no "Oversharing reports" node.
- Copilot pay-as-you-go billing: admin.microsoft.com > **Copilot** > **Billing & usage**
- Agent approval queue: admin.microsoft.com > **Agents** > **All agents** > **Requests** (states: Pending review, Pending update, Pending activate)
- Agent settings: admin.microsoft.com > **Agents** > **Settings**
- Researcher and Analyst: these are part of the core Copilot chat experience and do **NOT** fall under any agent-related settings. They remain available under **Tools** in Microsoft 365 Copilot Chat even when agents are disabled. Disabling one requires the tenant-wide **Block** action on the individual agent; **Edit users** is disabled for them.
- Sensitivity labels: purview.microsoft.com > **Solutions** > **Information Protection** > **Sensitivity labels**
- DLP policies: purview.microsoft.com > **Data loss prevention** > **Policies** (Copilot location: **Microsoft 365 Copilot and Copilot Chat**)
- Data explorer: purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Data explorer**
- Content search: purview.microsoft.com > **Solutions** > **eDiscovery** > **Content search**
- Data access governance reports: SharePoint admin center > **Reports** > **Data access governance**
- Conditional Access: entra.microsoft.com > **Entra ID** > **Conditional Access** > **Policies**
- PIM: entra.microsoft.com > **ID Governance** > **Privileged Identity Management**
- Copilot license assignment: admin.microsoft.com > **Users** > **Active users** > [user] > **Licenses and Apps**

## Exam version

The current skills-measured document is **Skills measured as of July 22, 2026**. Domain weights: Domain 1 (30-35%), Domain 2 (35-40%), Domain 3 (25-30%). The July 22, 2026 change log marks three subsections **Minor** and zero **Major**: "Identify the core objects of Microsoft 365 services", "Identify the core security features of Microsoft 365 services", and "Identify and monitor oversharing in SharePoint in Microsoft 365". AB-900 is generally available and no longer in beta.

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
