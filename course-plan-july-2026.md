# AB-900 Live Session Plan

**Platform:** O'Reilly Live Learning (ON24)
**Delivery date:** July 28, 2026
**Duration:** 4 x 50 min segments, 10-min breaks between
**Exam:** AB-900 -- Microsoft 365 Copilot and Agent Administration Fundamentals
**Skills measured version in force:** July 22, 2026

> **THIS FILE IS THE RUNNING ORDER.** Teach from this document. Everything else is a lookup:
> `docs/demo-scripts.md` for click-by-click, `warner-ab900-July-2026.pptx` for slides, `docs/exam-traps-cheatsheet.md` for the last-minute review.

## Delivery Map (one screen, keep this open)

**Segment order now follows EXAM DOMAIN order and matches the `segment-0N-*` folder names.** Domain 1, then Domain 2, then Domain 3 split across two segments. A short governance opener runs before Segment 1.

| Slot | Topic | Domain | Folder |
|------|-------|--------|--------|
| **Opener** | No-Code, Low-Code, Code-First: Who Builds What, and Who Governs It | framing | (none) |
| **1** | Core Features and Objects of Microsoft 365 Services | 1 (30-35%) | `segment-01-core-m365-services` |
| **2** | Data Protection and Governance for Microsoft 365 and Copilot | **2 (35-40%)** | `segment-02-data-protection-governance` |
| **3** | Copilot Features and Administration | 3 (25-30%) | `segment-03-copilot-administration` |
| **4** | Agent Administration and Exam Success | 3 (25-30%) + logistics | `segment-04-agents-exam-prep` |

### Deck remap (the deck is still in the OLD order)

`warner-ab900-July-2026.pptx` was built under the previous delivery order, so **slide numbers do NOT match segment numbers until the deck is reordered.** Until then, teach from this table.

| New segment | Content lives on deck slides | Demos |
|-------------|------------------------------|-------|
| **1** Core M365 services | **35-42** (was Segment 4) | Demo 1A (admin center), Demo 1B (licenses) |
| **2** Data protection | **24-31** (was Segment 3) | Demo 2A (labels), Demo 2B (DLP), Demo 2C (DSPM), Demo 2D (oversharing) |
| **3** Copilot administration | **5-10** (was Segment 1) | Demo 3A (PAYG billing), Demo 3B (Copilot settings), Demo 3C (Researcher and Analyst), Demo 3D (Copilot Dashboard) |
| **4** Agents and exam prep | **14-20**, then 44-45 | Demo 4A (approval queue), Demo 4D (build agent), Demo 4B (Teams), Demo 4C (Power Platform) |

**Demo IDs already follow domain numbering,** so Demo 1x belongs to Segment 1, Demo 2x to Segment 2, and so on. That part lines up cleanly.

Section-divider slides in the deck (4, 13, 23, 34) still carry the OLD segment numbers. Break slides: 12, 22, 33. Portal paths: 44. Exam tips: 45. Close: 46.

## Pacing Guardrails

| Checkpoint | Wall clock | If you are behind |
|------------|-----------|-------------------|
| End opener | :10 | Cut the code-first tier to one sentence and go straight to the governance questions |
| End Segment 1 | 1:00 | Cut the identity deep-dive, protect licensing and the admin center tour |
| End Segment 2 | 2:00 | Cut Demo 2A and 2B, protect Demo 2C and 2D. Heaviest domain -- **do NOT** cut it for time |
| End Segment 3 | 3:00 | Cut the per-app Copilot tour to Word and Teams only |
| End Segment 4 | 3:50 | Cut Demo 4D, keep Demo 4A -- the approval queue is the tested path. Protect the exam-tips block |

**The one rule:** if you must lose a demo, lose it in Segment 1 or 3. Segment 2 covers 35-40% of the exam.

## Exam Domain Weights (keep visible while teaching)

| Domain | Weight |
|--------|--------|
| 1 -- Identify the core features and objects of Microsoft 365 services | 30-35% |
| 2 -- Understand data protection and governance tasks for Microsoft 365 and Copilot | **35-40%** |
| 3 -- Perform basic administrative tasks for Copilot and agents | 25-30% |

