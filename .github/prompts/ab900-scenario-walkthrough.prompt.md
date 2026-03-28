---
name: ab900-scenario-walkthrough
description: "Generate one AB-900 admin scenario walkthrough: a guided 5-10 minute simulation of a real M365 admin task with exact navigation paths, correct settings, and exam relevance notes."
argument-hint: "domain='Domain 2' scenarioType='DSPM for AI review' estimatedTime='10 min'"
agent: ab900-cert-buddy-agent
tools:
  - ab900buddy-context7/*
  - ab900buddy-markitdown/*
  - ab900buddy-mslearn/*
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

Always use current Microsoft product names. Apply all mappings from the agent terminology table silently. Never use "Azure AD" (use "Microsoft Entra ID"), "compliance.microsoft.com" (use "purview.microsoft.com"), "per message" (use "per Copilot Credit"), "AI hub" (use "DSPM for AI (classic)"), or "Billing > Billing policies" (use "Copilot > Billing & usage").

## AB-900 accuracy rules

Before generating the walkthrough, confirm all portal paths match exactly:

- DSPM for AI: purview.microsoft.com > Solutions > DSPM for AI (classic)
- Copilot PAYG billing: admin.microsoft.com > Copilot > Billing & usage
- Agent approval queue: admin.microsoft.com > Agents > All agents > Requests
- Researcher/Analyst block: admin.microsoft.com > Agents > All agents (separate block; not the general agent toggle)
- Sensitivity labels: purview.microsoft.com > Solutions > Information protection > Labels
- DLP policies: purview.microsoft.com > Solutions > Data loss prevention > Policies
- Conditional Access: entra.microsoft.com > Protection > Conditional Access > Policies
- Copilot license assignment: admin.microsoft.com > Users > Active users > [user] > Licenses and apps

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
