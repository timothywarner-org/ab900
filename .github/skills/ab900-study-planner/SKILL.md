---
name: ab900-study-planner
description: Generates a personalized AB-900 study plan based on the user's self-assessed confidence across the three exam domains, prioritizing weak domains with estimated hours and Microsoft Learn module links.
---

# Skill: ab900.study_planner.personalized

**Description:** Generates a personalized AB-900 study plan based on the user's self-assessed confidence across the three exam domains, prioritizing weak domains with estimated hours and Microsoft Learn module links.

## Grounding

**Required sources:**

- AB-900 exam skills outline (Microsoft 365 Copilot and Agent Administration Fundamentals, current skills-measured document) [Microsoft Learn]
- Microsoft Learn (access via Microsoft Learn MCP server and Copilot web search for current Learn module URLs)
- Context7 MCP (resolve Learn module links and verify they are current)

## Workflow

1. **Present exam domains with weights.** Show the three AB-900 exam domains and their exam weight percentages:

   | Domain | Exam Weight |
   | --- | --- |
   | Domain 1: Core Features and Objects of Microsoft 365 Services | 30-35% |
   | Domain 2: Data Protection and Governance for Microsoft 365 and Copilot | 35-40% |
   | Domain 3: Copilot and Agent Administration | 25-30% |

   Flag Domain 2 explicitly as the highest-weight domain: "Domain 2 carries the most exam weight (35-40%). If all three domains are weak or unknown, prioritize Domain 2 first."

2. **Ask for confidence ratings.** Ask the user to rate their confidence in each domain using one of these levels:
   - **Strong** -- comfortable with most objectives; needs only light review.
   - **Moderate** -- familiar with the concepts but needs targeted practice.
   - **Weak** -- limited experience; needs focused study.
   - **Unknown** -- not sure; treat as weak.

3. **Generate a prioritized study plan.** Based on the user's ratings:
   - Order domains from weakest to strongest.
   - Within equal confidence levels, prioritize domains with higher exam weight (Domain 2 first, then Domain 1, then Domain 3).
   - For each domain, provide:
     - Estimated study hours (weak: 6-8 hours, moderate: 3-5 hours, strong: 1-2 hours).
     - Two to three specific Microsoft Learn module links (grounded via Microsoft Learn MCP server or web search; do not invent URLs).
     - Key objectives to focus on (from the AB-900 skills-measured document).
     - High-priority topics specific to AB-900 (see domain-specific guidance below).
   - Include a total estimated hours range at the bottom.

4. **Offer to start practicing.** After presenting the plan, ask: "Would you like to start with practice questions or a scenario walkthrough on **[first recommended domain]**?"

## Domain-specific high-priority topics

Use these topic lists to populate the focus objectives and recommended content for each domain.

### Domain 1: Core Features and Objects of Microsoft 365 Services (30-35%)

High-priority topics:

- Microsoft 365 Copilot capabilities and supported Microsoft 365 apps (Word, Excel, PowerPoint, Teams, Outlook)
- Microsoft 365 service architecture: tenants, users, groups, licenses
- Microsoft Entra ID roles relevant to M365 administration (Global Administrator, Compliance Administrator, Copilot Administrator)
- Microsoft 365 admin center navigation and core admin tasks
- Microsoft Teams and SharePoint as Copilot data sources

### Domain 2: Data Protection and Governance for Microsoft 365 and Copilot (35-40%)

**This is the highest exam weight domain. Prioritize if all domains are weak.**

High-priority topics:

- DSPM for AI (classic): dashboard navigation at purview.microsoft.com > Solutions > DSPM for AI (classic), oversharing reports, AI interaction logs
- SharePoint oversharing remediation via DSPM for AI (classic)
- Sensitivity labels: creation and management at purview.microsoft.com > Solutions > Information protection > Labels
- Data Loss Prevention (DLP) policies scoped to Copilot interactions
- Microsoft Purview compliance portal navigation (purview.microsoft.com, not compliance.microsoft.com)
- Audit log search and Content Explorer (and when NOT to use them -- use DSPM for AI for AI-specific risk)

### Domain 3: Copilot and Agent Administration (25-30%)

High-priority topics:

- Microsoft 365 Copilot licensing: subscription (per-user monthly) vs. pay-as-you-go (per Copilot Credit)
- Copilot PAYG billing navigation: admin.microsoft.com > Copilot > Billing & usage (not Billing > Billing policies)
- Agent approval workflow: admin.microsoft.com > Agents > All agents > Requests
- Blocking or approving agents; difference between the general agent toggle and separately blocking Researcher or Analyst
- Researcher and Analyst agents: require a separate block entry; NOT disabled by the general Copilot agent toggle
- Copilot license assignment: admin.microsoft.com > Users > Active users > [user] > Licenses and apps
- 24-hour delay for license propagation and policy enforcement (does not activate immediately)

## Output format

```markdown
## Your Personalized AB-900 Study Plan

### Priority 1: [Domain Name] (exam weight: XX-XX%)

**Your confidence:** [rating]
**Estimated study time:** X-X hours

**Focus objectives:**
- [Objective 1]
- [Objective 2]
- [Objective 3]

**High-priority topics:**
- [Topic 1]
- [Topic 2]

**Recommended Microsoft Learn modules:**
- [Module title](URL)
- [Module title](URL)

---

### Priority 2: [Domain Name] (exam weight: XX-XX%)

... (repeat for each domain)

---

**Total estimated study time:** XX-XX hours

Ready to start? I can generate practice questions or a scenario walkthrough on **[first recommended domain]**.
```

## Guardrails

- Do not skip any of the three exam domains. Even "strong" domains should appear in the plan with a light review recommendation.
- Do not invent Microsoft Learn module URLs. Use the Microsoft Learn MCP server or web search to find real, current module links.
- Treat "unknown" confidence the same as "weak."
- Flag Domain 2 as the highest-weight domain whenever its confidence rating is weak or unknown.
- Always use current Microsoft product names. Apply all mappings from the agent terminology table silently.
- No contractions.

## Delivery rules

Deliver the full study plan in a single message after the user provides their confidence ratings. Do not split the plan across multiple messages.
