# AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
## O'Reilly Live Learning — Instructor Delivery Guide

**Instructor:** Tim Warner
**Total Running Time:** 200 minutes (4 × 50-min segments)
**Format:** Live online with learner Q&A, demos in live tenant, and hands-on follow-along activities

---

## Session Summary Table

| Segment | Title | Domain Alignment | Weight |
|---------|-------|-----------------|--------|
| Pre-session | Tech check + housekeeping | — | 10 min |
| 1 | Core Features and Objects of Microsoft 365 Services | Domain 1 (30–35%) | 50 min |
| 2 | Data Protection and Governance for Microsoft 365 and Copilot | Domain 2 (35–40%) | 50 min |
| 3 | Copilot Features and Administration | Domain 3 (25–30%) | 50 min |
| 4 | Agent Administration and Exam Success | Domain 3 cont. + exam prep | 50 min |
| Wrap-up | Exam tips, next steps, resources | — | 10 min (inside Seg. 4) |

**Exam domain emphasis reminder:** Domain 2 (Data Protection) carries the most weight at 35–40%. Do not let Segments 1 or 3 run long at its expense.

---

## Pre-Session Block (10 minutes before start)

**Goal:** Every learner is confirmed technically ready before the clock starts.

### Checklist for Tim

- [ ] Screen share confirmed — learners can see both your browser and any admin center tabs
- [ ] Second monitor or device ready for learner chat monitoring
- [ ] Demo tenant pre-logged in: admin.microsoft.com, purview.microsoft.com, entra.microsoft.com, admin.teams.microsoft.com
- [ ] Copilot Studio tab open at copilotstudio.microsoft.com
- [ ] Power Platform admin center open at admin.powerplatform.microsoft.com
- [ ] Slide deck loaded at correct first slide

### What to Say

1. Welcome learners as they join; name the session title and exam code (AB-900)
2. Confirm audio/video: "Type 'yes' in chat if you can hear me clearly"
3. Platform orientation: where the Q&A panel is, chat etiquette, how to ask questions
4. Housekeeping: session will be recorded; slides and labs available in the GitHub repo linked in chat
5. Set expectations: "This session prepares you for the AB-900 exam. I'll flag exam objectives explicitly throughout. Not everything I show is on the exam — I'll tell you what is."
6. Drop repo link and M365 trial tenant signup link in chat

---

## Segment 1: Core Features and Objects of Microsoft 365 Services

**Duration:** 50 minutes
**Exam Domain:** Domain 1 — Core Features and Objects of Microsoft 365 Services (30–35%)

### Learning Objectives

By the end of this segment, you will be able to:

- Identify the core Microsoft 365 services (Exchange Online, SharePoint, Teams, OneDrive, Entra ID) and explain how they interconnect
- Describe how Microsoft Entra ID governs identity, authentication, and access control — including MFA, Conditional Access, and Privileged Identity Management (PIM)
- Assign and audit user licenses from the Microsoft 365 admin center, including Copilot license prerequisites
- Explain Zero Trust principles and how they apply to M365 administration decisions

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00–0:05 | Segment intro — frame the "why" for Domain 1 | 5 min |
| 0:05–0:18 | Lecture: M365 architecture and core services | 13 min |
| 0:18–0:30 | Lecture: Entra ID — identity, MFA, Conditional Access, PIM | 12 min |
| 0:30–0:38 | Demo: Admin center navigation + license assignment | 8 min |
| 0:38–0:44 | Learner activity: License audit exercise | 6 min |
| 0:44–0:48 | Lecture: Zero Trust and its M365 implications | 4 min |
| 0:48–0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**M365 Architecture and Core Services (13 min)**

- Tenant as the organizational boundary — one tenant, one Azure AD directory
- The five pillars learners must know cold: Exchange Online, SharePoint Online, Teams, OneDrive for Business, Microsoft Entra ID
- How these services are the data sources Copilot draws from — plant this seed early
- Admin centers map: admin.microsoft.com as the hub; spoke centers for Exchange, SharePoint, Teams, Entra
- Service health dashboard: where to find it, what incident severity levels mean
- Message Center: how planned changes surface here before they hit tenants

**Microsoft Entra ID — Identity, Auth, and Access Control (12 min)**

- Users vs. groups vs. service principals — know the difference
- Authentication methods: password, MFA (TOTP, authenticator app, FIDO2), passwordless
- Conditional Access policies: what they are, the IF/THEN logic (conditions → grant controls), and common scenarios (require MFA from untrusted locations)
- Privileged Identity Management (PIM): eligible vs. active assignments; just-in-time activation; approval workflows — this is a tested concept
- Least privilege principle: tie to exam scenarios where the question asks "which role is minimum required?"
- Global Admin vs. Copilot Admin vs. SharePoint Admin — role boundaries matter for exam questions

**Zero Trust Principles (4 min)**

- Three pillars: verify explicitly, use least privilege access, assume breach
- How Zero Trust maps to exam scenarios: "a user needs access only when…" = PIM; "access should be blocked from personal devices" = Conditional Access
- Do not over-explain — learners are not taking a security specialist exam

---

### Demo Moments

**Demo 1A: admin.microsoft.com navigation (4 min)**

