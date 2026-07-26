---
name: ab900-item-creator
description: Generate AB-900 practice questions that feel like the real exam without copying it. Every item is grounded in current Microsoft Learn content, uses modern M365 and Purview terminology, and follows Microsoft-style exam item rules (scenario-first, plausible distractors, no trick wording).
---

# Skill: ab900.practice_questions.exam_realistic

**Description:** Generate AB-900 practice questions that feel like the real exam without copying it. Every item is grounded in current Microsoft Learn content, uses modern M365 and Purview terminology, and follows Microsoft-style exam item rules (scenario-first, plausible distractors, no trick wording).

## Grounding

**Required sources:**

- Microsoft Learn (primary truth source for objectives + features; access via Microsoft Learn MCP server and Copilot web search)
- Context7 MCP (version-specific docs/snippets for M365 PowerShell and Graph API accuracy when needed)

**Study guide:**

- Study guide for Exam AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals (skills outline + objective mapping) [Microsoft Learn]
- Current skills-measured version: **Skills measured as of July 22, 2026**. Always confirm the objective wording against this version before writing an item.

**Exam domains and weights (as of July 22, 2026):**

| Domain | Title (verbatim from the study guide) | Weight |
| --- | --- | --- |
| Domain 1 | Identify the core features and objects of Microsoft 365 services | 30-35% |
| Domain 2 | Understand data protection and governance tasks for Microsoft 365 and Copilot | 35-40% |
| Domain 3 | Perform basic administrative tasks for Copilot and agents | 25-30% |

Domain 2 carries the most weight. The July 22, 2026 change log marks three subsections as **Minor** and zero as Major: "Identify the core objects of Microsoft 365 services", "Identify the core security features of Microsoft 365 services", and "Identify and monitor oversharing in SharePoint in Microsoft 365". Items targeting those three subsections should use the refreshed wording below.

**Objective wording that changed in the July 22, 2026 refresh:**

- "Identify the appropriate objects to configure by using the **Exchange admin center** (mailboxes and distribution groups)" -- NOT "Exchange Online admin center" and NOT "distribution lists".
- "Identify the appropriate objects to configure by using the **SharePoint admin center** (sites, libraries, and folders)" -- the admin center dropped the "in Microsoft 365" qualifier, but the SERVICE is still named "SharePoint in Microsoft 365".
- "Understand features and capabilities of SharePoint Advanced Management, including **restricted access control**" -- NOT "restricted site access".
- "Identify sensitive information by using **Microsoft Purview Data Explorer**" -- NOT Content explorer.
- "Search for files and emails by using **Content search in Microsoft Purview eDiscovery**" -- Content search is a capability inside eDiscovery, not a standalone solution.
- "Understand features and capabilities of **Microsoft Defender XDR**" -- NOT "Microsoft 365 Defender".
- "Compare Copilot monthly license model to pay-as-you-go, **including SharePoint**".

## Style

**Microsoft style:**

- Follow Microsoft sentence-style capitalization and UI-label rules.
- Use exact admin center navigation labels as they appear in the product.

## Guardrails

**Exam integrity:**

- Do not recreate or paraphrase real exam questions.
- Do not reference braindumps or leaked content.
- Write original scenarios and original stems every time.

**Terminology:**

- Always use current Microsoft product names. Apply all mappings from the agent's terminology table silently. Never use "Azure AD", "AAD", or "Azure Active Directory" (use "Microsoft Entra ID"); "compliance.microsoft.com" (use "purview.microsoft.com"); "AI hub" (use "DSPM for AI"); "Azure AI Studio" (use "Microsoft Foundry"); "Microsoft 365 Defender" (use "Microsoft Defender XDR"); "Exchange Online admin center" (use "Exchange admin center"); "Content explorer" when the objective means "Data explorer"; or "Requested agents tab" (use "Requests"). If a distractor references identity, governance, or billing, double-check that every product name and navigation path is current.
- **Billing unit:** the unit of consumption is the **Copilot Credit** at $0.01 per credit. Do NOT write an item asserting that one message equals one credit -- consumption is per-feature (a classic answer is 1 credit, a generative answer is 2, tenant graph grounding is 10). Microsoft's own pay-as-you-go Meters page still says "$0.01 per message", so avoid writing items that hinge on the message-versus-credit noun alone.

