---
name: ab900-scenario-walkthrough
description: Generate realistic 5-10 minute admin scenario walkthroughs through M365 admin centers. Each walkthrough is a guided simulation of a real AB-900 admin task with numbered steps, exact navigation paths, correct settings, and exam relevance notes.
---

# Skill: ab900.scenario_walkthrough.admin_simulation

**Description:** Generate realistic 5-10 minute admin scenario walkthroughs through M365 admin centers. Each walkthrough is a guided simulation of a real AB-900 admin task with numbered steps, exact navigation paths, correct settings, and exam relevance notes. This skill replaces hands-on Azure lab tasks; AB-900 is an admin fundamentals exam, not a hands-on Azure lab exam.

## Grounding

**Required sources:**

- Microsoft Learn (primary truth source for admin center navigation, feature behavior, and correct settings; access via Microsoft Learn MCP server and Copilot web search)
- Context7 MCP (when M365 PowerShell cmdlets or Graph API syntax appears in a step)

## Style

**Microsoft style:**

- Use Microsoft instruction formatting conventions for UI labels, menu names, and dialog names.
- Bold clickable UI elements (buttons, menu items, portal names).
- Use exact product names and portal URLs.

## Guardrails

- Keep every walkthrough within AB-900 scope (M365 admin tasks, not Azure infrastructure).
- No contractions.
- No ambiguous "navigate around until you find it" steps. Every step must name the exact portal, blade, menu item, or button label.
- Always use current Microsoft product names and navigation paths. Apply all mappings from the agent terminology table silently.
- Use fictional company names (Contoso, Fabrikam, Tailwind Traders, Northwind Traders, Adventure Works) for scenario context in the scenario_context field.
- No cleanup section is required. Admin configurations can be noted as reversible with a brief note; no Azure resource deletion is needed.

## AB-900 accuracy rules (non-negotiable)

These navigation paths must be exact every time they appear. Do not approximate or invent alternative paths.

- **DSPM for AI portal path:** purview.microsoft.com > Solutions > DSPM for AI (classic)
- **Copilot PAYG billing:** admin.microsoft.com > Copilot > Billing & usage
- **Agent approval queue:** admin.microsoft.com > Agents > All agents > Requests
- **Researcher and Analyst block:** admin.microsoft.com > Agents > All agents (separate block entry; not controlled by general agent toggle)
- **SharePoint oversharing remediation:** purview.microsoft.com > Solutions > DSPM for AI (classic) > Oversharing reports
- **Sensitivity label creation:** purview.microsoft.com > Solutions > Information protection > Labels
- **DLP policy management:** purview.microsoft.com > Solutions > Data loss prevention > Policies
- **Conditional Access:** entra.microsoft.com > Protection > Conditional Access > Policies
- **PIM role activation:** entra.microsoft.com > Identity governance > Privileged Identity Management
- **Copilot license assignment:** admin.microsoft.com > Users > Active users > [user] > Licenses and apps

## Supported scenario types

Select one of the following scenario types per walkthrough:

- **Copilot licensing:** Assigning or removing Microsoft 365 Copilot licenses, reviewing license consumption, or understanding subscription vs. pay-as-you-go models.
- **Agent approval:** Reviewing, approving, or blocking an agent submission in the agent approval queue; separately blocking Researcher or Analyst.
- **DSPM for AI review:** Opening the DSPM for AI (classic) dashboard, reviewing sensitive data signals, interpreting oversharing reports, or reviewing AI interaction logs.
- **SharePoint oversharing:** Identifying overshared SharePoint sites or files through DSPM for AI (classic) and remediating access.
- **Sensitivity labels:** Creating or modifying a sensitivity label, configuring label settings (encryption, marking, scope), and publishing a label policy.
- **DLP policy:** Reviewing a DLP policy alert, creating a DLP policy scoped to Copilot interactions, or configuring a policy tip.
- **PIM/Conditional Access:** Activating a PIM role for a Copilot-related admin task, or reviewing a Conditional Access policy that affects Copilot-licensed users.

