# Module 1: Explore Microsoft 365 Security Foundations

**Learning Path:** Explore Microsoft 365 Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/explore-microsoft-365-security-foundations/
**AB-900 Domain:** 1 -- Identify the core features and objects of Microsoft 365 services (30-35%)
**Verified:** 2026-07-26 (against the AB-900 skills measured as of July 22, 2026)

> **Objective mapping.** This module supports the Domain 1 subsections "Understand the Microsoft 365 security principles" and "Identify the core security features of Microsoft 365 services". The July 22, 2026 change log marks "Identify the core security features of Microsoft 365 services" as a **Minor** change; no Domain 1 subsection is marked Major.

---

## Unit 1: Analyze the Zero Trust Security Model

### Three Core Principles

**1. Verify Explicitly**
- Every access request must be authenticated and authorized using all available contextual signals (identity, device health, location, behavior, risk level)
- No user or device is trusted by default, even inside the corporate network
- Enforced through:
  - **Conditional Access policies** in Microsoft Entra ID -- rules based on user identity, device compliance, location, app sensitivity, real-time risk
  - **Risk-based authentication** -- Microsoft Entra Identity Protection uses ML and global threat intelligence to detect anomalies (impossible travel, unfamiliar sign-in properties, compromised credentials)
  - **MFA** -- second factor via mobile app, biometric, hardware token; supports passwordless (Windows Hello, FIDO2); risk-based MFA triggers only when necessary to reduce friction

**2. Least Privilege Access**
- Users, apps, and services get only the minimum access needed
- Enforced through:
  - **RBAC (Role-Based Access Control)** -- predefined roles with specific permissions (e.g., Password Administrator can reset passwords but cannot access mailboxes); custom roles supported
  - **PIM (Privileged Identity Management)** -- just-in-time (JIT) access; temporary elevation with approval workflows and audit logging; auto-revocation after task completion

**3. Assume Breach**
- Assume attackers are already inside the network
- Emphasizes segmentation, continuous monitoring, rapid response
- Key tools:
  - **Defender for Endpoint** -- behavioral analytics to detect lateral movement, privilege escalation, ransomware; auto-isolates compromised devices
  - **Microsoft Sentinel** -- cloud-native SIEM; aggregates logs from M365 and non-Microsoft sources; ML-based event correlation; automated playbooks
  - **Defender for Identity** -- monitors Active Directory traffic for Pass-the-Hash, Golden Ticket attacks, domain enumeration

### Six Zero Trust Pillars in Microsoft 365

| Pillar | Key Tools and Concepts |
|--------|------------------------|
| **Identity** | Microsoft Entra ID; passwordless auth (Windows Hello, FIDO2, Authenticator); risk-based Conditional Access; identity federation |
| **Endpoints** | Microsoft Intune compliance policies (encryption, AV, OS version); app protection policies for BYOD; Endpoint Analytics for device health; noncompliant devices quarantined or blocked |
| **Applications** | Defender for Cloud Apps (shadow IT discovery, session controls, block risky apps); Microsoft Entra ID App Proxy for secure remote access to on-prem apps |
| **Data** | Microsoft Purview Information Protection (classify, label, encrypt); DLP policies across Exchange, SharePoint, OneDrive, Teams; labels persist across services |
| **Infrastructure** | Defender for Cloud (security posture across Azure and other connected cloud estates); Azure Policy for governance (restrict VM sizes, enforce tagging, require encryption) |
| **Network** | Azure Firewall, VPN Gateway, Defender for Identity; network segmentation; restrict outbound traffic; detect lateral movement |

---

## Unit 2: Implement Zero Trust in Microsoft 365

### Six Implementation Phases

**Phase 1: Assess Current Security Posture**
- **Microsoft Secure Score** -- quantitative measure across M365 services; identifies gaps (missing MFA, outdated DLP, excessive admin privileges); provides prioritized recommendations
- **Microsoft Purview Compliance Manager** -- maps configs to regulatory standards (HIPAA, ISO 27001); provides actionable improvement actions

