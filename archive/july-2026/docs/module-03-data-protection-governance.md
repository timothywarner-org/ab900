# Module 3: Protect and Govern Microsoft 365 Data

**Learning Path:** Explore Microsoft 365 Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/protect-govern-data-microsoft-365/
**AB-900 Domain:** 2 -- Understand data protection and governance tasks for Microsoft 365 and Copilot (35-40%)
**Verified:** 2026-07-26 (against the AB-900 skills measured as of July 22, 2026)

> **Objective mapping.** Domain 2 is the heaviest-weighted domain and is marked **No change** at the domain level in the July 22, 2026 change log. One subsection is marked **Minor**: "Identify and monitor oversharing in SharePoint in Microsoft 365". The wording change in that subsection is **restricted access control** (the objective no longer says "restricted site access"), which makes it high-probability exam material.

> **Two naming traps to hold in your head while reading this module.** (1) The objective says "Identify sensitive information by using Microsoft Purview **Data Explorer**" -- not Content explorer. Microsoft introduced a new **Data explorer** and renamed the old tool **Content Explorer (classic)**. (2) The objective says "Search for files and emails by using **Content search in Microsoft Purview eDiscovery**" -- Content search is a capability inside eDiscovery, not a standalone solution.

---

## Unit 1: Introduction to Microsoft Purview and Data Governance

### What is Microsoft Purview?
- A cloud-based data governance and compliance platform providing a centralized suite of tools across Microsoft 365 and hybrid environments
- Unifies previously fragmented Microsoft services into a single integrated portal
- Three primary feature categories: **Data Security**, **Data Governance**, and **Risk and Compliance**

### Key Purview Features

**Information Protection**
- Classify, label, and encrypt sensitive data across emails, documents, and collaboration platforms
- Sensitivity labels enforce encryption, restrict access, and apply visual markings
- Labels travel with the data

**Data Loss Prevention (DLP)**
- Prevents accidental or intentional sharing of sensitive information by scanning content for predefined patterns (credit card numbers, personal identifiers)
- Policies can block, notify users, or alert admins
- Highly customizable with policy tips to educate users

**Insider Risk Management**
- Monitors user activities for unusual or risky behavior using behavioral analytics
- Detects data leaks, policy violations
- Integrates with HR, Legal, and IT workflows

**Communication Compliance**
- Monitors emails, Teams messages, Viva Engage, and generative AI interactions for policy violations (harassment, insider trading, sensitive data leaks)
- Uses pattern-based detection and ML classifiers
- The solution name is **Communication Compliance**, singular. "Communications Compliance" is not the Microsoft name.

**Microsoft Purview Data Security Posture Management (DSPM) for AI**
- Visibility and control over sensitive data used by AI systems
- Discovers, classifies, secures data flows in AI workloads
- The AB-900 objective names it in full as **Microsoft Purview Data Security Posture Management (DSPM) for AI**, then abbreviates to **DSPM for AI** in the later bullet "Discover and manage AI activity by using DSPM for AI". Establish the full name on first use, then abbreviate.
- **There are now THREE DSPM entries in the Purview portal.** See the DSPM section in Unit 3 before you demo this.

**Data Lifecycle Management (DLM)**
- Automates retention, archiving, and deletion based on business, legal, or regulatory requirements through retention labels and policies

### Data Discovery and Classification
- Scans data sources: SharePoint, Exchange, Teams, etc.
- Classification methods: manually by user selection, automatically based on policy rules, trainable classifiers (AI trained on specific document types)

**Sensitive Information Types (SITs):**
- Large predefined library: credit card numbers, SSNs, passport numbers, Health Insurance Claim Numbers
- Recognized using regex patterns, checksums, keyword evidence, and confidence scoring

**Trainable Classifiers:**
- ML-based models trained with example documents
- Built-in classifiers: resumes, source code, healthcare templates
- Custom classifiers require at least 50 sample documents
- Can identify documents even without explicit keywords

**Exact Data Match (EDM):**
- Checks if data exactly matches entries in a secure uploaded list (not pattern-based)
- Much higher precision than regex -- eliminates false positives
- Workflow: define schema, create rule package, hash and upload source data, validate
- Can be managed through Microsoft Purview portal or PowerShell
- Integrates with DLP policies, auto-labeling, and eDiscovery

### Sensitivity Labels and Information Protection

**Label Components:**
- **Encryption settings** -- restricts who can open, edit, print, copy using Azure Rights Management
- **Content markings** -- headers, footers, watermarks (e.g., "CONFIDENTIAL -- INTERNAL USE ONLY")
- **Access restrictions and sharing controls** -- block external sharing, printing, copying
- **Label policies** -- control which labels are available to which users or groups, mandatory vs. optional labeling, justification required for downgrading a label

**Application Methods:** manual, automatic (content detection), recommended to users, or mandatory

### Data Lifecycle Management (DLM)
- Controls how long data is retained, stored, and when deleted or archived
- Supports GDPR "right to be forgotten" and reduces storage costs

**Retention Labels:**
- Define retention behavior: retain for fixed period, delete after X days, retain then delete
- Can be applied manually or automatically based on content type, keywords, SITs, or metadata
- Support auditing of when and how labels were applied or changed

