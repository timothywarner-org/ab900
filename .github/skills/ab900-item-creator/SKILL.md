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

- Always use current Microsoft product names. Apply all mappings from the agent's terminology table silently. Never use "Azure AD" (use "Microsoft Entra ID"), "compliance.microsoft.com" (use "purview.microsoft.com"), "per message" (use "per Copilot Credit"), "AI hub" (use "DSPM for AI (classic)"), or "Azure AI Studio" (use "Azure AI Foundry"). If a distractor references identity, governance, or billing, double-check that every product name and navigation path is current.

**Item quality:**

- No contractions.
- Avoid negatives; if truly required, **CAP** + **bold** the negative word in the stem.
- Exactly 4 options (A-D) unless the requested item type explicitly differs.
- Exactly 1 correct answer unless the requested item type explicitly differs.
- No "all of the above", "none of the above", or subset answers (no overlap between choices).
- Distractors must be plausible and real (no fake admin centers, fake navigation paths, fake features).

**AB-900-specific accuracy rules (non-negotiable):**

- DSPM for AI portal path is ALWAYS: purview.microsoft.com > Solutions > DSPM for AI (classic)
- Copilot PAYG billing is ALWAYS: admin.microsoft.com > Copilot > Billing & usage
- Agent approval primary queue is ALWAYS: admin.microsoft.com > Agents > All agents > Requests
- Researcher and Analyst agents are NOT disabled by the general Copilot agent toggle; they require a separate block.
- Sensitivity label creation is ALWAYS: purview.microsoft.com > Solutions > Information protection > Labels

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

- **Wrong portal:** using compliance.microsoft.com instead of purview.microsoft.com (or vice versa for non-Purview tasks).
- **Wrong nav path:** using Billing > Billing policies instead of Copilot > Billing & usage for PAYG Copilot charges.
- **Overprivileged role:** selecting Global Administrator when a more specific role (such as Compliance Administrator or Copilot Administrator) is the correct least-privilege choice.
- **Wrong tool for AI data risk:** using Content Explorer instead of DSPM for AI (classic) when the scenario involves AI-generated oversharing or sensitive data surfaced by Copilot.
- **Agent toggle confusion:** selecting the general Copilot agent toggle when the correct action is a separate block for Researcher or Analyst.
- **Activation timing:** selecting "activates immediately" when the correct behavior includes a 24-hour delay for license propagation or policy enforcement.
- **Incorrect admin center:** navigating to a SharePoint admin center or Teams admin center when the correct path is the Microsoft 365 admin center or Purview portal.

## Scenario context guidance

Scenarios must involve realistic M365 admin tasks. Use the following scenario types to vary content across items:

- Configuring Copilot settings in the Microsoft 365 admin center.
- Assigning or removing Microsoft 365 Copilot licenses.
- Reviewing DSPM for AI dashboards for sensitive data risk.
- Remediating SharePoint oversharing identified by DSPM for AI.
- Approving or blocking an agent in the agent approval queue.
- Creating or modifying a sensitivity label in Microsoft Purview.
- Reviewing a DLP policy alert or configuring a DLP policy for Copilot interactions.
- Managing Conditional Access or Privileged Identity Management (PIM) for Copilot-licensed users.
- Troubleshooting Copilot sign-in or license assignment issues.
- Reviewing pay-as-you-go Copilot Credit consumption.

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

**Good distractors** (real but wrong):

- A: "Navigate to compliance.microsoft.com > Content Explorer." (Real tool, but does not surface Copilot-specific AI data risk; DSPM for AI is the correct path.)
- B: "Navigate to admin.microsoft.com > Billing > Billing policies." (Real path, but used for legacy billing settings, not Copilot PAYG usage.)

**Bad distractors** (fake or implausible):

- A: "Enable Copilot Shield in the Microsoft Defender portal." (Fake feature -- no such product exists.)
- B: "Run Set-CopilotAuditLog -Enable $true in PowerShell." (Fake cmdlet -- does not exist.)

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
