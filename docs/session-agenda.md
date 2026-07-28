# AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
## O'Reilly Live Learning -- Instructor Delivery Guide

**Instructor:** Tim Warner
**Delivery date:** July 28, 2026
**Skills measured version in force:** July 22, 2026
**Total Running Time:** 200 minutes (4 x 50-min segments)
**Format:** Live online with learner Q&A, demos in live tenant, and hands-on follow-along activities

---

> **ORDERING CONFLICT -- resolve before delivery.** This guide is sequenced in **exam-domain order**. The authoritative running order in `course-plan-july-2026.md` is **delivery order**, which leads with Copilot as the draw. The section bodies below are correct in content but appear under different segment numbers than the course plan uses. Teach from the course plan for running order; use this guide for per-topic timing and talk track. The mapping is in the table below.

## Session Summary Table

| This guide's section | Topic | Delivery slot (course plan) | Domain | Time |
|---------|-------|-----------------|--------|------|
| Pre-session | Tech check + housekeeping | Pre-session | -- | 10 min |
| Section 1 | Core Features and Objects of Microsoft 365 Services | **Segment 4** | Domain 1 (30-35%) | 50 min |
| Section 2 | Data Protection and Governance for Microsoft 365 and Copilot | **Segment 3** | Domain 2 (35-40%) | 50 min |
| Section 3 | Copilot Features and Administration | **Segment 1** | Domain 3 (25-30%) | 50 min |
| Section 4 | Agent Administration and Exam Success | **Segment 2** | Domain 3 cont. + exam prep | 50 min |
| Wrap-up | Exam tips, next steps, resources | End of Segment 4 | -- | 10 min |

**Exam domain emphasis reminder:** Domain 2 (Data Protection) carries the most weight at 35-40%. Do not let Segments 1 or 3 run long at its expense.

---

## July 22, 2026 Refresh -- What Moved

Microsoft updated the AB-900 skills measured on July 22, 2026, six days before this delivery. The change log records **three Minor changes and zero Major changes**. Domain weights did not move.

The three subsections flagged Minor:

1. Identify the core objects of Microsoft 365 services
2. Identify the core security features of Microsoft 365 services
3. Identify and monitor oversharing in SharePoint in Microsoft 365

Wording corrections that affect answer selection:

| Retired wording | Current wording |
|-----------------|-----------------|
| Exchange Online admin center (distribution lists) | **Exchange admin center** (distribution groups) |
| SharePoint in Microsoft 365 admin center | **SharePoint admin center** |
| restricted site access | **restricted access control** |
| Content explorer | **Data Explorer** |
| standalone Content search | **Content search in Microsoft Purview eDiscovery** |
| Microsoft 365 Defender | **Microsoft Defender XDR** |

Note for the "SharePoint in Microsoft 365" case: the phrase is still correct for the **service**. Only the **admin center** name changed. The objective bullets "Identify the appropriate roles and permissions for sites in SharePoint in Microsoft 365" and the oversharing subsection heading both keep it.

**AB-900 is generally available. Remove any reference to beta status, delayed beta scoring, or beta discount codes.**

---

## Pre-Session Block (10 minutes before start)

**Goal:** Every learner is confirmed technically ready before the clock starts.

### Checklist for Tim

- [ ] Screen share confirmed -- learners can see both your browser and any admin center tabs
- [ ] Second monitor or device ready for learner chat monitoring
- [ ] Demo tenant pre-logged in: admin.microsoft.com, purview.microsoft.com, entra.microsoft.com, admin.exchange.microsoft.com, admin.teams.microsoft.com
- [ ] Copilot Studio tab open at copilotstudio.microsoft.com
- [ ] Power Platform admin center open at admin.powerplatform.microsoft.com
- [ ] Confirm which DSPM entries the tenant shows under Purview > Solutions before going live: **DSPM**, **Data Security Posture Management (classic)**, and **DSPM for AI (classic)** can all appear
- [ ] Slide deck loaded at correct first slide

### What to Say

1. Welcome learners as they join; name the session title and exam code (AB-900)
2. Confirm audio/video: "Type 'yes' in chat if you can hear me clearly"
3. Platform orientation: where the Q&A panel is, chat etiquette, how to submit questions
4. Housekeeping: session will be recorded; slides and labs available in the GitHub repo linked in chat
5. Set expectations: "This session prepares you for the AB-900 exam. I will flag exam objectives explicitly throughout. Not everything I show is on the exam, and I will tell you what is."
6. Name the refresh date: "Microsoft updated the skills measured for this exam on July 22, six days ago. The content you are getting today reflects that update."
7. Drop repo link and Microsoft 365 trial tenant signup link in chat

---

## Segment 1: Core Features and Objects of Microsoft 365 Services

**Duration:** 50 minutes
**Exam Domain:** Domain 1 -- Identify the core features and objects of Microsoft 365 services (30-35%)

### Learning Objectives

By the end of this segment, you will be able to:

- Identify the core Microsoft 365 services (Exchange Online, SharePoint in Microsoft 365, Teams, OneDrive, Microsoft Entra ID) and explain how they interconnect
- Describe how Microsoft Entra ID governs identity, authentication, and access control, including MFA, Conditional Access, and Privileged Identity Management (PIM)
- Assign and audit user licenses from the Microsoft 365 admin center, including Copilot license prerequisites
- Explain Zero Trust principles and how they apply to Microsoft 365 administration decisions

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00-0:05 | Segment intro -- frame the "why" for Domain 1 | 5 min |
| 0:05-0:18 | Lecture: Microsoft 365 architecture and core services | 13 min |
| 0:18-0:30 | Lecture: Entra ID -- identity, MFA, Conditional Access, PIM | 12 min |
| 0:30-0:38 | Demo: Admin center navigation + license assignment | 8 min |
| 0:38-0:44 | Learner activity: License audit exercise | 6 min |
| 0:44-0:48 | Lecture: Zero Trust and its Microsoft 365 implications | 4 min |
| 0:48-0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**Microsoft 365 Architecture and Core Services (13 min)**

- Tenant as the organizational boundary -- one tenant, one **Microsoft Entra ID** directory
- The five pillars learners must know cold: Exchange Online, SharePoint in Microsoft 365, Microsoft Teams, OneDrive, Microsoft Entra ID
- How these services are the data sources Copilot draws from -- plant this seed early
- Admin centers map: admin.microsoft.com as the hub; spoke centers for **Exchange admin center** (admin.exchange.microsoft.com), **SharePoint admin center** (admin.microsoft.com/sharepoint), **Microsoft Teams admin center** (admin.teams.microsoft.com), **Microsoft Entra admin center** (entra.microsoft.com)
- Naming precision that the July 22 refresh made explicit: it is the **Exchange admin center**, not the Exchange Online admin center, and the **SharePoint admin center**, not the SharePoint in Microsoft 365 admin center
- Exchange objects: mailboxes and **distribution groups**. The EAC tab label reads Distribution list, and Microsoft uses both terms, so learners should recognize either.
- SharePoint objects: sites, libraries, folders, plus site roles and permissions
- Teams objects: teams, channels, policies
- Note that **admin.cloud.microsoft** now resolves to the same Microsoft 365 admin center app as admin.microsoft.com, part of the broader cloud.microsoft domain unification
- Service health dashboard: where to find it and what the severity categories mean
- Message Center: how planned changes surface here before they reach tenants

**Microsoft Entra ID -- Identity, Auth, and Access Control (12 min)**

- Users versus groups versus service principals -- know the difference
- Authentication methods: password, MFA, and passwordless. These are managed in the unified **Authentication methods policy** at entra.microsoft.com > Entra ID > Authentication methods > Policies. Legacy MFA and SSPR method management retired September 30, 2025.
- **Passkey-first is the current Microsoft guidance.** Microsoft-provided SMS and voice retire February 1, 2027, and passkey auto-enablement begins September 1, 2026. Do not present SMS as a recommended method.
- Mandatory MFA: Phase 1 and Phase 2 are both in force as of July 2026. There is no opt-out, and it applies to break-glass accounts and B2B guests.
- Conditional Access: entra.microsoft.com > Entra ID > Conditional Access. The IF/THEN logic runs conditions into grant controls. The target selector now reads **Resources (formerly cloud apps)**, so avoid the old "Cloud apps" label on camera.
- **Identity Secure Score:** entra.microsoft.com > Entra ID > Identity Secure Score. It recalculates every 24 hours and represents the Identity category of the broader Microsoft Secure Score, which is viewed in the Microsoft Defender portal at security.microsoft.com.
- **Privileged Identity Management (PIM):** entra.microsoft.com > **ID Governance** > Privileged Identity Management. It is NOT under Entra ID. Assignment types are **Eligible** and **Active**, with just-in-time activation and optional approval workflows. This is a reliably tested concept.
- **App registrations versus Enterprise applications:** an app registration is the application object, the app's definition with redirect URIs, secrets, API permissions, and app roles, and it exists only in the home tenant. An enterprise application is the service principal, the local instance in a tenant, and it is where SSO, user assignment, and provisioning are configured. Both sit under entra.microsoft.com > Entra ID.
- Least privilege principle: tie to exam scenarios where the question asks which role is the minimum required
- Global Administrator versus AI Administrator versus SharePoint Administrator -- role boundaries matter for exam questions. Microsoft describes Global Administrator as a highly privileged role to be used only when a lower-privileged role cannot do the job.
- **Microsoft Defender XDR** is the service. **security.microsoft.com** is the Microsoft Defender portal. Never say "Microsoft 365 Defender."