**Retention Policies:**
- Broader than labels -- apply rules across locations and content types without individual labeling
- Location-based: select target services (SharePoint, Exchange, etc.)
- Useful for uniform rules, legacy or unlabeled content, and baseline data hygiene

**Auto-Apply Rules:**
- Automatically apply retention labels based on: keywords or phrases, SITs, trainable classifiers
- Removes reliance on users for consistent compliance

---

## Unit 2: Identify and Respond to Data Risks with Microsoft Purview

### Governance Risks in Microsoft 365 and Copilot
- Risks emerge when sensitive information is accessed, shared, or used against policy or regulations
- Purview analyzes signals across SharePoint, OneDrive, Teams, and Copilot
- Centralized dashboard for tracking behavior across AI integrations

**Risk Monitoring Tools:**
- Logs policy violations, suspicious behavior, unauthorized data access
- Failed policy-blocked uploads (e.g., to Dropbox or Google Drive) are logged; spikes indicate misbehavior or misconfiguration
- Behavioral analytics detect mass downloads from SharePoint or OneDrive, transfers to USB drives
- DLP policies can restrict Copilot from processing or displaying labeled documents; logs violations and can issue warnings or block actions entirely
- Monitors baseline user behavior; flags deviations (e.g., accessing dozens of confidential files in one day, nonworking hours, unfamiliar devices)

### Insider Risk Management
- Analyzes user activity against defined thresholds, HR signals, and behavioral baselines
- Combines machine learning, user activity data, and security signals
- Considers working hours, travel locations, role changes, HR context (resignation, performance concerns)

**Key Capabilities:**
- **Mass file download detection** -- define thresholds (e.g., 50+ "Confidential" files in 24 hours); logs file names, locations, user info; valuable during offboarding or role changes
- **Personal email sharing detection** -- flags when sensitive content sent to gmail.com, yahoo.com, etc.; can auto-notify user, block message, or escalate to compliance teams
- **Abnormal behavior detection** -- sign-ins at unusual hours, unfamiliar IP addresses; behavioral baselining establishes "normal" patterns; combined with HR data (approved travel, leave) for fewer false positives
- **Thresholds plus HR integrations** -- integrates resignation notices, role changes, disciplinary actions; combination of HR signals plus behavioral anomalies elevates risk scores

### Data Loss Prevention (DLP)
- Detects, blocks, or audits movement of sensitive data based on content inspection and contextual rules
- Applies to: copying to USB, emailing, uploading to cloud storage, interacting with Copilot
- Uses classification rules, sensitivity labels, pattern matching, built-in SITs, and custom regex or dictionaries
- Enforced in: Microsoft 365 apps, devices (via Defender for Endpoint), and session controls (Defender for Cloud Apps)

**DLP Tools:**
- **DLP policies** -- block uploads of "Confidential" docs to non-Microsoft cloud services; allow with business justification (logged for audit); just-in-time decision-making
- **Device-level enforcement** -- via Defender for Endpoint on Windows 10+, 11, or macOS; blocks or logs: copy to USB, print, clipboard paste into unmanaged apps; critical for hybrid and remote environments
- **Alert-triggered investigations** -- full details: who, when, where, what data, which rule; alerts appear in Purview portal; routable to Defender XDR, Sentinel, or other SIEM; can trigger automated workflows (Logic Apps, Power Automate) or manual handling

### Communication Compliance
- Monitors emails, Teams, Viva Engage, and Copilot chat prompts
- Detects harassment, abusive language, insider trading, data leaks
- Uses pattern-based detection (regex and keywords) and ML classifiers trained on real-world examples

**Key Features:**
- **Reviewer dashboard** -- analysts see sender, recipients, content snippets, policy matches; can dismiss, notify user, escalate to HR or legal, or tag for policy training
- **Industry-specific custom policies** -- FINRA (financial), HIPAA (healthcare); focus on material nonpublic information (MNPI), drug-related language, prohibited statements; configurable thresholds and confidence levels

### Activity Explorer
- Centralized investigation and visualization tool -- forensic timeline of user actions with sensitive data
- Shows activities related to sensitive data and labels: label downgrades, external sharing, DLP logs, auto-labeling, and Endpoint DLP
- Provides visibility even when activity does **NOT** trigger a policy violation
- Offers about **50 individual filters** plus predefined filter sets including "Endpoint DLP activities", "Sensitivity labels applied, changed, or removed", "Egress activities", "DLP policies that detected activities", "Network DLP activities", and "Protected Browser"
- Filter options are generated from the first **500 records**
- In the new unified DSPM, Activity explorer is reached at **DSPM > Discover > Activity explorer > AI activities tab**
- Filters: date, user, file name, sensitivity label, activity type, policy matches
- Timeline view: connects sequences of behavior (labeled, then downloaded, then emailed externally)
- Events include metadata: timestamps, user identity, device info, label history, risk scores

---

## Unit 3: Compliance, AI Data Discovery, and eDiscovery

### Compliance Manager
- Risk assessment and recommendations engine for GDPR, HIPAA, ISO 27001, etc.
- **Compliance Score** -- quantifies how well the organization meets regulatory requirements; strategic tool for prioritizing remediation