---

## What Changed Since April 2026 (live talking point, 3 minutes, open Segment 1)

Use this box near the top of the session. It sets the tone: the material is fresh, and Tim is telling learners exactly what moved.

> Microsoft refreshed the AB-900 skills measured on **July 22, 2026** -- six days before this session. Here is what actually moved, and what did not.
>
> **The change log lists three Minor changes and zero Major changes.** Domain weights did not move. The three subsections flagged Minor are "Identify the core objects of Microsoft 365 services," "Identify the core security features of Microsoft 365 services," and "Identify and monitor oversharing in SharePoint in Microsoft 365." Everything else carries a No change marker or does not appear in the log at all, which under Microsoft convention means it was untouched.
>
> **The wording changes that matter for answer selection:**
>
> | Old wording | Current wording (as of July 22, 2026) |
> |-------------|---------------------------------------|
> | Exchange Online admin center (mailboxes and distribution lists) | **Exchange admin center** (mailboxes and **distribution groups**) |
> | SharePoint in Microsoft 365 admin center | **SharePoint admin center** (the service is still "SharePoint in Microsoft 365") |
> | restricted site access | **restricted access control** |
> | Content explorer | **Data Explorer** |
> | standalone Content search | **Content search in Microsoft Purview eDiscovery** |
> | Microsoft 365 Defender | **Microsoft Defender XDR** |
>
> **Product changes since April that are not exam wording but WILL show up in a live portal:**
>
> - A new unified **Data Security Posture Management (DSPM)** went generally available in May 2026. The Purview portal now shows three entries: **DSPM**, **Data Security Posture Management (classic)**, and **DSPM for AI (classic)**. The exam objective still says "DSPM for AI," so teach the classic label as the exam answer and show the new unified DSPM as the direction of travel.
> - **Microsoft 365 E7** (the Frontier Suite) went generally available May 1, 2026. E7 equals E5 plus Microsoft 365 Copilot plus Microsoft Entra Suite plus Agent 365. Any licensing slide that stops at E5 is now incomplete.
> - **Microsoft Agent 365** went generally available May 1, 2026 for the Commercial segment, licensed per user. It is the control plane for agents regardless of where they were built.
> - The Copilot billing unit is the **Copilot Credit** at **$0.01 per credit**, not "per message." The Azure meter is still named Copilot Studio, and some Microsoft Learn pages still say per message. Both vocabularies are live in current documentation.
> - **Restricted SharePoint Search** blocks new enablement starting **July 31, 2026** -- three days after this session. Microsoft directs customers to **Restricted Content Discovery** instead.
> - AB-900 is generally available. It is **NOT** in beta. Learners get scores immediately and can retake after 24 hours.

---

## Opener: No-Code, Low-Code, Pro-Code -- Who Builds What, and Who Governs It (10 min)

*Orient on the maker spectrum, then pivot hard to governance. Full script in [docs/session-opener-governance.md](docs/session-opener-governance.md).*

- **The maker spectrum.** No-code (Agent Builder in Microsoft 365 Copilot, SharePoint agents) > low-code (Microsoft Copilot Studio) > pro-code (Microsoft 365 Agents Toolkit, Microsoft 365 Agents SDK). Microsoft's word is **pro-code**, not "code-first."
  - **There is NO "Copilot Studio SDK."** Current Learn documentation names the **Microsoft 365 Agents SDK**. The Agents FAQ still says otherwise in one bullet and contradicts itself two answers later.
  - **"Copilot Studio lite" is NOT the product name.** It is **Agent Builder in Microsoft 365 Copilot**. The names collide because Copilot Studio processes Agent Builder capabilities behind the scenes.
- **The two-way taxonomy.** Microsoft describes **two approaches to building** agents, not "two agent types." **Declarative** agents inherit Microsoft 365 compliance and Responsible AI posture. **Custom engine** agents make that posture yours to own.
  - Agent type and coding approach are **independent axes**. A declarative agent can be built no-code, low-code, or pro-code.