**Phase 2: Enable Identity Protection**
- Identity is the first and most critical control plane
- **Conditional Access policies** -- rules based on user, device, location, risk level; real-time enforcement
- **Risk-based authentication** -- detects impossible travel, unfamiliar sign-in properties, compromised credentials
- **Identity governance** -- access reviews, entitlement management; temporary access with auto-expiration to prevent privilege creep

**Phase 3: Enforce Endpoint Compliance**
- **Endpoint compliance policies** (Intune) -- check encryption, AV, OS version, security patches; noncompliant devices blocked
- **App protection policies** -- data encryption and isolation at app level; prevents copy-paste, requires PIN, encrypts data on unmanaged devices
- **Endpoint Analytics** -- insights into device performance, crashes, outdated software

**Phase 4: Classify and Protect Data**
- **Sensitivity labels** -- manual or automatic; enforce encryption and access restrictions; persist across Exchange, SharePoint, OneDrive, Teams
- **DLP policies** -- block, warn, or require justification for sharing sensitive info; applies across all M365 workloads
- **Policy tuning** -- monitor violations, investigate incidents, refine rules; dashboards and reports in Purview

**Phase 5: Monitor and Respond to Threats**
- **Defender for Endpoint** -- behavioral analytics, threat intelligence, auto-isolate devices, timeline views, forensic data
- **Microsoft Sentinel** -- SIEM; correlates events across domains; hunting queries for proactive threat hunting; automated playbooks
- **Defender for Identity** -- sensor-based monitoring of on-prem AD domain controller traffic; detects credential theft, lateral movement; correlated view in Defender XDR

**Phase 6: Educate Users**
- **Attack simulation training** (Defender for Office 365) -- realistic phishing simulations; tracks user responses; redirects to training
- **Security awareness campaigns** -- via Viva Learning, Teams, email; newsletters, videos, infographics
- **Role-specific training** -- tailored by role, department, risk (finance: invoice fraud; developers: secure coding; executives: strategic risks)

---

## Unit 3: Examine Threat Protection and Intelligence

### Microsoft Defender XDR Suite

> **Naming rule.** The AB-900 study guide says **Microsoft Defender XDR** verbatim. The retired name "Microsoft 365 Defender" must not appear in course materials or in distractors. The portal that surfaces it is the **Microsoft Defender portal** at security.microsoft.com.

- Unified detection, prevention, investigation, response across M365 services
- Addresses both pre-breach (block) and post-breach (contain and remediate) scenarios
- Benefits from trillions of daily signals from Azure, Office 365, Windows

| Component | Function |
|-----------|----------|
| **Defender for Office 365** | Protects email and collaboration against phishing, BEC, malware; scans URLs and attachments |
| **Defender for Endpoint** | EDR, antivirus, attack surface reduction, automated investigation and response; can isolate devices |
| **Defender for Identity** | Signals from on-prem AD; detects lateral movement, pass-the-hash, Kerberos ticket abuse |
| **Defender for Cloud Apps** | Shadow IT discovery, app governance, data exfiltration prevention; session controls |

**Integration with Microsoft Purview:**
- Purview complements Defender XDR with compliance, governance, data protection
- Auto-applies sensitivity labels; blocks unauthorized external sharing
- Used for data security investigations and insider risk management

### Core Threat Protection Features

**Anti-Phishing:**
- Spoof intelligence -- detects unauthorized senders impersonating trusted domains
- Impersonation protection -- flags attempts to mimic internal users and executives
- User and domain impersonation detection -- identifies lookalike domains (e.g., micros0ft.com)
- **Safe Links** -- rewrites URLs, scans at time of click in real time

**Anti-Malware:**
- Multiple scanning engines across Exchange, SharePoint, OneDrive, Teams
- **Zero-hour Auto Purge (ZAP)** -- retroactively removes malicious messages after new threats identified
- Common attachment filter policies -- block .exe, .js, .vbs, etc.

**Anti-Spam and Transport Rules:**
- Heuristics, ML, reputation-based analysis
- Transport rules (mail flow rules) -- custom logic (e.g., block external emails with "wire transfer" in subject)
- Connection filtering -- blocks known malicious IPs
- Outbound spam protection -- prevents compromised accounts from sending spam
- Quarantine policies -- admin review and release of flagged messages