**Key Components:**
- **Assessments based on regulations** -- prebuilt assessments (e.g., GDPR includes data protection, breach notification, subject rights controls); flags gaps (e.g., audit logging not enabled)
- **Controls** -- Microsoft-managed controls (automatically monitored: encryption, service configs) vs. customer-managed controls (manual verification: staff training, data processing documentation); assignable to responsible parties with progress tracking and evidence upload
- **Improvement actions** -- specific steps to close gaps: enable auditing, assign sensitivity labels, update privacy notices; score increases as actions are completed

### Microsoft Purview Data Explorer (the exam's answer)

The July 22, 2026 objective says "Identify sensitive information by using Microsoft Purview **Data Explorer**". Microsoft introduced a new **Data explorer** and renamed the older tool **Content Explorer (classic)**. They live under different solutions.

| Tool | Path | Access roles |
|------|------|--------------|
| **Data explorer** (current answer) | purview.microsoft.com > Solutions > **Information Protection > Explorers > Data explorer** | **Data Explorer List viewer** (see item and location) and **Data Explorer Content viewer** (see item contents). These two role groups are **independent, not cumulative**. |
| **Content explorer (classic)** | purview.microsoft.com > Solutions > **Data Lifecycle Management > Explorers > Content explorer** | **Content Explorer List viewer** and **Content Explorer Content viewer** |

What Data Explorer does:
- Discovers where sensitive data resides across the organization
- Searches for SITs (credit card numbers, SSNs, health data) across SharePoint, Teams, OneDrive
- Filters: location, sensitivity label, content type
- Shows files, owners, and sharing status
- Essential before implementing new security policies

**Content explorer (classic) latency:** counts can take up to **7 days** to update, and **14 days** for files in SharePoint.

**Licensing:** data classification analytics (the Content and Activity Explorer interfaces) requires **E5/A5/G5**, but Content Explorer data **aggregation** continues for E3/A3/G3 tenants.

### Data Security Posture Management -- THREE entries in the portal

This is the largest drift between older course materials and the live portal. As of July 26, 2026 a learner opening **purview.microsoft.com > Solutions** sees **three** DSPM entries:

| Entry | What it is |
|-------|-----------|
| **DSPM** (no qualifier) | The **new unified** Data Security Posture Management. Reached general availability **May 2026**. Microsoft states most new features will be added to this version only. |
| **DSPM for AI (classic)** | The previous AI-focused experience. Still a current, accurate UI label. **This is the wording the AB-900 objective uses.** |
| **Data Security Posture Management (classic)** | The previous general data security posture experience. |

Microsoft Learn instructs administrators to sign in to the Microsoft Purview portal and go to **Solutions > DSPM**, and warns explicitly not to confuse it with the previous versions, which are now named **Data Security Posture Management (classic)** and **DSPM for AI (classic)**.

**How to teach this without getting it wrong on stage:** the exam objective still says **DSPM for AI**, so answer exam items with the classic label. In a live portal demo, show the new unified **DSPM** as the current front door and name the two classic entries so nobody is surprised.

<!-- VERIFY: Microsoft has published no retirement date for the DSPM for AI (classic) experience. Do NOT state a classic sunset date on stage. -->

**New unified DSPM key pages:** Posture (dashboard with 30-day trending), Objectives (data security objectives such as "Prevent data exposure in Microsoft 365 Copilot and Microsoft Copilot interactions" and "Prevent oversharing of sensitive data"), **AI observability** (inventory of AI apps and agents including Microsoft Agent 365, with activity in the last 30 days), Asset explorer, Reports, and Setup tasks.

**Old-to-new navigation mapping (use this when a learner asks "where did my DSPM for AI page go?"):**

| Former location | New location in unified DSPM |
|-----------------|------------------------------|
| Setup tasks | DSPM > **Getting Started**, or DSPM > Actions > Setup tasks |
| Recommendations for AI apps | DSPM > **Actions > Remediation actions** |
| Microsoft 365 Copilot overview page | DSPM > **Reports > Microsoft 365 Copilot** |
| Policies for AI apps | DSPM > **Reports > Policies with AI workloads** |
| Apps and agents | DSPM > **Discover > Apps and agents** |
| Activity explorer | DSPM > **Discover > Activity explorer > AI activities tab** |
| Data risk assessments | DSPM > **Discover > Data risk assessments** |

**Coverage gap worth naming:** the unified DSPM's **Discover > Apps and agents** dashboard does **NOT** include Agent 365 agents. Microsoft directs admins to the **AI observability** page for Agent 365 coverage.

**What DSPM for AI does:**
- Discovers, monitors, and controls how AI interacts with sensitive data
- Tracks where AI-generated content is stored, labeled, and who can access it
- Detects AI interactions with sensitive data (for example, Copilot summarizing legal contracts)
- Runs a **weekly data risk assessment for the top 100 SharePoint sites** by usage automatically, with no activation needed. Custom data risk assessments are in preview. Allow at least **24 hours** for one-click policies to collect data before results display.

**Access roles:** the Microsoft Entra **Compliance Administrator** role, the Microsoft Entra **Global Administrator** role, or the Microsoft Purview **Compliance Administrator** role group. DSPM (classic) additionally requires **Microsoft 365 E5** or the **Microsoft Purview Suite**.