- **Six governance questions** that frame the whole session: who can build, what can it reach, who approves it, who pays, how do we watch it, how do we stop it. Each maps to an exact admin center path.
- **The pivot line** (say it out loud): everything shown so far is how an agent gets **made**, and AB-900 tests none of it. The exam tests what happens **next**. Fundamentals is an **administrator** credential, not a builder credential.
- **Scope guard:** Microsoft Foundry (formerly Azure AI Foundry) appears **NOWHERE** in the July 22, 2026 objectives. Mention only if a learner raises it, and say plainly that it is not on the exam.

---

## Segment 1: Core Features and Objects of Microsoft 365 Services (50 min)

*Start where the exam starts. This is the foundation every later segment assumes.*

- Microsoft 365 admin center (**admin.microsoft.com**, and **admin.cloud.microsoft** now resolves to the same app): dashboard, users, groups, billing, reports, service health
- Core services configuration:
  - **Exchange admin center** (admin.exchange.microsoft.com): mailboxes and **distribution groups**. The Groups page tab label reads **Distribution list**, and both terms are current in Microsoft documentation.
  - **SharePoint admin center** (admin.microsoft.com/sharepoint): sites, libraries, folders, and site roles and permissions
  - **Microsoft Teams admin center** (admin.teams.microsoft.com): teams, channels, policies
- Identity and security:
  - Zero Trust: verify explicitly, use least privilege access, assume breach
  - **Microsoft Entra ID** -- never "Azure AD." Cloud-only versus hybrid identities.
  - Authentication methods are managed in the unified **Authentication methods policy** at entra.microsoft.com > Entra ID > Authentication methods > Policies. Legacy MFA and SSPR method management retired September 30, 2025.
  - **Passkey-first is the current guidance.** Microsoft-provided SMS and voice retire February 1, 2027, with passkey auto-enablement starting September 1, 2026.
  - Mandatory MFA is in force for both Phase 1 and Phase 2 as of July 2026. There is no opt-out, and it applies to break-glass accounts and guests.
  - SSO across Microsoft 365 and third-party apps
  - Conditional Access: **entra.microsoft.com > Entra ID > Conditional Access**. The target selector now reads **Resources (formerly cloud apps)**.
  - **Identity Secure Score:** entra.microsoft.com > Entra ID > Identity Secure Score. It recalculates every 24 hours and represents the Identity category of the broader Microsoft Secure Score viewed in the Defender portal.
  - **PIM:** entra.microsoft.com > **ID Governance** > Privileged Identity Management. It is not under Entra ID. Assignment types are **Eligible** and **Active**.
  - **App registrations versus Enterprise applications:** an app registration is the application object, the app's definition, and it exists only in the home tenant. An enterprise application is the service principal, the local instance in a tenant, and it is where SSO, user assignment, and provisioning are configured.
  - **Microsoft Defender XDR** is the service; **security.microsoft.com** is the Microsoft Defender portal. Never "Microsoft 365 Defender."
- RBAC: prefer least-privilege roles. Microsoft describes Global Administrator as a highly privileged role reserved for cases where a lower-privileged role cannot do the job.
- Group types: Security, Microsoft 365, Mail-enabled Security, Distribution, Dynamic
- Audit logs: **purview.microsoft.com > Audit** or **security.microsoft.com > Audit**. Audit (Standard) retains 180 days by default.
- Troubleshooting: sign-in logs, the What If tool, audit logs
- **Demo:** Admin center tour -- license assignment, Copilot pay-as-you-go billing, Conditional Access, service health

---

## Segment 2: Data Protection and Governance for Microsoft 365 and Copilot (50 min)

*Heaviest exam domain at 35-40%. Give it the time it deserves.*