- Portal: `admin.microsoft.com`
- Navigate: Users > Active users — show the user properties pane
- Navigate: Billing > Licenses — show license counts, highlight which SKUs include Copilot eligibility (M365 E3, E5, Business Standard, Business Premium)
- Navigate: Health > Service health — show advisory/incident distinction
- Navigate: Settings > Org settings — show how org-wide settings live here

**Demo 1B: License assignment (4 min)**

- Portal: `admin.microsoft.com` > Users > Active users
- Select a test user > Licenses and apps tab
- Show license assignment UI; toggle Copilot license on; explain the 24-hour activation delay
- Show group-based licensing path: Groups > select group > Licenses blade (do not actually assign in live demo unless using test tenant)

> **Pacing note:** The admin center UI loads slowly. Pre-navigate to each page before the session. Keep browser tabs for each portal open and pinned.

---

### Learner Activity

**Activity 1: License inventory check (6 min)**

Tell learners: "If you have access to an M365 trial tenant, navigate to Billing > Licenses right now. Answer in chat: How many total Copilot licenses does your tenant show? Is Copilot for Microsoft 365 listed separately from base M365 licenses?"

If learners do not have a tenant: run a chat poll — "Which base license tier do you work with most: E3, E5, Business Standard, or Business Premium?"

Use their answers to contextualize the licensing prerequisite discussion before moving to Segment 3.

---

### Exam Connection — Segment 1

Domain 1 objectives covered in this segment:

- License management: assigning/monitoring licenses, understanding Copilot prerequisites
- Microsoft 365 admin center: navigation, user management, service health
- Exchange Online administration: mailbox types (mention briefly), mail flow concepts
- SharePoint administration: permissions model (introduce here, deepen in Segment 2)
- Teams administration: policies, app permissions (introduce here)
- Zero Trust security: principles, never trust/always verify
- Microsoft Entra features: MFA, Conditional Access, PIM eligible vs. active roles

> **Exam flag for learners:** PIM (eligible vs. active role assignments and just-in-time access) is a reliable exam topic. Know that eligible = assigned but not active, active = currently elevated, and JIT = activation on demand with optional approval.

---

### If Running Long — Segment 1 Cuts

Cut in this order (exam coverage impact in parentheses):

1. Shorten the Zero Trust lecture to 2 min — just name the three pillars (minimal exam impact)
2. Skip the learner activity or convert it to a 1-minute verbal question (no exam impact)
3. Cut Demo 1B (group-based licensing) — describe it verbally instead (low exam impact)
4. Do not cut: PIM discussion or license prerequisite explanation — both are tested

---

## Segment 2: Data Protection and Governance for Microsoft 365 and Copilot

**Duration:** 50 minutes
**Exam Domain:** Domain 2 — Data Protection and Governance (35–40%) — the highest-weight domain

### Learning Objectives

By the end of this segment, you will be able to:

- Explain how Microsoft Graph controls what data Copilot can surface, and why oversharing in SharePoint creates AI risk
- Configure sensitivity labels and DLP policies in Microsoft Purview to protect organizational data
- Use DSPM for AI (Data Security Posture Management for AI) in Microsoft Purview to assess AI-specific data risks
- Identify and remediate SharePoint oversharing using SharePoint Advanced Management tools

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00–0:04 | Segment intro — frame Domain 2's weight and real-world stakes | 4 min |
| 0:04–0:14 | Lecture: Microsoft Graph, data grounding, and AI risk from oversharing | 10 min |
| 0:14–0:24 | Lecture: Sensitivity labels, DLP, and Purview governance tools | 10 min |
| 0:24–0:30 | Demo: Purview — sensitivity labels + DLP policy overview | 6 min |
| 0:30–0:38 | Lecture + Demo: DSPM for AI in Microsoft Purview | 8 min |
| 0:38–0:44 | Demo: SharePoint Advanced Management — oversharing reports | 6 min |
| 0:44–0:48 | Learner activity: Identify an oversharing risk scenario | 4 min |
| 0:48–0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**Microsoft Graph, Data Grounding, and Oversharing Risk (10 min)**

- Microsoft Graph is the API layer that connects Copilot to organizational data — emails, files, meetings, chats
- Copilot does not have its own data store; it queries Graph on behalf of the signed-in user
- Critical principle: Copilot can only surface data the user already has permission to see — but if that user can see everything (because permissions are too broad), Copilot can surface everything
- Oversharing scenario: a SharePoint site set to "Everyone except external users" means Copilot will serve that content to every licensed user who asks — even if the content was never intended to be that broadly accessible
- The problem is not Copilot — it's the pre-existing permission debt that Copilot makes suddenly visible and exploitable
- This is why SharePoint permission hygiene is a Domain 2 exam topic

**Sensitivity Labels, DLP, and Purview Tools (10 min)**

