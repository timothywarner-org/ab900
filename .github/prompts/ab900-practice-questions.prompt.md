---
name: ab900-practice-question
description: "Generate one exam-realistic AB-900 practice question grounded in Microsoft Learn and validated for M365 accuracy."
argument-hint: "domain='Domain 2' objective='DSPM for AI oversharing remediation' bloom='Apply' difficulty='medium'"
agent: ab900-cert-buddy-agent
tools:
[vscode, execute, read, agent, edit, search, web, browser, 'ab900buddy-mslearn/*', 'ab900buddy-context7/*', 'ab900buddy-markitdown/*', todo]
---

# AB-900 Practice Question

Generate **ONE** original, exam-realistic **AB-900** practice question.

## Use this skill

You must follow the workspace skill **ab900-item-creator** for item structure, guardrails, and **delivery rules** (Phase 1 / Phase 2 interactive flow).

## Inputs (from chat)

- Domain: ${input:domain:Domain 1 | Domain 2 | Domain 3 (or leave blank and the agent picks one)}
- Objective: ${input:objective:Specific objective line to measure (optional)}
- Bloom: ${input:bloom:Remember | Understand | Apply | Analyze}
- Difficulty: ${input:difficulty:easy | medium | hard}

## Grounding and validation rules

1. Ground the correct behavior in **Microsoft Learn** using the **Microsoft Learn MCP** server and Copilot web search.
2. If the item includes M365 PowerShell or Graph API syntax, confirm with **Context7** tools.
3. Provide **Microsoft Learn URLs** in the Phase 2 References section.

## Terminology

Always use current Microsoft product names. Apply all mappings from the agent terminology table silently. Never use:

- "Azure AD", "AAD", or "Azure Active Directory" (use "Microsoft Entra ID")
- "compliance.microsoft.com" (use "purview.microsoft.com")
- "AI hub" (use "DSPM for AI")
- "Azure AI Studio" (use "Microsoft Foundry")
- "Microsoft 365 Defender" (use "Microsoft Defender XDR"; the portal is the "Microsoft Defender portal")
- "Exchange Online admin center" (use "Exchange admin center") or "distribution lists" in the Domain 1 objective (use "distribution groups")
- "Content explorer" where the objective means "Data explorer"
- "Requested agents tab" (use "Requests")
- "Billing > Billing policies" for Copilot (use "Copilot > Billing & usage")
- "restricted site access" in the SharePoint Advanced Management objective (use "restricted access control")

The unit of consumption is the **Copilot Credit** at $0.01 per credit, but Microsoft's own pay-as-you-go Meters page still reads "$0.01 per message" and the Azure meter is still named "Copilot Studio". Do not write an item that turns on the message-versus-credit noun alone, and never assert that one message equals one credit. See the full terminology table in the agent file.

## AB-900 accuracy rules

Before generating the item, confirm:

- The objective wording matches the **Skills measured as of July 22, 2026** study guide.
- DSPM for AI path is purview.microsoft.com > Solutions > DSPM for AI (classic), and oversharing review is under **Data risk assessments** (there is no "Oversharing reports" node).
- Copilot PAYG billing path is admin.microsoft.com > Copilot > Billing & usage.
- Agent approval queue is admin.microsoft.com > Agents > All agents > **Requests**.
- Researcher and Analyst are part of the core Copilot chat experience and do **NOT** fall under agent-related settings; disabling one requires a tenant-wide **Block**.
- Sensitivity labels are at purview.microsoft.com > Solutions > Information Protection > Sensitivity labels; DLP policies are at purview.microsoft.com > Data loss prevention > Policies.
- Conditional Access is entra.microsoft.com > Entra ID > Conditional Access > Policies; PIM is entra.microsoft.com > ID Governance > Privileged Identity Management.
- Any item referencing propagation timing must use a delay Microsoft actually publishes for that scenario (for example, up to 24 hours for Copilot to appear in some Microsoft 365 apps after license assignment). Do not apply a generic 24-hour rule to every scenario.

## Output format (exact) -- two-phase delivery

### Phase 1 (send first, then STOP and wait for user reply)

#### Metadata

- Exam: AB-900
- Domain:
- Objective:
- Bloom:
- Difficulty:

#### Question

`<scenario-first stem>`

A. `<choice>`
B. `<choice>`
C. `<choice>`
D. `<choice>`

_(Do NOT reveal the answer. Wait for the user to reply.)_

### Phase 2 (send after the user replies with their choice)

**Result:** <Correct! / Incorrect.> The correct answer is **<A|B|C|D>**.

#### Rationale

- A: <2 sentences. Sentence 1: state correct/incorrect and why. Sentence 2: context, misconception, or contrast with the correct answer.>
- B: <same 2-sentence format>
- C: <same 2-sentence format>
- D: <same 2-sentence format>

#### References

- <Microsoft Learn URL 1>
- <Microsoft Learn URL 2 if needed>

## Style rules

- No contractions.
- No trick wording.
- No negatives unless absolutely required; if used, **bold** the negative word.
- Distractors must be plausible and real M365 admin options (no invented portals, paths, or features).
- All product names and navigation paths must use current terminology.