**Zero Trust Principles (4 min)**

- Three pillars: verify explicitly, use least privilege access, assume breach
- How Zero Trust maps to exam scenarios: "a user needs access only when..." points to PIM; "access should be blocked from personal devices" points to Conditional Access
- Do not over-explain. Learners are not taking a security specialist exam.

---

### Demo Moments

**Demo 1A: admin.microsoft.com navigation (4 min)**

- Portal: `admin.microsoft.com`
- Navigate: Users > Active users -- show the user properties pane
- Navigate: Billing > Licenses -- show license counts, and highlight which base SKUs make a user eligible for the Copilot add-on (Microsoft 365 E3, E5, E7, Business Standard, Business Premium, and the Office 365 plans)
- Note that **Microsoft 365 E7** includes Microsoft 365 Copilot in the base SKU, so an E7 tenant does not buy the add-on separately
- Navigate: Health > Service health -- show the advisory and incident distinction
- Navigate: Settings > Org settings -- show how org-wide settings are configured here

**Demo 1B: License assignment (4 min)**

- Portal: `admin.microsoft.com` > Users > Active users
- Select a test user > Licenses and apps tab
- Show the license assignment interface, toggle the Copilot license on, and explain that users might wait up to 24 hours for Copilot to appear in some apps
- Show the group-based licensing path: Groups > select group > Licenses (do not actually assign in live demo unless using a disposable test tenant)

> **Pacing note:** The admin center loads slowly. Pre-navigate to each page before the session. Keep browser tabs for each portal open and pinned.

---

### Learner Activity

**Activity 1: License inventory check (6 min)**

Tell learners: "If you have access to a Microsoft 365 trial tenant, navigate to Billing > Licenses right now. Answer in chat: how many total Copilot licenses does your tenant show, and is Microsoft 365 Copilot listed separately from your base Microsoft 365 licenses?"

If learners do not have a tenant, run a chat poll: "Which base license tier do you work with most -- E3, E5, E7, Business Standard, or Business Premium?"

Use their answers to contextualize the licensing prerequisite discussion before moving to Segment 3.

---

### Exam Connection -- Segment 1

Domain 1 objectives covered in this segment:

- License management: how license types assigned to users and groups affect access to Microsoft 365 features, including Copilot prerequisites
- Microsoft 365 admin center: organization configuration, domain names, org settings, user management, service health
- **Exchange admin center**: mailboxes and distribution groups
- **SharePoint admin center**: sites, libraries, folders, plus site roles and permissions in SharePoint in Microsoft 365
- **Teams admin center**: teams, channels, policies
- Zero Trust security principles: verify explicitly, least privilege, assume breach
- Authorization, authentication methods, threat protection and intelligence, and Microsoft Defender XDR
- Microsoft Entra ID features: Conditional Access, SSO, Identity Secure Score, PIM, App registrations and Enterprise apps, audit logs, and the tools for troubleshooting sign-in issues

> **Exam flag for learners:** PIM is a reliable exam topic. Eligible means assigned but not active, Active means currently elevated, and just-in-time means activation on demand with optional approval. PIM lives under **ID Governance** in the Microsoft Entra admin center, not under Entra ID.