- Sensitivity labels: what they are (metadata + protection actions), where they apply (files, emails, meetings, containers/sites), and the label hierarchy (parent/sublabel)
- Label policies: how labels get to users; scope (users/groups vs. all users)
- Automatic labeling: trainable classifiers vs. sensitive information types — know the difference
- Data Loss Prevention: policy = container; rule = conditions + actions; condition examples (credit card numbers, sensitivity label applied); action examples (block send, encrypt, notify)
- Insider Risk Management: brief conceptual coverage — indicators, policies, cases, not deep configuration
- Communication Compliance: brief conceptual coverage — what communications it monitors, who reviews alerts
- Compliance Manager: compliance score, improvement actions, assessments — know these terms for exam scenarios
- Content Explorer and Activity Explorer: where admins discover what sensitive data exists and what's happening to it

**DSPM for AI — Data Security Posture Management for AI (8 min, lecture + demo combined)**

- DSPM for AI is a Microsoft Purview feature specifically designed for the AI era — this is a unique AB-900 topic often missed by learners
- It provides a dashboard that surfaces: what sensitive data Copilot is interacting with, risky user behaviors in AI interactions, data oversharing risks that Copilot exposes
- Key reports within DSPM for AI: AI interaction data, sensitive data in AI prompts and responses, data access alerts
- Distinction from standard Purview: DSPM for AI focuses specifically on AI-surface risks, not general compliance
- Exam relevance: questions may describe a scenario where an admin needs to assess what data Copilot is exposing — DSPM for AI is the answer, not standard Content Explorer
- Licensing note: DSPM for AI capabilities have tiered availability depending on E3/E5 + Purview add-on licensing

---

### Demo Moments

**Demo 2A: Purview sensitivity labels (3 min)**

- Portal: `purview.microsoft.com` > Information protection > Labels
- Show the label hierarchy — a parent label with sublabels
- Click into a label: show the name/description, scope (files/emails), protection settings (encryption toggle), auto-labeling configuration
- Do not actually create a label — navigate read-only

**Demo 2B: DLP policy overview (3 min)**

- Portal: `purview.microsoft.com` > Data loss prevention > Policies
- Open an existing policy (or the policy creation wizard if no policy exists)
- Show: where to select workloads (Exchange, SharePoint, Teams, etc.), how conditions work (content contains sensitive info type), and the action options (block, notify, audit)
- Point to the "Test mode" option — important for exam scenarios about rolling out DLP safely

**Demo 2C: DSPM for AI (4 min)**

- Portal: `purview.microsoft.com` > Solutions > **DSPM for AI (classic)**
- Note for Tim: `compliance.microsoft.com` is being retired — always use `purview.microsoft.com`. The feature may appear as "DSPM for AI (classic)" alongside a newer preview version labeled "Data Security Posture Management" — both are in the Solutions menu. Acknowledge this if learners see different UI.
- Show the overview dashboard: AI app usage, sensitive data interactions, risky users
- Click into one report to show the data surface — even if the tenant has no data, walk through the UI so learners know where it lives
- Explicitly tell learners: "This is the place exam questions will point to when they ask how an admin monitors AI data risk"

> **Pacing note:** DSPM for AI is the most likely place to lose time. If the portal is slow to load, talk through the feature conceptually while it loads. Do not skip it — it is a unique AB-900 topic.

**Demo 2D: SharePoint Advanced Management — oversharing reports (6 min)**

- Portal: `admin.microsoft.com/sharepoint` (SharePoint admin center)
- Navigate: Reports > Data access governance (or Advanced management > Oversharing reports — UI label varies by tenant)
- Show: "Sites with most sharing links" and "Sites shared with Everyone or Everyone except external users" reports
- Show: Site access review capability — how an admin can trigger an owner-driven review of who has access to a site
- Briefly mention: Restricted SharePoint Search (limits Copilot to a curated set of sites) as a short-term oversharing mitigation — this is a tested concept
- Remediation tools: block download policy, restricted access control for sites

> **Pacing note:** The oversharing demo is high-value for exam preparation. Do not cut it. If pressed for time, cut Demo 2A or 2B to one minute each instead.

---

### Learner Activity

**Activity 2: Oversharing risk identification (4 min)**

Present a scenario verbally or in chat:

> "Contoso has 500 SharePoint sites. Site permissions were never audited. All licensed users have Copilot. An employee uses Copilot to research the company's upcoming acquisition. Copilot returns a summary that includes the deal terms from a SharePoint document labeled 'Confidential — Legal.' The employee was not supposed to have access to this document."

Ask learners in chat: "What is the root cause? What tool would you use to find which other sites have this exposure? What is the fastest short-term mitigation while you fix permissions properly?"

Expected answers: root cause = oversharing/broken permissions; tool = SharePoint Advanced Management data access governance reports; short-term mitigation = Restricted SharePoint Search or site-level restricted access control.

---

### Exam Connection — Segment 2

Domain 2 objectives covered in this segment:

- Microsoft Purview capabilities: information protection (sensitivity labels), DLP, Insider Risk Management, Communication Compliance, DSPM for AI
- Copilot data access and permissions: how Graph drives data grounding; managing permissions that affect Copilot responses
- Compliance Manager: compliance score, improvement actions, assessments
- Sensitive data discovery: Content Explorer, Activity Explorer
- SharePoint oversharing remediation: data access governance reports, restricted access controls, site access reviews