**Purview's three AI app category names as they appear in the UI:**
- **Copilot experiences and agents** -- Microsoft 365 Copilot, Security Copilot, Copilot in Fabric, Copilot Studio
- **Enterprise AI apps** -- Microsoft Foundry, Entra-registered AI apps, Anthropic Claude Enterprise, ChatGPT Enterprise
- **Other AI apps** -- browser-detected apps categorized as Generative AI in the Defender for Cloud Apps catalog, such as ChatGPT, Google Gemini, consumer Microsoft Copilot, DeepSeek

**Shadow AI:**
- Unsanctioned use of AI tools by employees without IT or security approval
- Includes generative AI apps, ML models, browser extensions
- DSPM monitors which apps and services access Microsoft 365 data and flags unauthorized access

**Named one-click policies a learner will see on the Recommendations page:** "Secure interactions from enterprise apps", "Secure data in Azure AI apps and agents", "Detect sensitive info added to AI sites", "Detect when users visit AI sites", "Detect sensitive info shared in AI prompts in Edge", "Detect sensitive info shared with AI via network", "Control Unethical Behavior in AI" (remediated in Communication Compliance), and "Detect risky AI usage" (remediated in Insider Risk Management).

### Content search and eDiscovery -- one unified solution

**All classic eDiscovery experiences retired on August 31, 2025**, including classic Content Search, classic eDiscovery (Standard), and classic eDiscovery (Premium). Legacy eDiscovery guidance now applies only to organizations hosted in Microsoft 365 operated by 21Vianet (China).

**There is now ONE solution named eDiscovery.** The products "eDiscovery (Standard)" and "eDiscovery (Premium)" no longer exist as separate solutions. Capabilities split into **eDiscovery feature support** and **premium eDiscovery feature support** based on subscription. Microsoft's own comparison table uses those two column headings.

> **Where the old words survive.** Warn learners about exactly two places: (1) **Case settings** show a **Premium features** toggle labeled "eDiscovery (Premium)" and a **License** field whose values are "eDiscovery (Premium)" or "eDiscovery (Standard)". (2) The **Cases dashboard Case type filter** offers Premium, Standard, User data search, and Content search. Teach "unified eDiscovery with premium features" and flag these two spots.

**Content search -- the current path:**
- **purview.microsoft.com > Solutions > eDiscovery > Content Search**
- All content searches are contained in a single system-generated eDiscovery case named **Content search**, created by default for all members of the eDiscovery Manager and Administrator role groups
- The Content search case has the **same capability as any user-created case** -- you can create holds and review sets in it, depending on subscription
- To limit access to content searches, use **Case settings** to add or remove members of the Content search case
- Search across mailboxes, SharePoint, OneDrive, Teams using keywords, sender info, dates, sensitivity labels; supports Keyword Query Language (KQL) and GUI filters; results are exportable

**Renamed eDiscovery concepts:**

| Old term | Current term |
|----------|--------------|
| Collections | **Statistics** (in searches). Searches are also no longer immutable after results are added to a review set. |
| Jobs | **Processes** |
| Custodians as the primary organizing unit | The **case** is the primary organizing unit |
| Separate reindexing step | **Advanced indexing** now runs automatically ("just in time") during each search |

**Premium-only eDiscovery capabilities:** Advanced indexing, Review sets, Import external data to review sets, cloud attachments and SharePoint versions support, OCR, Conversation threading, Decryption, Review set filtering, Review set KQL queries (preview), Query Report (preview), Tagging, Analytics, Computed document metadata, Guest user access (preview), Security Copilot, transparency of long-running processes, full process reporting, enhanced data source mapping, and Graph API app-only authentication.

**Legal hold** still prevents data from being altered or deleted during an investigation. **Review sets** still organize and analyze collected content.

### Current Microsoft Purview solution names (verified 2026-07-26)

All are reached via **purview.microsoft.com > Solutions**.

- **Data compliance solutions:** Audit, Communication Compliance, Compliance Manager, Data Lifecycle Management, eDiscovery, Records Management. Note that **Data Lifecycle Management and Records Management are separate solutions** with separate configuration areas.
- **Data security solutions:** Data Loss Prevention, Data Security Investigations, Information Barriers, Information Protection, Insider Risk Management, Privileged Access Management, plus Data Security Posture Management (DSPM).

---

## Unit 4: Oversharing and Data Access Governance in SharePoint

### What is Oversharing?
- Granting broader access to SharePoint content than appropriate or intended
- Common scenarios:
  - Sharing with "Everyone" or "Anyone with the link" -- accessible to anyone who obtains the link
  - Providing Edit access when View-only is sufficient
  - Allowing external guest users full site access instead of specific document access

### Tools for Identifying and Troubleshooting Oversharing
- **Sharing reports** (Microsoft 365 admin center and SharePoint admin center) -- who shared what, who has access, external sharing status; filterable by site, folder, or file
- **PowerShell and Microsoft Graph API** -- audit access at scale; scripts can scan for docs shared with "Anyone with the link" or containing sensitive labels
- **Automated audits and alerts** -- schedule regular scans; configure alerts for high-risk sharing events