### Threat Intelligence Tools
- **Microsoft Threat Intelligence Center (MSTIC)** -- over 65 trillion signals daily; nation-state actor monitoring; dark web monitoring for stolen credentials
- **Threat Explorer** (Defender for Office 365 Plan 2) -- real-time visibility into email threats; pivot by sender, subject, URL, file hash; take action directly (delete, block, investigate)
- **Threat Analytics** -- curated library of threat intelligence reports; MITRE ATT&CK framework mappings; recommended remediation steps

---

## Unit 4: Explore Identity and Authentication

### Identity in Microsoft 365
- Digital representation of a user, device, or service in Microsoft Entra ID
- Includes: username (UPN), password or sign-in method, attributes (title, department, groups), permissions
- **Cloud-only identities** -- created and managed entirely in Microsoft Entra ID
- **Hybrid identities** -- originate in on-prem AD, synced via Microsoft Entra Connect Sync or Entra Connect Cloud Sync

### Authentication Methods

**Passwordless and Secure Sign-In:**
- **Microsoft Authenticator** -- push notifications, TOTP, passwordless with biometric or PIN
- **FIDO2 security keys** -- physical USB or NFC tokens; public-key cryptography; no password transmitted
- **Windows Hello** -- facial recognition, fingerprint, secure PIN tied to device
- **Certificate-based authentication (CBA)** -- digital certificates on smart cards; PIN plus certificate private key

**Enhanced Authentication Features:**
- **MFA** -- two or more verification factors; drastically reduces account compromise risk
- **Self-Service Password Reset (SSPR)** -- users reset own passwords via registered methods; reached at **entra.microsoft.com > Entra ID > Password reset**; reduces helpdesk calls
- **Microsoft Entra Identity Protection** -- ML-based detection of risky sign-ins; auto-blocks, requires extra verification, or flags for review

### Authentication Methods Policy (current management surface)

- Authentication methods are managed in the unified **Authentication methods policy** at **entra.microsoft.com > Entra ID > Authentication methods > Policies**.
- Managing authentication methods in the legacy MFA policy and the legacy SSPR policy was **retired on September 30, 2025**. An automated migration guide is available from the same blade.
- Per-user MFA state (Enabled, Enforced, Disabled) was **NOT** retired by that change. Only the per-user MFA *service settings* moved into the Authentication methods policy.

### Mandatory MFA Enforcement (in force as of July 2026)

Microsoft enforces MFA on its own admin surfaces independently of security defaults and Conditional Access. Both phases are live for a July 2026 delivery.

| Phase | Scope | Status as of July 2026 |
|-------|-------|------------------------|
| **Phase 1** | Azure portal, Microsoft Entra admin center, Microsoft Intune admin center (any CRUD operation) since October 2024; Microsoft 365 admin center since February 2025 | In force. The postponement window closed September 30, 2025. |
| **Phase 2** | Azure CLI, Azure PowerShell, Azure mobile app, IaC tools, Azure SDK, and REST API (control plane) for Create, Update, and Delete operations | In force. The last postponement date was July 1, 2026, which has passed. |

Enforcement details worth teaching:

- Phase 2 is enforced server-side at Azure Resource Manager. Only requests targeting `https://management.azure.com` are in scope. Microsoft Graph APIs are generally **NOT** in scope. Read operations do not require MFA.
- Workload identities (managed identities and service principals) are not impacted by either phase. User accounts used as service accounts **ARE** impacted.
- There is no opt-out. Mandatory MFA applies to break-glass and emergency access accounts, to B2B guest accounts, and to test tenants. Microsoft enforces it in the public Azure cloud only.
- Microsoft recommends break-glass accounts use passkey (FIDO2) or certificate-based authentication to satisfy the requirement.
- Phase status pages: `https://aka.ms/managemfaforazure` (Phase 1) and `https://aka.ms/postponePhase2MFA` (Phase 2), reached by signing in to the Azure portal as a Global Administrator.

### Passkey Default and SMS/Voice Retirement (dated changes ahead)

