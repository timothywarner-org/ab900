# AB-900 New Features Deep Dive: What Changed Through July 2026

**Audience:** IT professionals with existing Microsoft 365 administration experience preparing to teach or sit the AB-900 exam (Microsoft 365 Copilot and Agent Administration Fundamentals).

**Purpose:** This document covers topics that are genuinely new to the AB-900 objective domain, plus the material that **moved, was renamed, or changed status** between early 2026 and July 2026. Familiarity with Exchange, Teams, Intune, or Purview DLP does not substitute for understanding these areas, and familiarity with the early-2026 versions of these features is no longer sufficient either.

**Last updated:** 2026-07-26, verified against Microsoft Learn and the AB-900 study guide dated **Skills measured as of July 22, 2026**.

**Exam version in force:** AB-900 skills measured as of **July 22, 2026**. The change log for that refresh lists **three Minor** subsection changes and **ZERO Major** changes. Domain weightings are unchanged: Domain 1 at 30-35%, Domain 2 at 35-40%, Domain 3 at 25-30%.

---

## Table of Contents

1. [What changed in the July 22, 2026 objective refresh](#1-what-changed-in-the-july-22-2026-objective-refresh)
2. [DSPM: three entries in the Purview portal now](#2-dspm-three-entries-in-the-purview-portal-now)
3. [Copilot Credits replaced the message as the billing unit](#3-copilot-credits-replaced-the-message-as-the-billing-unit)
4. [Microsoft 365 E7 and Microsoft Agent 365](#4-microsoft-365-e7-and-microsoft-agent-365)
5. [The Agents workload moved to a top-level admin center node](#5-the-agents-workload-moved-to-a-top-level-admin-center-node)
6. [Researcher and Analyst: the governance mechanism restated](#6-researcher-and-analyst-the-governance-mechanism-restated)
7. [Work IQ is an umbrella, not a peer of Microsoft Graph](#7-work-iq-is-an-umbrella-not-a-peer-of-microsoft-graph)
8. [eDiscovery unified, Content search relocated](#8-ediscovery-unified-content-search-relocated)
9. [Data explorer replaced Content explorer as the exam answer](#9-data-explorer-replaced-content-explorer-as-the-exam-answer)
10. [SharePoint oversharing: RSS retiring, RAC and RCD are the answer](#10-sharepoint-oversharing-rss-retiring-rac-and-rcd-are-the-answer)
11. [Identity changes with hard dates ahead](#11-identity-changes-with-hard-dates-ahead)
12. [Rename table: say this, not that](#12-rename-table-say-this-not-that)
13. [Cross-topic exam traps summary](#13-cross-topic-exam-traps-summary)

---

## 1. What changed in the July 22, 2026 objective refresh

The AB-900 change log compares "Skill area prior to July 22, 2026" against "Skill area as of July 22, 2026" and contains exactly six rows.

| Skill area | Change |
|---|---|
| Audience profile | No change |
| **Identify the core features and objects of Microsoft 365 services** (functional group) | No change |
| Identify the core objects of Microsoft 365 services | **Minor** |
| Identify the core security features of Microsoft 365 services | **Minor** |
| **Understand data protection and governance tasks for Microsoft 365 and Copilot** (functional group) | No change |
| Identify and monitor oversharing in SharePoint in Microsoft 365 | **Minor** |

**There is no row for Domain 3** ("Perform basic administrative tasks for Copilot and agents") and no row for "Understand the Microsoft 365 security principles", "Understand Microsoft Purview", "Understand data security implications of Copilot", or "Identify data protection and governance risks for Microsoft 365 and Copilot". Under Microsoft's change log convention, unlisted areas were unchanged in this refresh.

### The three Minor changes, decoded

The change log does not spell out what changed inside each Minor subsection. Comparing the current objective text against the prior wording surfaces these differences, and each is high-probability exam material precisely because Microsoft flagged the subsection.

| Subsection | Wording that changed |
|---|---|
| Identify the core objects of Microsoft 365 services | The bullet now reads "**Exchange admin center** (mailboxes and **distribution groups**)". Previously "Exchange Online admin center" and "distribution lists". Also "**SharePoint admin center**", previously "SharePoint in Microsoft 365 admin center". |
| Identify the core security features of Microsoft 365 services | The subsection now enumerates Identity Secure Score, audit log review, Privileged Identity Management, and App registrations plus Enterprise apps alongside the Entra ID, Conditional Access, and SSO bullets. |
| Identify and monitor oversharing in SharePoint in Microsoft 365 | The SharePoint Advanced Management bullet now reads "including **restricted access control**". Previously "restricted site access". |

> **Careful nuance on "SharePoint in Microsoft 365".** Do **NOT** blanket-replace this phrase. It is still current and correct when naming the **service**, as in "Identify the appropriate roles and permissions for sites in SharePoint in Microsoft 365" and the subsection heading "Identify and monitor oversharing in SharePoint in Microsoft 365". Only fix it where it modifies "admin center".

### Exam logistics worth restating correctly

| Fact | Value |
|---|---|
| Passing score | **700 or greater** on a scale where 1000 is the maximum |
| Exam duration | **45 minutes** working clock; **65 minutes** seat duration for a Fundamentals exam |
| Question count | Microsoft publishes **no AB-900-specific count**. The official statement is generic: "Most Microsoft Certification exams typically contain between 40-60 questions; however, the number can vary depending on the exam." Present 40-60 as a Microsoft-wide typical range, **not** a verified AB-900 figure. |
| Beta status | **NOT in beta.** AB-900 exited beta on January 28, 2026. Remove every reference to beta scoring delays or beta discount codes. |
| Renewal | AB-900 **does NOT require renewal**. Microsoft states verbatim: "Fundamentals certifications do not expire." |
| Access to Microsoft Learn during the exam | **NOT available.** The in-exam Learn resource "is only available on role-based exams, not fundamentals or Microsoft Office Specialist (MOS) exams." |
| Retake | 24 hours after the first attempt; wait times increase for subsequent retakes |
| Languages | **English only** as of July 22, 2026 |
| Scheduling | Pearson VUE, or Certiport for students and educators. Proctored, and "may have interactive components". Price varies by country or region. |
| Breaks | Unscheduled breaks allowed, but the clock keeps running and you cannot return to any question viewed before the break. Five minutes of break time is built into the duration. |
| Preview features | "Most questions cover features that are general availability (GA). The exam may contain questions on Preview features if those features are commonly used." |
| Sandbox | `https://aka.ms/examdemo`. The secure browser is not enabled in the sandbox. |
| Practice assessment | A free official AB-900 Practice Assessment is live on Microsoft Learn |

> **Renewal trap worth naming out loud.** The AB-900 study guide's own boilerplate renewal row says "Microsoft associate, expert, and specialty certifications expire annually", which learners routinely misread as applying to AB-900. It does not. Fundamentals certifications do not expire.

> **MS-900 is gone.** MS-900 (Microsoft 365 Fundamentals) retired March 31, 2026. AB-900 is its successor Fundamentals credential in the Microsoft 365 space. Do not present MS-900 as a currently available alternative.

---

## 2. DSPM: three entries in the Purview portal now

### What changed

Earlier course materials asserted, as an authoritative rule, that DSPM for AI is reached at `purview.microsoft.com > Solutions > DSPM for AI (classic)`. That path now points to the **legacy** experience. The **new unified Data Security Posture Management (DSPM)** reached general availability in **May 2026** and is the current front door.

A learner opening **purview.microsoft.com > Solutions** today sees **three** DSPM entries:

| Entry | What it is |
|---|---|
| **DSPM** (no qualifier) | The new unified experience. GA May 2026. Microsoft states most new features will be added to this version only. |
| **DSPM for AI (classic)** | The previous AI-focused experience. Still a current, accurate UI label. **This is the wording the AB-900 objective uses.** |
| **Data Security Posture Management (classic)** | The previous general data security posture experience. |

Microsoft Learn instructs administrators to sign in to the Microsoft Purview portal and go to **Solutions > DSPM**, and warns explicitly not to confuse it with the previous versions, which are now named **Data Security Posture Management (classic)** and **DSPM for AI (classic)**. Microsoft also states that DSPM for AI and DSPM "have converged into a single, central solution."

### How to teach this without getting it wrong on stage

The AB-900 objective bullet still says **Microsoft Purview Data Security Posture Management (DSPM) for AI**, and a later bullet says "Discover and manage AI activity by using **DSPM for AI**". Answer exam items with the classic wording. In a live portal demo, open the new unified **DSPM** as the current front door and name the two classic entries so nobody is surprised by what they see.

<!-- VERIFY: Microsoft has published no retirement date for the DSPM for AI (classic) experience. Do NOT state a classic sunset date on stage. -->

### New unified DSPM key pages

**Posture** (dashboard with 30-day trending), **Objectives** (data security objectives such as "Prevent data exposure in Microsoft 365 Copilot and Microsoft Copilot interactions" and "Prevent oversharing of sensitive data"), **AI observability** (inventory of AI apps and agents including Microsoft Agent 365, with activity in the last 30 days), **Asset explorer**, **Reports**, and **Setup tasks**.

### Old-to-new navigation mapping

Use this when a learner asks where their DSPM for AI page went.

| Former location | New location in unified DSPM |
|---|---|
| Setup tasks | DSPM > **Getting Started**, or DSPM > Actions > Setup tasks |
| Recommendations for AI apps | DSPM > **Actions > Remediation actions** |
| Microsoft 365 Copilot overview page | DSPM > **Reports > Microsoft 365 Copilot** |
| Policies for AI apps | DSPM > **Reports > Policies with AI workloads** |
| Apps and agents | DSPM > **Discover > Apps and agents** |
| Activity explorer | DSPM > **Discover > Activity explorer > AI activities tab** |
| Data risk assessments | DSPM > **Discover > Data risk assessments** |

**Coverage gap worth naming:** the unified DSPM's **Discover > Apps and agents** dashboard does **NOT** include Agent 365 agents. Microsoft directs admins to the **AI observability** page for Agent 365 coverage.

### What still holds from the earlier material

- The **weekly default data risk assessment** for the **top 100 SharePoint sites** by usage runs automatically with no admin configuration. This remains true.
- Allow at least **24 hours** after activating one-click policies for data to populate.
- Custom data risk assessments are in **preview**.
- **Access roles:** Microsoft Entra **Compliance Administrator**, Microsoft Entra **Global Administrator**, or the Microsoft Purview **Compliance Administrator** role group. DSPM (classic) additionally requires **Microsoft 365 E5** or the **Microsoft Purview Suite**.
- To view prompt and response **content** in activity explorer drill-down, the admin must be a member of the Microsoft Purview **Content Explorer Content Viewer** role group.

### Purview's three AI app category names as they appear in the UI

- **Copilot experiences and agents** -- Microsoft 365 Copilot, Security Copilot, Copilot in Fabric, Copilot Studio
- **Enterprise AI apps** -- Microsoft Foundry, Entra-registered AI apps, Anthropic Claude Enterprise, ChatGPT Enterprise
- **Other AI apps** -- browser-detected apps categorized as Generative AI in the Defender for Cloud Apps catalog, such as ChatGPT, Google Gemini, consumer Microsoft Copilot, DeepSeek

### Named one-click policies

"Secure interactions from enterprise apps", "Secure data in Azure AI apps and agents", "Detect sensitive info added to AI sites", "Detect when users visit AI sites", "Detect sensitive info shared in AI prompts in Edge", "Detect sensitive info shared with AI via network", "Control Unethical Behavior in AI" (remediated in Communication Compliance), and "Detect risky AI usage" (remediated in Insider Risk Management).

> **Exam Traps**
>
> - The classic label is what the **objective** says; the unified DSPM is what the **portal** shows first. Both statements are true at the same time.
> - The default assessment is automatic and weekly. Exam items may try to make you think an admin must manually run or schedule it.
> - DSPM requires **Compliance Administrator** permissions, not necessarily Global Administrator. An admin with only the SharePoint Administrator role cannot access it.
> - Monitoring prompts sent to third-party AI sites requires **device onboarding**, not just Purview licensing.
> - "AI hub" is retired terminology. The Copilot usage report FAQ reads "Data Security Posture Management for AI (previously called AI Hub)."

---

## 3. Copilot Credits replaced the message as the billing unit

### This is the headline correction in this document

Earlier versions of this material stated that pay-as-you-go usage is billed through "the Copilot Studio **message** meter at **$0.01 per message**". **The unit noun is stale.** Microsoft Learn now states plainly: "Copilot Credits are the unit that measures agent usage" and "Copilot Credits are the unit of consumption in Microsoft 365 Copilot Chat and SharePoint agents for AI interactions." The pay-as-you-go rate is **$0.01 per Copilot Credit**.

**The dollar figure did not change. The unit did.** That distinction matters commercially: a single complex Copilot Chat or SharePoint agent prompt can consume **12 credits ($0.12)**, not 1 message ($0.01).

### The documentation conflict you must handle carefully on stage

This is not a clean rename. Both vocabularies are live in current Microsoft documentation:

| Source | What it says |
|---|---|
| Copilot Studio billing-rates page | Copilot Credits |
| Power Platform pay-as-you-go meters page | "the total number of Copilot credits consumed by agents", billed "$0.01 per credit" |
| Microsoft 365 admin center report | Literally named **Credits** |
| Microsoft 365 Copilot pay-as-you-go **Meters** page | **NOT updated.** Still shows the meter as "Copilot Studio", describes "a billable Copilot Studio message", and bills "$0.01 per message". |
| Azure invoice | The meter name is still **Copilot Studio** |

**Safe on-stage phrasing:** the unit is the **Copilot Credit at $0.01 per credit**; the Azure meter is still named **Copilot Studio**; and some Learn pages still say "per message". Do **NOT** assert that 1 message equals 1 credit as a universal rule, because consumption is per-feature and ranges from 1 to 100 credits.

> **Note for anyone maintaining this repo's CI.** The validation rule that flags "per message" as retired terminology is only partially right and will produce false positives against current Microsoft documentation. The Meters page genuinely still uses that phrasing.

**The Azure public pricing page for Copilot Studio no longer displays a numeric per-credit figure.** It shows "Price per Copilot Credit: $-" and directs customers to the Azure pricing calculator or a sales specialist. Cite the $0.01 figure from Microsoft Learn, not from the Azure pricing page.

### Consumption rates

| Action | Credits |
|---|---|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding for messages | 10 |
| Agent flow actions | 13 per 100 actions |
| Content processing tools | 8 per page |
| Text and generative AI tools, basic | 1 per 10 responses (0.1 per 1K tokens) |
| Text and generative AI tools, standard | 15 per 10 responses (1.5 per 1K tokens) |
| Text and generative AI tools, premium | 100 per 10 responses (10 per 1K tokens) |
| Classic Voice | 10 per minute |
| GenAI Voice | 35 per minute |
| Premium GenAI Voice | 75 per minute |

**Users who ARE licensed with Microsoft 365 Copilot incur "No charge"** for classic answers, generative answers, agent actions, tenant graph grounding, agent flow actions, and AI tools in employee-facing (B2E) scenarios, subject to fair usage limits. **Pay-as-you-go credits are consumed by UNLICENSED users.**

### Three purchase models

| Model | Detail |
|---|---|
| **Pay-as-you-go** | $0.01 per Copilot Credit, billed to a linked Azure subscription. Up to **50** billing policies per tenant. |
| **Prepaid capacity packs** | **$200.00 per pack per month for 25,000 Copilot Credits**. Replenished at the start of every monthly billing period and consumed **FIRST**, before pay-as-you-go billing applies. "Message packs" is the retired name. |
| **Copilot Credit Pre-Purchase Plan** | Bought in the Azure portal under **Reservations**. Uses Copilot Credit Commit Units (CCCUs) over a one-year term at tiered discounts. **Cancellations and exchanges are NOT supported.** |

**A newer billing construct arrived in 2026: Copilot credit policies**, which connect prepaid capacity pack credits to a specific set of users **without requiring an Azure subscription**. A tenant can create up to **10** Copilot credit policies. **They are currently available ONLY for Microsoft 365 Copilot Chat.** For SharePoint agents, administrators must continue using pay-as-you-go billing.

> **Three different limits, three different things.** 50 pay-as-you-go billing policies per tenant. 10 Copilot credit policies per tenant. 10 SharePoint agent billing policies. Do not conflate them.

**Overage enforcement:** Copilot Studio prepaid capacity triggers enforcement at **125%** of prepaid capacity, at which point custom agents are disabled until capacity is increased or reset. Users then see "There is a billing issue" or "This agent is currently unavailable. It has reached its usage limit."

### The admin path is unchanged and still correct

**admin.microsoft.com > Copilot > Billing & usage.** The **Billing policies** tab holds the policies; the **Pay-as-you-go services** tab connects them to services.

The warning against the Billing node for Copilot also still holds. That page covers Microsoft 365 Backup, Microsoft 365 SharePoint Storage, and High Volume Email; for Copilot it only surfaces a "Go to Copilot Billing & usage" redirect link. Microsoft states explicitly: "Manage Copilot services in Copilot > Billing & usage."

**Second route to the same destination:** Copilot > Settings > User access > Copilot pay-as-you-go billing.

**Prerequisites:** Billing Administrator, AI Administrator, or Global Administrator role; an Azure subscription in the same tenant as Microsoft 365; an Azure resource group in that subscription; **Owner or Contributor** rights to both; and the tenant must have at least one SharePoint license or a license that includes SharePoint.

**Three services are available for pay-as-you-go:** Microsoft 365 Copilot Chat, SharePoint agents, and the **Microsoft Copilot Retrieval API** (in preview). The Retrieval API is billed **per API call at $0.10**, not per credit.

### Billing has bifurcated

**Copilot Cowork** and the **Work IQ API** are **NOT** managed through the Copilot node pay-as-you-go flow. Microsoft explicitly redirects those to a **Cost Management dashboard** in the Microsoft admin center with **Overview** and **Consumption** tabs, supporting prepaid credits, pay-as-you-go, or existing capacity.

**Microsoft 365 Copilot Cowork reached general availability in June 2026** for all Microsoft 365 Copilot tenants worldwide in tier-1 languages. It exposes a model selector including **Claude Opus 4.8**, **Claude Sonnet 5**, and **Claude Fable 5 (preview)**. Fable 5 is **off by default**; an admin turns it on in the Microsoft 365 admin center under Copilot settings. It requires data retention by the model provider, and Cowork shows a banner while it is selected.

### SharePoint pay-as-you-go, called out because the objective names it

The Domain 3 bullet reads "Compare Copilot monthly license model to pay-as-you-go, **including SharePoint**." Cover this specifically.

- SharePoint agent usage **by unlicensed users** is billed as **Generative answer (2)** plus **Tenant graph grounding (10)**. Because SharePoint agents are always grounded in the tenant graph, Microsoft states each interaction uses **12 messages (10 + 2)** to respond to a single complex prompt.
- Billing applies **only** when a user **WITHOUT** a Microsoft 365 Copilot license uses a SharePoint agent.
- **Setup roles:** SharePoint administrator plus **Owner or Contributor** on the Azure subscription and resource group.
- **Policy limit:** up to **10** billing policies, each assigned **one** security group. Only users in the assigned security group have access to SharePoint agents.
- **Migration trap:** policies previously configured under **Org settings > Pay-as-you-go services** must be disconnected there (select SharePoint agents, then **Disconnect previous billing**) before a new Copilot-node billing policy can be linked.

### The budget nuance that has not changed

Budget limits **trigger email notifications only**. Microsoft states that the system does **NOT** enforce the budget or prevent the organization from exceeding it, and that usage can continue uninterrupted even after the budget is surpassed. Default alert threshold is **100%**, and alerts can take up to **24 hours** to arrive.

> **Exam Traps**
>
> - "$0.01 per message" is **numerically** right and **linguistically** stale. The unit is the Copilot Credit.
> - "Creating a billing policy enables PAYG" is FALSE. The policy must also be connected to a Copilot service.
> - "Budget limits prevent overspending" is FALSE. They notify only.
> - "PAYG provides full Microsoft 365 Copilot" is FALSE. PAYG covers Copilot Chat, SharePoint agents, and the Retrieval API preview, not the full in-app Copilot suite.
> - Licensed Copilot users incur **no charge** for the credit-consuming actions in B2E scenarios. Credits are consumed by **unlicensed** users.

---

## 4. Microsoft 365 E7 and Microsoft Agent 365

Both went generally available on **May 1, 2026**. Any licensing slide that stops at E5 is now incomplete.

### Microsoft 365 E7 (the "Frontier Suite")

**E7 = Microsoft 365 E5 + Microsoft 365 Copilot + Microsoft Entra Suite + Agent 365** in a single SKU. Microsoft Learn states E7 is a **strict superset of E5**: it only adds capabilities, it never removes them. Reported list price is **$99 per user per month**.

**E7 customers do NOT buy the Copilot add-on separately.** E7 is also now an eligible license for Microsoft 365 Copilot Chat, listed alongside E3 and E5.

### Microsoft Agent 365

Documented as **the control plane for AI agents**, letting organizations deploy, govern, and manage all agents at scale regardless of where they were built or acquired. Licensed **per user** at general availability. Reported standalone list price is **$15 per user per month**; it is also included in E7.

**Agents themselves do not require their own Agent 365 license.** All agents managed or owned by a licensed user are covered under that user's Agent 365 or Microsoft 365 E7 license.

**Frontier licensing differs from GA.** In the Frontier program, licenses are assigned **per agent instance** and are required before an agent instance can be created. Frontier tenants confirm enrollment by checking for 25 active "Microsoft 365 Frontier for AI Teammates" licenses under Billing > Licenses. There is **NO** Service Level Agreement associated with Agent 365 Frontier, and Microsoft states Frontier should not be used for product evaluations, recommending Agent 365 trials instead.

**Licensing gates on agent visibility:** a Microsoft E7 or Agent 365 license is required to see the **Risks** column in the Agent Registry, an agent's **Security** tab details, and an agent's **Activity** tab details.

**Extending Microsoft Entra security features to agents** requires E7, or E5 paired with an Agent 365 license. Standalone paths for customers without E5 or E7, all still requiring an Agent 365 license: Conditional Access for agents needs Entra ID P1, ID Protection for agents needs Entra ID P2, and ID Governance for agents needs Entra ID P1.

### Microsoft Entra Agent ID

Now a named product within Microsoft Entra providing the platform for creating and managing agent identities and agent identity blueprints. It is available for **all** Microsoft Entra customers. Automatic creation of Entra Agent IDs per Copilot Studio agent is in **preview**. The Entra ID node in the Microsoft Entra admin center now includes an **Agents** area documented as Microsoft Entra Agent ID.

### SMB pricing that changed July 1, 2026

| SKU | Price | Notes |
|---|---|---|
| Microsoft 365 Copilot (enterprise add-on) | $30.00 per user per month (annual billing) | Requires a qualifying subscription |
| Microsoft 365 Copilot Business | List 21.00 USD; **18 USD** under a 15% promotion extended through December 2026, no license minimum (1-300) | **300-seat MAXIMUM**, annual subscription with annual billing |
| Microsoft 365 Business Standard with Copilot | 23.50 USD per user per month | New GA July 1, 2026; 300-license maximum |
| Microsoft 365 Business Premium with Copilot | 32 USD per user per month | New GA July 1, 2026; 300-license maximum |

> **The 300-seat number reversed direction and this is the single most dangerous stale licensing fact.** Microsoft removed the original **300-seat MINIMUM** for Copilot commercial plans in **January 2024**, and also removed the Microsoft 365 prerequisite so Office 365 E3 and E5 customers became eligible. **There is no seat minimum today.** The only surviving 300 is a **MAXIMUM** on Copilot Business and the Business-with-Copilot SKUs.

**Copilot Business capability:** Microsoft states the Business add-on "delivers the same capabilities as the Microsoft 365 Copilot offering." The difference is price point and eligibility, **not** feature set. Business plans are sold **only** as an annual commitment; there is **NO** month-to-month purchasing agreement. Existing enterprise add-on customers **cannot** switch to Copilot Business until their annual commitment ends, and licenses do **NOT** auto-convert at renewal.

---

## 5. The Agents workload moved to a top-level admin center node

### The path correction

**Correct: admin.microsoft.com > Agents > All agents > Requests**

Stale on both counts: "admin.microsoft.com > Copilot > Agents > Requested agents tab". The Agents workload is a **top-level node** in the Microsoft 365 admin center left navigation, not nested under Copilot, and the tab is named **Requests**, not "Requested agents". One legacy sentence in the agents admin guide still says "Requested agents tab", but its own numbered procedure directly below instructs "Select Agents > All agents > Requests".

**"Manage agent requests in Microsoft 365 admin center" is generally available**, release-notes dated **July 15, 2026**. "Submit agent to Agent Store from Agent Builder" is also GA as of July 15, 2026. "Automate agent lifecycle management with policy-based rules" is GA as of June 2, 2026.

### The four sub-pages

**Agents > Overview** (dashboard with hero metrics and governance action cards), **Agents > All agents** (containing the **Registry** and **Requests** tabs), **Agents > Tools** (MCP server registration and approval), and **Agents > Settings** (agent policy configuration).

**Hero metrics on Overview:** Agent registry (total agents in the catalog), Active users (unique users who sent a prompt and received a response in the last 30 days), Agent run-time (total hours worked by agents in the last 30 days), and Registry sync (external connected platforms scanned).

**Four governance action cards:** Pending Requests for Agents, Agents at risk, Agents without owners, and Agents with exceptions.

### Three request states

| State | Admin action button |
|---|---|
| **Pending review** | **Publish to store** |
| **Pending update** | **Update in store**. Until approved, users continue to access the **previous version**. |
| **Pending activate** | Approve and activate, or reject; scope the audience to specific users, groups, or everyone |

**Reject submission** is available from the ellipses to the right of the agent name. A fourth state, **"Allow user to install"**, appears when a user requests a **blocked Microsoft-built agent**; the admin must first select **Unblock agent**, then Approve or Reject.

### Who can actually approve

Only **AI Administrator** and **Global Administrator** can perform governance actions such as approving agent requests or assigning ownership. **Global Reader, AI Reader, Security Administrator, Security Reader, Reports Reader, and User Experience Success Manager** can view agent registry information but **cannot** take administrative action.

### Agent Registry

**admin.microsoft.com > Agents > All agents > Registry.** Three summary tiles: **Total agents**, **Agents without owners**, and **Unmanaged agents** (created or managed outside Agent 365, without its risk protection and observability).

**Four publisher-based types:** Microsoft agents, External partner-built agents, Published by your org (LOB), and Shared by creator.

**Agent risk types and severities:** Shadow agent (Critical), No owner assigned (Critical), Excessive permissions (Critical), Security misconfiguration (High), Prompt injection (High), Sensitive data access (High), Conditional access violation (High), Pending approval (Medium), Operational exceptions (Medium), Compliance/retention gap (Medium). Signals aggregate from Microsoft Entra, Microsoft Defender, and Microsoft Purview.

**Pinning:** admins can pin a maximum of **three** agents for end users. End users cannot unpin administrator-pinned or Microsoft-pinned agents. It can take up to **six hours** for a pin to appear. An agent must be deployed and not blocked before it can be pinned.

**Graph API access is in preview:** `GET packages` and `GET` package details, working with the AI Admin role.

### Agents > Settings, five areas

1. **Agent management rules** -- exactly two rule-based bulk actions today: **Install Microsoft agents** and **Reassign ownerless agents created with Agent Builder to manager** (per the Microsoft Entra ID hierarchy). The reassignment rule works **ONLY** for Agent Builder agents.
2. **Allowed agent types** -- three toggles. **Exam trap:** agents built by Microsoft remain **VISIBLE** to users even when that setting is disabled; users simply cannot install them.
3. **Security templates** (policy templates)
4. **Sharing** -- All users, No users, Specific users. **Exam trap:** only Agent Builder agents are governed by the Sharing control, and under **No users** users can **STILL** share directly with specific individuals.
5. **User access** -- All users (default), No users, Specific users/groups

**Alternate legacy path that still exists:** Copilot > Settings > Data access > Agents, with a "Manage all agents" link that jumps to Agents > All agents. Both are current; **Agents > Settings** is the fuller surface.

### Block versus Remove

| Action | Effect |
|---|---|
| **Block** | Prevents any user in the tenant from accessing the agent **AND removes it from users who already installed it** |
| **Uninstall / Remove** | Takes the agent out of inventory, but it **can be re-added** from the store. Applies only to first-party or external agents; admins can only remove shared agents and custom LOB agents. |

**Blocking scope differs by build tool.** Blocking an **Agent Builder or Copilot Studio** agent affects Microsoft 365 Copilot **AND** other host products such as Outlook and Teams. Blocking a **SharePoint or Microsoft Foundry** agent affects only **Microsoft 365 Copilot Chat**. SharePoint documentation adds that blocking an agent affects only its availability in Copilot Chat, and does not yet apply to OneDrive, SharePoint, or Teams.

### Availability and installation are independent

On the **Users** tab, **Installed for** controls which users automatically have the agent pre-installed (Just me, Entire organization, Specific users/groups), and **Available to** controls which users can install and use it (No users can install, All users can install, Specific users/groups can install). Installing to the entire organization installs it **regardless** of the availability scope.

### Two agent usage reports, different status

Both at **admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot > Agents**.

| Report | Status | Coverage | Latency |
|---|---|---|---|
| Microsoft 365 Copilot **Agent** usage report (original) | **GA** | **EXCLUDES** SharePoint agents and agents built by Microsoft and Microsoft partners | Up to 72 hours |
| Microsoft 365 Copilot **Agents** usage report (new) | **PREVIEW** | Declarative, SharePoint, and custom engine agents, including agents built by the org, Microsoft, and Microsoft partners | Within an hour |

### MCP tool governance is a separate queue

After a developer registers a tool such as a remote MCP server, an admin reviews it at **Agents > Tools > Requests**, then selects **Approve** or **Reject**. Only **AI Administrator** and **Global Administrator** meet both requirements (page access plus tenant-wide consent).

### Division of labor with the Power Platform admin center

Agents built with **Agent Builder** and **SharePoint** are managed primarily through the Microsoft 365 admin center. Agents built with **Copilot Studio** are managed through the **Power Platform admin center** with finer-grained controls, and **still require Microsoft 365 admin center approval** to reach the tenant-wide Microsoft 365 Copilot or Teams catalog.

**Copilot Studio controls that live ONLY in the Power Platform admin center:** DLP policies to block publishing through specific channels, **Editor** and **Viewer** sharing roles, and block-or-limit-sharing rules at the managed environment or environment group level. **Power Platform inventory** includes all agents created in Copilot Studio **AND** all agents created in Agent Builder.

---

## 6. Researcher and Analyst: the governance mechanism restated

### What was half right before

Earlier materials said Researcher and Analyst "require a separate administrative block" and are "NOT governed by the general agent on/off toggle". **The conclusion is correct. The mechanism was wrong.**

Microsoft's current wording is stronger and different: **"Researcher and Analyst are part of the core Copilot chat experience and will not fall under any agent-related settings."** They remain accessible in Microsoft 365 Copilot Chat under **Tools** even when Copilot agents are disabled for some or all users. They are not agents that escape a toggle; they are **core chat Tools** that sit outside agent settings entirely.

Say it this way on stage: *they are not exempt from the agent toggle, they are outside the agent settings surface altogether.*

### Status and licensing

**Both reached general availability on June 2, 2025.** They debuted in April 2025 via the Frontier program before GA. They are GA, not preview, as of July 2026. Both **require a Microsoft 365 Copilot license**; Microsoft deployed them to existing licensed users and there is **NO** separate add-on license. They are listed as "Advanced Agents" that a Copilot license unlocks beyond Copilot Chat.

They are the **only** agents Microsoft currently deploys via the "Microsoft-installed agents and features" method: preinstalled and pre-pinned for all licensed users. End users cannot remove or unpin Researcher.

### How to actually restrict them

Block the individual agent tenant-wide: **admin.microsoft.com > Agents > All agents > select the agent > Block**. The **Edit users** panel is **disabled** for Researcher and Analyst, so granular assignment to specific users or groups is **not possible**. Granular assignment controls are grayed out for Microsoft-installed agents.

### What each one is for

**Researcher** performs deep, multi-step research combining Microsoft Graph work data, **Microsoft 365 Copilot connectors**, and the **Bing index** for web data. Documented usage limit: **25 queries per user per month**.

**Analyst** performs advanced data analysis using chain-of-thought reasoning and is **better suited than Researcher for Microsoft Excel tasks**.

### Web control and Computer Use

Researcher adheres to the tenant-level **Allow web search in Copilot** toggle. If web search is disabled at the tenant level, Researcher will not use any web data. There is **NO** granular setting to allow or block specific websites for standard Researcher.

**Researcher with Computer Use** is a separately governed extension that lets Researcher interact with public, gated, and interactive web content through a **Windows 365**-backed virtual computer. Admins configure it on a dedicated **Computer use** tab at **Agents > Researcher > Computer use**, which exposes exactly three policies:

1. Allow Researcher with Computer Use to perform actions on behalf of users (all users, specific users or groups only, no users)
2. Allow Researcher to access work data
3. Choose which websites are allowed for Computer Use (All websites, Allow specific URLs or domains only, Exclude specific URLs or domains)

Web search is required for Computer use. Admins can also connect up to **10** additional agents to Researcher via the **Connected Agents** tab; agents added by the maker cannot be removed by admins.

### Monitoring limits

The Researcher FAQ states there is **NO** existing reporting tool for Copilot agents like Researcher and Analyst, and that by default the **content** of Researcher sessions is not accessible to admins or compliance tools. Admins can see usage metrics but not conversation content. The only exception is when a user explicitly submits feedback including session data.

> **Exam Traps**
>
> - "Disabling Copilot agents blocks Researcher" is FALSE, and the reason matters: they do not fall under agent-related settings at all.
> - "Admins can assign Researcher to specific users" is FALSE. Edit users is disabled; it is tenant-wide available or tenant-wide blocked.
> - Researcher respects existing Microsoft 365 permissions and cannot surface data a user does not already have access to.
> - Researcher is for research and synthesis across mixed sources. Analyst is for analysis and computation, and Microsoft explicitly names Analyst as better for Excel tasks.

---

## 7. Work IQ is an umbrella, not a peer of Microsoft Graph

**Work IQ is a real, current, first-party Microsoft term**, not a garbled name. Microsoft Learn defines it as **"the intelligence layer that personalizes Microsoft 365 Copilot for users and organizations"**, built atop foundation models from providers including **OpenAI and Anthropic**.

### The architecture correction

Earlier course diagrams presented Copilot architecture as "Microsoft Graph + Work IQ + LLMs (Azure OpenAI) + Orchestration Service", showing Work IQ as a **peer** of Microsoft Graph. That is wrong on two counts.

**Work IQ is composed of three integrated layers:**

| Layer | Contains |
|---|---|
| **Data** | Microsoft Graph tenant data plus Microsoft 365 Copilot connectors |
| **Context** | The **semantic index** |
| **Skills and tools** | Agent skills and tool invocation |

So Microsoft Graph sits **inside** Work IQ's data layer, and the semantic index sits **inside** its context layer. Work IQ is an umbrella over both, not a sibling alongside them. Second, the models are from **multiple providers**, not Azure OpenAI alone.

### Work IQ API and Work IQ MCP

The **Work IQ API** is documented with endpoints for **A2A (agent-to-agent)**, a **remote MCP server**, and a **REST API**. Its usage is **independent of Microsoft 365 Copilot licensing** and is available through usage-based billing, with governance and cost management controls in the Microsoft 365 admin center.

**Work IQ MCP is a PREVIEW feature.** It collapses hundreds of operations into **10 generic tools** (verbs such as fetch, create, update) providing access to Microsoft 365 mail, calendar, files, people, chat, and sites, and it **requires a Microsoft 365 Copilot license**.

### The semantic index is still called the semantic index

Microsoft describes it as a superset of content within Microsoft Graph plus ingested content from Copilot connectors, mapping organizational data into an advanced lexical and semantic index while respecting permission structures. No rename here.

### Connectors: renamed, and now two models

**Microsoft Graph connectors are now officially Microsoft 365 Copilot connectors.** Microsoft Learn states it directly: "You can use Microsoft 365 Copilot connectors (formerly Microsoft Graph connectors)". The underlying API is still called the Microsoft Graph connectors API.

| Model | Behavior |
|---|---|
| **Synced connectors** | Ingest and index content into Microsoft Graph; **support semantic indexing** |
| **Federated connectors** | Retrieve content in real time using Model Context Protocol with **no data movement** and **NO semantic indexing**. Read-only, labeled **early access preview**. |

A **Amazon S3 connector** shipped in the March 10, 2026 release notes, letting Copilot reference structured documents stored there. Worth knowing as a factual matter about connector breadth.

### Microsoft IQ in Copilot Studio (preview)

Copilot Studio shipped a **new agent experience** in June 2026 as a production-ready preview, using an enhanced orchestration runtime and running alongside the classic experience. It introduces **Microsoft IQ**, reusable skills, and per-user memory.

**Microsoft IQ (preview)** is a context layer in Copilot Studio comprising three sources: **Work IQ** (emails, chats, files, activity, routed through the Agent 365 MCP gateway via a single M365Copilot server), **Fabric IQ** (Microsoft Fabric business data and analytics), and **Foundry IQ** (preview, Azure AI Search-indexed knowledge bases).

### Other Copilot Studio milestones in 2026

| Capability | Status |
|---|---|
| Agent evaluations | **GA March 2026** |
| Agent-to-agent (A2A) protocol | **GA April 2026** |
| Computer use | **GA May 2026** |
| Claude Sonnet 5 and GPT-5.5 Chat as primary agent models | **GA June 2026** |
| Agent inventory schema for admins | May 2026 |

**Model currency warning:** GPT-4o was retired for generative orchestration between October 27-31, 2025 and fully unavailable after November 26, 2025. Any 2025-era slide naming GPT-4o as the current default is stale.

### Deprecations to know

- After the end of **June 2026**, the **Copilot Studio for Teams app** can no longer be used to create classic chatbots. The app redirects makers to the Copilot Studio web app.
- Starting **January 2026**, Copilot chat in model-driven apps in environments not enabled for Dynamics 365 apps is deprecated. Microsoft 365 Copilot is the replacement.
- The **Copilot Studio Kit** is being renamed to **Copilot Agent Kit**. The July 2026 guidance hub update describes this as "the first phase of the rename".

---

## 8. eDiscovery unified, Content search relocated

**All classic eDiscovery experiences retired on August 31, 2025**, including classic Content Search, classic eDiscovery (Standard), and classic eDiscovery (Premium). Legacy eDiscovery guidance now applies only to organizations hosted in Microsoft 365 operated by 21Vianet (China).

**There is now ONE solution named eDiscovery.** The products "eDiscovery (Standard)" and "eDiscovery (Premium)" no longer exist as separate solutions. Capabilities split into **eDiscovery feature support** and **premium eDiscovery feature support** based on subscription, and Microsoft's own comparison table uses those two column headings.

### Where the old words survive

Warn learners about exactly two places, because they will see them:

1. **Case settings** show a **Premium features** toggle labeled "eDiscovery (Premium)" and a **License** field whose values are "eDiscovery (Premium)" or "eDiscovery (Standard)".
2. The **Cases dashboard Case type filter** offers Premium, Standard, User data search, and Content search.

### The current Content search path

**purview.microsoft.com > Solutions > eDiscovery > Content Search**

All content searches are contained in a single system-generated eDiscovery case named **Content search**, created by default for all members of the eDiscovery Manager and Administrator role groups. The Content search case has the **same capability as any user-created case** -- you can create holds and review sets in it, depending on subscription. To limit access, use **Case settings** to add or remove members of the Content search case.

The AB-900 objective bullet reads exactly: "Search for files and emails by using **Content search in Microsoft Purview eDiscovery**", confirming it is tested as a component **within** eDiscovery. Note the lowercase "s" in "Content search" as Microsoft writes it in the objective.

### Renamed eDiscovery concepts

| Old term | Current term |
|---|---|
| Collections | **Statistics** (in searches). Searches are also no longer immutable after results are added to a review set. |
| Jobs | **Processes** |
| Custodians as the primary organizing unit | The **case** is the primary organizing unit |
| Separate reindexing step | **Advanced indexing** runs automatically ("just in time") during each search |

### eDiscovery over Copilot data

User prompts and responses are stored in the **user's mailbox**. Create a case, select the user's mailbox as the data source, and in the query builder select **Add condition > Type > Contains any of > Edit > "Copilot activity"**. That condition covers all Copilot and other AI application activity.

---

## 9. Data explorer replaced Content explorer as the exam answer

The July 22, 2026 objective says "Identify sensitive information by using Microsoft Purview **Data Explorer**" -- **not** Content explorer. Microsoft introduced a new **Data explorer** and renamed the old one **Content Explorer (classic)**. They live under different solutions.

| Tool | Path | Access roles |
|---|---|---|
| **Data explorer** (current answer) | purview.microsoft.com > Solutions > **Information Protection > Explorers > Data explorer** | **Data Explorer List viewer** (see item and location) and **Data Explorer Content viewer** (see item contents). **Independent, not cumulative.** |
| **Content explorer (classic)** | purview.microsoft.com > Solutions > **Data Lifecycle Management > Explorers > Content explorer** | Content Explorer List viewer and Content Explorer Content viewer |

**Content explorer (classic) latency:** counts can take up to **7 days** to update, and **14 days** for files in SharePoint.

**Activity explorer** shows activities related to sensitive data and labels (label downgrades, external sharing, DLP logs, auto-labeling, Endpoint DLP). It offers about **50 individual filters** and predefined filter sets including "Endpoint DLP activities", "Sensitivity labels applied, changed, or removed", "Egress activities", "DLP policies that detected activities", "Network DLP activities", and "Protected Browser". Filter options are generated from the **first 500 records**.

**Licensing:** data classification analytics (the Content and Activity Explorer interfaces) requires **E5/A5/G5**, but Content Explorer data **aggregation** continues for E3/A3/G3 tenants.

---

## 10. SharePoint oversharing: RSS retiring, RAC and RCD are the answer

This is the subsection the July 22, 2026 change log flags as **Minor**, which makes it disproportionately likely to appear.

> **RETIREMENT ALERT.** **Restricted SharePoint Search (RSS) is retiring. Starting July 31, 2026, new enablement is blocked.** Microsoft directs customers to **Restricted Content Discovery (RCD)** instead. Do **NOT** teach RSS as a current recommendation. Related constraint: if Restricted SharePoint Search is enabled in the tenant, SharePoint **cannot** be used as a knowledge source for a declarative agent.

### The naming resolution

Both "restricted access control" and "restricted site access" are current, and Microsoft uses them interchangeably in the same article. The SharePoint Advanced Management overview says "Use restricted access control (RAC)". The feature article opens: "Restricted site access control (also referred to as restricted access control or site access restriction)...". **The July 2026 objective bullet says "restricted access control".** Teach **RAC** as the primary term and tell learners the portal UI uses "Site-level access restriction" and "Restricted site access" wording.

### The one-line distinction

**RAC controls ACCESS.** **RCD controls DISCOVERABILITY.** RAC is enforcement; RCD is concealment.

| | Restricted access control (RAC) | Restricted content discovery (RCD) |
|---|---|---|
| Changes who can access the site? | **Yes** | **No** |
| Blocks org-wide search and Copilot? | Yes, because users lose access | Yes, by concealment |
| Users who already have permissions can still open the site directly? | **No** | **Yes** |
| Scope | SharePoint sites, up to **10 groups** per site | SharePoint sites only, **NOT** OneDrive sites |
| Best used when | Access itself is too broad and must be restricted | Permissions are correct or under review, and you want the content out of Copilot and search temporarily |

**RAC detail:** users not in the control group cannot access the site or its content **EVEN IF** they had prior permissions or a shared link. Group membership alone does not grant access -- a user needs **BOTH** the site or content permission **AND** membership in the RAC group.

**RAC paths, two levels:**
- **Tenant enablement:** SharePoint admin center > **Policies > Access control > Site-level access restriction > Allow access restriction > Save**. PowerShell: `Set-SPOTenant -EnableRestrictedAccessControl $true`. May take up to one hour.
- **Per-site:** SharePoint admin center > **Sites > Active sites** > select the site > **Settings** tab > **Edit** in the **Restricted site access** section > select **Restrict SharePoint site access to only users in specified groups** > add groups > **Save**.

**RCD detail:** prevents content from a site appearing in org-wide search and Copilot **UNLESS** a user recently interacted with the content. It **does NOT change permissions** and does **not** remove content from the Microsoft 365 search index. Users can still discover content they own or recently interacted with.

**RCD path:** SharePoint admin center > **Sites > Active sites** > select a site > **Settings** tab > under **Restrict content discovery** select **On** > **Save**. A **Restricted** tag becomes visible on covered sites.

**RCD limits:** SharePoint sites only, not OneDrive. Does not affect searches originating from site context, nor Microsoft 365 Feed and Recommendations. Microsoft cautions that excessive use degrades Copilot response completeness and relevance, and positions RCD as a **temporary governance control during permissions review**. Requires the organization to have a Microsoft 365 Copilot license.

**RCD tooling:** `Get-SPOSite -Identity <site-url> | Select RestrictContentOrgWideSearch`; tenant-wide reporting with `Start-SPORestrictedContentDiscoverabilityReport` and `Get-SPORestrictedContentDiscoverabilityReport`. Enable, disable, and justification events are captured in Purview audit log activities.

### Data Access Governance reports

**Exact path:** SharePoint admin center > left pane expand **Reports** > **Data access governance**.

| Group | Reports |
|---|---|
| **Snapshot reports** | "Site permissions across your organization" (marked Recommended), "Sensitivity label applied to files", and a "Site permissions for users" report |
| **Activity reports** | "Sharing links" and "Shared with 'Everyone except external users'" (EEEU). Cover the **last 28 days**. |

**Remediation from the reports:** use RAC to limit access to a specific group; review the **Change history** report to find recent permission changes that caused oversharing; use **Site access review** to delegate review to site owners; generate AI insights with **Get AI insights**.

**Licensing nuance:** admins with **Microsoft 365 E5** CAN access DAG reporting **without** SharePoint Advanced Management, but they cannot view or use other SAM features, do not get snapshot reports or remedial actions, and their activity reports return only up to **10,000 sites**. Organizations without SAM must explicitly enable data collection first; reports become available 24 hours after enabling, data is stored 28 days, and collection pauses if no reports are generated for 3 months.

**Two blockers:** DAG reports do not work if the tenant uses nonpseudonymized report data -- a Global Administrator must go to the **Reports** setting in the Microsoft 365 admin center and **CLEAR** "Display concealed user, group, and site names in all reports". DAG reports are also unavailable for Microsoft 365 operated by 21Vianet.

### SharePoint Advanced Management licensing, precisely

**The answer to "paid add-on or bundled?" is BOTH.**

- SAM capabilities that support a **Microsoft 365 Copilot deployment** are unlocked when **at least one user** in the organization is assigned a Microsoft 365 Copilot license. That user does not need to be a SharePoint administrator.
- Organizations with SharePoint K, P1, or P2 can purchase the **SharePoint Advanced Management Plan 1** add-on.
- **Microsoft 365 E7** also includes it.
- **The caveat:** some SAM features still require the paid Plan 1 add-on and are **NOT** unlocked by a Copilot license. Microsoft names **restricted site creation** as an example.

**Correct teaching line:** *a Copilot license unlocks the Copilot-readiness subset of SAM; the full SAM feature set still needs the Plan 1 add-on.*

**Base subscription requirement:** Office 365 E3/E5/A5, or Microsoft 365 E1/E3/E5/A5, or Microsoft 365 GCC/GCC-High/DoD. Required roles: **SharePoint Administrator** or the broader **SharePoint Advanced Management Administrator** role. External users do not require a license.

**SAM features included with a Copilot license** (WW, GCC, GCC-H, DoD): Restricted content discovery, Sharing links reports, Sensitivity labels report (requires E5 or G5), EEEU insights, Permission state reports for sites/OneDrive sites/files, Site access review for all reports, Catalog management, Change history - site settings, and Recent admin actions.

---

## 11. Identity changes with hard dates ahead

Domain 1 covers authentication methods, and two dated changes will land between this session and the end of the exam objective's life. Teach them as forward guidance.

### Mandatory MFA is fully in force

| Phase | Scope | Status July 2026 |
|---|---|---|
| **Phase 1** | Azure portal, Microsoft Entra admin center, Microsoft Intune admin center since October 2024; Microsoft 365 admin center since February 2025 | In force. Postponement closed September 30, 2025. |
| **Phase 2** | Azure CLI, Azure PowerShell, Azure mobile app, IaC tools, Azure SDK, REST API (control plane) for Create, Update, Delete | In force. Last postponement date was July 1, 2026. |

Phase 2 is enforced server-side at Azure Resource Manager; only requests targeting `https://management.azure.com` are in scope, and Microsoft Graph APIs are generally **NOT** in scope. Read operations do not require MFA. Workload identities are not impacted; **user accounts used as service accounts ARE**. There is no opt-out, and it applies to break-glass accounts, B2B guests, and test tenants. Enforced in the public Azure cloud only.

### Passkeys become the default, SMS and voice retire

| Date | What happens |
|---|---|
| **August 1, 2026** | API support and opt-out information become available |
| **September 1, 2026** | Users enabled for SMS or voice are auto-enabled for **passkeys**, and the tenant Registration Campaign is set to Microsoft Managed state targeting passkeys |
| **September 18, 2026** | Customer-managed telecom provider options and terms publish in the Microsoft Security Store |
| **October 30, 2026** | Customer-managed telecom provider configuration becomes available |
| **February 1, 2027** | Microsoft-provided telecom delivery for SMS and voice is **fully retired** across Microsoft Entra including SSPR. Users whose only method is SMS or voice receive a **BLOCKING** prompt to register a passkey. Microsoft states there is **NO** opt-out from this behavior. |

**Two passkey types:** **synced passkeys** (saved to a platform credential manager and synced across devices) and **device-bound passkeys** (Passkey in Microsoft Authenticator, Entra Passkey on Windows, FIDO2 hardware security key). Passkey support for B2B and internal guest users is planned by the end of calendar year 2026.

Microsoft publishes a PowerShell script at `https://github.com/microsoft/entra-sms-voice-usage-analyzer` to find users still enabled for SMS or voice. Running it requires Global Reader, Authentication Policy Administrator, or Security Reader.

### Authentication method management moved

Managing authentication methods in the legacy MFA and legacy SSPR policies was **retired September 30, 2025**. Methods are now managed in the unified **Authentication methods policy** at **entra.microsoft.com > Entra ID > Authentication methods > Policies**. **Per-user MFA state (Enabled/Enforced/Disabled) was NOT retired** -- only the per-user MFA *service settings* moved.

### Baseline security mode is new

**admin.microsoft.com > ... Show all > Settings > Org Settings > Security and Privacy tab > Baseline Security Mode.** Available on all Microsoft 365 subscriptions. Two BSM settings surface in Microsoft Entra as Conditional Access policies -- **Require phishing resistant authentication for admins** and **Block legacy authentication** -- showing **Baseline security mode** in the **Created by** column. Unlike Microsoft-managed policies, BSM policies are attributed to the **administrator**, not Microsoft.

**Known artifact:** tenants that accessed BSM between November 2025 and early February 2026 might show two draft Conditional Access policies in a Disabled state attributed to the admin who visited the page. Microsoft states this is not a security incident and a fix is in progress.

### Navigation labels that changed

- Conditional Access target selector is now **Resources (formerly cloud apps)**, and the all-resources option reads **All resources (formerly 'All cloud apps')**.
- Conditional Access lives at **entra.microsoft.com > Entra ID > Conditional Access > Policies**.
- Identity Secure Score lives at **entra.microsoft.com > Entra ID > Identity Secure Score**, and recalculates **every 24 hours**.
- Privileged Identity Management lives at **entra.microsoft.com > ID Governance > Privileged Identity Management**, **NOT** under Entra ID. PIM audit data covers the past **30 days** only.

<!-- VERIFY: The Microsoft Entra admin center left-navigation label is documented consistently as "Entra ID" in Learn procedures and breadcrumbs, but one Learn screenshot alt-text still reads "Identity menu", suggesting a rename that may not be fully rolled out in every tenant. Verify in the live tenant before screen-sharing. -->

---

## 12. Rename table: say this, not that

| Do not say | Say instead |
|---|---|
| Exchange Online admin center | **Exchange admin center** |
| distribution lists (when echoing the objective) | **distribution groups** (both terms are current; the EAC tab label is "Distribution list") |
| SharePoint in Microsoft 365 admin center | **SharePoint admin center** (but keep "SharePoint in Microsoft 365" when naming the **service**) |
| restricted site access | **restricted access control (RAC)** |
| Microsoft 365 Defender | **Microsoft Defender XDR** (the portal is the **Microsoft Defender portal**) |
| compliance.microsoft.com | **purview.microsoft.com** |
| Azure AD, AAD, Azure Active Directory | **Microsoft Entra ID** |
| Azure AD Connect | **Microsoft Entra Connect** |
| AI hub | **Data Security Posture Management (DSPM) for AI** |
| Content explorer (as the exam answer) | **Data explorer** |
| Content Search as a standalone solution | **Content search inside Microsoft Purview eDiscovery** |
| eDiscovery (Standard) / (Premium) as separate solutions | **eDiscovery** with premium features toggled per case |
| Classification (Purview nav node) | **Classifiers** |
| Collections (eDiscovery) | **Statistics** |
| Jobs (eDiscovery) | **Processes** |
| Data Estate Insights | **Reports** (Unified Catalog > Health management) |
| Privacy Risk Management in Purview | **Microsoft Priva** portal |
| Restricted SharePoint Search | **Restricted Content Discovery (RCD)** |
| Copilot for Microsoft 365 | **Microsoft 365 Copilot** |
| Copilot with commercial data protection | **Microsoft 365 Copilot Chat (with enterprise data protection)** |
| Copilot Studio lite | **Agent Builder in Microsoft 365 Copilot** |
| Teams Toolkit | **Microsoft 365 Agents Toolkit** |
| Requested agents tab | **Requests** tab (under Agents > All agents) |
| admin.microsoft.com > Copilot > Agents | **admin.microsoft.com > Agents > All agents** |
| Integrated apps (as the agent management surface) | **Agents** section of the Copilot Control System |
| Message packs | **Copilot Studio capacity packs** |
| per message (as the billing unit) | **per Copilot Credit** (see section 3 for the live doc conflict) |
| Microsoft Graph connectors | **Microsoft 365 Copilot connectors** |
| Copilot Studio Kit | **Copilot Agent Kit** |
| Agent Mode in Excel | **Edit with Copilot in Excel** (the rename is not universal; Agent Mode still exists in PowerPoint) |
| Azure AI Studio | **Microsoft Foundry** |
| 300-seat minimum | **No seat minimum**; 300-seat **maximum** on SMB SKUs |
| Agent 365 (preview) | **Agent 365** (GA May 1, 2026) |
| AB-900 (beta) | **AB-900** (generally available) |

---

## 13. Cross-topic exam traps summary

| Misconception | Correct understanding |
|---|---|
| The Copilot agents toggle blocks Researcher and Analyst | It does not, and the reason matters: they do not fall under **any** agent-related settings. They are core chat Tools. Block each one tenant-wide. |
| Admins can assign Researcher to a pilot group | The **Edit users** panel is disabled. It is tenant-wide available or tenant-wide blocked. |
| PAYG activates when you create a billing policy | You must also **connect** the policy to a Copilot service. Two steps. |
| Budget limits in PAYG prevent overspending | They send email alerts only. Usage continues after the budget is exceeded. |
| Pay-as-you-go is billed per message | The unit is the **Copilot Credit** at $0.01 per credit. Some Learn pages still say "per message"; the Azure meter is still named Copilot Studio. |
| A SharePoint agent prompt costs $0.01 | It can cost **12 credits ($0.12)** for an unlicensed user: generative answer (2) plus tenant graph grounding (10). |
| Microsoft 365 Copilot has a 300-seat minimum | **No minimum since January 2024.** 300 is a **maximum** on Copilot Business and Business-with-Copilot SKUs. |
| E5 is the top enterprise SKU | **E7** (GA May 1, 2026) = E5 + Copilot + Entra Suite + Agent 365. |
| DSPM for AI is the only DSPM entry | Three entries now: **DSPM** (new unified, GA May 2026), DSPM for AI (classic), and Data Security Posture Management (classic). |
| DSPM for AI requires admin setup to run risk assessments | The weekly default assessment for the top 100 SharePoint sites runs automatically. |
| SAM always requires a paid add-on | The Copilot-readiness subset is unlocked by any single Copilot license. The full feature set (for example restricted site creation) still needs Plan 1. |
| RCD removes user access to SharePoint sites | RCD blocks discoverability only. Permissions are unchanged. Use RAC to change access. |
| Restricted SharePoint Search is the recommended oversharing control | RSS blocks new enablement **starting July 31, 2026**. Use RCD. |
| Content explorer is the answer for finding sensitive data | The July 2026 objective says **Data explorer**. The old tool is Content Explorer (classic). |
| Content Search is a standalone Purview solution | It is inside **eDiscovery**, in a system-generated case named "Content search". |
| eDiscovery Standard and Premium are separate solutions | One unified eDiscovery solution with premium features toggled per case. |
| Work IQ is a peer of Microsoft Graph | Work IQ is the umbrella intelligence layer; Graph sits in its **data** layer and the semantic index in its **context** layer. |
| The agent approval queue is under Copilot > Agents | **Agents > All agents > Requests**, a top-level node. |
| Any admin role can approve agent requests | Only **AI Administrator** and **Global Administrator**. |
| Blocking any agent has the same scope | Agent Builder and Copilot Studio agents: Copilot **and** Outlook/Teams. SharePoint and Foundry agents: **Copilot Chat only**. |
| Code interpreter and image generator are off by default | Both are **enabled by default** in Agent Builder. |
| Purview audit logs are a valid Copilot usage report | Microsoft explicitly warns they are **not** intended for usage reporting. Use the usage report or Copilot Dashboard. |
| AB-900 requires annual renewal | **Fundamentals certifications do not expire.** |
| You can look things up in Microsoft Learn during AB-900 | The in-exam Learn resource is **role-based exams only**, not Fundamentals. |
| AB-900 is still in beta | It exited beta January 28, 2026. |

---

*Verified against Microsoft Learn and the AB-900 study guide (Skills measured as of July 22, 2026) on 2026-07-26. Always confirm current portal navigation and feature status against official Microsoft documentation before delivering this content live.*