### Best Practices to Prevent Oversharing
- Sensitivity labels with encryption -- only authorized users can access content even if link is shared externally
- Organization-wide sharing limits -- set in SharePoint admin center; disable anonymous links; enforce authenticated-user-only access
- User education and automated alerts -- tooltips and prompts in SharePoint; automated admin notifications for external sharing of sensitive content

### Data Access Governance (DAG) Reports

**Exact current path:** sign in to the **SharePoint admin center** > in the left pane expand **Reports** > select **Data access governance**.

**Two report groups on the DAG landing page:**

| Group | Reports |
|-------|---------|
| **Snapshot reports** | "Site permissions across your organization" (marked Recommended), "Sensitivity label applied to files", and a "Site permissions for users" report |
| **Activity reports** | "Sharing links" and "Shared with 'Everyone except external users'" (EEEU). Activity reports cover the **last 28 days**. |

**Remediation actions available directly from DAG reports:**
- Use **restricted access control (RAC)** to limit access to a specific group
- Review the **Change history** report to find recent permission changes that caused oversharing
- Use **Site access review** to delegate permission review to site owners
- Generate AI insights with the **Get AI insights** button next to the report

**Licensing nuance:** IT administrators with **Microsoft 365 E5** licensing CAN access Data access governance reporting **without** SharePoint Advanced Management, but they cannot view or use other SAM features, do not get snapshot reports or remedial actions, and their activity reports return only up to **10,000 sites**. Organizations without SAM must also explicitly enable data collection before generating activity reports. Reports become available 24 hours after enabling, data is stored 28 days, and collection pauses if no reports are generated for 3 months.

**Two blockers to know:** DAG reports do not work if the tenant uses nonpseudonymized report data. To fix this, a Global Administrator goes to the **Reports** setting in the Microsoft 365 admin center and CLEARS "Display concealed user, group, and site names in all reports". DAG reports are also unavailable for Microsoft 365 operated by 21Vianet regardless of licensing.

### SharePoint Advanced Management (SAM)

**Licensing -- the answer to "paid add-on or bundled?" is BOTH, and the distinction is exam-worthy.**

- SAM capabilities that support a **Microsoft 365 Copilot deployment** are unlocked when **at least one user** in the organization is assigned a Microsoft 365 Copilot license. That user does not need to be a SharePoint administrator.
- Alternatively, organizations with SharePoint K, P1, or P2 can purchase the **SharePoint Advanced Management Plan 1** add-on.
- **Microsoft 365 E7** also includes it.
- **Caveat that keeps this from being a clean "it is free with Copilot" answer:** some SAM features still require the paid Plan 1 add-on and are **NOT** unlocked by a Copilot license. Microsoft names **restricted site creation** as an example. The correct teaching line is: *a Copilot license unlocks the Copilot-readiness subset of SAM; the full SAM feature set still needs the Plan 1 add-on.*

**Base subscription requirement:** Office 365 E3/E5/A5, or Microsoft 365 E1/E3/E5/A5, or Microsoft 365 GCC/GCC-High/DoD. Required Entra roles are **SharePoint Administrator** or the broader **SharePoint Advanced Management Administrator** role. External users do not require a license.

**SAM features included with a Microsoft 365 Copilot license** (confirmed available in WW, GCC, GCC-H, and DoD): Restricted content discovery (RCD), Sharing links reports, Sensitivity labels report (requires E5 or G5), Everyone except external users (EEEU) insights, Permission state reports for sites/OneDrive sites/files, Site access review for all reports, Catalog management, Change history - site settings, and Recent admin actions.

### RAC versus RCD -- the distinction Domain 2 tests

> **Naming resolution.** Both "restricted access control" and "restricted site access" are current, and Microsoft uses them interchangeably in the same article. The SharePoint Advanced Management overview says "Use restricted access control (RAC)". The feature article opens: "Restricted site access control (also referred to as restricted access control or site access restriction)...". **The July 2026 AB-900 objective bullet says "restricted access control".** Teach **RAC** as the primary term and tell learners the portal UI uses "Site-level access restriction" and "Restricted site access" wording.

**One-line distinction:** **RAC controls ACCESS** (who can open the site at all -- a permissions gate that blocks even prior link holders). **RCD controls DISCOVERABILITY** (who can find the content via org-wide search and Copilot -- permissions are untouched). RAC is enforcement; RCD is concealment.

| | Restricted access control (RAC) | Restricted content discovery (RCD) |
|---|---|---|
| Changes who can access the site? | **Yes** | **No** |
| Blocks org-wide search and Copilot? | Yes, because users lose access | Yes, by concealment |
| Users who already have permissions can still open the site directly? | **No** | **Yes** |
| Scope | SharePoint sites, up to 10 groups per site | SharePoint sites only, **NOT** OneDrive sites |
| Best used when | Access itself is too broad and must be restricted | Permissions are correct, or under review, and you want the content out of Copilot and search temporarily |

**RAC -- what it does:** restricts who can access a SharePoint site to members of specified Microsoft 365 groups or Microsoft Entra security groups. Users not in the control group cannot access the site or its content **EVEN IF** they had prior permissions or a shared link. Critically, group membership alone does not grant access -- a user needs **BOTH** the site or content permission **AND** membership in the RAC group.

