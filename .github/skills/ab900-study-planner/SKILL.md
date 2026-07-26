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
   | Domain 1: Identify the core features and objects of Microsoft 365 services | 30-35% |
   | Domain 2: Understand data protection and governance tasks for Microsoft 365 and Copilot | 35-40% |
   | Domain 3: Perform basic administrative tasks for Copilot and agents | 25-30% |

   These titles and weights are from the **Skills measured as of July 22, 2026** version of the study guide. Use them verbatim.

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

### Domain 1: Identify the core features and objects of Microsoft 365 services (30-35%)

Three subsections: "Identify the core objects of Microsoft 365 services", "Understand the Microsoft 365 security principles", and "Identify the core security features of Microsoft 365 services". The first and third are marked **Minor** changes in the July 22, 2026 change log.

High-priority topics:

- License types assigned to users and groups, and how they affect access to Microsoft 365 features
- Microsoft 365 admin center organization configuration (domain names and org settings)
- Exchange admin center objects: mailboxes and distribution groups (the portal is the **Exchange admin center**, not the Exchange Online admin center)
- SharePoint admin center objects: sites, libraries, and folders; plus roles and permissions for sites in SharePoint in Microsoft 365
- Teams admin center objects: teams, channels, and policies
- Zero Trust principles, authorization, authentication methods, threat protection and intelligence
- Microsoft Defender XDR features and capabilities (surfaced in the Microsoft Defender portal at security.microsoft.com)
- Microsoft Entra ID features, Conditional Access, and the purpose and benefits of SSO
- Troubleshooting sign-in issues (MFA, Conditional Access, risky sign-ins)
- Interpreting Identity Secure Score at entra.microsoft.com > Entra ID > Identity Secure Score
- Reviewing audit logs for user and admin activity (purview.microsoft.com > Audit, or security.microsoft.com > Audit)
- The role of Privileged Identity Management (PIM) at entra.microsoft.com > ID Governance > Privileged Identity Management
- App registrations versus Enterprise applications (application object versus service principal)

### Domain 2: Understand data protection and governance tasks for Microsoft 365 and Copilot (35-40%)

**This is the highest exam weight domain. Prioritize if all domains are weak.**

Four subsections: "Understand Microsoft Purview", "Understand data security implications of Copilot", "Identify data protection and governance risks for Microsoft 365 and Copilot", and "Identify and monitor oversharing in SharePoint in Microsoft 365". The oversharing subsection is marked **Minor** in the July 22, 2026 change log.

High-priority topics:

- Purview solution families: Information Protection, Data Loss Prevention, Insider Risk Management, Communication Compliance, DSPM for AI, and Data Lifecycle Management
- Sensitivity label use cases, data classification, and retention
- DSPM for AI (classic): purview.microsoft.com > Solutions > DSPM for AI (classic), including **Data risk assessments** (a weekly default assessment runs automatically for the top 100 SharePoint sites)
- Note for learners: the Purview portal now also shows a unified **DSPM** entry that reached general availability in May 2026, alongside **Data Security Posture Management (classic)**. The exam objective wording still says "DSPM for AI".
- How Copilot accesses data, how Microsoft Graph influences responses, and how permissions and Purview controls protect against risk
- The EXTRACT usage right: when a label applies encryption, a user needs EXTRACT in addition to VIEW for Copilot to summarize the content
- Responsible AI principles
- Compliance Manager, Microsoft Purview **Data explorer** (purview.microsoft.com > Solutions > Information Protection > Explorers > Data explorer), activity explorer, DLP alerts, and Communication Compliance policy violations
- Content search in Microsoft Purview eDiscovery (purview.microsoft.com > Solutions > eDiscovery > Content search)
- Running a data access governance report: SharePoint admin center > Reports > Data access governance
- SharePoint Advanced Management, including **restricted access control (RAC)**, and how RAC (controls access) differs from restricted content discovery (controls discoverability in search and Copilot without changing permissions)
- Sensitivity labels: creation at purview.microsoft.com > Solutions > Information Protection > Sensitivity labels, publishing at Information Protection > Publishing policies
- DLP for Copilot: turn on the **Microsoft 365 Copilot and Copilot Chat** location at purview.microsoft.com > Data loss prevention > Policies

### Domain 3: Perform basic administrative tasks for Copilot and agents (25-30%)

Three subsections: "Understand features and capabilities of Copilot and agents", "Perform basic administrative tasks for Copilot", and "Perform basic administrative tasks for agents".

High-priority topics:

- Comparing built-in capabilities of Copilot and agents; use cases for Researcher, Analyst, and custom agents
- Comparing the Copilot monthly license model to pay-as-you-go, **including SharePoint**
- Which Copilot features can be enabled or disabled
- Copilot PAYG billing navigation: admin.microsoft.com > Copilot > Billing & usage (not the Billing node, which covers Microsoft 365 Backup, SharePoint storage, and High Volume Email)
- Copilot Credits as the unit of consumption, billed at $0.01 per credit; a pay-as-you-go budget sends notifications but does **NOT** enforce a spending cap
- Copilot license assignment: admin.microsoft.com > Users > Active users > [user] > Licenses and Apps. Allow up to 24 hours for Copilot to appear in some Microsoft 365 apps after assignment.
- Monitoring usage and adoption: admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot, plus Copilot Analytics and the Copilot Dashboard in Viva Insights
- Managing prompts: saving, sharing, scheduling, and deleting
- Configuring user access to agents: admin.microsoft.com > Agents > Settings (User access, Sharing, Allowed agent types)
- Creating an agent with Agent Builder in Microsoft 365 Copilot, or in SharePoint
- Agent approval: admin.microsoft.com > Agents > All agents > **Requests**, with states Pending review, Pending update, and Pending activate; actions are **Publish to store** and **Reject submission**
- Researcher and Analyst are part of the core Copilot chat experience and do **NOT** fall under agent-related settings; they stay available under **Tools** in Copilot Chat. Disabling one requires the tenant-wide **Block** action, and **Edit users** is disabled for them.
- Monitoring agents through the Agent Registry and the Microsoft Power Platform admin center

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