**Item quality:**

- No contractions.
- Avoid negatives; if truly required, **CAP** + **bold** the negative word in the stem.
- Exactly 4 options (A-D) unless the requested item type explicitly differs.
- Exactly 1 correct answer unless the requested item type explicitly differs.
- No "all of the above", "none of the above", or subset answers (no overlap between choices).
- Distractors must be plausible and real (no fake admin centers, fake navigation paths, fake features).

**AB-900-specific accuracy rules (non-negotiable):**

- DSPM for AI portal path is ALWAYS: purview.microsoft.com > Solutions > DSPM for AI (classic). The Purview portal also shows a newer unified **DSPM** entry and a **Data Security Posture Management (classic)** entry. Never write an item whose correct answer depends on the classic-versus-unified distinction unless the stem names the version explicitly.
- Oversharing and data risk review is ALWAYS: DSPM for AI (classic) > **Data risk assessments**. There is no node named "Oversharing reports".
- Copilot PAYG billing is ALWAYS: admin.microsoft.com > Copilot > Billing & usage
- Agent approval primary queue is ALWAYS: admin.microsoft.com > Agents > All agents > **Requests** (NOT a "Requested agents" tab, and NOT nested under Copilot).
- Researcher and Analyst are part of the core Copilot chat experience and do **NOT** fall under any agent-related settings; they stay available under **Tools** in Copilot Chat even when agents are disabled. The only way to turn one off is the tenant-wide **Block** action on the individual agent; **Edit users** is disabled for them.
- Sensitivity label creation is ALWAYS: purview.microsoft.com > Solutions > Information Protection > Sensitivity labels
- DLP policy management is ALWAYS: purview.microsoft.com > Data loss prevention > Policies; the Copilot DLP location is named **Microsoft 365 Copilot and Copilot Chat**
- Data explorer is ALWAYS: purview.microsoft.com > Solutions > Information Protection > Explorers > Data explorer
- Content search is ALWAYS: purview.microsoft.com > Solutions > eDiscovery > Content search
- Data access governance reports are ALWAYS: SharePoint admin center > Reports > Data access governance
- Conditional Access is ALWAYS: entra.microsoft.com > Entra ID > Conditional Access > Policies
- PIM is ALWAYS: entra.microsoft.com > ID Governance > Privileged Identity Management

## Workflow

1. Pull current AB-900 exam domains and choose a target objective to measure.
2. Ground the intended correct behavior in Microsoft Learn via the Microsoft Learn MCP server.
3. If the item touches M365 PowerShell or Graph API specifics, invoke Context7 MCP to confirm syntax.
4. Draft a workplace scenario stem using a fictional company (Contoso, Fabrikam, Tailwind Traders, Northwind Traders, Adventure Works) that forces a real admin decision.
5. Write 1 correct answer and 3 distractors based on common-but-wrong admin assumptions.
6. Apply one or more of the AB-900 common distractor patterns (see below) to ensure distractors are realistic.
7. Run a mutual exclusivity check on answer choices.
8. Run a terminology check: confirm every product name and navigation path matches current terminology.
9. Run a candidate clarity check: single skill measured, no trivia, no hidden requirements.
10. Prepare rationale internally but **do not deliver it yet** (see delivery rules below).

## AB-900 common distractor patterns

Use these patterns to construct realistic distractors. Each represents a real misconception or a real-but-wrong path.

Do NOT use a retired portal or a retired UI label as a distractor unless the stem is explicitly testing recognition of the retired name. A distractor built on a name Microsoft no longer uses is unfair and dates the item.