> **Exam flag for learners:** Know the difference between an **App registration** (the application object, the app's own definition, home tenant only) and an **Enterprise application** (the service principal, the local instance where you configure SSO and user assignment). The July 22, 2026 refresh keeps "Understand App registrations and Enterprise apps" as an explicit Domain 1 bullet.

---

### If Running Long -- Segment 1 Cuts

Cut in this order (exam coverage impact in parentheses):

1. Shorten the Zero Trust lecture to 2 min and just name the three pillars (minimal exam impact)
2. Skip the learner activity or convert it to a 1-minute verbal question (no exam impact)
3. Cut Demo 1B (group-based licensing) and describe it verbally instead (low exam impact)
4. Do not cut: PIM, App registrations versus Enterprise applications, or the license prerequisite explanation. All three are tested.

---

## Segment 2: Data Protection and Governance for Microsoft 365 and Copilot

**Duration:** 50 minutes
**Exam Domain:** Domain 2 -- Understand data protection and governance tasks for Microsoft 365 and Copilot (35-40%) -- the highest-weight domain

### Learning Objectives

By the end of this segment, you will be able to:

- Explain how Microsoft Graph controls what data Copilot can surface, and why oversharing in SharePoint creates AI risk
- Configure sensitivity labels and DLP policies in Microsoft Purview to protect organizational data
- Use Data Security Posture Management (DSPM) in Microsoft Purview to assess AI-specific data risks
- Identify and remediate SharePoint oversharing using data access governance reports and SharePoint Advanced Management controls

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00-0:04 | Segment intro -- frame Domain 2's weight and real-world stakes | 4 min |
| 0:04-0:14 | Lecture: Microsoft Graph, data grounding, and AI risk from oversharing | 10 min |
| 0:14-0:24 | Lecture: Sensitivity labels, DLP, and Purview governance tools | 10 min |
| 0:24-0:30 | Demo: Purview -- sensitivity labels + DLP policy overview | 6 min |
| 0:30-0:38 | Lecture + Demo: DSPM in Microsoft Purview | 8 min |
| 0:38-0:44 | Demo: SharePoint data access governance -- oversharing reports | 6 min |
| 0:44-0:48 | Learner activity: Identify an oversharing risk scenario | 4 min |
| 0:48-0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**Microsoft Graph, Data Grounding, and Oversharing Risk (10 min)**

- Microsoft Graph is the API layer that connects Copilot to organizational data: emails, files, meetings, chats
- Copilot does not have its own data store. It queries Graph on behalf of the signed-in user.
- Frame Graph inside the bigger picture: **Work IQ** is the intelligence layer for Microsoft 365 Copilot. Microsoft Graph and Copilot connectors sit in its **data** layer, and the semantic index sits in its **context** layer. Work IQ is the umbrella, not a sibling of Graph.
- Note the connector rename: **Microsoft Graph connectors are now Microsoft 365 Copilot connectors**. The underlying API keeps the Microsoft Graph connectors name.
- Critical principle: Copilot can only surface data the user already has permission to see. If that user can see everything because permissions are too broad, Copilot can surface everything.
- Oversharing scenario: a SharePoint site shared with "Everyone except external users" means Copilot will serve that content to every licensed user who asks, even if the content was never intended to be that broadly accessible
- The problem is not Copilot. It is the pre-existing permission debt that Copilot makes suddenly visible and easy to reach.
- This is why SharePoint permission hygiene is a Domain 2 exam topic

**Sensitivity Labels, DLP, and Purview Tools (10 min)**

- Sensitivity labels: what they are (metadata plus protection actions), where they apply (files, emails, meetings, containers and sites), and how the hierarchy works
- Label policies: how labels reach users, and how scope works for specific users and groups versus everyone
- Automatic labeling: trainable classifiers versus sensitive information types -- know the difference
- **The EXTRACT usage right (heavily tested):** when a label applies encryption, the user needs **EXTRACT** in addition to **VIEW** before Copilot returns the content. With VIEW but not EXTRACT, Copilot will not summarize the item, but it can still reference it with a link so the user opens it outside Copilot.
- Label inheritance: Copilot in Word, PowerPoint, and Outlook apply the source file's label and its protection settings, including content markings, to newly created content
- Label display in responses: Copilot Chat shows the **highest priority** (most restrictive) label from the data used in that response
- Data Loss Prevention: the policy is the container, and the rule holds the conditions and the actions. The Copilot-specific policy location is named **"Microsoft 365 Copilot and Copilot Chat"**.
- DLP for Copilot supports four condition and action pairs: sensitivity labels to prevent processing content, sensitive information types to prevent processing prompts, sensitive information types to block web searches, and (preview) email received from external users
- **DLP trap worth stating out loud:** you cannot combine the sensitive information types condition and the sensitivity labels condition in the **SAME rule**. Two rules in one policy, yes. One rule, no.
- Rollout uses **simulation mode**, which replaced the older Test and Test with policy tips states. Simulation runs the policy as if enforced without acting on users, and reports results on a separate dashboard.
- Insider Risk Management: brief conceptual coverage. Name the **Risky AI usage** policy template, which detects prompt injection attacks and access to protected materials.
- Communication Compliance: brief conceptual coverage. Name the **Detect Microsoft Copilot interactions** policy template, and the three generative AI location checkboxes: **Microsoft Copilot experiences**, **Enterprise AI apps**, and **Other AI apps**.
- **Communication Compliance billing trap:** detecting Microsoft 365 Copilot data carries no pay-as-you-go charge. Detecting non-Microsoft-365 AI data, such as Security Copilot or Copilot in Fabric, does require pay-as-you-go billing.
- Compliance Manager: compliance score, improvement actions, assessments, and control-mapping templates for AI regulations
- **Data explorer and Activity explorer:** the July 22, 2026 objective wording says **Microsoft Purview Data Explorer**. Data explorer lives at Purview > Solutions > **Information Protection** > Explorers > Data explorer. The older tool is now labeled **Content Explorer (classic)** and sits under Data Lifecycle Management > Explorers. Teach Data explorer as the current answer.
- Auditing Copilot: prompts and responses land in the unified audit log automatically as part of **Audit (Standard)**, with operation name **CopilotInteraction**. Two properties worth naming: **SensitivityLabelId** identifies whether Copilot touched labeled content, and **XPIADetected** flags a cross-prompt injection attack.
- **Audit trap:** Microsoft explicitly warns that audit log data is **NOT** intended as the basis for Copilot usage reporting. Use the Copilot usage report or the Copilot Dashboard for that.
- Retention: policies can retain or delete AI prompts and responses. Where policies conflict, data is retained for the **longest** duration of all applied retention policies or holds.

**DSPM -- Data Security Posture Management (8 min, lecture + demo combined)**

- **The name and the front door both changed since April.** A new unified **Data Security Posture Management (DSPM)** went generally available in May 2026 at **purview.microsoft.com > Solutions > DSPM**. The prior experiences are now explicitly labeled **DSPM for AI (classic)** and **Data Security Posture Management (classic)**.
- Microsoft states that most new features are being added to the new DSPM only. Microsoft has **NOT** published a retirement date for the classic experience, so do not state one on stage.
- **What to teach for the exam:** the AB-900 objective still uses the phrase "Microsoft Purview Data Security Posture Management (DSPM) for AI," so the classic label is the exam-aligned answer. Show learners the new unified DSPM so they are not lost when they open a current tenant.
- New DSPM key pages: **Posture**, **Objectives**, **AI observability**, **Asset explorer**, **Reports**, **Setup tasks**
- Old-to-new mapping worth having on screen: the former Apps and agents page is now **DSPM > Discover > Apps and agents**; Recommendations for AI apps is now **DSPM > Actions > Remediation actions**; the Microsoft 365 Copilot overview page is now **DSPM > Reports > Microsoft 365 Copilot**; Activity explorer is now **DSPM > Discover > Activity explorer > AI activities** tab
- DSPM for AI (classic) automatically runs a weekly data risk assessment on the top 100 SharePoint sites by usage, with no activation needed. Allow at least 24 hours for one-click policies to collect data.
- Exam relevance: when a question describes an admin who needs to assess what data Copilot is exposing, DSPM is the answer, not Data explorer and not the standard usage reports
- Licensing note: access requires the Compliance Administrator or Global Administrator Entra role, or the Purview Compliance Administrator role group. The classic DSPM additionally requires Microsoft 365 E5 or the Microsoft Purview Suite.

---

### Demo Moments

**Demo 2A: Purview sensitivity labels (3 min)**

- Portal: `purview.microsoft.com` > **Solutions** > **Information Protection** > **Sensitivity labels**
- Show the label structure. Depending on the tenant's label scheme, this is either a parent label with sublabels (classic scheme) or standalone labels and label groups (modern scheme, default for tenants created on or after October 1, 2025).
- Click into a label and show the name and description, the scope options (Files & other data assets, Emails, Meetings, Groups & sites), and the protection settings including the encryption configuration
- Tie it back to Copilot: a label scoped to Groups & sites classifies a whole SharePoint site, and an encrypted label requires the **EXTRACT** usage right before Copilot will summarize the content
- Do not actually create a label. Navigate read-only.

**Demo 2B: DLP policy overview (3 min)**

- Portal: `purview.microsoft.com` > **Data Loss Prevention** > **Policies**
- Open an existing policy, or the policy creation wizard if no policy exists
- Show where locations are selected (Exchange, SharePoint, OneDrive, Teams, Devices, and **Microsoft 365 Copilot and Copilot Chat**), how conditions work, and the action options
- Point to **"Run the policy in simulation mode"** on the final wizard page. This replaced the older Test and Test with policy tips modes. Simulation runs the policy as if enforced, takes no action on users, and reports matches on a separate dashboard.

**Demo 2C: DSPM (4 min)**

- Portal: `purview.microsoft.com` > **Solutions** > **DSPM**
- <!-- VERIFY: confirm in the live tenant which DSPM entries appear under Solutions before going on camera. A current tenant can show DSPM, Data Security Posture Management (classic), and DSPM for AI (classic) simultaneously. -->
- Say out loud what learners are seeing: "You may see up to three DSPM entries in this menu. The plain **DSPM** entry is the new unified experience that went GA in May. The two with **(classic)** in the name are the previous experiences. The exam objective still says 'DSPM for AI,' so that classic label is what you want in your head for exam day."
- The compliance portal is retired. Always use `purview.microsoft.com`. Do not type compliance.microsoft.com on camera even to demonstrate the redirect.
- In the new DSPM, show the **Posture** page, then the **AI observability** page, which inventories AI apps and agents with activity in the last 30 days
- If you land in DSPM for AI (classic) instead, show the overview dashboard and the Recommendations page
- Click into one report to show the data surface. Even with an empty tenant, walk the interface so learners know where it lives.
- Tell learners explicitly: "This is where exam questions point when they ask how an admin discovers and manages AI activity."

> **Pacing note:** DSPM is the most likely place to lose time. If the portal is slow, talk through the feature while it loads. Do not skip it. It is a uniquely AB-900 topic.

**Demo 2D: SharePoint data access governance -- oversharing reports (6 min)**

- Portal: `admin.microsoft.com/sharepoint` (SharePoint admin center)
- Navigate: expand **Reports** in the left pane, then select **Data access governance**
- The landing page splits into two groups. **Snapshot reports:** Site permissions across your organization (marked Recommended), Sensitivity label applied to files, and the Site permissions for users report. **Activity reports:** Sharing links, and Shared with 'Everyone except external users'. Activity reports cover the last 28 days.
- Show the **Shared with 'Everyone except external users'** report. This is exactly the oversharing pattern that creates Copilot exposure.
- Show the **Site access review** remediation, where the admin delegates permission review to site owners
- Cover the two SharePoint Advanced Management controls the exam names:
  - **Restricted access control (RAC)** limits who can open a site to members of specified groups, up to 10 groups per site. A user needs BOTH the site permission and the group membership. RAC is honored in org-wide search and Copilot.
  - **Restricted content discovery (RCD)** keeps a site's content out of org-wide search and Copilot **without changing permissions**. Users who already have access can still open the content directly.
  - One-line distinction: **RAC is enforcement, RCD is concealment.**
- **Retirement callout:** Restricted SharePoint Search blocks new enablement starting **July 31, 2026**, three days after this session. Microsoft directs customers to RCD. Do **NOT** teach RSS as a current recommendation.

> **Pacing note:** The oversharing demo is high-value for exam preparation. Do not cut it. If pressed for time, cut Demo 2A or 2B to one minute each instead.

---

### Learner Activity

**Activity 2: Oversharing risk identification (4 min)**

Present a scenario verbally or in chat:

> "Contoso has 500 SharePoint sites. Site permissions were never audited. All licensed users have Copilot. An employee uses Copilot to research the company's upcoming acquisition. Copilot returns a summary that includes the deal terms from a SharePoint document labeled 'Confidential - Legal.' The employee was not supposed to have access to this document."

Ask learners in chat: "What is the root cause? What tool would you use to find which other sites have this exposure? What is the fastest short-term mitigation while you fix permissions properly?"

Expected answers: the root cause is oversharing and unmanaged permissions; the discovery tool is the SharePoint admin center data access governance reports, specifically the site permissions snapshot report and the 'Everyone except external users' activity report; the short-term mitigation is **restricted content discovery (RCD)** to keep the content out of Copilot, or **restricted access control (RAC)** if the site should be locked down outright.

> **Instructor note:** if a learner answers "Restricted SharePoint Search," accept it as the historically correct answer and immediately correct it forward. RSS blocks new enablement on July 31, 2026, and Microsoft now directs customers to RCD.

---

### Exam Connection -- Segment 2

Domain 2 objectives covered in this segment:

- Microsoft Purview capabilities: Information Protection, Data Loss Prevention, Insider Risk Management, Communication Compliance, DSPM for AI, and Data Lifecycle Management
- Sensitivity label use cases, data classification, and retention
- Copilot data access: how Copilot accesses data, how Microsoft Graph influences responses, how Copilot uses permissions and controls in Microsoft 365, Purview, and Defender, and responsible AI principles
- Risk identification: Compliance Manager, **Data Explorer**, Insider Risk Management, DLP alerts, Communication Compliance policy violations, **activity explorer**, DSPM for AI, and **Content search in Microsoft Purview eDiscovery**
- SharePoint oversharing: oversharing troubleshooting tools, data access governance reports, and SharePoint Advanced Management including **restricted access control**

> **Exam flag for learners:** the objective names **Microsoft Purview Data Explorer**, not Content explorer. Data explorer sits under Information Protection > Explorers. The older tool is now labeled **Content Explorer (classic)** under Data Lifecycle Management > Explorers. If a question asks how to identify sensitive information, Data explorer is the current answer.

> **Exam flag for learners:** **Content search is a capability inside Microsoft Purview eDiscovery**, not a standalone solution. Classic Content Search retired August 31, 2025. Every content search now lives in a single system-generated eDiscovery case named "Content search."

> **Exam flag for learners:** know the **restricted access control** versus **restricted content discovery** distinction cold. RAC controls who can access the site at all, even for someone holding a previously shared link. RCD controls whether content appears in org-wide search and Copilot, and it does not touch permissions.

---

### If Running Long -- Segment 2 Cuts

Cut in this order:

1. Shorten Insider Risk Management and Communication Compliance to 1 minute each and just name them plus their exam purpose (low exam depth required)
2. Cut Demo 2A (sensitivity labels) to a screenshot walkthrough and describe instead of navigating live (minimal exam impact)
3. Do not cut: the DSPM demo, the data access governance demo, or the Microsoft Graph and oversharing lecture. All three are high-probability exam topics specific to AB-900.

---

## Segment 3: Copilot Features and Administration

**Duration:** 50 minutes
**Exam Domain:** Domain 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)