Microsoft is making passkeys the default sign-in experience and retiring Microsoft-provided SMS and voice authentication.

| Date | What happens |
|------|--------------|
| **August 1, 2026** | API support and opt-out information become available for the changes below. |
| **September 1, 2026** | Users enabled for SMS or voice in the Authentication methods policy (or legacy MFA settings) are auto-enabled for passkeys, and the tenant Registration Campaign is set to Microsoft Managed state targeting passkeys. |
| **September 18, 2026** | Customer-managed telecom provider options and terms publish in the Microsoft Security Store. |
| **October 30, 2026** | Customer-managed telecom provider configuration becomes available. |
| **February 1, 2027** | Microsoft-provided telecom delivery for SMS and voice is fully retired across Microsoft Entra, including SSPR. Users whose only available method is SMS or voice receive a BLOCKING prompt to register a passkey. Microsoft states there is **NO** opt-out from the February 1 behavior. |

**Passkey types in Microsoft Entra ID:**
- **Synced passkeys** -- saved to a platform credential manager and synced across the user's devices.
- **Device-bound passkeys** -- Passkey in Microsoft Authenticator, Entra Passkey on Windows, and FIDO2 hardware security keys.

Passkey support for B2B users and internal guest users is planned by the end of calendar year 2026. Microsoft publishes a PowerShell script at `https://github.com/microsoft/entra-sms-voice-usage-analyzer` to find users still enabled for SMS or voice; running it requires Global Reader, Authentication Policy Administrator, or Security Reader.

### Hybrid Authentication Methods

| Method | How It Works | Best For |
|--------|-------------|----------|
| **Password Hash Sync (PHS)** | Password hash synced from on-prem AD to Entra ID; cloud-validated | Most common; simple setup; supports Identity Protection and smart lockout |
| **Pass-through Auth (PTA)** | Entra ID validates passwords against on-prem AD via secure agent in real time; no hashes stored in cloud | Compliance requirements prohibiting cloud-stored hashes |
| **Federation (AD FS)** | Authentication delegated to external IdP (e.g., AD FS); token issued and trusted by Entra ID | Highly regulated environments; custom sign-in pages; Microsoft now recommends PHS or PTA instead |

### Single Sign-On (SSO)
- Authenticate once to Microsoft Entra ID, access all M365 services and approved non-Microsoft apps (Salesforce, Adobe, ServiceNow)
- Uses tokens (temporary digital passes) via secure protocols
- Cloud-only setup, hybrid setup, and device-based SSO (Intune SSO extensions for iOS and macOS; Windows devices joined to Entra ID or hybrid-joined get SSO by default)
- Reduces password-related issues and phishing risk

---

## Unit 5: Manage Access and Permissions

### Authorization in Microsoft 365

**Role-Based Access Control (RBAC):**
- Built-in roles in Microsoft Entra ID: Global Administrator, Exchange Administrator, SharePoint Administrator, Teams Administrator, User Administrator, etc.
- Each role has defined scope and permission set
- Custom roles supported for fine-tuned access

**Group-Based and Resource-Specific Permissions:**
- Microsoft 365 Group membership grants access to shared resources (mailbox, calendar, SharePoint site, Planner)
- SharePoint permissions at multiple levels: site, document library, folder, individual file
- Built-in SharePoint roles: Visitor (read-only), Member (edit), Owner (full control)

**Advanced Authorization:**
- **Conditional Access** -- dynamic rules based on risk, device compliance, location, app sensitivity
- **PIM** -- just-in-time admin role access with auto-expiration
- **Access Packages** (Entitlement Management) -- bundle permissions across resources with workflows and approval steps; useful for onboarding
- **Sensitivity labels** -- restrict actions (print, copy, forward) even after access is granted; follow the document everywhere

### Users and Groups

**User Types:** Internal employees, external guests, service accounts, application accounts