> **Exam flag for learners:** DSPM for AI is a named feature in the AB-900 exam guide. If a question describes an admin needing to understand what sensitive data Copilot is accessing or exposing — the answer points to DSPM for AI in Microsoft Purview, not a general Purview search tool.

> **Exam flag for learners:** Restricted SharePoint Search is a specific Microsoft Copilot mitigation — it limits Copilot's organizational search to admin-approved sites. Know this as a Copilot governance control, not a general SharePoint feature.

---

### If Running Long — Segment 2 Cuts

Cut in this order:

1. Shorten Insider Risk Management and Communication Compliance to 1 minute each — just name them and their exam purpose (low exam depth required)
2. Cut Demo 2A (sensitivity labels) to a screenshot walkthrough — describe instead of live navigation (minimal exam impact)
3. Do not cut: DSPM for AI demo, SharePoint Advanced Management demo, or the Microsoft Graph / oversharing lecture — all are high-probability exam topics specific to AB-900

---

## Segment 3: Copilot Features and Administration

**Duration:** 50 minutes
**Exam Domain:** Domain 3 — Copilot and Agent Administration (25–30%)

### Learning Objectives

By the end of this segment, you will be able to:

- Distinguish between Microsoft 365 Copilot subscription licensing and pay-as-you-go billing, including how SharePoint agents are licensed
- Configure Copilot settings from the Microsoft 365 admin center and manage feature enablement
- Monitor Copilot adoption and usage using the Copilot Dashboard in Viva Insights
- Describe the Researcher and Analyst agentic experiences and the administrative controls around them

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00–0:04 | Segment intro — frame Domain 3 and licensing complexity | 4 min |
| 0:04–0:18 | Lecture: Copilot licensing — subscription vs. pay-as-you-go + SharePoint agents | 14 min |
| 0:18–0:28 | Demo: License assignment in admin center + billing policy | 10 min |
| 0:28–0:36 | Lecture + Demo: Copilot settings and feature management in admin center | 8 min |
| 0:36–0:43 | Lecture + Demo: Researcher and Analyst agentic experiences | 7 min |
| 0:43–0:48 | Demo: Copilot Dashboard in Viva Insights | 5 min |
| 0:48–0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**Copilot Licensing — Subscription vs. Pay-As-You-Go + SharePoint Agents (14 min)**

This is a complex licensing area that the exam tests directly. Be deliberate here.

- **Base license prerequisite:** Microsoft 365 Copilot requires an eligible underlying license: M365 E3, E5, Business Standard, or Business Premium (and Office 365 E3/E5). Copilot is an add-on, not standalone.

- **Subscription model (per-user per-month):**
  - Fixed cost assigned to named users
  - Full Copilot in Word, Excel, PowerPoint, Outlook, Teams, Pages, Loop, Whiteboard
  - Business Chat (now called Microsoft 365 Chat) with Graph grounding
  - Best for: knowledge workers with predictable, high-frequency AI usage

- **Pay-as-you-go (metered / consumption-based):**
  - Billed through Azure subscription
  - No per-user named license required for some scenarios
  - Used for: Copilot Studio agents (message capacity), certain Power Platform scenarios
  - Billing policy configured in Microsoft 365 admin center under **Copilot > Billing & usage** — this is a testable admin task
  - Best for: variable usage, pilot programs, specific agent workloads

- **SharePoint agents — licensing specifics:**
  - SharePoint agents (agents embedded in SharePoint sites, document libraries) can be used without a full Copilot license in certain configurations — this is a nuanced tested point
  - Agents created and published in SharePoint draw on SharePoint content within the site boundary
  - Licensing model for SharePoint agents interacts with both Copilot licensing and Copilot Studio metering
  - Know the distinction: a SharePoint agent is not the same as a declarative agent published through Teams

- **24-hour activation delay:** After assigning a Copilot license, users may not see Copilot features for up to 24 hours — this is a common exam distractor question

- **Copilot Studio licensing:**
  - Separate from M365 Copilot
  - Subscription (monthly capacity) or pay-as-you-go (per **Copilot Credit** billed through Azure)
  - Tenant billing policy must be configured before agents can run on PAYG

**Researcher and Analyst Agentic Experiences (7 min)**

- Researcher and Analyst are two built-in agentic experiences in Microsoft 365 Copilot — not custom agents, not Copilot Studio agents
- **Researcher:** performs multi-step research tasks using both organizational data (Graph) and web data (Bing); produces structured research outputs; uses "deep research" capability
- **Analyst:** performs data analysis tasks; can work with structured data in Excel and other sources; produces charts, summaries, trend analysis
- These are considered "agentic" because they run multi-step autonomous reasoning — they do not just generate text, they plan and execute steps
- Admin controls: Researcher and Analyst can be **blocked** by admins in the M365 admin center, but they are **NOT** governed by the general agent on/off toggle — turning off agents does not disable Researcher or Analyst. They are part of the core Copilot experience and require a separate explicit block action. Users cannot disable them individually.
- Exam angle: questions will likely ask what Researcher does vs. what Analyst does, and whether admins can control access to them

---

### Demo Moments

**Demo 3A: License assignment and billing policy (10 min)**