### Learning Objectives

By the end of this segment, you will be able to:

- Distinguish between the Microsoft 365 Copilot monthly license model and pay-as-you-go billing, including SharePoint
- Configure Copilot settings from the Microsoft 365 admin center and manage feature enablement
- Monitor Copilot adoption and usage using the admin center reports and the Copilot Dashboard in Viva Insights
- Describe the Researcher and Analyst use cases and the administrative controls around them

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00-0:04 | Segment intro -- frame Domain 3 and licensing complexity | 4 min |
| 0:04-0:18 | Lecture: Copilot licensing -- monthly license versus pay-as-you-go, including SharePoint | 14 min |
| 0:18-0:28 | Demo: License assignment in admin center + billing policy | 10 min |
| 0:28-0:36 | Lecture + Demo: Copilot settings and feature management in admin center | 8 min |
| 0:36-0:43 | Lecture + Demo: Researcher and Analyst | 7 min |
| 0:43-0:48 | Demo: Copilot Dashboard in Viva Insights | 5 min |
| 0:48-0:50 | Exam connection recap + Q&A triage | 2 min |

---

### Lecture Topics

**Copilot Licensing -- Monthly License versus Pay-As-You-Go, Including SharePoint (14 min)**

This is a complex licensing area that the exam tests directly. Be deliberate here. The July 22, 2026 objective wording is "Compare Copilot monthly license model to pay-as-you-go, including SharePoint," so SharePoint pay-as-you-go gets explicit airtime, not a footnote.

- **Base license prerequisite:** Microsoft 365 Copilot is an add-on, not a standalone product. Eligible base plans include Microsoft 365 E7, E5, E3, F1, F3, Business Basic, Business Standard, Business Premium, Microsoft 365 Apps, and the Office 365 E5, E3, E1, and F3 plans.

- **Monthly license model (per user per month):**
  - Fixed cost assigned to named users
  - **Microsoft 365 Copilot** is $30.00 per user per month (annual billing)
  - **Microsoft 365 Copilot Business** is the SMB SKU at $21.00 list, currently $18 under a 15 percent promotion extended through December 31, 2026, with a **300-seat maximum**, available as an annual commitment with either annual or monthly billing (there is no month-to-month purchasing agreement). Microsoft states it delivers the same capabilities as the enterprise offering; the difference is price point and eligibility.
  - **Microsoft 365 E7** includes Microsoft 365 Copilot in the base SKU. E7 went generally available May 1, 2026 and equals E5 plus Microsoft 365 Copilot plus Microsoft Entra Suite plus Agent 365.
  - **Microsoft 365 Copilot Chat** is the free tier, included at no additional cost with an eligible Microsoft 365 subscription. Web-based chat is included; **work-based chat requires a Microsoft 365 Copilot license**.
  - **Correct the old 300-seat myth out loud.** There is no seat minimum for Microsoft 365 Copilot. Microsoft removed that requirement in January 2024. The only surviving 300 is a **maximum** on Copilot Business and the Business-with-Copilot SKUs.

- **Pay-as-you-go (metered consumption):**
  - Billed through an Azure subscription
  - The unit of consumption is the **Copilot Credit** at **$0.01 per credit**. This replaced per-message language for Copilot Chat and SharePoint agents.
  - Published rates: classic answer 1 credit, generative answer 2, agent action 5, tenant graph grounding 10, agent flow actions 13 per 100 actions
  - **Licensed Microsoft 365 Copilot users incur no charge** for these in employee-facing scenarios, subject to fair usage. Pay-as-you-go credits are consumed by **unlicensed** users.
  - Three services are available for Copilot pay-as-you-go: **Microsoft 365 Copilot Chat**, **SharePoint agents**, and the **Microsoft Copilot Retrieval API** (preview)
  - Billing policy is configured at **admin.microsoft.com > Copilot > Billing & usage** with a **Billing policies** tab and a **Pay-as-you-go services** tab. This is a testable admin task.
  - Prepaid **capacity packs** cost **$200.00 per pack per month for 25,000 Copilot Credits**, replenish at the start of each monthly billing period, and are consumed before pay-as-you-go billing applies
  - A newer construct exists: **Copilot credit policies** connect prepaid pack credits to a set of users with no Azure subscription required, up to 10 per tenant. They are currently available for Microsoft 365 Copilot Chat only; SharePoint agents still use pay-as-you-go billing.
  - Up to **50** pay-as-you-go billing policies per tenant
  - **Doc conflict to handle gracefully on camera:** the Azure meter is still named **Copilot Studio**, and the Microsoft 365 Copilot pay-as-you-go Meters page still reads "$0.01 per message." The dollar figure matches; the unit noun is what changed. Say the unit is the Copilot Credit, and note that both vocabularies appear in current Microsoft documentation.

- **SharePoint agents -- licensing specifics:**
  - SharePoint agent usage is billed **only when a user WITHOUT a Microsoft 365 Copilot license** uses the agent. Licensed users are covered at no extra cost.
  - Because SharePoint agents are always grounded in the tenant graph, each interaction costs **12 credits**: 10 for tenant graph grounding plus 2 for the generative answer. That is $0.12 per complex prompt, not a penny.
  - Setup requires SharePoint administrator plus Owner or Contributor on the Azure subscription and resource group. The policy is created under Copilot > Billing & usage, then connected on the **Pay-as-you-go services** tab by selecting **SharePoint agents**.
  - Up to **10** SharePoint agent billing policies, each assigned one security group. Only users in the assigned group have access to SharePoint agents.
  - **Migration trap:** policies previously configured under Microsoft 365 admin center > **Org settings > Pay-as-you-go services** must be disconnected there (select SharePoint agents, then **Disconnect previous billing**) before a new Copilot-node policy can be linked.
  - Know the distinction: a SharePoint agent is a declarative agent created and stored in SharePoint as a **.agent** file, and the file permissions determine who can access or edit it.

- **Activation delay:** after assigning a Copilot license, users might wait up to 24 hours for Copilot to appear in some apps, and might need to restart or refresh the app. This shows up in troubleshooting scenario questions.

- **Budget trap worth calling out:** setting a budget on a pay-as-you-go billing policy triggers **email notifications only**. Microsoft states the system does not enforce the budget and usage continues uninterrupted past it. The default alert threshold is 100 percent, and alerts can take up to 24 hours.

**Researcher and Analyst (7 min)**

- Researcher and Analyst are built-in experiences in Microsoft 365 Copilot. They are not custom agents and they are not deployed from Copilot Studio.
- Both reached general availability on June 2, 2025 and require a **Microsoft 365 Copilot license**. There is no separate add-on for either. They are preinstalled and pre-pinned for licensed users, and end users cannot unpin Researcher.
- **Researcher:** performs deep multi-step research combining Microsoft Graph work data, Copilot connectors, and the Bing index for web data. Usage limit is a maximum of **25 queries per user per month**.
- **Analyst:** performs advanced data analysis using chain-of-thought reasoning, and Microsoft notes it is better suited than Researcher for Microsoft Excel tasks.
- **Say this precisely, because the mechanism matters:** Microsoft's current wording is that Researcher and Analyst "are part of the core Copilot chat experience and will not fall under any agent-related settings." They stay available in Microsoft 365 Copilot Chat under **Tools** even when agents are disabled for some or all users in the admin center.
- **To disable them,** the admin uses the **Block** action on the individual agent in the Microsoft 365 admin center at Agents > All agents > select the agent > Block. The **Edit users** panel is disabled for Researcher and Analyst, so granular assignment to specific users or groups is not possible. Blocking is tenant-wide.
- Researcher adheres to the tenant-level **Allow web search in Copilot** policy. If web search is off at the tenant level, Researcher uses no web data. There is no per-site allowlist for standard Researcher.
- **Researcher with Computer Use** is a separately governed extension that reaches interactive web content through a Windows 365-backed virtual computer. Admins configure it on a dedicated **Computer use** tab in the agent details pane, with three policies: who can perform actions on behalf of users, whether Researcher can access work data, and which websites are allowed.
- **Monitoring trap:** Microsoft states there is no existing reporting tool for the **content** of Researcher sessions. Admins see usage metrics, not conversation content, unless a user explicitly submits feedback including session data.
- Exam angle: expect questions on Researcher use cases versus Analyst use cases, and on whether admins can control access to them

---

### Demo Moments

**Demo 3A: License assignment and billing policy (10 min)**

