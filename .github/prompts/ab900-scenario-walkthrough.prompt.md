---
name: ab900-scenario-walkthrough
description: "Generate one AB-900 admin scenario walkthrough: a guided 5-10 minute simulation of a real M365 admin task with exact navigation paths, correct settings, and exam relevance notes."
argument-hint: "domain='Domain 2' scenarioType='DSPM for AI review' estimatedTime='10 min'"
agent: ab900-cert-buddy-agent
tools:
[vscode, execute, read, agent, edit, search, web, browser, 'ab900buddy-mslearn/*', 'ab900buddy-context7/*', 'ab900buddy-markitdown/*', todo]
---

# AB-900 Scenario Walkthrough

Generate **ONE** realistic **AB-900** admin scenario walkthrough.

## Use this skill

You must follow the workspace skill **ab900-scenario-walkthrough** for walkthrough structure, guardrails, AB-900 accuracy rules, output format, and **delivery rules** (full walkthrough in a single message).

## Inputs (from chat)

- Domain: ${input:domain:Domain 1 | Domain 2 | Domain 3 (or leave blank and the agent picks one)}
- Scenario type: ${input:scenarioType:Copilot licensing | Agent approval | DSPM for AI review | SharePoint oversharing | Sensitivity labels | DLP policy | PIM/Conditional Access}
- Estimated time: ${input:estimatedTime:5 min | 10 min (default 10 min)}

## Grounding and validation rules

1. Ground every navigation path and setting in **Microsoft Learn** using the **Microsoft Learn MCP** server and Copilot web search. Microsoft Learn is the primary grounding source for all admin center paths and feature behavior.
2. If the walkthrough includes M365 PowerShell cmdlets or Graph API calls, confirm command names and parameters with **Context7** tools.
3. Provide **Microsoft Learn URLs** in the references section of the walkthrough output.

## Terminology

Always use current Microsoft product names. Apply all mappings from the agent terminology table silently. Never use:

- "Azure AD", "AAD", or "Azure Active Directory" (use "Microsoft Entra ID")
- "compliance.microsoft.com" (use "purview.microsoft.com")
- "AI hub" (use "DSPM for AI")
- "Azure AI Studio" (use "Microsoft Foundry")
- "Microsoft 365 Defender" (use "Microsoft Defender XDR"; the portal is the "Microsoft Defender portal")
- "Exchange Online admin center" (use "Exchange admin center")
- "Content explorer" where the current tool is "Data explorer"
- "Requested agents tab" (use "Requests")
- "Billing > Billing policies" for Copilot (use "Copilot > Billing & usage")
- "restricted site access" as the primary term (use "restricted access control"; note that the SharePoint admin center UI does label the per-site section "Restricted site access")

The unit of consumption is the **Copilot Credit** at $0.01 per credit. The Azure invoice meter is still named "Copilot Studio", so a walkthrough that opens an invoice should say so.

## AB-900 accuracy rules

Before generating the walkthrough, confirm all portal paths match exactly:

- DSPM for AI: purview.microsoft.com > Solutions > DSPM for AI (classic); oversharing review is under **Data risk assessments**
- Copilot PAYG billing: admin.microsoft.com > Copilot > Billing & usage (Billing policies tab, Pay-as-you-go services tab)
- Agent approval queue: admin.microsoft.com > Agents > All agents > **Requests**
- Agent settings: admin.microsoft.com > Agents > Settings
- Researcher and Analyst: part of the core Copilot chat experience, available under **Tools**, and outside agent-related settings; disable with a tenant-wide **Block** at admin.microsoft.com > Agents > All agents
- Sensitivity labels: purview.microsoft.com > Solutions > Information Protection > Sensitivity labels
- DLP policies: purview.microsoft.com > Data loss prevention > Policies (Copilot location is "Microsoft 365 Copilot and Copilot Chat")
- Data access governance reports: SharePoint admin center > Reports > Data access governance
- Conditional Access: entra.microsoft.com > Entra ID > Conditional Access > Policies
- PIM: entra.microsoft.com > ID Governance > Privileged Identity Management
- Copilot license assignment: admin.microsoft.com > Users > Active users > [user] > Licenses and Apps

## Output format

Use the YAML output format defined in the **ab900-scenario-walkthrough** skill exactly. The output must include: title, domain, objective, scenario_context, estimated_time, prerequisites, steps (each with action, portal, navigation, correct_setting, exam_relevance), exam_connection (with domain, key_objectives, common_distractors), and references.

## Style rules

- No contractions.
- No ambiguous "navigate around" steps. Every step must name the exact portal, menu path, and setting.
- Use bold for clickable UI elements (buttons, menu items) following Microsoft instruction formatting.
- Distractors in common_distractors must describe real failure modes or real-but-wrong paths, not invented ones.
- All product names and navigation paths must use current terminology.
- Use a fictional company name (Contoso, Fabrikam, Tailwind Traders, Northwind Traders, Adventure Works) in the scenario_context field.
- No cleanup section is required. If a setting is reversible, add a one-sentence note in the last step.