| Group Type | Purpose | Key Feature |
|------------|---------|-------------|
| **Security Groups** | Assign permissions to resources | No shared mailbox or storage; access control only |
| **Microsoft 365 Groups** | Collaboration | Auto-creates shared mailbox, calendar, SharePoint site, Planner, optional Teams |
| **Mail-Enabled Security Groups** | Access control plus email distribution | Can assign permissions AND receive email |
| **Distribution Groups** | Email distribution only | Cannot assign permissions; email list only |
| **Dynamic Groups** | Auto-populated based on user attributes | Based on department, location, title, etc.; no manual membership; can be Security or M365 group |

### Group Administration Tools
- **Microsoft 365 admin center** -- web-based; day-to-day group tasks
- **Microsoft Entra admin center** -- advanced IAM; Dynamic Group rules, Conditional Access tied to groups, audit logs
- **PowerShell and Microsoft Graph API** -- enterprise-scale automation; integrate with HR systems for auto-provisioning

---

## Unit 6: Explore Identity and Access Management in Microsoft Entra

### Microsoft Entra Feature Overview

| Feature | Purpose |
|---------|---------|
| **Microsoft Entra ID** | Central identity platform: auth, SSO, group and role management |
| **Conditional Access** | Dynamic risk-based access control |
| **Identity Secure Score** | Measures identity security posture |
| **PIM** | Just-in-time privileged access |
| **Entra ID Governance** | Identity lifecycle, entitlement management, access reviews |
| **Entra ID Protection** | ML-based risk detection for compromised accounts and risky sign-ins |
| **Entra Verified ID** | Decentralized digital credentials |
| **Entra Permissions Management** | Permissions visibility across connected cloud estates |
| **Entra Internet Access / Private Access** | Cloud-based VPN and proxy replacements using Zero Trust (Global Secure Access) |
| **Microsoft Entra Agent ID** | Identity platform for agent identities and agent identity blueprints; available to all Microsoft Entra customers |

### Conditional Access -- Deep Dive

**Portal path:** **entra.microsoft.com > Entra ID > Conditional Access > Policies**. The Conditional Access area also has an Overview page and a Coverage tab showing application policy coverage over the past seven days. Security Reader is the minimum role to view; Conditional Access Administrator is required to create policies.

**Label change to know:** the policy target selector is now labeled **Resources (formerly cloud apps)**, and the all-resources option reads **All resources (formerly 'All cloud apps')**. Teaching the old "Cloud apps" label is stale.

**Real-Time Signals Evaluated:**
- User and sign-in risk (low, medium, high)
- Device state (compliant via Intune?)
- Application sensitivity
- Location and IP address
- Session context and behavior (via Defender for Cloud Apps)

**Common Policy Examples:**
- Require MFA for external access
- Block access from unmanaged devices
- Require sign-in risk mitigation for high-risk users
- Enforce Terms of Use acceptance
- Restrict guest user access to specific apps
- Block legacy authentication (POP3, IMAP, SMTP)
- Apply session controls with Defender for Cloud Apps

**Key Tool:** "What If" tool in Microsoft Entra admin center -- simulate policy impact before deployment

### Identity Secure Score
- **Portal path:** **entra.microsoft.com > Entra ID > Identity Secure Score** for the dashboard, or **Entra ID > Overview > Recommendations** with the Security filter applied. It is **NOT** under a top-level Protection or Security node.
- Dashboard-based metric of identity security posture
- Available to free and paid Microsoft Entra customers; some individual recommendations require a paid license to view and act on
- **Scores recalculate every 24 hours**
- Identity Secure Score represents the **Identity** category of the broader **Microsoft Secure Score**, which also covers Data, Devices, Infrastructure, and Apps and is viewed in the Microsoft Defender portal at **security.microsoft.com**
- Security recommendations (enforce MFA, remove stale accounts, block legacy protocols, configure Conditional Access)
- Improvement actions with step-by-step guidance
- Action statuses: Completed, Planned, Resolved via Third Party, Risk Accepted
- Benchmarking tools -- compare against similar organizations by industry, region, size