- **Wrong nav path:** using Billing > Pay-as-you-go instead of Copilot > Billing & usage for Copilot PAYG charges. The Billing node is real and covers Microsoft 365 Backup, SharePoint storage, and High Volume Email, so it is plausible but wrong for Copilot.
- **Legacy SharePoint agent billing path:** using Org settings > Pay-as-you-go services for SharePoint agents. This was the previous location, and an existing policy there must be disconnected before a Copilot-node policy can be linked.
- **Overprivileged role:** selecting Global Administrator when a more specific role (such as AI Administrator, Compliance Administrator, or Billing Administrator) is the correct least-privilege choice. Agent governance actions require AI Administrator or Global Administrator; Global Reader is view-only.
- **Wrong tool for AI data risk:** using Data explorer or activity explorer alone when the scenario calls for DSPM for AI data risk assessments, or reaching for Purview audit logs to build Copilot usage reporting (Microsoft explicitly warns audit data is not intended for that).
- **Agent settings confusion:** selecting the general agent on/off setting when the correct action is a tenant-wide Block on Researcher or Analyst. Reinforce that these two are core chat Tools and fall outside agent-related settings entirely.
- **Budget enforcement:** selecting "the budget stops spending" when a pay-as-you-go budget only triggers email notifications. Microsoft states the system does not enforce the budget or prevent the organization from exceeding it.
- **Seat minimum reversal:** selecting "300-seat minimum" for Microsoft 365 Copilot. The minimum was removed in January 2024; the surviving 300 figure is a MAXIMUM on Copilot Business and the Business-with-Copilot SKUs.
- **RAC versus RCD confusion:** selecting restricted access control when the scenario calls for restricted content discovery, or the reverse. RAC controls who can open the site at all; RCD controls whether content surfaces in org-wide search and Copilot without changing permissions.
- **Retired feature as the answer:** selecting Restricted SharePoint Search, which blocks new enablement starting July 31, 2026 and is superseded by Restricted Content Discovery.
- **Propagation timing:** selecting "applies immediately" when the documented behavior includes a delay. Only use a specific number when the scenario supports one that Microsoft publishes, for example allow up to 24 hours for Copilot to appear in Microsoft 365 apps after license assignment, up to 6 hours for an admin-pinned agent to appear, or up to 24 hours for a pay-as-you-go budget alert.
- **Incorrect admin center:** navigating to the SharePoint admin center or Teams admin center when the correct path is the Microsoft 365 admin center or the Purview portal, or the reverse. Data access governance reports genuinely do live in the SharePoint admin center, so scope this pattern carefully.

## Scenario context guidance

Scenarios must involve realistic M365 admin tasks. Use the following scenario types to vary content across items:

- Configuring Copilot settings in the Microsoft 365 admin center.
- Assigning or removing Microsoft 365 Copilot licenses.
- Reviewing DSPM for AI dashboards and data risk assessments for sensitive data risk.
- Remediating SharePoint oversharing using data access governance reports, restricted access control, or restricted content discovery.
- Approving, updating, or blocking an agent in the agent approval queue (Pending review, Pending update, Pending activate).
- Reviewing the Agent Registry for agents without owners or agents at risk.
- Creating or modifying a sensitivity label in Microsoft Purview.
- Reviewing a DLP policy alert or configuring a DLP policy for the Microsoft 365 Copilot and Copilot Chat location.
- Managing Conditional Access or Privileged Identity Management (PIM) for Copilot-licensed users.
- Troubleshooting Copilot sign-in or license assignment issues.
- Reviewing pay-as-you-go Copilot Credit consumption in the Credits report.
- Comparing the Copilot monthly license model to pay-as-you-go, including SharePoint agents.
- Interpreting Identity Secure Score or reviewing audit logs for user and admin activity.

## Invalid answer handling

When presenting questions interactively:

- **"hint"**: Provide a clue that eliminates one distractor. Re-present the question with all four choices still visible but the eliminated option noted.
- **"skip"** or **"I do not know"**: Immediately reveal the correct answer and full rationale (Phase 2), then move to the next question.
- **Unrecognized input**: Prompt the user: "Please reply with **A**, **B**, **C**, or **D**. You can also type **hint** for a clue or **skip** to see the answer."

## Progress tracking

When multiple questions are requested:

- Prefix each question with **"Question N of M"** (for example, "Question 3 of 10").
- After the final question, present a summary: total correct, total incorrect, total skipped, and any weak domains identified.

## Scenario-first stem guidance

The stem must open with a workplace scenario before asking the question. The scenario establishes context that makes the question feel like a real admin decision.

**Good example:**
> Contoso Ltd. has recently purchased Microsoft 365 Copilot licenses for 200 users. The compliance team has discovered that Copilot is surfacing files from a SharePoint site that contains sensitive HR data. You need to identify which users accessed that data through Copilot. What should you do?

**Bad example (no scenario):**
> Which tool shows Copilot data access events?