- Portal: `admin.microsoft.com` > Billing > Licenses
- Show the Microsoft 365 Copilot license entry; click through to see assigned users
- Show: Users > Active users > select user > Licenses and apps — assign/unassign Copilot license
- Navigate to: **Copilot > Billing & usage** > Billing policies tab
- Show where pay-as-you-go billing is configured — the Azure subscription, resource group, and spending limit fields
- Narrate: "This billing policy is configured in the Copilot node of the M365 admin center, not in the Azure portal or the Billing node. The exam may ask where this lives — it's Copilot > Billing & usage."

**Demo 3B: Copilot settings in admin center (4 min)**

- Portal: `admin.microsoft.com` > Settings > Microsoft 365 Copilot (or Copilot under the left nav depending on tenant)
- Show: feature toggles — web search on/off, optional connected experiences, plugin management
- Show: the "Manage Copilot" section — where tenant-level defaults live
- Point out: the diagnostic data sharing toggle — this is a policy-sensitive setting organizations ask about

**Demo 3C: Researcher and Analyst in Copilot (3 min)**

- If available in demo tenant: open Microsoft 365 Copilot (microsoft365.com or Teams)
- Show Researcher entry point — the "Research" or deep research option in Copilot chat
- Show Analyst entry point if visible
- If not available in demo tenant: show the admin setting that controls these experiences and walk through the UI description
- Tell learners: "The exam will describe these as 'agentic experiences' — multi-step, autonomous reasoning workflows built into Copilot, distinct from plugins or custom agents"

**Demo 3D: Copilot Dashboard in Viva Insights (5 min)**

- Portal: `insights.viva.cloud.microsoft` or accessible via Microsoft 365 admin center > Reports > Copilot Dashboard
- Show four dashboard sections: Readiness, Adoption, Impact, Sentiment
- Readiness: license assignment status, users enabled vs. inactive
- Adoption: active users by app (Teams, Outlook, Word, etc.), weekly trends
- Impact: "Copilot assisted hours" metric — explain what this measures and why it matters for business justification
- Sentiment: optional survey data if configured
- Tell learners: "Exam questions about 'how does an admin track Copilot usage' point here — not to the standard M365 usage reports"

> **Pacing note:** The licensing lecture at 14 minutes is the longest single block in the session. It is justified by exam weight — but watch the clock. If you go past 0:22, compress Demo 3A to 7 minutes.

---

### Learner Activity

**Activity 3: Licensing decision scenario (integrated into lecture)**

During the licensing lecture (around the 10-minute mark), pause and ask in chat:

> "Contoso wants to let 50 specific power users have full Copilot in Word, Excel, and Teams. They also want to let a team of 5 developers build and run custom agents for internal use without paying for 5 additional full Copilot licenses. Which licensing model fits each group?"

Expected answer: Power users = M365 Copilot subscription (named license); developers = Copilot Studio with pay-as-you-go billing (Azure-connected billing policy, no named Copilot license required for agent builders in basic scenarios).

This doubles as exam preparation for licensing scenario questions.

---

### Exam Connection — Segment 3

Domain 3 objectives covered in this segment:

- Licensing models: monthly subscription vs. pay-as-you-go; SharePoint agents licensing; Copilot Studio metering
- Feature management: enable/disable Copilot features, web search toggle, plugin management
- License assignment procedures: individual and group assignment, 24-hour delay
- Billing policy management: pay-as-you-go configuration, Azure subscription linkage
- Usage monitoring: Copilot Dashboard in Viva Insights — readiness, adoption, impact, sentiment
- Agent types and use cases: Researcher (multi-step research), Analyst (data analysis)

> **Exam flag for learners:** The Copilot Dashboard in Viva Insights is the specific tool for monitoring adoption. Know its four sections (Readiness, Adoption, Impact, Sentiment) by name. The standard M365 usage reports do not give the same Copilot-specific view.

> **Exam flag for learners:** SharePoint agents and their licensing interaction with the broader Copilot model is a nuanced point. The key: SharePoint agents can surface site content and may run with different licensing requirements than full M365 Copilot. Know this distinction exists even if you cannot memorize every pricing detail.

---

### If Running Long — Segment 3 Cuts

Cut in this order:

1. Compress Copilot Studio licensing to 2 minutes — just state: "Copilot Studio uses subscription or PAYG, licensed separately, configured through billing policies" (minor exam impact)
2. Skip Demo 3C (Researcher/Analyst in Copilot UI) — describe the experience verbally (low demo impact; exam tests concepts not UI navigation for this topic)
3. Do not cut: the subscription vs. PAYG lecture, billing policy demo, or Viva Insights dashboard demo — all are directly tested

---

## Segment 4: Agent Administration and Exam Success

**Duration:** 50 minutes (includes 10-minute wrap-up)
**Exam Domain:** Domain 3 continued — Copilot and Agent Administration (25–30%) + exam preparation

### Learning Objectives

By the end of this segment, you will be able to:

- Explain the agent lifecycle from creation in Copilot Studio through the approval and publication workflow in the Microsoft 365 admin center and Power Platform admin center
- Identify the governance controls available to admins for managing agents across the tenant
- Distinguish between declarative agents, custom agents, and the built-in Researcher/Analyst agentic experiences
- Apply a structured exam strategy to AB-900 question scenarios

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00–0:04 | Segment intro — frame the agent governance landscape | 4 min |
| 0:04–0:14 | Lecture: Agent types, creation fundamentals, and Copilot Studio basics | 10 min |
| 0:14–0:26 | Lecture + Demo: Agent approval workflow — M365 admin center + Power Platform admin center | 12 min |
| 0:26–0:34 | Demo: Copilot Studio — build and publish a declarative agent (walkthrough) | 8 min |
| 0:34–0:40 | Learner activity: Agent governance scenario | 6 min |
| 0:40–0:50 | Wrap-up: Exam strategy, domain review, resources, next steps | 10 min |

---

### Lecture Topics

**Agent Types, Creation Fundamentals, and Copilot Studio Basics (10 min)**

- Clarify the taxonomy — learners will confuse these:
  - **Declarative agents:** instruction-based agents defined by a system prompt, knowledge sources, and conversation starters; no custom code; built in Copilot Studio or with Teams Toolkit / VS Code
  - **Custom engine agents (custom agents):** use Azure Bot Framework, custom orchestration, full code control — not the focus of AB-900 but know the term exists
  - **Researcher and Analyst:** built-in agentic experiences in M365 Copilot (covered in Segment 3) — NOT built in Copilot Studio, not deployed by admins
  - **SharePoint agents:** declarative agents scoped to a SharePoint site or library; created by site owners, not just IT admins
  - **Copilot Studio agents:** custom-built agents using the Copilot Studio low-code platform
- Copilot Studio fundamentals: topics, knowledge sources (websites, SharePoint, uploaded files, custom connectors), actions (Power Automate flows, connectors), generative answers
- Agent distribution channels: Teams app store (organizational), SharePoint pages, standalone web widget, M365 Copilot
- Key admin concept: agents are published through the Teams app store model — this means the same app governance controls that apply to Teams apps apply to Copilot agents

**Agent Approval Workflow — M365 Admin Center + Power Platform Admin Center (12 min)**

This is one of the most operationally specific topics in the exam. Walk through it methodically.

- **The publishing pipeline:**
  1. Developer/maker creates agent in Copilot Studio
  2. Agent is submitted for publication ("publish to your organization")
  3. Submission creates a **pending agent request in the M365 admin center Copilot Control System** (`admin.microsoft.com` > Agents > All agents > Requests). Teams admin center plays a secondary role for allow/block policies — it is not the primary approval queue.
  4. M365 admin reviews and approves or rejects

- **Microsoft 365 admin center role:**
  - Navigate: `admin.microsoft.com` > Settings > Microsoft 365 Copilot > Agents (or Copilot > Manage agents — UI varies)
  - This is where tenant-wide agent policies live: allow all agents, allow only approved agents, block all agents
  - Admins can approve individual agents or set blanket allow/block policies by category

- **Teams admin center role:**
  - Navigate: `admin.teams.microsoft.com` > Teams apps > Manage apps
  - Agents published as Teams apps appear here; admins grant org-wide app consent or restrict to specific users/groups
  - App permission policies: which users can install which apps (and agents are treated as apps)
  - App setup policies: which apps are pinned for which users

- **Power Platform admin center role:**
  - Navigate: `admin.powerplatform.microsoft.com` > Environments > [select environment] > Copilot Studio agents (or Resources > Chatbots)
  - This is where admins manage Copilot Studio environments, control which environments agents can be built in, and set data loss prevention policies for connectors used by agents
  - DLP policies in Power Platform admin center control which connectors agents can invoke — this prevents an agent from connecting to an unsanctioned data source
  - Know this distinction: M365 admin center controls agent deployment/distribution; Power Platform admin center controls the environment governance and connector access for agents built in Copilot Studio

- **Approval workflow scenario (exam-style):**
  - A maker in the HR department builds a Copilot Studio agent and submits it for org-wide distribution
  - The M365 admin receives a notification (via admin center or email)
  - Admin reviews the agent's requested permissions and knowledge sources
  - Admin approves — agent becomes available to assigned users in Teams/M365 Copilot
  - OR: admin blocks the connector the agent uses via a Power Platform DLP policy, effectively preventing the agent from functioning even if it was "approved"

---

### Demo Moments

**Demo 4A: Agent approval in M365 admin center (6 min)**

- Portal: `admin.microsoft.com` > Settings > Microsoft 365 Copilot > Agents (or equivalent path in your tenant)
- Show: the tenant-level agent policy setting (allow all / allow specific / block all)
- Show: any pending agent submissions if available; walk through what the approval review shows (agent name, description, requested permissions, maker)
- Show: how to approve or block an individual agent submission
- Tell learners: "This is where the AB-900 exam expects you to go when asked 'how does an admin approve a Copilot agent for org-wide use'"

**Demo 4B: Teams admin center — app governance for agents (3 min)**

- Portal: `admin.teams.microsoft.com` > Teams apps > Manage apps
- Filter by "Copilot" or agent type if available
- Show: app permission policy assignment — how an admin restricts which users can see/install the agent
- Tell learners: "Agents published as Teams apps flow through this same governance model. If you know how to govern Teams apps, you know how to govern Copilot agents."