### Privileged Identity Management (PIM) -- Deep Dive
- **Portal path:** **entra.microsoft.com > ID Governance > Privileged Identity Management**. PIM is **NOT** under the Entra ID node.
- **Three scopes managed:** Microsoft Entra roles, Azure resource roles, and Groups (PIM for Groups)
- **Two assignment types:** Eligible and Active
- **Audit retention:** PIM audit data in the Microsoft Entra admin center covers the past 30 days only. Longer retention requires routing to an Azure storage account via Azure Monitor. Audit views are at **ID Governance > Privileged Identity Management > Microsoft Entra roles > Resource audit** (org-wide) or **My audit** (self).
- **Time-bound role activation** -- roles active only for a specified period, then auto-revoked
- **MFA and justification requirements** -- required at activation; provides auditable reason
- **Approval workflow integration** -- customizable approvers (team leads, managers)
- **Access reviews and expiration policies** -- scheduled reviews; re-approval required after defined period (e.g., 30 days)
- **Audit logging and alerting** -- all activations recorded; accessible via Entra admin center and Sentinel; alerts for sensitive role activations (e.g., Global Admin)

---

## Unit 7: Troubleshoot and Monitor Identity Security

### Troubleshooting Sign-In Issues

**Primary Tools:**
- **Microsoft Entra admin center** -- main hub for identity troubleshooting
- **Sign-in logs** -- records every sign-in attempt; shows time, location, device, app, MFA status, Conditional Access policies applied, failure reasons; filter by user, app, IP, date
- **What If tool** -- simulate Conditional Access without real sign-in; test which policies would apply

### Common Troubleshooting Scenarios

**1. User Blocked by MFA or Phishing-Resistant Policies:**
- Check sign-in logs for failed attempts and triggering policy
- Verify registered MFA methods match policy requirements
- Guide user to re-enroll MFA (delete existing credentials, re-register Authenticator or FIDO2)
- Check device clock synchronization (TOTP codes rely on time sync)

**2. Conditional Access Denials:**
- Use What If tool to simulate the scenario
- Verify device compliance in Intune (encryption, AV, security patches)
- Check Defender for Endpoint for security alerts on the device

**3. Risky Sign-Ins (Identity Protection):**
- Filter sign-in logs by risk level
- Look for impossible travel, unfamiliar locations, leaked credentials
- Response: require password reset, enforce MFA, temporarily block access

**4. Location or IP Restriction Issues:**
- Check Location and IP address fields in sign-in logs
- Review triggering Conditional Access policy
- For legitimate travel: temporary policy exception, PIM just-in-time access, or IP allow list

**5. Legacy Protocol Authentication Failures:**
- Check Client App field in sign-in logs for IMAP, POP3, SMTP AUTH
- Verify if Conditional Access blocks legacy authentication
- Solutions: upgrade to supported client, enable OAuth, or use app passwords (discouraged)

### Audit Logs

**Two current entry points for unified audit log search, and neither is compliance.microsoft.com:**

1. **Microsoft Purview portal:** purview.microsoft.com > **Audit**
2. **Microsoft Defender portal:** security.microsoft.com > **Audit** (direct deep link `https://security.microsoft.com/auditlogsearch`)

**Retention:**
- **Audit (Standard)** default retention is **180 days**. Records generated before October 17, 2023 are retained 90 days; records generated on or after that date follow the 180-day default.
- Office 365 E5, Microsoft 365 E5, Microsoft Purview Suite, or the Microsoft 365 E5 eDiscovery and Audit add-on get **one year** of retention by default for Microsoft Entra ID, Exchange, and SharePoint activity, and can create audit log retention policies for other services up to one year.

**Search job behavior:**
- Audit log search jobs started from the Microsoft Purview portal keep running after the browser window is closed.
- Completed search jobs are retained for **30 days**.
- Each admin Audit account user can have up to **10 concurrent search jobs**, with a limit of **one unfiltered search job**.

**Other operational facts:**
- Requires **Audit Logs** role or **View-Only Audit Logs** role
- Filter by activities, users, date ranges, services
- Includes timestamps, user IDs, IP addresses, detailed event info
- Key use cases: track unauthorized file access, monitor admin role assignments, track policy changes
- PowerShell: `Search-UnifiedAuditLog` in Exchange Online PowerShell is **NOT** deprecated and remains the documented cmdlet backing the audit search tool. Microsoft recommends the **Microsoft 365 Management Activity API** instead for programmatic bulk download. An **Audit Search Graph API** (beta) also exists.
- Enable or disable ingestion: `Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true`
- Integration with Microsoft Sentinel for real-time alerting