- Microsoft Purview -- one portal, one URL: **purview.microsoft.com**. Every solution is reached through **Solutions > (solution name)**. The compliance portal is retired.
- Information Protection: sensitivity labels (encrypt, restrict, mark); labels travel with the data
- **The EXTRACT usage right:** when a label applies encryption, the user needs **EXTRACT** in addition to **VIEW** before Copilot returns the content. With VIEW only, Copilot will not summarize the item but can still reference it with a link.
- Label inheritance in Copilot: Copilot in Word, PowerPoint, and Outlook apply the source file's label and its protection settings to newly created content
- Label display: Copilot Chat shows the **highest priority** (most restrictive) label from the data used in a response
- Data classification: sensitive information types, trainable classifiers, Exact Data Match
- DLP: the Copilot policy location is named **"Microsoft 365 Copilot and Copilot Chat"**
  - Four supported condition and action pairs: sensitivity labels to prevent processing; sensitive information types to prevent processing prompts; sensitive information types to block web searches; and (preview) email received from external users
  - **Trap:** you cannot combine the sensitive information types condition and the sensitivity labels condition in the **SAME rule**. Separate rules in the same policy, yes. One rule, no.
  - Policy rollout uses **simulation mode**. The older "Test" and "Test with policy tips" states were replaced.
- Insider Risk Management: the **Risky AI usage** policy template detects prompt injection attacks and access to protected materials
- Communication Compliance: the **Detect Microsoft Copilot interactions** policy template. The three generative AI location checkboxes are **Microsoft Copilot experiences**, **Enterprise AI apps**, and **Other AI apps**.
  - **Billing trap:** no pay-as-you-go charge for detecting Microsoft 365 Copilot data. Pay-as-you-go IS required for non-Microsoft-365 AI data such as Security Copilot and Copilot in Fabric.
- **DSPM:** the current front door is **purview.microsoft.com > Solutions > DSPM** (unified, generally available May 2026). The legacy experiences are labeled **DSPM for AI (classic)** and **Data Security Posture Management (classic)**.
  - The AB-900 objective still uses the "DSPM for AI" wording. Teach the classic label as the exam answer, and show the new unified DSPM as what the portal actually looks like today.
  - Key new DSPM pages: **Posture**, **Objectives**, **AI observability**, **Asset explorer**, **Reports**, **Setup tasks**
  - DSPM for AI (classic) runs an automatic weekly data risk assessment on the top 100 SharePoint sites by usage, with no activation needed
- Compliance Manager: compliance score, assessments, improvement actions, and control-mapping templates for AI regulations
- **Data explorer** -- this is the exam wording. Path: **purview.microsoft.com > Solutions > Information Protection > Explorers > Data explorer**. The older tool is now labeled **Content Explorer (classic)** under Data Lifecycle Management > Explorers.
- **Activity explorer** -- activities on sensitive data and labels, roughly 50 filters, plus predefined filter sets such as Endpoint DLP activities and Egress activities
- **eDiscovery** -- one unified solution. "eDiscovery (Standard)" and "eDiscovery (Premium)" are gone as separate products; capabilities split into base and premium features per subscription.
  - **Content search** is now inside eDiscovery: **purview.microsoft.com > Solutions > eDiscovery > Content Search**. All content searches sit in a single system-generated case named "Content search."
  - Renames to name out loud: Collections became **Statistics**; Jobs became **Processes**
  - Classic eDiscovery experiences retired **August 31, 2025**
  - Warn learners that Standard and Premium wording still survives in case settings and the Cases dashboard Case type filter
- Auditing Copilot: prompts and responses are captured in the unified audit log as part of **Audit (Standard)** with no extra configuration. Operation name is **CopilotInteraction**. The **AccessedResources** property carries **SensitivityLabelId** and **XPIADetected**, a boolean for cross-prompt injection.
  - **Trap:** Microsoft explicitly warns that audit log data is **NOT** the basis for Copilot usage reporting. Use the Copilot usage report or the Copilot Dashboard.
