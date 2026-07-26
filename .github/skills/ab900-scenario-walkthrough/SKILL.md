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

**Exam domains and weights (as of July 22, 2026):**

| Domain | Title (verbatim from the study guide) | Weight |
| --- | --- | --- |
| Domain 1 | Identify the core features and objects of Microsoft 365 services | 30-35% |
| Domain 2 | Understand data protection and governance tasks for Microsoft 365 and Copilot | 35-40% |
| Domain 3 | Perform basic administrative tasks for Copilot and agents | 25-30% |

Use this wording verbatim in the `exam_connection.domain` field. Populate `key_objectives` from the July 22, 2026 skills-measured document, not from memory.

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

- **DSPM for AI portal path:** purview.microsoft.com > Solutions > DSPM for AI (classic). The Purview portal now also lists a unified **DSPM** entry (generally available May 2026) and a **Data Security Posture Management (classic)** entry. If a walkthrough demonstrates the unified experience, name it explicitly and use DSPM > Discover, DSPM > Actions, or DSPM > Reports.
- **Copilot PAYG billing:** admin.microsoft.com > Copilot > Billing & usage (Billing policies tab and Pay-as-you-go services tab)
- **Agent approval queue:** admin.microsoft.com > Agents > All agents > Requests
- **Agent settings:** admin.microsoft.com > Agents > Settings
- **Agent Registry:** admin.microsoft.com > Agents > All agents > Registry
- **Researcher and Analyst:** these are part of the core Copilot chat experience and do **NOT** fall under agent-related settings; they remain available under **Tools** in Copilot Chat. To disable one, use the tenant-wide **Block** action on the individual agent at admin.microsoft.com > Agents > All agents. **Edit users** is disabled for these agents.
- **SharePoint oversharing review:** purview.microsoft.com > Solutions > DSPM for AI (classic) > **Data risk assessments** (there is no "Oversharing reports" node), or SharePoint admin center > Reports > Data access governance
- **Restricted access control (tenant):** SharePoint admin center > Policies > Access control > Site-level access restriction
- **Restricted access control (per site):** SharePoint admin center > Sites > Active sites > [site] > Settings tab > Restricted site access
- **Restricted content discovery:** SharePoint admin center > Sites > Active sites > [site] > Settings tab > Restrict content discovery
- **Sensitivity label creation:** purview.microsoft.com > Solutions > Information Protection > Sensitivity labels
- **Sensitivity label publishing:** purview.microsoft.com > Solutions > Information Protection > Publishing policies
- **DLP policy management:** purview.microsoft.com > Data loss prevention > Policies. The Copilot DLP location is named **Microsoft 365 Copilot and Copilot Chat**.
- **Data explorer:** purview.microsoft.com > Solutions > Information Protection > Explorers > Data explorer
- **Content search:** purview.microsoft.com > Solutions > eDiscovery > Content search
- **Audit log search:** purview.microsoft.com > Audit (also reachable at security.microsoft.com > Audit)
- **Conditional Access:** entra.microsoft.com > Entra ID > Conditional Access > Policies. In policy creation the target selector reads **Resources (formerly cloud apps)**.
- **PIM role activation:** entra.microsoft.com > ID Governance > Privileged Identity Management > My roles
- **Identity Secure Score:** entra.microsoft.com > Entra ID > Identity Secure Score
- **Copilot license assignment:** admin.microsoft.com > Users > Active users > [user] > Licenses and Apps
- **Copilot usage and Credits reports:** admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot (then the Copilot, Agents, or Credits report)

## Supported scenario types

Select one of the following scenario types per walkthrough:

- **Copilot licensing:** Assigning or removing Microsoft 365 Copilot licenses, reviewing license consumption, or comparing the monthly license model to pay-as-you-go (including SharePoint agents).
- **Agent approval:** Reviewing, approving, updating, or blocking an agent submission in the agent approval queue (Pending review, Pending update, Pending activate); or blocking Researcher or Analyst tenant-wide.
- **DSPM for AI review:** Opening the DSPM for AI (classic) dashboard, reviewing sensitive data signals, running or interpreting a data risk assessment, or reviewing AI interaction activity.
- **SharePoint oversharing:** Running a data access governance report in the SharePoint admin center, then remediating with restricted access control (RAC) or restricted content discovery (RCD).
- **Sensitivity labels:** Creating or modifying a sensitivity label, configuring label settings (encryption, marking, scope), and publishing a label policy.
- **DLP policy:** Reviewing a DLP policy alert, or creating a DLP policy that turns on the **Microsoft 365 Copilot and Copilot Chat** location.
- **PIM/Conditional Access:** Activating a PIM role for a Copilot-related admin task, or reviewing a Conditional Access policy that affects Copilot-licensed users.
- **Copilot pay-as-you-go billing:** Creating a billing policy at Copilot > Billing & usage, connecting a service on the Pay-as-you-go services tab, and setting an optional budget (which notifies but does **NOT** enforce a spending cap).

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
- scenario_type: {{scenario_type}} (Copilot licensing | Agent approval | DSPM for AI review | SharePoint oversharing | Sensitivity labels | DLP policy | PIM/Conditional Access | Copilot pay-as-you-go billing)
- estimated_time: {{estimated_time}} (5 min | 10 min)

Requirements:

1. Ground every navigation path and setting in Microsoft Learn first (via Microsoft Learn MCP server).
2. Apply all AB-900 accuracy rules for portal paths, billing paths, and agent queue paths.
3. Output using the YAML output_format exactly.
```