### App Registrations and Enterprise Applications

Both are under **entra.microsoft.com > Entra ID**.

- **App registrations** hold **application objects** -- the definition of an app: name, redirect URIs, secrets, API permissions, and app roles. An application object exists only in the app's home tenant. Secrets and certificates should be rotated regularly.
- **Enterprise applications** hold **service principal objects** -- the local instance of an app in a tenant. This is where an admin configures single sign-on, user assignment, and provisioning.
- **User consent management** -- review and limit which apps users can approve; regularly audit permissions; enforce least privilege for apps.

**One-line exam distinction:** an app registration defines what the app **IS**; an enterprise application defines how that app is **USED and GOVERNED** in your tenant.

---

## Portal Reference (verified 2026-07-26)

| Surface | URL | Notes |
|---------|-----|-------|
| Microsoft 365 admin center | admin.microsoft.com | `admin.cloud.microsoft` is also live and current; Learn procedures increasingly link it |
| Microsoft Entra admin center | entra.microsoft.com | Left navigation: Entra ID, ID Protection, ID Governance, Verified ID, Global Secure Access |
| Microsoft Defender portal | security.microsoft.com | Official name is "Microsoft Defender portal". Microsoft Defender XDR is a service **inside** the portal, not the portal name |
| Microsoft Purview portal | purview.microsoft.com | Single URL for every Purview solution; reach each one via **Solutions > _solution name_** |
| Exchange admin center | admin.exchange.microsoft.com | Abbreviated EAC in Microsoft docs |
| SharePoint admin center | admin.microsoft.com/sharepoint | Tenant host `https://<tenant>-admin.sharepoint.com` also resolves |
| Microsoft Teams admin center | admin.teams.microsoft.com | |

**Retired, do NOT demo:** `compliance.microsoft.com` (the retired Microsoft Purview compliance portal) and `protection.office.com` (the retired Office 365 Security & Compliance Center, now split across the Defender portal, the Purview portal, and the Exchange admin center).

**Services in the Microsoft Defender portal:** Microsoft Defender XDR, Microsoft Sentinel, Microsoft Defender Threat Intelligence, Microsoft Security Exposure Management, and Microsoft Defender for Cloud. Microsoft Sentinel is now generally available in the Defender portal **with or without** Microsoft Defender XDR or an E5 license.

**Network note for live demos:** Microsoft is consolidating user-facing Microsoft 365 apps and services onto the `*.cloud.microsoft` domain, and admin centers are part of that migration. Allow lists must include `*.cloud.microsoft`, `*.static.microsoft`, and `*.usercontent.microsoft`.

---

## Baseline Security Mode (new since most course materials)

**Baseline security mode (BSM)** is a Microsoft 365 admin center feature at **admin.microsoft.com > ... Show all > Settings > Org Settings > Security and Privacy tab > Baseline Security Mode**. It is available on all Microsoft 365 subscriptions and plans and bundles recommended security settings across Microsoft 365 apps, SharePoint and OneDrive, Teams, Exchange Online, and the Microsoft Entra identity platform.

- Two BSM settings surface in Microsoft Entra as Conditional Access policies: **Require phishing resistant authentication for admins** and **Block legacy authentication**. Both show **Baseline security mode** in the **Created by** column.
- Unlike Microsoft-managed policies, BSM policies are attributed to the **administrator**, not Microsoft, and are managed from the Microsoft 365 admin center.
- **Known artifact:** tenants that accessed Baseline Security Mode between November 2025 and early February 2026 might show two draft Conditional Access policies in a Disabled state, attributed to the admin who visited the BSM page. Microsoft states this is not a security incident and a fix is in progress.

**Retired capability:** legacy browser authentication using the Relying Party Suite (RPS) protocol was deprecated for enterprise tenants as of October 2025. `Set-SPOTenant -LegacyBrowserAuthProtocolsEnabled` can no longer be set to true.