- Retention and Data Lifecycle Management: retention policies can retain or delete AI prompts and responses. Conflicts resolve to the **longest** retention duration of all applied policies or holds.
- SharePoint oversharing:
  - **Data access governance reports:** SharePoint admin center > **Reports** > **Data access governance**
    - Snapshot reports: **Site permissions across your organization** (Recommended), **Sensitivity label applied to files**, and the **Site permissions for users** report
    - Activity reports: **Sharing links** and **Shared with 'Everyone except external users'**, covering the last 28 days
  - **Restricted access control (RAC)** controls **ACCESS**. It limits who can open a site to members of specified groups, up to 10 groups per site, and a user needs BOTH the site permission and the group membership.
  - **Restricted content discovery (RCD)** controls **DISCOVERABILITY**. It keeps site content out of org-wide search and Copilot without changing permissions. Users who already have access can still reach the content directly.
  - **One-line distinction for the exam:** RAC is enforcement. RCD is concealment.
  - **Restricted SharePoint Search is retiring.** New enablement is blocked starting July 31, 2026. Microsoft directs customers to RCD.
  - **SharePoint Advanced Management licensing is a both-and answer:** the Copilot-readiness subset of SAM unlocks when at least one user in the organization holds a Microsoft 365 Copilot license. The full SAM feature set (restricted site creation, for example) still requires the SharePoint Advanced Management Plan 1 add-on.
- **Demo:** Purview walkthrough -- sensitivity labels, a DLP policy in simulation mode, DSPM, and the SharePoint data access governance reports

---

## Segment 3: Copilot Features and Administration (50 min)

*Now the thing everyone came to learn about, framed as administration rather than usage.*

- What Copilot actually is -- **NOT** a standalone app, embedded in Word, Excel, PowerPoint, Outlook, and Teams
- Architecture: **Work IQ** is the intelligence layer. Microsoft Graph and Copilot connectors sit inside its data layer, and the semantic index sits inside its context layer. Work IQ is the umbrella, not a peer of Graph.
- Work IQ is built on foundation models from multiple providers, including OpenAI and Anthropic
- Grounded prompting -- the user prompt is enriched with tenant data before it reaches the model
- Semantic index -- meaning-based retrieval that respects permission structures, not keyword matching
- **Key security point:** Copilot can only see what the user can already see. Graph enforces permissions.
- Data stays inside the service boundary and is never used to retrain public models
- Copilot in each app: Word (draft and summarize), Excel (Edit with Copilot, formerly Agent Mode), PowerPoint (outline to deck), Outlook (thread summary and draft), Teams (meeting recap and action items)
- Microsoft 365 Copilot Chat -- cross-app search, multi-meeting summaries, tenant-wide queries
- Responsible AI: data minimization, transparency through source references, content filtering, auditability
- Licensing overview:
  - **Microsoft 365 Copilot Chat** -- included at no additional cost with an eligible Microsoft 365 subscription. Web-based chat is included free; work-based chat requires a Microsoft 365 Copilot license.
  - **Microsoft 365 Copilot** (enterprise add-on) -- $30.00 per user per month (annual billing)
  - **Microsoft 365 Copilot Business** (SMB add-on) -- list $21.00 per user per month, available at $18 under a 15 percent promotion extended through December 31, 2026, **300-seat maximum**, sold on an annual commitment with either annual or monthly billing (there is no month-to-month agreement), same capabilities as the enterprise SKU
  - **Microsoft 365 E7** -- includes Microsoft 365 Copilot in the base SKU, so E7 customers do not buy the add-on separately
  - **Trap to name out loud:** there is no 300-seat minimum. That requirement was removed in January 2024. The only surviving 300 is a **maximum** on Copilot Business and the Business-with-Copilot SKUs.