**Demo 4C: Power Platform admin center — environment and DLP controls (3 min)**

- Portal: `admin.powerplatform.microsoft.com`
- Navigate: Environments — show the list; emphasize that Copilot Studio agents are built within an environment
- Navigate: Policies > Data policies (DLP) — show an existing DLP policy; highlight the connector classification (Business / Non-business / Blocked)
- Tell learners: "If an agent tries to use a connector that's classified as 'Blocked' in a DLP policy, the agent cannot invoke that action — even if the agent was approved in the M365 admin center. These two governance layers work together."

**Demo 4D: Copilot Studio — declarative agent creation walkthrough (8 min)**

- Portal: `copilotstudio.microsoft.com`
- Create a new agent: name it "Demo Agent"; add a description; write a system prompt (2–3 sentences describing the agent's purpose)
- Add a knowledge source: add a SharePoint site URL or upload a document
- Add a conversation starter: one example question
- Show the "Publish" button and the publication options (Teams, SharePoint, M365 Copilot)
- Do NOT publish live — stop at the publish screen and say: "When I click Publish here, this triggers the submission that goes to the M365 admin center approval queue we just saw."
- Tell learners: "The exam does not test deep Copilot Studio configuration. It tests whether you understand the creation-to-approval pipeline and what each admin center is responsible for."

> **Pacing note:** Demo 4D is the highest-value "aha moment" demo in the session because it closes the loop from creation to approval. Reserve the full 8 minutes. If you are running long entering Segment 4, cut Demo 4B or 4C to 90 seconds each.

---

### Learner Activity

**Activity 4: Agent governance scenario (6 min)**

Present this scenario in chat:

> "Fabrikam's IT admin receives a complaint that an employee-built Copilot agent is accessing customer data from a third-party CRM via a connector. The agent was approved by a junior admin three weeks ago. The admin needs to: (1) immediately stop the agent from using the CRM connector, and (2) prevent future agents from using unapproved external connectors without a review process."

Ask learners: "Which admin center handles step 1? Which handles step 2? What specific feature do you use for each?"

Expected answers:
- Step 1: Power Platform admin center — add the CRM connector to the Blocked category in a DLP policy for the environment
- Step 2: Power Platform admin center — update the DLP policy to classify third-party CRM connectors as Non-business (or Blocked) by default; also consider requiring admin approval for new connector usage

Debrief the answers before moving to wrap-up.

---

### Exam Connection — Segment 4

Domain 3 objectives covered in this segment:

- Agent creation and configuration: declarative agents in Copilot Studio, knowledge sources, actions, publication pipeline
- Agent approval processes: M365 admin center agent policies, Teams admin center app governance, Power Platform DLP policies for connectors
- Agent types: declarative, custom engine, Researcher/Analyst (built-in), SharePoint agents

> **Exam flag for learners:** The two admin centers that govern agents are the M365 admin center (deployment approval, tenant policies) and the Power Platform admin center (environment governance, DLP for connectors). Exam questions will distinguish between them — know which does what.

> **Exam flag for learners:** A Power Platform DLP policy blocking a connector will prevent an agent action from running regardless of whether the agent itself was approved in the M365 admin center. These are independent but complementary controls.

---

### If Running Long — Segment 4 Cuts

Cut in this order:

1. Compress Demo 4B (Teams admin center app governance) to 90 seconds — describe the concept, show one screenshot (minor exam impact)
2. Compress Demo 4C (Power Platform DLP) to 90 seconds — just show the connector classification screen (moderate impact — still describe the concept verbally)
3. Do not cut: Demo 4A (M365 admin center agent approval), Demo 4D (Copilot Studio creation walkthrough), or the wrap-up block — all are critical to session completion

---

## Wrap-Up Block (Final 10 minutes of Segment 4)

### Domain Coverage Recap (2 min)

Call out the three domains and their weights one more time:

| Domain | Weight | Key Focus Areas |
|--------|--------|----------------|
| Domain 1 | 30–35% | Entra ID, PIM, Conditional Access, license management, admin center navigation |
| Domain 2 | 35–40% | Sensitivity labels, DLP, DSPM for AI, SharePoint oversharing, Microsoft Graph grounding |
| Domain 3 | 25–30% | Copilot licensing models, agent approval workflow, Copilot Dashboard, Researcher/Analyst |

Tell learners: "Domain 2 is the largest. If you leave today and only have time to study one domain deeply, make it Domain 2 — and within Domain 2, focus on DSPM for AI and SharePoint oversharing remediation. Those are the topics most unique to this exam."

---

### Exam Strategy Tips (4 min)

**Question reading strategy:**

- Watch for "EXCEPT," "NOT," and "LEAST" — these are negation questions; mark the correct wrong answer
- Watch for role qualifiers: "which admin role has minimum required permissions to…" — think least privilege first
- Watch for portal qualifiers: "in which admin center would you…" — know M365 admin center vs. Purview vs. Entra vs. Teams vs. Power Platform

**Common exam traps for AB-900 specifically:**

1. Confusing DSPM for AI (Purview feature for AI risk) with standard Purview Content Explorer or Activity Explorer — they are different tools
2. Confusing the M365 admin center agent approval with Power Platform admin center agent governance — they control different things
3. Answering "Global Administrator" when a more specific role (Copilot Admin, Compliance Administrator, SharePoint Administrator) is correct
4. Forgetting the 24-hour Copilot license activation delay in troubleshooting scenarios
5. Treating Researcher and Analyst as custom-built agents — they are built-in agentic experiences, not deployed through Copilot Studio

**Time management:**

- Exam is 45 minutes — approximately 30–40 questions (beta exams may vary)
- Do not spend more than 90 seconds on any single question; mark and return
- Use process of elimination aggressively — wrong answers are often obviously wrong on this exam

---

### Next Steps and Resources (4 min)

**Immediate actions:**

1. Sign up for an M365 developer trial tenant at `developer.microsoft.com/microsoft-365/dev-program` — practice in a real environment
2. Complete the official Microsoft Learn path for AB-900: `learn.microsoft.com/credentials/certifications/exams/ab-900`
3. Read the official study guide (linked from the exam page) — it lists exact objectives
4. Practice with Content Explorer and Activity Explorer in a trial tenant — navigating Purview under time pressure is a real skill

**High-priority study areas (time-boxed recommendations):**

| Topic | Recommended Study Time | Primary Resource |
|-------|----------------------|-----------------|
| DSPM for AI | 1 hour | Microsoft Purview docs — search "DSPM for AI" |
| SharePoint Advanced Management + oversharing | 1.5 hours | SharePoint Advanced Management docs + SAM hands-on |
| Copilot licensing (subscription vs. PAYG) | 1 hour | Copilot licensing guide in repo + official licensing docs |
| PIM (eligible vs. active, JIT) | 45 min | Entra PIM documentation |
| Agent approval workflow (M365 + Power Platform) | 1 hour | Both admin center docs + this session recording |
| Copilot Dashboard in Viva Insights | 30 min | Viva Insights Copilot Dashboard docs |

**Repo resources:**

- All demo scripts, lab guides, and reference materials: `github.com/timothywarner-org/ab900`
- Practice questions: `shared-resources/references/AB-900-PRACTICE-QUESTIONS.md`
- Skills breakdown by domain: `shared-resources/references/AB-900-SKILLS-BREAKDOWN.md`
- Licensing guide: `segment-03-copilot-administration/resources/COPILOT-LICENSING-GUIDE.md`

---

## Global Pacing Notes

The following are time sinks observed in live delivery of M365 admin sessions. Watch for all of them:

- **Admin center load times:** Portal pages — especially Purview and Power Platform — can take 10–20 seconds to render. Pre-navigate during the previous segment's activity block.
- **Tenant configuration variance:** Your demo tenant may not show the same nav labels as learner tenants. Always narrate what you are clicking even if the screen matches, and acknowledge that UI labels vary.
- **Q&A creep:** The chat will generate good questions during demos. Resist answering inline — defer to the 2-minute Q&A triage at the end of each segment. Exception: if a learner is confused about a concept needed for the current demo, answer it immediately and briefly.
- **Licensing debate:** Learners who work with M365 licensing daily will push back or add nuance during the licensing lecture. Acknowledge, validate, and defer detailed licensing edge cases to the repo or post-session: "The exam tests the conceptual model, not edge cases in your specific agreement."
- **Copilot UI novelty:** Learners will want to explore Copilot features live. Keep demos tightly scoped to what is on the exam — do not demo Copilot creative features, image generation, or consumer Copilot.

---

## Admin Center Quick Reference

| Task | Portal URL | Navigation Path |
|------|-----------|----------------|
| License assignment | admin.microsoft.com | Users > Active users > [user] > Licenses and apps |
| Billing / pay-as-you-go policy | admin.microsoft.com | Copilot > Billing & usage |
| Copilot settings + agent approval | admin.microsoft.com | Settings > Microsoft 365 Copilot |
| Service health | admin.microsoft.com | Health > Service health |
| Sensitivity labels | purview.microsoft.com | Information protection > Labels |
| DLP policies | purview.microsoft.com | Data loss prevention > Policies |
| DSPM for AI | purview.microsoft.com | Solutions > DSPM for AI (classic) |
| Content Explorer | purview.microsoft.com | Data classification > Content explorer |
| Activity Explorer | purview.microsoft.com | Data classification > Activity explorer |
| SharePoint oversharing reports | admin.microsoft.com/sharepoint | Reports > Data access governance |
| Conditional Access | entra.microsoft.com | Protection > Conditional access |
| PIM | entra.microsoft.com | Identity governance > Privileged Identity Management |
| Teams app governance | admin.teams.microsoft.com | Teams apps > Manage apps |
| App permission policies | admin.teams.microsoft.com | Teams apps > Permission policies |
| Power Platform environments | admin.powerplatform.microsoft.com | Environments |
| Power Platform DLP | admin.powerplatform.microsoft.com | Policies > Data policies |
| Copilot Studio agent building | copilotstudio.microsoft.com | Create > New agent |
| Copilot Dashboard | insights.viva.cloud.microsoft | Copilot Dashboard |

---

*Document version: 1.0 — March 2026*
*Maintained in: `/c/github/ab900/docs/session-agenda.md`*