## Timebox guidance

A walkthrough should contain 5-10 numbered steps across all tasks. If the walkthrough requires more than 10 steps, split the content into two separate walkthroughs, each focused on a narrower objective. Estimated time is 5-10 minutes (admin center navigation only; no Azure resource creation).

## Workflow

1. Choose a single AB-900 objective and state it at the top.
2. Select a scenario type and draft a fictional company context.
3. Ground every navigation path and setting in Microsoft Learn via the Microsoft Learn MCP server.
4. Draft 5-10 numbered steps. Each step must include: what to navigate to, what to configure or observe, what the correct setting or action is, and why it matters for AB-900.
5. Confirm that all portal URLs and navigation paths match the AB-900 accuracy rules above.
6. Map each step to an exam domain (Domain 1, 2, or 3) in the exam_connection field.
7. Add Microsoft Learn references.

## Output format

```yaml
walkthrough:
  title: "<Action-oriented title, e.g., 'Review DSPM for AI oversharing signals for a SharePoint site'>"
  domain: "<Domain 1 | Domain 2 | Domain 3>"
  objective: "<One sentence outcome tied to AB-900>"
  scenario_context: "<2-3 sentence fictional company scenario that sets the admin task context>"
  estimated_time: "<5 min | 10 min>"
  prerequisites:
    - "<Microsoft 365 admin access or specific role required>"
    - "<Any required license or configuration already in place>"
  steps:
    - step: 1
      action: "<What the admin does in this step>"
      portal: "<Portal URL, e.g., admin.microsoft.com | purview.microsoft.com | entra.microsoft.com>"
      navigation: "<Exact menu path, e.g., Copilot > Billing & usage>"
      correct_setting: "<What the correct value, toggle state, or selection is>"
      exam_relevance: "<One sentence explaining why AB-900 tests this step>"
    - step: 2
      action: "<...>"
      portal: "<...>"
      navigation: "<...>"
      correct_setting: "<...>"
      exam_relevance: "<...>"
  exam_connection:
    domain: "<Domain number and name>"
    key_objectives:
      - "<Objective line 1 from AB-900 study guide>"
      - "<Objective line 2 if applicable>"
    common_distractors:
      - "<Distractor 1: real but wrong path or setting a test-taker might choose>"
      - "<Distractor 2: real but wrong role or tool>"
  references:
    - "<Microsoft Learn URL 1>"
    - "<Microsoft Learn URL 2 if needed>"
```

## Delivery rules

Walkthroughs are delivered in full (all sections in a single message). Unlike practice questions, there is no interactive hold-back of answers. If multiple walkthroughs are requested, deliver each walkthrough sequentially in the same message.

## Quality checklist

- "Single objective, single scenario type."
- "All portal URLs and navigation paths match AB-900 accuracy rules exactly."
- "Every step has an action, portal, navigation path, correct setting, and exam relevance note."
- "Estimated time is 5-10 minutes."
- "No invented admin center paths or fake settings."
- "All product names and portal names use current terminology."
- "No contractions in any walkthrough text."
- "Fictional company name is used for scenario context."
- "At least one Microsoft Learn reference is included."

---

## Prompt template

```text
Create {{count}} AB-900 admin scenario walkthrough(s).

Inputs:

- domain: {{domain}} (Domain 1 / Domain 2 / Domain 3, or pick from AB-900 exam domains)
- scenario_type: {{scenario_type}} (Copilot licensing | Agent approval | DSPM for AI review | SharePoint oversharing | Sensitivity labels | DLP policy | PIM/Conditional Access)
- estimated_time: {{estimated_time}} (5 min | 10 min)

Requirements:

1. Ground every navigation path and setting in Microsoft Learn first (via Microsoft Learn MCP server).
2. Apply all AB-900 accuracy rules for portal paths, billing paths, and agent queue paths.
3. Output using the YAML output_format exactly.
```