**RAC -- exact paths (two levels):**
- **Tenant enablement:** SharePoint admin center > expand **Policies** > **Access control** > **Site-level access restriction** > **Allow access restriction** > **Save**. PowerShell equivalent: `Set-SPOTenant -EnableRestrictedAccessControl $true`. May take up to one hour.
- **Per-site:** SharePoint admin center > expand **Sites** > **Active sites** > select the site > **Settings** tab > **Edit** in the **Restricted site access** section > select the **Restrict SharePoint site access to only users in specified groups** checkbox > add groups > **Save**.

**RAC and Copilot:** the restricted site access control policy IS honored in organization-wide search experiences and Microsoft 365 Copilot experiences. Search index update latency depends on site item count, so large sites take longer to reflect the policy.

**RCD -- what it does:** a site-level setting that prevents content from a site appearing in organization-wide search and Microsoft 365 Copilot experiences **UNLESS** a user recently interacted with the content. RCD **does NOT change permissions** -- users who already have access can still reach the content directly and can still discover content they own or recently interacted with. RCD also does not remove content from the Microsoft 365 search index.

**RCD -- exact path:** SharePoint admin center > expand **Sites** > **Active sites** > select a site to open its flyout > **Settings** tab > under **Restrict content discovery** select **On** > **Save**. A **Restricted** tag becomes visible on covered sites.

**RCD limitations worth calling out:** it applies to SharePoint sites only, not OneDrive sites. It does not affect searches that originate from site context, nor other intelligent experiences such as Microsoft 365 Feed and Recommendations. Microsoft cautions that excessive use reduces the content available to search and Copilot, degrading response completeness and relevance. It is positioned as a **temporary governance control during permissions review**.

**RCD licensing and tooling:** requires the organization to have a Microsoft 365 Copilot license, since Microsoft states it is "intended for Microsoft 365 Copilot deployment and governance scenarios". Check per site with `Get-SPOSite -Identity <site-url> | Select RestrictContentOrgWideSearch`. Tenant-wide reporting uses `Start-SPORestrictedContentDiscoverabilityReport` and `Get-SPORestrictedContentDiscoverabilityReport`. Enable, disable, and justification events are captured in Microsoft Purview audit log activities.

> **RETIREMENT ALERT.** **Restricted SharePoint Search (RSS) is retiring. Starting July 31, 2026, new enablement is blocked.** Microsoft directs customers to **Restricted Content Discovery (RCD)** instead. Do **NOT** teach RSS as a current recommendation. Note the related constraint: if Restricted SharePoint Search is enabled in the tenant, SharePoint cannot be used as a knowledge source for a declarative agent.

**Additional site-scoped agent controls SharePoint admins hold outside the Microsoft 365 admin center:** **restricted content discovery** (turns off all agent-related features on individual sites, removing the Agent icon from the site's global header and preventing that site's content from being added to any other agent) and **restricted access control policies** via SharePoint Advanced Management.

---

## Unit 5: Data Protection in Microsoft 365 Copilot

### How Copilot Accesses Data
- **Critical principle: Copilot can only see what the user is already allowed to see**
- Operates entirely within Microsoft Purview compliance boundaries
- Does NOT transmit data outside the tenant or to non-Microsoft services
- Accesses data through Microsoft Graph using the signed-in user identity and permissions
- No separate security model needed -- Copilot respects existing SharePoint security groups, OneDrive sharing settings, and Purview data governance policies
- **One important refinement to the "only what the user can see" rule:** permission to VIEW is not always sufficient. If encryption from a sensitivity label grants VIEW but withholds the **EXTRACT** usage right, Copilot will not summarize the content even though the user can open it. See Unit 6.

**Copilot Data Access by App:**
- **Outlook** -- summarize threads, draft responses; only accesses user emails and calendar
- **Word, Excel, PowerPoint** -- generate content, summarize, analyze; only from files user can access in OneDrive or SharePoint
- **Teams** -- summarize meetings, surface chat history; only from authorized channels and messages
- **OneDrive and SharePoint** -- search and retrieve from accessible repositories only

### Microsoft Graph and Copilot
- Microsoft Graph is the centralized data access layer for all of Microsoft 365
- Copilot queries Graph using the user OAuth token (enforces authentication and authorization)
- Graph adds intelligence: filters and ranks results using context, recency, user activity, and relationship graphs
- **Semantic index** -- transforms content into vectors (mathematical representations of meaning); enables meaning-based retrieval rather than keyword matching
  - Example: searching "project kickoff" returns documents about "launch meetings" or "initial planning"

**Graph Query Factors:**
- User context tokens -- OAuth tokens represent user identity and authorization scope
- Search relevance and semantic understanding -- analyzes Teams memberships, chat activity, calendar invites
- Temporal and contextual filters -- interprets time references ("last week's meeting")
- Signals used: file activity (recently accessed ranked higher), sharing signals, content insights (titles, summaries, people references)

### Copilot Security and Permissions Model
- Operates under the exact same permission models as all other Microsoft 365 services
- Respects: Sensitivity Labels, DLP rules, Information Protection policies, Conditional Access

