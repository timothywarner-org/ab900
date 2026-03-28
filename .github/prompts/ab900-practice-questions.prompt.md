---
name: ab900-practice-question
description: "Generate one exam-realistic AB-900 practice question grounded in Microsoft Learn and validated for M365 accuracy."
argument-hint: "domain='Domain 2' objective='DSPM for AI oversharing remediation' bloom='Apply' difficulty='medium'"
agent: ab900-cert-buddy-agent
tools:
  - ab900buddy-context7/*
  - ab900buddy-markitdown/*
  - ab900buddy-mslearn/*
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

Always use current Microsoft product names. Apply all mappings from the agent terminology table silently. Never use "Azure AD" (use "Microsoft Entra ID"), "compliance.microsoft.com" (use "purview.microsoft.com"), "per message" (use "per Copilot Credit"), "AI hub" (use "DSPM for AI (classic)"), or "Billing > Billing policies" (use "Copilot > Billing & usage"). See the full terminology table in the agent file.

## AB-900 accuracy rules

Before generating the item, confirm:

- DSPM for AI path is purview.microsoft.com > Solutions > DSPM for AI (classic).
- Copilot PAYG billing path is admin.microsoft.com > Copilot > Billing & usage.
- Agent approval queue is admin.microsoft.com > Agents > All agents > Requests.
- Researcher and Analyst are NOT disabled by the general agent toggle.
- Any item referencing license activation must note the 24-hour delay (not "immediately").

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

*(Do NOT reveal the answer. Wait for the user to reply.)*

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