- Portal: `admin.microsoft.com` > Billing > Licenses
- Show the Microsoft 365 Copilot license entry, then click through to see assigned users
- Show Users > Active users > select user > Licenses and apps, and assign or unassign the Copilot license
- Navigate to **Copilot > Billing & usage**, then the **Billing policies** tab
- Show where pay-as-you-go billing is configured: the Azure subscription, the resource group, and the optional budget
- Show the **Pay-as-you-go services** tab and the three services listed there: Microsoft 365 Copilot Chat, SharePoint agents, and the Microsoft Copilot Retrieval API (preview)
- Narrate: "This billing policy is configured in the Copilot node of the Microsoft 365 admin center, not in the Azure portal and not under Billing. If the exam asks where this lives, the answer is Copilot > Billing & usage. The Billing node handles Microsoft 365 Backup, SharePoint storage, and High Volume Email, and for Copilot it only gives you a link back here."
- Add the budget caveat out loud: "That budget field sends email notifications. It does not stop spending. Microsoft says the system does not enforce it and usage continues past it, and alerts can take a full day to arrive."

**Demo 3B: Copilot settings in admin center (4 min)**

- Portal: `admin.microsoft.com` > **Copilot** > **Settings**
- Show the four tabs: **User access**, **Data access**, **Copilot actions**, and **Other settings**
- On **Data access**, show the **Agents** scenario, which configures who can access agents and which types they can install, along with the **Manage all agents** link that jumps to Agents > All agents
- Also on **Data access**, show **AI providers for other large language models**, which controls whether users can use models such as Anthropic's Claude inside Microsoft products
- **Correct a common misconception here:** the **web search** control is **NOT** configured in the Microsoft 365 admin center. The Copilot Settings page links out to the Microsoft 365 Apps admin center, where the **Allow web search in Copilot** policy is created in the Cloud Policy service for Microsoft 365. Say this plainly, because older course decks show it as an in-admin-center toggle.
- Note the three web search policy options: enabled in both Microsoft 365 Copilot and Copilot Chat; disabled in both; or disabled in Copilot Work mode while enabled in Web mode and Copilot Chat. That third option also disables web search in Researcher and Analyst.

> **Tenant variance note:** the admin center only shows the services licensed in the tenant, and Microsoft notes this page changes frequently. Narrate what you are clicking and say out loud that the learner's tenant may list different scenarios.

**Demo 3C: Researcher and Analyst in Copilot (3 min)**

- If available in the demo tenant, open Microsoft 365 Copilot at microsoft365.com or in Teams
- Show the **Tools** menu in Microsoft 365 Copilot Chat, where Researcher and Analyst appear. Say "Tools," not "Agents pane," because being a Tool is exactly why they survive the agent on/off setting.
- If they are not available in the demo tenant, go to admin.microsoft.com > **Agents** > **All agents**, select Researcher, and show the agent details pane
- Show that the **Edit users** panel is disabled for Researcher, and that **Block** is the disable mechanism
- If the tenant surfaces it, show the **Computer use** tab on the Researcher details pane with its three policies
- Tell learners: "Microsoft's exact wording is that Researcher and Analyst are part of the core Copilot chat experience and will not fall under any agent-related settings. Turn agents off tenant-wide and these two keep working. If you want them gone, you block the individual agent, and that block is tenant-wide because you cannot scope it to users."

**Demo 3D: Copilot Dashboard in Viva Insights (5 min)**

- Access path: open the **Viva Insights** app in Microsoft Teams or the Viva Insights web app, then select **Copilot Dashboard**. An AI Administrator enables the dashboard and delegates access from the Microsoft 365 admin center first.
- Show the four metric categories: **Readiness**, **Adoption**, **Impact**, **Sentiment**
- Readiness: license assignment status and eligible users
- Adoption: active users by app with trend lines
- Impact: the Copilot assisted hours metric, and why it matters for business justification conversations
- Sentiment: optional survey data, populated through Viva Pulse if configured
- Contrast it with the admin center: **admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot > Copilot** gives you the Readiness tab and the Usage tab, and the **Credits** report shows Copilot Credit consumption. The Copilot Dashboard in Viva Insights is the deeper adoption and impact view.
- Name the umbrella term: **Copilot Analytics** covers the admin center readiness and adoption report, the Copilot Dashboard, the Agent Dashboard, the Consumption Dashboard, ready-to-use reports, and advanced reporting through Power BI.
- Tell learners: "When an exam question asks how an admin monitors Copilot usage and adoption, the answer is the Copilot usage report in the admin center or the Copilot Dashboard in Viva Insights. It is explicitly **NOT** the Purview audit log. Microsoft warns in writing that audit data is not intended for usage reporting."

> **Pacing note:** The licensing lecture at 14 minutes is the longest single block in the session. Exam weight justifies it, but watch the clock. If you pass 0:22, compress Demo 3A to 7 minutes.

---

### Learner Activity

**Activity 3: Licensing decision scenario (integrated into lecture)**

During the licensing lecture (around the 10-minute mark), pause and ask in chat:

> "Contoso wants 50 specific power users to have full Copilot in Word, Excel, and Teams. They also want a broader group of unlicensed employees to be able to use a SharePoint agent on the HR policy site without buying everyone a Copilot license. Which model fits each group, and what does the second one actually cost per prompt?"

Expected answer: the 50 power users get the Microsoft 365 Copilot monthly license as named users. The unlicensed employees are covered by a **pay-as-you-go billing policy** connected to **SharePoint agents** under Copilot > Billing & usage. Each SharePoint agent interaction costs **12 Copilot Credits** (10 for tenant graph grounding plus 2 for the generative answer), so **$0.12** per complex prompt at $0.01 per credit.

Follow-up worth asking if time allows: "If Contoso is a 200-person company on Business Premium, is there a cheaper license option than the $30 SKU?" Answer: yes, **Microsoft 365 Copilot Business**, currently $18 per user per month under the promotion running through December 2026, capped at 300 seats.

This doubles as exam preparation for licensing scenario questions.

---

### Exam Connection -- Segment 3

Domain 3 objectives covered in this segment:

- Compare the built-in capabilities of Copilot and agents
- Compare the Copilot monthly license model to pay-as-you-go, **including SharePoint**
- Identify which Copilot features can be enabled or disabled
- Identify use cases for **Researcher** and use cases for **Analyst**
- Assign Copilot licenses
- Monitor and manage Copilot pay-as-you-go billing policies
- Monitor Copilot usage and adoption, including Copilot Analytics and the Microsoft 365 admin center
- Manage prompts, including saving, sharing, scheduling, and deleting

> **Exam flag for learners:** the consumption unit is the **Copilot Credit** at $0.01 per credit. If you see "per message" in older material or on the Microsoft 365 Copilot pay-as-you-go Meters page, understand that the dollar figure is right and the unit noun is stale. Do not assume one message equals one credit. Consumption runs from 1 credit for a classic answer up to 100 for premium generative AI tools.

> **Exam flag for learners:** the pay-as-you-go budget sends notifications. It does **NOT** stop spending. Microsoft states plainly that the system does not enforce the budget and usage continues after it is exceeded.

> **Exam flag for learners:** Researcher and Analyst require a Microsoft 365 Copilot license, and they are **NOT** governed by agent settings. Blocking the individual agent is the only way to turn them off, and that block is tenant-wide because the Edit users panel is disabled for them.

---

### If Running Long -- Segment 3 Cuts

Cut in this order:

1. Compress the capacity pack and credit policy detail to 2 minutes and just state that prepaid packs are $200 per pack per month for 25,000 credits and are consumed before pay-as-you-go applies (minor exam impact)
2. Skip Demo 3C in the end-user interface and show only the admin control for Researcher (low demo impact; the exam tests the governance concept, not the chat interface)
3. Do not cut: the monthly license versus pay-as-you-go lecture, the billing policy demo, or the usage monitoring demo. All three are directly tested.

---

## Segment 4: Agent Administration and Exam Success

**Duration:** 50 minutes (includes 10-minute wrap-up)
**Exam Domain:** Domain 3 continued -- Perform basic administrative tasks for Copilot and agents (25-30%) + exam preparation

### Learning Objectives

By the end of this segment, you will be able to:

- Explain the agent lifecycle from creation through the approval workflow in the Microsoft 365 admin center and the governance controls in the Power Platform admin center
- Identify the governance controls available to admins for managing agents across the tenant
- Distinguish between declarative agents, custom engine agents, SharePoint agents, and the built-in Researcher and Analyst experiences
- Apply a structured exam strategy to AB-900 question scenarios

---

### Timing Breakdown

| Clock | Block | Duration |
|-------|-------|----------|
| 0:00-0:04 | Segment intro -- frame the agent governance landscape | 4 min |
| 0:04-0:14 | Lecture: Agent types, creation fundamentals, and creation surfaces | 10 min |
| 0:14-0:26 | Lecture + Demo: Agent approval workflow -- Microsoft 365 admin center + Power Platform admin center | 12 min |
| 0:26-0:34 | Demo: Build an agent and connect it to the approval queue (walkthrough) | 8 min |
| 0:34-0:40 | Learner activity: Agent governance scenario | 6 min |
| 0:40-0:50 | Wrap-up: Exam strategy, domain review, resources, next steps | 10 min |

