# Module 3: Protect and Govern Microsoft 365 Data

**Learning Path:** Explore Microsoft 365 Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/protect-govern-data-microsoft-365/
**AB-900 Domain:** 2 -- Understand data protection and governance tasks for Microsoft 365 and Copilot (35-40%)

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

**Communications Compliance**
- Monitors emails, Teams messages, Yammer for policy violations (harassment, insider trading, sensitive data leaks)
- Uses pattern-based detection and ML classifiers

**DSPM for AI**
- Visibility and control over sensitive data used by AI systems
- Discovers, classifies, secures data flows in AI workloads
- Portal path: **purview.microsoft.com > Solutions > DSPM for AI (classic)**

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
- Monitors emails, Teams, Yammer, and Copilot chat prompts
- Detects harassment, abusive language, insider trading, data leaks
- Uses pattern-based detection (regex and keywords) and ML classifiers trained on real-world examples

**Key Features:**
- **Reviewer dashboard** -- analysts see sender, recipients, content snippets, policy matches; can dismiss, notify user, escalate to HR or legal, or tag for policy training
- **Industry-specific custom policies** -- FINRA (financial), HIPAA (healthcare); focus on material nonpublic information (MNPI), drug-related language, prohibited statements; configurable thresholds and confidence levels

### Activity Explorer
- Centralized investigation and visualization tool -- forensic timeline of user actions with sensitive data
- Provides visibility even when activity does NOT trigger a policy violation
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

### Microsoft Purview Data Explorer
- Discovers where sensitive data resides across the organization
- Searches for SITs (credit card numbers, SSNs, health data) across SharePoint, Teams, OneDrive
- Filters: location, sensitivity label, content type
- Visualization: patterns and trends in data usage; shows files, owners, sharing status
- Essential before implementing new security policies

### DSPM for AI (Data Security Posture Management)
- Discovers, monitors, and controls how AI interacts with sensitive data
- Tracks where AI-generated content is stored, labeled, and who can access it
- Detects AI interactions with sensitive data (e.g., Copilot summarizing legal contracts)

**Shadow AI:**
- Unsanctioned use of AI tools by employees without IT or security approval
- Includes generative AI apps (ChatGPT, Copilot), ML models, browser extensions
- DSPM monitors which apps and services access Microsoft 365 data; flags unauthorized access

**DSPM Reporting Features:**
- Activity Explorer views -- capture and classify AI prompts and responses
- Audit logs -- investigate interactions with AI agents
- Oversharing assessments -- identify and mitigate data exposure risks
- Data risk assessment reports -- summarize sensitive data usage and user behavior across AI apps

### Content Search and eDiscovery

**Content Search:**
- Search across mailboxes, SharePoint, OneDrive, Teams using keywords, sender info, dates, sensitivity labels
- Supports Keyword Query Language (KQL) and GUI filters
- Results exportable

**eDiscovery Editions:**
- **eDiscovery (Standard)** -- basic search, export, and legal hold features
- **eDiscovery (Premium)** -- adds case management, review sets, analytics (near-duplicate detection, common themes), and redaction
- **Legal hold** -- prevents data from being altered or deleted during investigation
- **Review sets** -- organize and analyze collected content for key evidence identification

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
- Available in the **SharePoint admin center**
- Identify high-risk sites based on:
  - Sites with sensitive content and excessive sharing
  - Sites with inactive owners (no one managing access)
  - Sites lacking assigned sensitivity labels
- Remediation actions: revoke guest access, apply stricter sharing settings, assign sensitivity labels

### SharePoint Advanced Management (SAM)
- Paid add-on for advanced governance
- Key features:
  - **Restricted site access** -- prevent unauthorized users from accessing sensitive sites; can require Intune-managed devices only
  - **Inactivity alerts** -- flag sites not accessed for a specified period; prompt archive or security action
  - **Site access reviews** -- prompt site owners to periodically review and confirm permissions
  - **Conditional access integration** -- require MFA or block access based on device compliance or location
- Four principles: Monitor, Detect, Take action, Automate

---

## Unit 5: Data Protection in Microsoft 365 Copilot

### How Copilot Accesses Data
- **Critical principle: Copilot can only see what the user is already allowed to see**
- Operates entirely within Microsoft Purview compliance boundaries
- Does NOT transmit data outside the tenant or to non-Microsoft services
- Accesses data through Microsoft Graph using the signed-in user identity and permissions
- No separate security model needed -- Copilot respects existing SharePoint security groups, OneDrive sharing settings, and Purview data governance policies

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
- **No hallucination by design** -- if no accessible data matches a query, Copilot responds with "No data found" rather than fabricating an answer