- Monthly per-user license versus pay-as-you-go -- when to use which. Note that the objective wording explicitly says "including SharePoint," so cover SharePoint pay-as-you-go specifically.
- Copilot admin tasks:
  - Assign licenses individually or by group. Users may wait up to **24 hours** for Copilot to appear in some apps after assignment.
  - Pay-as-you-go billing: **admin.microsoft.com > Copilot > Billing & usage**, with a **Billing policies** tab and a **Pay-as-you-go services** tab
    - Four setup steps: create the policy with billing details, choose users, set an optional budget, review and select Create policy
    - Prerequisites: Billing Administrator, AI Administrator, or Global Administrator; an Azure subscription and resource group in the same tenant with Owner or Contributor rights; at least one SharePoint license in the tenant
    - Up to **50** pay-as-you-go billing policies per tenant; up to **10** SharePoint agent billing policies, each assigned one security group
    - **Trap:** a budget triggers **email notifications only**. Microsoft states the system does not enforce the budget and usage continues uninterrupted past it. Alerts can take up to 24 hours.
    - **Do NOT** teach "Billing > Billing policies" for Copilot. The Billing node covers Microsoft 365 Backup, SharePoint Storage, and High Volume Email, and only surfaces a redirect link for Copilot.
    - **Migration trap:** SharePoint agent policies previously configured under **Org settings > Pay-as-you-go services** must be disconnected there before a new Copilot-node policy can be linked
  - **Copilot Credits** are the consumption unit at **$0.01 per credit**. Rates: classic answer 1, generative answer 2, agent action 5, tenant graph grounding 10, agent flow actions 13 per 100 actions. A SharePoint agent prompt costs 12 credits (10 grounding plus 2 generative) for an unlicensed user. Licensed Copilot users incur no charge.
  - Capacity packs: **$200.00 per pack per month for 25,000 Copilot Credits**, replenished monthly and consumed before pay-as-you-go applies
  - Monitor usage: **admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot > Copilot**, then the **Usage** tab. The **Credits** report sits alongside it. The **Copilot Dashboard** is in **Viva Insights**, not the admin center.
  - Prompt governance: save, share, schedule, delete
  - Agent management: the Microsoft 365 admin center handles deployment, approval, and the agent registry. The Power Platform admin center handles environment governance and data policies for Copilot Studio agents.
- **Demo:** Copilot in action across apps (show Graph grounding and source references)

---

## Segment 4: Agent Administration and Exam Success (50 min)

*Agents are the exam growth area. Close with logistics so it is the last thing they hear.*

- What agents are -- software that automates tasks, answers questions, and acts on user intent
- The canonical Microsoft taxonomy is a two-way split:
  - **Declarative agents** -- hosted in Microsoft 365, use Copilot's orchestrator and foundation models, designed for individual use, user-initiated only (they do **NOT** support proactive interactions)
  - **Custom engine agents** -- fully customizable model and orchestration, support group collaboration and proactive interactions, hosted outside Microsoft 365, and the builder owns their own compliance and Responsible AI posture
- Creator personas: **Users** build in Agent Builder or SharePoint, **Makers** build in Copilot Studio, **Developers** build with the **Microsoft 365 Agents SDK** or the Microsoft 365 Agents Toolkit
- Prebuilt agent use cases: **Researcher** (multi-step research across Graph work data, Copilot connectors, and the Bing index) and **Analyst** (advanced data analysis with chain-of-thought reasoning, better suited than Researcher for Excel work)
- **Researcher and Analyst are part of the core Copilot chat experience and do NOT fall under any agent-related settings.** They stay available in Microsoft 365 Copilot Chat under **Tools** even when agents are disabled for some or all users. To disable them, the admin blocks the individual agent tenant-wide. The Edit users panel is disabled for them, so granular per-user assignment is not possible.
- Researcher usage limit: course notes carry a figure of 25 queries per user per month. **VERIFY IN YOUR TENANT BEFORE ASSERTING IT** -- this number could not be reconfirmed on Microsoft Learn on July 28, 2026, and Microsoft adjusts these caps. If a learner asks and you are unsure, say the limit exists and is documented per-plan rather than quoting a number.
- Researcher honors the tenant-level **Allow web search in Copilot** policy. There is no per-site allowlist for standard Researcher.
- **Researcher with Computer Use** is separately governed on a dedicated **Computer use** tab in the agent details pane, with three policies: who can perform actions, whether Researcher can access work data, and which websites are allowed
- Copilot versus agents: reactive and assistive versus task-scoped and increasingly autonomous
- Creating an agent in **Agent Builder in Microsoft 365 Copilot** (the current product name; "Copilot Studio lite" survives only in Microsoft Learn URL slugs):
  - Describe tab (natural language) versus Configure tab (manual)
  - Knowledge limits: up to **20 knowledge sources total**, up to **4 public website URLs**, up to **100 SharePoint files, folders, or sites**, **1 SharePoint list**, **50 OneDrive files**, **5 Teams chat URLs**, **20 embedded uploaded files**
  - Field limits: Description 1,000 characters; Instructions 8,000 characters
  - Capabilities: **Code interpreter ("Create documents, charts, and code") and Image generator ("Create images") are both ENABLED by default.** This is a reversal from earlier course material that said both were off.
  - Starter prompts: Microsoft documents **no minimum and publishes no maximum**. Do **NOT** assert a ceiling.
  - "Only use specified sources" **prioritizes** the listed sources. Agent Builder cannot fully block general model knowledge. Use Copilot Studio for stricter control.
  - Governance trap: **Information Barriers are NOT supported on embedded files.** Any user who can access the agent sees responses grounded in that content.