---

### Lecture Topics

**Agent Types, Creation Fundamentals, and Creation Surfaces (10 min)**

- Start with Microsoft's canonical two-way split, because learners will conflate everything else with it:
  - **Declarative agents:** hosted in Microsoft 365, use Copilot's AI infrastructure, model, and orchestrator. Designed for individual use. They do **NOT** support proactive interactions; they rely on user-initiated ones. They run in Microsoft 365 Copilot and in apps such as Teams, Word, Excel, and Outlook.
  - **Custom engine agents:** fully customizable including the choice of AI models and orchestration. They support both individual use and group collaboration, and they **DO** support proactive interactions. They require hosting outside Microsoft 365, and the builder must supply their own compliance, Responsible AI practices, and security measures. They do not automatically inherit Microsoft 365 compliance the way declarative agents do.
- Then place the familiar names inside that split:
  - **Agent Builder in Microsoft 365 Copilot** is the low-code, in-Copilot authoring surface, reached with **New agent** in the Microsoft 365 Copilot app. This is the current product name. "Copilot Studio lite" survives only in Microsoft Learn URL slugs.
  - **SharePoint agents:** declarative agents created in SharePoint, stored as **.agent** files, and grounded in SharePoint content. File permissions determine who can access or edit them.
  - **Copilot Studio agents:** built by makers on the low-code platform, and managed with finer-grained controls in the Power Platform admin center.
  - **Researcher and Analyst:** core Copilot chat experiences covered in Segment 3. Not built in Copilot Studio, not deployed by admins, and not governed by agent settings.
- Four creator personas Microsoft documents: **Users** create declarative agents in Agent Builder or SharePoint, **Makers** use Copilot Studio, **Developers** use the **Microsoft 365 Agents SDK** or the **Microsoft 365 Agents Toolkit** (formerly Teams Toolkit), and both makers and developers can add actions, connectors, and advanced logic
- Agent Builder creation limits the exam can reasonably test: up to **20 knowledge sources** total, **4 public website URLs**, **100 SharePoint files, folders, or sites**, **1 SharePoint list**, **50 OneDrive files**, **5 Teams chat URLs**, and **20 embedded uploaded files**. Description is capped at 1,000 characters and Instructions at 8,000.
- **Reversal to state plainly:** in Agent Builder, **code interpreter and image generator are both ENABLED by default**. The UI labels are "Create documents, charts, and code" and "Create images" under Capabilities on the Configure tab. Earlier course material said both were off by default. That is no longer accurate.
- **Do NOT assert a starter prompt maximum.** Microsoft documents no minimum and publishes no ceiling.
- The **"Only use specified sources"** toggle **prioritizes** the designated knowledge sources. Microsoft states explicitly that Agent Builder cannot fully block general model knowledge; use Copilot Studio for stricter control.
- SharePoint agents cap knowledge at **20 source items** in any combination of sites, libraries, folders, and files. That number is distinct from Agent Builder's 100-SharePoint-file limit.
- Governance trap: **Information Barriers are NOT supported on embedded files** in Agent Builder. Any user who can access the agent sees responses grounded in that content.
- Distribution: the user-facing storefront is the **Agent Store** in the Microsoft 365 Copilot app. Admin-approved agents built in the tenant appear under **Built by your org**.

**Agent Approval Workflow -- Microsoft 365 Admin Center + Power Platform Admin Center (12 min)**

This is one of the most operationally specific topics on the exam. Walk it methodically.

- **The publishing pipeline:**
  1. A maker or developer creates the agent in Copilot Studio, Agent Builder, or SharePoint
  2. The agent is submitted for publication to the organization
  3. The submission creates a pending request in the Microsoft 365 admin center at **`admin.microsoft.com` > Agents > All agents > Requests**
  4. An **AI Administrator** or **Global Administrator** reviews and either publishes or rejects

- **Microsoft 365 admin center role:**
  - The authoritative path is **`admin.microsoft.com` > Agents > All agents > Requests**. **Agents** is now a top-level node in the left navigation, not nested under Copilot. The old "Requested agents tab" label is deprecated; the tab is named **Requests**.
  - Three request states appear under Requests: **Pending review**, **Pending update**, and **Pending activate**. A fourth state, **Allow user to install**, appears when a user requests a blocked Microsoft-built agent; the admin selects **Unblock agent** first, then Approve.
  - Primary actions: **Publish to store** and **Reject submission**. For a Pending update, the button reads **Update in store**, and users keep the previous version until the admin approves.
  - The Requests list filters by **State** and by **Channel** (Microsoft Teams, Copilot, Office, Outlook, Word, Excel, PowerPoint)
  - The **Agents** workload has four sub-pages: **Overview** (dashboard with hero metrics and governance action cards), **All agents** (containing the **Registry** and **Requests** tabs), **Tools** (MCP server registration and approval), and **Settings**
  - **Agents > Settings** contains five configuration areas: **Agent management rules**, **Allowed agent types**, **Security templates**, **Sharing**, and **User access**
  - A narrower alternate path still exists at **Copilot > Settings > Data access > Agents**, with a **Manage all agents** link that jumps to Agents > All agents
  - Only **AI Administrator** and **Global Administrator** can take governance actions such as approving requests or assigning ownership. Global Reader, AI Reader, Security Administrator, Security Reader, and Reports Reader can view but cannot act.

- **Teams admin center role:**
  - Navigate: `admin.teams.microsoft.com` > **Teams apps** > **Manage apps**
  - Agents distributed as Teams apps appear here, and admins allow or block them and control who can use them
  - **Naming has moved on:** many tenants are migrated to **app centric management**, which replaces app permission policies and lets you scope an app or agent to users and groups on a per-app basis from the app's **Users and groups** tab. If the permission policies page still shows policies in your tenant, that tenant has not migrated yet. Check before demoing.
  - **Unified agent and app management** now synchronizes org-wide settings, agent status, and availability between the Teams admin center and the Microsoft 365 admin center automatically in both directions for migrated tenants
  - Availability changes take up to 24 hours to take effect, and in rare cases up to six days

- **Power Platform admin center role:**
  - Navigate: `admin.powerplatform.microsoft.com`. Every Copilot Studio agent is built inside an **environment**, which is a container with its own data store, security model, and data policies.
  - **Policies > Data policies** classify connectors as **Business**, **Non-business**, or **Blocked**. Connectors in different groups cannot share data, and a Blocked connector cannot be used at all.
  - Copilot Studio supports data policy enforcement in real time, so makers and users see error messages on a violation
  - Controls that exist **only** in the Power Platform admin center: data policies that block publishing through specific channels, Editor and Viewer sharing roles, and block-or-limit-sharing rules at the managed environment or environment group level
  - **Power Platform inventory** gives tenant admins a unified view of all agents, apps, and flows, including agents created in Copilot Studio **and** agents created in Agent Builder
  - The division of labor: the Microsoft 365 admin center controls approval, deployment, and the registry. The Power Platform admin center controls environment governance and what an agent is allowed to connect to.

- **Approval workflow scenario (exam-style):**
  - A maker in the HR department builds a Copilot Studio agent and publishes it to the Microsoft Teams and Microsoft 365 Copilot channel
  - The submission appears under Agents > All agents > **Requests** with the state **Pending review**
  - The admin reviews capabilities, data sources, security and permissions, and custom actions
  - The admin selects **Publish to store**, chooses which users or groups can install it, optionally chooses who gets it preinstalled, picks a policy template, reviews permissions and grants admin consent if appropriate, and publishes
  - Alternatively, the admin blocks a connector the agent depends on through a Power Platform data policy, which stops the agent from functioning even though it was approved

---

### Demo Moments

**Demo 4A: Agent approval in the Microsoft 365 admin center (6 min)**

- Portal: `admin.microsoft.com` > **Agents** > **All agents** > **Requests**
- Show the **Registry** tab first for context: the three tenant-wide tiles are Total agents, Agents without owners, and Unmanaged agents
- Switch to the **Requests** tab. Name the three states out loud: Pending review, Pending update, Pending activate.
- If a pending request exists, open it and walk the review: capabilities, data sources, security and permissions, and custom actions
- Show the **Publish to store** action and the **Reject submission** action from the ellipsis
- Show **Agents > Settings** and name the five areas: Agent management rules, Allowed agent types, Security templates, Sharing, and User access
- Tell learners: "This is where the AB-900 exam expects you when it asks how an admin approves an agent for the organization. **Agents** is a top-level node now. It is not under Copilot, and the tab is called **Requests**, not Requested agents. If you studied from material that says otherwise, update that page in your notes."
- Add the role fact: "Only AI Administrator or Global Administrator can approve. Global Reader can look at every bit of this and cannot click a single approve button."

**Demo 4B: Teams admin center -- app and agent governance (3 min)**

- Portal: `admin.teams.microsoft.com` > **Teams apps** > **Manage apps**
- <!-- VERIFY: check before the session whether this tenant is migrated to app centric management. If the Permission policies page still lists policies, the tenant is on the older model and the demo narration should match what is on screen. -->
- Show the app list with its Status and availability columns, and use the search box to filter for an agent
- Open an app's details and show the **Users and groups** tab, where availability is scoped to specific users or groups
- Tell learners: "Agents distributed as Teams apps run through this same governance model. Microsoft has been consolidating this: app centric management replaced app permission policies for migrated tenants, and unified agent and app management now syncs settings between this admin center and the Microsoft 365 admin center in both directions. Expect either interface in the wild."
- Note the latency: availability changes take up to 24 hours to reach clients, and in rare cases up to six days

