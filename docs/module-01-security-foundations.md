# Module 1: Explore Microsoft 365 Security Foundations

**Learning Path:** Explore Microsoft 365 Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/explore-microsoft-365-security-foundations/
**AB-900 Domain:** 1 -- Identify the core features and objects of Microsoft 365 services (30-35%)

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
| **Infrastructure** | Defender for Cloud (security posture, multicloud support including AWS and GCP); Azure Policy for governance (restrict VM sizes, enforce tagging, require encryption) |
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
- **Self-Service Password Reset (SSPR)** -- users reset own passwords via registered methods (phone, Authenticator); reduces helpdesk calls
- **Microsoft Entra Identity Protection** -- ML-based detection of risky sign-ins; auto-blocks, requires extra verification, or flags for review

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
| **Entra Permissions Management** | Multicloud permissions visibility (Azure, AWS, GCP) |
| **Entra Internet Access / Private Access** | Cloud-based VPN and proxy replacements using Zero Trust |

### Conditional Access -- Deep Dive

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
- Dashboard-based metric of identity security posture
- Security recommendations (enforce MFA, remove stale accounts, block legacy protocols, configure Conditional Access)
- Improvement actions with step-by-step guidance
- Action statuses: Completed, Planned, Resolved via Third Party, Risk Accepted
- Benchmarking tools -- compare against similar organizations by industry, region, size

### Privileged Identity Management (PIM) -- Deep Dive
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
- Accessible via **Microsoft Purview portal** and PowerShell
- Requires **Audit Logs** role or **View-Only Audit Logs** role
- Filter by activities, users, date ranges, services
- Includes timestamps, user IDs, IP addresses, detailed event info
- Key use cases: track unauthorized file access, monitor admin role assignments, track policy changes
- PowerShell: `Search-UnifiedAuditLog` cmdlet for automated queries and exports
- Integration with Microsoft Sentinel for real-time alerting

### App Registrations and Enterprise Applications
- **App Registrations** -- define how an app connects to M365 and what it can access; specify account types and required permissions; secured with client secrets or certificates (rotate regularly)
- **Enterprise Applications** -- service principals instantiated in a tenant; represent the actual app instance users and admins interact with
- **User consent management** -- review and limit which apps users can approve; regularly audit permissions; enforce least privilege for apps