- Creating a **SharePoint agent**:
  - Three entry points: the site homepage via **New > Agent**, the document library command bar via the **AI actions** menu, and a file's right-click or ellipsis context menu
  - Storage: homepage-created agents land in **Site contents > Site Assets > Copilots**; library-created agents save to the current folder
  - Knowledge limit: up to **20 source items** in any combination of sites, libraries, folders, and files
  - Agents are stored as **.agent files**, and the file permissions determine who can access or edit the agent
  - Code interpreter and image generator are **NOT documented as available** for SharePoint agents
  - Requires either an assigned Microsoft 365 Copilot license or pay-as-you-go billing configured for the organization
- Agent approval workflow -- the authoritative path is **admin.microsoft.com > Agents > All agents > Requests**
  - Three request states: **Pending review**, **Pending update**, **Pending activate**
  - Primary actions: **Publish to store** and **Reject submission**. For a Pending update, the button reads **Update in store**.
  - Only **AI Administrator** or **Global Administrator** can approve. Global Reader and the other reader roles can view but cannot act.
- Agent lifecycle: create, request, approve, deploy, monitor, block or remove
  - **Block** prevents access tenant-wide AND removes the agent from users who already installed it
  - **Uninstall/Remove** takes it out of inventory, but it can be reacquired from the store
  - **Blocking scope trap:** blocking an Agent Builder or Copilot Studio agent affects Microsoft 365 Copilot and other hosts such as Outlook and Teams. Blocking a SharePoint or Foundry agent affects Microsoft 365 Copilot Chat only.
- Agent licensing buckets: included with a Copilot license, consumption-billed through pay-as-you-go, or covered by Microsoft Agent 365 and Microsoft 365 E7
- **Demo:** Create an agent in Agent Builder and a SharePoint agent side by side, then show the Requests queue
- Exam tips and wrap-up:
  - Domain 2 is the heaviest. If learners study one domain deeply, make it Domain 2.
  - Know the portal paths: admin.microsoft.com, purview.microsoft.com, entra.microsoft.com, admin.exchange.microsoft.com, admin.teams.microsoft.com, security.microsoft.com
  - Know Copilot versus agents versus Agent Builder versus Copilot Studio
  - Know the three agent request states: Pending review, Pending update, Pending activate
  - **Exam logistics:** passing score is **700 or greater** on a scale where 1000 is the maximum; **45 minutes** of exam time with **65 minutes** of seat time; English only; scheduled through Pearson VUE, or Certiport for students and educators; retake after 24 hours; sandbox at **aka.ms/examdemo**
  - Microsoft does **NOT** publish an AB-900 question count. The 40-60 range is a Microsoft-wide typical figure, not an AB-900 number.
  - **Access to Microsoft Learn during the exam is NOT available on AB-900.** That benefit applies to role-based exams only, not Fundamentals.
  - **AB-900 does NOT expire.** Fundamentals certifications do not require renewal, even though the study guide boilerplate mentions annual renewal for associate, expert, and specialty credentials.
  - A free official practice assessment is live on Microsoft Learn