**Demo 4C: Power Platform admin center -- environment and data policy controls (3 min)**

- Portal: `admin.powerplatform.microsoft.com`
- Navigate to **Environments** and show the list. Emphasize that every Copilot Studio agent is built inside an environment.
- Navigate to **Policies** > **Data policies** and open a policy. Show the connector classification: **Business**, **Non-business**, **Blocked**.
- Note the default: when a policy is created, all connectors start in **Non-business**, and Microsoft recommends leaving Non-business as the default group for new connectors
- Note the limit: some connectors cannot be blocked at all, including core Microsoft 365 and Power Platform connectors such as Dataverse and Approvals
- Mention **Power Platform inventory**, which gives tenant admins a unified view of all agents, apps, and flows, including agents created in Agent Builder
- Tell learners: "If an agent needs a connector that is classified as Blocked, the agent cannot invoke that action, even though it was approved in the Microsoft 365 admin center. Approving the agent controls who can use it. The data policy controls what it can reach. Two layers, independent, both have to line up."

**Demo 4D: Build an agent and close the loop to approval (8 min)**

Pick the surface that matches the tenant. Agent Builder is the safer live demo because it needs no separate Copilot Studio licensing.

**Option A -- Agent Builder in Microsoft 365 Copilot (preferred):**

- Open the Microsoft 365 Copilot app and select **New agent**
- Use the **Describe** tab to generate the agent from natural language, then switch to the **Configure** tab to show the fields directly
- Name it: `Contoso HR Policy Assistant`
- Instructions: describe the scope and the limits. Note the 8,000 character cap on Instructions and the 1,000 character cap on Description.
- Add a **SharePoint** knowledge source. Name the limits while you are there: 20 knowledge sources total, up to 100 SharePoint files, folders, or sites.
- Show the **Capabilities** section and point out that **Create documents, charts, and code** and **Create images** are both **on by default**. Say it plainly, because this reversed from the older guidance.
- Add one starter prompt, and note that Microsoft publishes no maximum
- Stop before publishing to the organization

**Option B -- Copilot Studio:**

- Portal: `copilotstudio.microsoft.com`
- From the **Home** page or the **Agents** page, describe the agent in natural language, or select **Create an agent** to start from scratch
- Configure instructions, add a SharePoint knowledge source, and add a starter prompt
- Show the **Channels** page and the **Teams and Microsoft 365 Copilot** channel, which is the channel that routes an agent to the organization
- Do **NOT** publish live. Stop at the channel configuration and narrate the handoff.

- Either way, deliver the closing line: "When a maker publishes to the Microsoft Teams and Microsoft 365 Copilot channel, that submission lands in the admin center under Agents > All agents > Requests as Pending review. The maker presses publish here; the admin sees a request there. That is the pipeline the exam tests."
- Tell learners: "The exam does not test deep Copilot Studio configuration. It tests whether you understand the creation-to-approval pipeline and which admin center owns which decision."

> **Pacing note:** Demo 4D is the highest-value moment in the session because it closes the loop from creation to approval. Reserve the full 8 minutes. If you are running long entering Segment 4, cut Demo 4B or 4C to 90 seconds each.

---

### Learner Activity

**Activity 4: Agent governance scenario (6 min)**

Present this scenario in chat:

> "Fabrikam's IT admin receives a complaint that an employee-built Copilot Studio agent is reaching customer data in a third-party CRM through a connector. The agent was approved by a junior admin three weeks ago. The admin needs to (1) immediately stop the agent from using the CRM connector, and (2) prevent future agents from using unapproved external connectors without a review."

Ask learners: "Which admin center handles step 1? Which handles step 2? What specific feature do you use for each?"

Expected answers:

- Step 1: Power Platform admin center. Add the CRM connector to the **Blocked** group in a data policy scoped to the environment. Copilot Studio enforces data policies in real time, so the maker and users see an error immediately.
- Step 2: Power Platform admin center. Set the default group for new connectors and keep third-party connectors out of the Business group, so a new connector cannot quietly ride along with sanctioned data.

Bonus question worth asking: "Which role can approve agent requests in the Microsoft 365 admin center, and which cannot?" Answer: **AI Administrator** and **Global Administrator** can approve. **Global Reader** and the other reader roles can view the registry and the request but cannot act.

Debrief the answers before moving to wrap-up.

---

### Exam Connection -- Segment 4

Domain 3 objectives covered in this segment:

- Identify use cases for custom agents
- Identify how to configure user access to agents
- Create an agent
- Understand the approval process for agents
- Monitor agents, including usage, operational insights, and agent lifecycle, using the Microsoft 365 admin center and the Power Platform admin center

> **Exam flag for learners:** the approval path is **admin.microsoft.com > Agents > All agents > Requests**. **Agents** is a top-level node in the left navigation. The tab is **Requests**, and the three states are Pending review, Pending update, and Pending activate. Any material that says "Copilot > Agents > Requested agents tab" is out of date.

> **Exam flag for learners:** the two admin centers that govern agents split the job cleanly. The **Microsoft 365 admin center** handles approval, deployment, the agent registry, and tenant agent settings. The **Power Platform admin center** handles environment governance and data policies that control which connectors an agent can reach. A blocked connector stops an agent action regardless of whether the agent itself was approved.

> **Exam flag for learners:** know the difference between **Block** and **Uninstall/Remove**. Block prevents any user in the tenant from accessing the agent **and** removes it from users who already installed it. Uninstall takes it out of inventory, but the agent can be reacquired from the store.

> **Exam flag for learners:** blocking scope varies by where the agent was built. Blocking an **Agent Builder or Copilot Studio** agent affects Microsoft 365 Copilot and other hosts such as Outlook and Teams. Blocking a **SharePoint or Foundry** agent affects Microsoft 365 Copilot Chat only.

---

### If Running Long -- Segment 4 Cuts

Cut in this order:

1. Compress Demo 4B (Teams admin center) to 90 seconds. Describe the concept and show one screen (minor exam impact).
2. Compress Demo 4C (Power Platform data policies) to 90 seconds and show only the connector classification screen (moderate impact, so still describe the concept verbally)
3. Do not cut: Demo 4A (agent approval queue), Demo 4D (agent creation walkthrough), or the wrap-up block. All three are critical to session completion.

---

## Wrap-Up Block (Final 10 minutes of Segment 4)

### Domain Coverage Recap (2 min)

Call out the three domains and their weights one more time:

| Domain | Weight | Key Focus Areas |
|--------|--------|----------------|
| Domain 1 | 30-35% | Microsoft Entra ID, PIM, Conditional Access, App registrations versus Enterprise apps, Identity Secure Score, license management, admin center navigation |
| Domain 2 | 35-40% | Sensitivity labels, DLP for Copilot, DSPM, Data explorer, Content search in eDiscovery, SharePoint oversharing, Microsoft Graph grounding |
| Domain 3 | 25-30% | Copilot licensing and pay-as-you-go, Copilot Credits, agent approval workflow, Copilot Analytics, Researcher and Analyst |

Tell learners: "Domain 2 is the largest. If you leave today and only have time to study one domain deeply, make it Domain 2, and within Domain 2 focus on DSPM and SharePoint oversharing remediation. Those are the topics most unique to this exam."

---

### Exam Strategy Tips (4 min)

**Question reading strategy:**

- Watch for "EXCEPT," "**NOT**," and "LEAST." These are negation questions, so you are hunting the odd one out.
- Watch for role qualifiers: "which admin role has the minimum required permissions to..." points you toward least privilege
- Watch for portal qualifiers: "in which admin center would you..." requires knowing the Microsoft 365 admin center versus Purview versus Entra versus Teams versus Power Platform

**Common exam traps for AB-900 specifically:**

1. Confusing **DSPM** (the Purview solution for AI risk) with **Data explorer** or **activity explorer**. They are different tools with different jobs.
2. Reaching for **Content explorer** when the July 22, 2026 objective wording says **Data Explorer**. Content Explorer is now labeled classic and sits in a different solution.
3. Confusing Microsoft 365 admin center agent approval with Power Platform admin center agent governance. Approval controls who can use an agent; data policies control what it can reach.
4. Answering "Global Administrator" when a more specific role is correct. For agent approval that is **AI Administrator**. For Copilot reports it is **AI Administrator**. For Purview it is often **Compliance Administrator**.
5. Treating Researcher and Analyst as custom-built agents. They are core Copilot chat experiences, not deployed through Copilot Studio, and not governed by agent settings.
6. Assuming a pay-as-you-go **budget** stops spending. It sends notifications only.
7. Saying "300-seat minimum" for Microsoft 365 Copilot. There is no minimum. The 300 is a **maximum** on the Copilot Business and Business-with-Copilot SKUs.
8. Reaching for **Restricted SharePoint Search** as the oversharing mitigation. Microsoft now directs customers to **restricted content discovery**, and RSS blocks new enablement starting July 31, 2026.
9. Mixing up **restricted access control** (who can open the site) with **restricted content discovery** (what shows up in search and Copilot). RAC is enforcement, RCD is concealment.