**Key Details:**
- **Shared file behavior** -- if user has access via "Anyone with the link" and link is active, Copilot can access it; if link expires or is revoked, Copilot access disappears; critical to monitor link-based sharing
- **Purview sensitivity labels and DLP** -- Copilot does not surface labeled content if policy rules prevent it; example: "Confidential -- Finance Only" document excluded unless user is in Finance group
- **Defender for Cloud Apps and Conditional Access** -- restrict access from unmanaged devices or certain IP ranges; if a user is blocked from opening SharePoint docs on a personal laptop, Copilot on that device also cannot process that content
- **Audit and monitoring** -- Defender and Purview track when Copilot was used, what data was queried, and whether policy violations occurred

### AI Safety and Responsible AI Principles
- **Data minimization** -- fetches only data necessary for the specific request; does not indiscriminately crawl mailboxes or file systems
- **Transparency** -- every generated answer includes source references users can select to validate; users always see where Copilot got its information
- **Content filtering** -- blocks harmful, offensive, or unverified content; excludes content with high uncertainty or inappropriate language
- **Auditability** -- all Copilot interactions logged (prompt history, data accessed, AI responses); viewable through Microsoft Purview and Microsoft 365 audit logs; essential for regulated industries
- **Grounding reduces, but does not eliminate, fabrication** -- Copilot grounds responses in retrieved tenant data and cites sources, which is the mitigation for fabricated content. Do **NOT** teach "no hallucination by design" as an absolute guarantee; human review of generated output remains a documented responsible-AI practice.

---

## Unit 6: Purview Controls That Act On Copilot Directly

This unit collects the Purview-to-Copilot mechanics that Domain 2 tests most concretely.

### Sensitivity label inheritance in Copilot

Copilot in Word, Copilot in PowerPoint, and Copilot in Outlook support **sensitivity label inheritance for newly created content**. When a user selects **Draft with Copilot** in Word and references a file, or **Create presentation from file** in PowerPoint, or **Edit in Pages** from Copilot Chat, the source file's sensitivity label and its protection settings (including content markings such as footers) are automatically applied to the new content.

### Label display in Copilot responses

Microsoft 365 Copilot Chat displays the sensitivity label for items listed in the response and its citations. Using the label's **priority number** defined in the Purview portal, the latest response and threaded summaries in Copilot in Teams chat and channels display the **highest priority** sensitivity label from the data used for that chat -- that is, the most restrictive label. A higher priority number usually denotes higher sensitivity.

In **Copilot Studio** agent responses, a **shield icon** shows the highest sensitivity label applied to content the agent used, plus a label for each cited file. On the web the shield appears **below** the response; in Teams it appears **above** the response. Purview sensitivity labels in Copilot Studio are **on by default** for agents with supported knowledge sources. This feature is marked **preview**.

### The EXTRACT usage right (heavily tested)

When a sensitivity label applies encryption, the user must have the **EXTRACT** usage right in addition to **VIEW** for Copilot to return the data. If content grants VIEW but **NOT** EXTRACT, Copilot will not summarize the content, but it can still reference it with a link so the user can open and view it outside Copilot.

### Encryption without labels, and other content Copilot cannot use

- Content encrypted by Azure Rights Management **without** a sensitivity label (Purview Message Encryption, Microsoft IRM, RMS connector, RMS SDK) still has VIEW and EXTRACT usage rights checked, but there is **NO** automatic inheritance of protection to new items.
- **S/MIME** protected emails are **NOT** returned by Copilot, and Copilot is unavailable in Outlook when an S/MIME email is open.
- **Password-protected documents** cannot be accessed unless the user already has them open in the same app.
- Items encrypted with **Customer Key or BYOK ARE supported** and are eligible to be returned by Copilot.
- A PowerShell-only label setting, **BlockContentAnalysisServices** (via `Set-Label` or `New-Label`), prevents Office apps from sending labeled content to connected experiences, which includes Microsoft 365 Copilot. It is **NOT** configurable in the Purview portal. Important caveat: content excluded this way in the named Office apps **remains available to Copilot in other scenarios** such as Teams and Microsoft 365 Copilot Chat.

### DLP for Copilot

**The DLP policy location is named "Microsoft 365 Copilot and Copilot Chat".** Create it at purview.microsoft.com > **Data Loss Prevention > Policies > + Create policy > Custom template > Custom policy**, then turn on the **Microsoft 365 Copilot and Copilot Chat** location on the Locations page.

**Four supported condition and action pairs:**

| Condition | Action | Effect |
|-----------|--------|--------|
| Content contains > **Sensitivity labels** | Prevent Copilot from processing content | The item is excluded from the response summary but may still appear in citations |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Processing prompts** | Copilot does not respond to the prompt at all |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Performing Web Searches** | Blocks external web search as a grounding source |
| **Email is received from > External users** (preview) | Prevent Copilot from processing content | Excludes external email from grounding, summarization, or citation, to reduce prompt injection risk. Entered preview June 2026. |

> **Distractor-grade gotcha.** You **CANNOT** use the "Content contains sensitive info types" condition and the "Content contains sensitivity labels" condition in the **SAME RULE**. You can create a rule for each condition in the same policy, but not combined in one rule.