## Plausible distractor guidance

Distractors must reference real M365 admin portals, navigation paths, roles, or features that are genuinely related to the topic but incorrect for the specific scenario.

**Good distractors** (real, current, but wrong for the scenario):

- A: "Navigate to purview.microsoft.com > Solutions > Information Protection > Explorers > Data explorer." (Real, current tool that shows where sensitive data lives, but it does not surface Copilot-specific AI data risk; DSPM for AI data risk assessments is the correct path.)
- B: "Navigate to admin.microsoft.com > Billing > Pay-as-you-go." (Real, current path, but it covers Microsoft 365 Backup, SharePoint storage, and High Volume Email; Copilot services are managed at Copilot > Billing & usage.)

**Bad distractors** (fake, implausible, or retired):

- A: "Enable Copilot Shield in the Microsoft Defender portal." (Fake feature -- no such product exists.)
- B: "Run Set-CopilotAuditLog -Enable $true in PowerShell." (Fake cmdlet -- does not exist.)
- C: "Navigate to compliance.microsoft.com > Content Search." (Retired portal and retired standalone solution. A distractor built on a name Microsoft has retired tests recall of obsolete branding rather than admin judgment.)

## Delivery rules (non-negotiable)

When presenting a question to the user:

**Phase 1 -- Question only:**

- Show metadata, scenario stem, and choices (A-D).
- Do **NOT** include correct_answer, rationale, or references.
- End the message and wait for the user to reply.

**Phase 2 -- Evaluation:**

- After the user replies with their answer, show:
  - Whether they were correct or incorrect.
  - The correct answer letter.
  - Full rationale for every choice (see rationale depth below).
  - References (Microsoft Learn URLs).

If multiple questions were requested, repeat this Phase 1 / Phase 2 cycle for each question sequentially.

## Output format

**Phase 1 message (question only):**

- **metadata**
  - exam: AB-900
  - domain: "`<Domain 1 | Domain 2 | Domain 3>`"
  - objective: "`<specific objective line>`"
  - bloom: "`<Remember|Understand|Apply|Analyze>`"
  - difficulty: "`<easy|medium|hard>`"
- **question**
  - stem:
    - `<Scenario + question. Keep it tight. One problem. One decision.>`
  - choices:
    - A: "`<choice>`"
    - B: "`<choice>`"
    - C: "`<choice>`"
    - D: "`<choice>`"

*(Stop here. Wait for the user to answer.)*

**Phase 2 message (evaluation, after user replies):**

- **result:** "<Correct! / Incorrect.> The correct answer is <A|B|C|D>."
- **rationale:**
  - A: "<2-sentence explanation. Sentence 1: state whether correct or incorrect and why. Sentence 2: add context -- when this option would apply, the misconception it tests, or how it differs from the correct answer.>"
  - B: "<same 2-sentence format>"
  - C: "<same 2-sentence format>"
  - D: "<same 2-sentence format>"
- **references:**
  - "<Microsoft Learn URL 1>"
  - "<Microsoft Learn URL 2 if needed>"
- **quality_checklist:**
  - "Scenario is realistic for an M365 admin."
  - "Exactly one skill is being measured."
  - "Correct answer is unambiguously correct given Learn docs."
  - "Distractors are plausible, real, and unambiguously wrong."
  - "No contractions; minimal negatives; no trick phrasing."
  - "Choices are parallel in grammar and scope."
  - "At least one Microsoft Learn reference is included."
  - "All product names and navigation paths use current terminology."
  - "Each rationale entry is exactly 2 sentences."
  - "AB-900 accuracy rules verified (portal paths, billing path, agent queue, toggle behavior)."

---

## Prompt template

You are writing NEW AB-900 practice questions that feel exam-realistic without copying the exam.

**Inputs:**

- count: {{count}}
- domain: {{domain}} (Domain 1 / Domain 2 / Domain 3, or pick from the AB-900 exam domains)
- bloom: {{bloom}}
- constraints: {{constraints}}

**Requirements:**

1. Ground every question in Microsoft Learn first (via Microsoft Learn MCP server).
2. Use Context7 MCP for M365 PowerShell or Graph API accuracy when applicable.
3. Follow guardrails, AB-900 accuracy rules, and output_format exactly.

Deliver {{count}} items.