**Time management and logistics:**

- The exam is **45 minutes** of working time inside a **65-minute** seat time. Seat time covers instructions, the Candidate Agreement, the questions, and comments.
- Microsoft does **NOT** publish an AB-900-specific question count. The commonly quoted 40-60 range is Microsoft's generic statement about most certification exams, not an AB-900 number. Plan by the clock, not by a question count.
- Passing score is **700 or greater**, on a scale where 1000 is the maximum
- Do not spend more than 90 seconds on any single question. Mark it and come back.
- Use elimination aggressively. Wrong answers on a Fundamentals exam are often clearly wrong.
- **Access to Microsoft Learn during the exam is NOT available on AB-900.** That benefit applies to role-based exams only, not Fundamentals or MOS.
- Unscheduled breaks are allowed, but the clock keeps running and you cannot return to any question you already viewed
- You can retake after 24 hours if you do not pass. Wait times increase for later attempts.
- AB-900 is offered in **English only** as of July 22, 2026
- **AB-900 does NOT expire.** Fundamentals certifications do not require renewal. The study guide's boilerplate renewal language applies to associate, expert, and specialty certifications, and learners routinely misread it as applying here.

---

### Next Steps and Resources (4 min)

**Immediate actions:**

1. Try the exam sandbox at `aka.ms/examdemo`. It shows the real question types and the exam interface, though the secure browser is not enabled in the sandbox.
2. Take the free official **Practice Assessment** for AB-900 on Microsoft Learn. Microsoft notes the questions are not the same as exam questions and are not representative of exam length.
3. Read the official study guide at `learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900`. Check the **Skills measured as of July 22, 2026** heading and the change log before exam day.
4. Get hands on in a trial tenant. Navigating Purview and the Microsoft 365 admin center under time pressure is a real skill.

**High-priority study areas (time-boxed recommendations):**

| Topic | Recommended Study Time | Primary Resource |
|-------|----------------------|-----------------|
| DSPM and DSPM for AI | 1 hour | Microsoft Purview docs, plus the DSPM task-mapping article for old-to-new navigation |
| SharePoint oversharing: DAG reports, RAC, RCD | 1.5 hours | SharePoint Advanced Management docs plus hands-on |
| Copilot licensing and pay-as-you-go, including SharePoint | 1 hour | Copilot licensing guide in the repo plus the official licensing docs |
| PIM (Eligible versus Active, just-in-time) | 45 min | Microsoft Entra PIM documentation |
| Agent approval workflow and agent registry | 1 hour | Microsoft 365 admin center agent docs plus this session recording |
| Copilot Analytics and the Copilot Dashboard | 30 min | Copilot Analytics introduction plus the Copilot Dashboard docs |
| App registrations versus Enterprise applications | 30 min | Microsoft Entra identity platform docs |

**Repo resources:**

- All demo scripts, lab guides, and reference materials: `github.com/timothywarner-org/ab900`
- Practice questions: `shared-resources/references/AB-900-PRACTICE-QUESTIONS.md`
- Skills breakdown by domain: `shared-resources/references/AB-900-SKILLS-BREAKDOWN.md`
- Licensing guide: `segment-03-copilot-administration/resources/COPILOT-LICENSING-GUIDE.md`

---

## Global Pacing Notes

The following are time sinks observed in live delivery of Microsoft 365 admin sessions. Watch for all of them:

- **Admin center load times:** Portal pages, especially Purview and Power Platform, can take 10 to 20 seconds to render. Pre-navigate during the previous segment's activity block.
- **Tenant configuration variance:** Your demo tenant may not show the same navigation labels as learner tenants. Microsoft states directly that the Copilot settings page changes frequently and shows only the services licensed in that tenant. Narrate what you are clicking and acknowledge that labels vary.
- **The DSPM triple:** the Purview Solutions menu can show DSPM, Data Security Posture Management (classic), and DSPM for AI (classic) all at once. Decide before the session which one you are demoing and say the exam-aligned label out loud either way.
- **Q&A creep:** The chat will produce good questions during demos. Resist answering inline and defer to the 2-minute Q&A triage at the end of each segment. Exception: if a learner is confused about a concept needed for the current demo, answer it immediately and briefly.
- **Licensing debate:** Learners who work with Microsoft 365 licensing daily will push back or add nuance during the licensing lecture. Acknowledge, validate, and defer edge cases to the repo or to post-session: "The exam tests the conceptual model, not the edge cases in your specific agreement."
- **The per-message versus per-credit question:** someone will notice that a Microsoft Learn page still says "$0.01 per message" while another says "$0.01 per Copilot Credit." Have the answer ready: the unit is the Copilot Credit, the Azure meter is still named Copilot Studio, and both vocabularies currently appear in Microsoft documentation.
- **Copilot UI novelty:** Learners will want to explore Copilot features live. Keep demos tightly scoped to what is on the exam. Do not demo Copilot creative features, image generation, or consumer Copilot.

---

## Admin Center Quick Reference

| Task | Portal URL | Navigation Path |
|------|-----------|----------------|
| License assignment | admin.microsoft.com | Users > Active users > [user] > Licenses and apps |
| Copilot pay-as-you-go billing policy | admin.microsoft.com | **Copilot > Billing & usage > Billing policies** |
| Connect a service to pay-as-you-go | admin.microsoft.com | Copilot > Billing & usage > Pay-as-you-go services |
| Copilot tenant settings | admin.microsoft.com | Copilot > Settings (tabs: User access, Data access, Copilot actions, Other settings) |
| Copilot usage and readiness report | admin.microsoft.com | Reports > Usage > Microsoft 365 Copilot > Copilot |
| Copilot Credits report | admin.microsoft.com | Reports > Usage > Microsoft 365 Copilot > Credits |
| Agent approval queue | admin.microsoft.com | **Agents > All agents > Requests** |
| Agent registry | admin.microsoft.com | Agents > All agents > Registry |
| Agent tenant settings | admin.microsoft.com | Agents > Settings |
| MCP tool approval | admin.microsoft.com | Agents > Tools > Requests |
| Service health | admin.microsoft.com | Health > Service health |
| Sensitivity labels | purview.microsoft.com | **Solutions > Information Protection > Sensitivity labels** |
| DLP policies | purview.microsoft.com | Data Loss Prevention > Policies |
| DSPM (current unified) | purview.microsoft.com | **Solutions > DSPM** |
| DSPM for AI (classic, exam-aligned label) | purview.microsoft.com | Solutions > DSPM for AI (classic) |
| Data explorer (current) | purview.microsoft.com | **Solutions > Information Protection > Explorers > Data explorer** |
| Content Explorer (classic) | purview.microsoft.com | Solutions > Data Lifecycle Management > Explorers > Content explorer |
| Activity explorer | purview.microsoft.com | Within the relevant solution's Explorers area |
| Content search | purview.microsoft.com | **Solutions > eDiscovery > Content Search** |
| Audit log search | purview.microsoft.com or security.microsoft.com | Audit |
| SharePoint oversharing reports | admin.microsoft.com/sharepoint | **Reports > Data access governance** |
| Restricted access control (tenant) | admin.microsoft.com/sharepoint | Policies > Access control > Site-level access restriction |
| Restricted access control (per site) | admin.microsoft.com/sharepoint | Sites > Active sites > [site] > Settings > Restricted site access |
| Restricted content discovery | admin.microsoft.com/sharepoint | Sites > Active sites > [site] > Settings > Restrict content discovery |
| Exchange mailboxes and distribution groups | admin.exchange.microsoft.com | Recipients > Groups > Distribution list |
| Conditional Access | entra.microsoft.com | **Entra ID > Conditional Access** |
| Identity Secure Score | entra.microsoft.com | Entra ID > Identity Secure Score |
| Authentication methods policy | entra.microsoft.com | Entra ID > Authentication methods > Policies |
| PIM | entra.microsoft.com | **ID Governance > Privileged Identity Management** |
| App registrations / Enterprise applications | entra.microsoft.com | Entra ID > App registrations; Entra ID > Enterprise applications |
| Microsoft Defender portal | security.microsoft.com | Microsoft Defender XDR services |
| Teams app and agent governance | admin.teams.microsoft.com | Teams apps > Manage apps > [app] > Users and groups |
| Power Platform environments | admin.powerplatform.microsoft.com | Environments |
| Power Platform data policies | admin.powerplatform.microsoft.com | Policies > Data policies |
| Copilot Studio agent building | copilotstudio.microsoft.com | Home or Agents page > describe the agent, or Create an agent |
| Agent Builder | Microsoft 365 Copilot app | New agent |
| Copilot Dashboard | Viva Insights app (Teams or web) | Copilot Dashboard |

> **Portal note:** `admin.cloud.microsoft` now resolves to the same Microsoft 365 admin center app as `admin.microsoft.com`. Both are current. `compliance.microsoft.com` is retired; always use `purview.microsoft.com`.

---

*Document version: 2.0 -- July 2026 (aligned to the AB-900 skills measured as of July 22, 2026)*
*Maintained in: `/c/github/ab900/docs/session-agenda.md`*