**Coverage limits:** sensitivity-label rules support stored files and actively open files, and emails sent on or after January 1, 2025. **Calendar invites are NOT supported.** In Word, Excel, and PowerPoint the policy is evaluated **at file open** -- if a label is applied mid-session, enforcement starts the next time the file is opened.

### Auditing Copilot interactions

Copilot prompts and responses are captured in the unified audit log automatically as part of **Audit (Standard)**. No extra configuration is needed if auditing is enabled for the organization. Access them at purview.microsoft.com > **Audit**, filtering with the **Activities - operation names** field.

**Record properties worth naming in class:**
- **Operation** = `CopilotInteraction` for Microsoft-developed Copilots
- **RecordType** values: `CopilotInteraction` (Microsoft Copilots), `ConnectedAIAppInteraction` (custom or third-party AI apps registered in your org), and `AIAppInteraction` (third-party AI apps **NOT** deployed in your org)
- **AccessedResources** includes `SensitivityLabelId`, identifying whether Copilot touched labeled content, plus **`XPIADetected`**, a boolean flagging a cross-prompt injection attack

> **Billing trap.** Audit logs for **non-Microsoft** AI applications use **pay-as-you-go billing** and are retained 180 days; they are **NOT** included in the enterprise subscription. All Microsoft applications, including Microsoft 365 Copilot, Security Copilot, Copilot in Fabric, and apps built with Copilot Studio and Microsoft Foundry, **ARE** included in Audit (Standard) at no extra charge.

> **Reporting trap.** Microsoft explicitly warns that Purview audit log data is **NOT** intended as the basis for Copilot usage reporting, and aggregated metrics built on it may not match the official Copilot usage reports. Use the Microsoft 365 Copilot usage report or the Copilot Dashboard instead.

### Communication Compliance over Copilot prompts

Create the policy at purview.microsoft.com > **Communication Compliance > Policies > Create policy > "Detect Microsoft Copilot interactions"** template. Communication Compliance detects any message with the `IPM.SkypeTeams.Message.Copilot.*` item class (for example `IPM.SkypeTeams.Message.Copilot.Teams`, `IPM.SkypeTeams.Message.Copilot.Outlook`).

To add generative AI as a location to an **existing** policy, edit the policy and on the "Choose locations to detect communications" page select one or more of these three checkboxes: **Microsoft Copilot experiences**, **Enterprise AI apps**, and **Other AI apps**.

**Identifying AI matches in the Pending tab:** the **Subject** column shows `[Copilot]` for Microsoft-based Copilots and `[AI app]` for all other generative AI interactions. The **Sender** column shows "Copilot", "Connected AI app", or "Cloud AI app". The **Recipient** column is the user interacting with the AI application. Prompts and responses appear as **separate entries**.

**Investigation roles:** you must hold one of Communication Compliance, Communication Compliance Investigators, or Communication Compliance Analysts, **AND** be assigned as a reviewer in the **Reviewers** field of the policy.

> **Billing trap.** There is **NO** pay-as-you-go charge for detecting Microsoft 365 Copilot data. Pay-as-you-go billing **IS** required to detect interactions for non-Microsoft-365 AI data, including Copilot in Microsoft Fabric, Microsoft Security Copilot, Microsoft Copilot Studio, connected generative AI applications, and other AI applications detected via browser and network activity.

### eDiscovery over Copilot data

User prompts and responses are stored in the **user's mailbox**. To retrieve them, create a case, select the user's mailbox as the data source, and in the query builder select **Add condition > Type > Contains any of > Edit > "Copilot activity"**. That condition covers all Copilot and other AI application activity.

### Insider Risk Management over Copilot

Insider Risk Management uses the **"Risky AI usage"** policy template, which detects prompt injection attacks and access to protected materials. In **June 2026** Microsoft reached general availability on the ability to **select which generative AI apps to monitor** in IRM policy indicators (for Microsoft Copilot experiences and Enterprise AI apps), which reduces alert noise and avoids unnecessary pay-as-you-go charges.

### Activity explorer and prompt content

To view prompt and response **content** in activity explorer drill-down, an admin must be a member of the Microsoft Purview **Content Explorer Content Viewer** role group. Without it, the activity is visible but the prompt and response text is not.

### Data Lifecycle Management and Compliance Manager applied to Copilot

- **Data Lifecycle Management:** retention policies can automatically retain or delete user prompts and responses for AI apps. Where multiple policies apply to the same location, the **principles of retention** resolve conflicts -- data is retained for the **longest** duration of all applied retention policies or eDiscovery holds.
- **Compliance Manager:** provides control-mapping regulatory **templates specifically for AI regulations**, used by the DSPM for AI recommendation "Get guided assistance to AI regulations". Compliance Manager is available to organizations with Office 365 and Microsoft 365 licenses including Business Premium, and to GCC, GCC High, and DoD.

### Forward-looking aside (not an exam item)

**Defender for Cloud Apps file policies retire on January 6, 2027** and must be recreated as Microsoft Purview DLP or auto-labeling policies. Defender for Cloud Apps continues to provide SaaS app discovery, posture management, and threat detection; file-based data protection is moving to Microsoft Purview.
