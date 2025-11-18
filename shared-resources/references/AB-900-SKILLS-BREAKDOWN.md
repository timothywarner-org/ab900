# AB-900 Exam Skills - Complete Breakdown

## Exam Structure Overview

**Total Duration:** 45 minutes
**Passing Score:** 700/1000
**Question Types:** Multiple choice, multiple response, interactive scenarios, drag-and-drop, case studies

### Domain Weights
| Domain | Weight | Focus |
|--------|--------|-------|
| Domain 1: Core M365 Features & Objects | 30-35% | Foundation services and security |
| Domain 2: Data Protection & Governance | 35-40% | **LARGEST** - Purview, Copilot data security |
| Domain 3: Copilot & Agent Administration | 25-30% | Copilot/agent deployment and management |

---

# Domain 1: Identify Core Features and Objects of Microsoft 365 Services (30-35%)

## Section 1.1: Identify the Core Objects of Microsoft 365 Services

### Skill: Explain how license types assigned to users and groups affect access to Microsoft 365 features

**What You Need to Know:**
- Different license tiers provide different feature access
- License assignment can be individual or group-based
- Some features require specific licenses (e.g., Copilot requires base M365 license + add-on)

**Key Concepts:**

#### License Types and Feature Access

| License | Key Features | Copilot Eligible |
|---------|--------------|------------------|
| **Microsoft 365 E3** | Office apps, Teams, Exchange, SharePoint, OneDrive, basic security | ✅ Yes |
| **Microsoft 365 E5** | All E3 + advanced security, analytics, compliance, phone system | ✅ Yes |
| **Microsoft 365 Business Basic** | Web/mobile Office, Teams, Exchange, OneDrive, SharePoint | ✅ Yes (Business tiers) |
| **Microsoft 365 Business Standard** | All Basic + desktop Office apps | ✅ Yes |
| **Microsoft 365 Business Premium** | All Standard + advanced security, device management | ✅ Yes |
| **Office 365 E1** | Online Office apps only, Exchange, SharePoint, Teams | ✅ Yes |
| **Office 365 E3** | Desktop Office apps + online, Exchange, SharePoint, Teams | ✅ Yes |
| **Office 365 E5** | All E3 + advanced features | ✅ Yes |

#### License Assignment Impact Examples:
- **No Exchange Online license** → Cannot access email or mailbox
- **No Teams license** → Cannot use Teams chat or meetings
- **No SharePoint license** → Cannot access SharePoint sites or OneDrive
- **No Copilot add-on** → Cannot use Copilot features even with base M365 license
- **Group-based licensing** → Automatic assignment based on group membership
- **Direct licensing** → Manual assignment to individual users

**Hands-On:**
- Navigate to M365 Admin Center → Billing → Licenses
- View available licenses and assigned users
- Assign license to user: Users → Active users → Select user → Licenses and apps
- Create security group and assign licenses to group
- Understand 24-hour delay for Copilot license activation

**Documentation:** https://learn.microsoft.com/en-us/microsoft-365/admin/manage/assign-licenses-to-users

---

### Skill: Explore the organization configurations by using the Microsoft 365 admin center (domain names and org settings)

**What You Need to Know:**
- Microsoft 365 admin center is the central hub for M365 administration
- Domain names determine email addresses and service URLs
- Organizational settings control tenant-wide configurations

**Key Concepts:**

#### Domain Names
- **Primary domain:** Default domain for new users (e.g., contoso.onmicrosoft.com)
- **Custom domains:** Add your own domains (e.g., contoso.com)
- **Domain verification:** Prove ownership via DNS TXT or MX records
- **Domain services:** Email, Teams, SharePoint use domains
- **Domain federation:** Connect to on-premises Active Directory

#### Organization Settings (Settings → Org settings)
- **Organization profile:**
  - Organization name
  - Contact information
  - Preferred language and time zone
  - Data location

- **Services & add-ins:**
  - Calendar
  - Cortana
  - Microsoft 365 groups
  - SharePoint
  - User owned apps and services
  - Microsoft 365 installation options

- **Security & privacy:**
  - Password expiration policy
  - Customer Lockbox
  - Sharing settings
  - Privacy profile

**Hands-On:**
- Navigate to Setup → Domains
- View domain details and DNS records
- Add custom domain (if available)
- Navigate to Settings → Org settings
- Review organization profile
- Check services configuration

**Admin Center URL:** https://admin.microsoft.com

---

### Skill: Identify the appropriate objects to configure by using the Exchange Online admin center (mailboxes and distribution lists)

**What You Need to Know:**
- Exchange Admin Center (EAC) manages email and calendar services
- Different mailbox types serve different purposes
- Distribution lists enable email to groups of users

**Key Concepts:**

#### Mailbox Types

1. **User Mailboxes**
   - Primary mailbox for individual users
   - Includes email, calendar, contacts, tasks
   - Assigned via license
   - Default 50 GB storage (varies by license)

2. **Shared Mailboxes**
   - Shared email address (e.g., info@contoso.com, support@contoso.com)
   - Multiple users can access
   - No separate license required (up to 50 GB)
   - Users need "Full Access" and "Send As" permissions
   - Use cases: Team email, departmental email, service accounts

3. **Resource Mailboxes**
   - **Room mailboxes:** Conference rooms, meeting spaces
   - **Equipment mailboxes:** Projectors, vehicles, laptops
   - Integrated with calendar for booking
   - Automatic accept/decline rules

4. **Archive Mailboxes**
   - Additional storage for compliance
   - In-place archiving
   - Requires E3/E5 or archive add-on license

#### Distribution Lists

1. **Distribution Groups**
   - Email to multiple recipients
   - Static membership (manually managed)
   - Use cases: Department lists, project teams

2. **Microsoft 365 Groups**
   - Modern replacement for distribution groups
   - Includes shared mailbox, calendar, files, OneNote, Planner
   - Dynamic membership options
   - Integration with Teams

3. **Mail-Enabled Security Groups**
   - Combine email capability with security permissions
   - Use for both distribution and access control

4. **Dynamic Distribution Groups**
   - Membership based on filter rules (e.g., department=Sales)
   - Automatically updated

**Hands-On:**
- Open Exchange Admin Center: https://admin.exchange.microsoft.com
- Create shared mailbox: Recipients → Mailboxes → Add shared mailbox
- Assign permissions to shared mailbox
- Create distribution list: Recipients → Groups → Add group
- Add members to distribution list
- Test sending email to distribution list

**Common Tasks:**
- Grant "Send As" permission on shared mailbox
- Set mailbox storage quotas
- Enable/disable automatic replies
- Configure mailbox delegation
- Export mailbox to PST

**Documentation:** https://learn.microsoft.com/en-us/exchange/exchange-online

---

### Skill: Identify the appropriate objects to configure by using the SharePoint in Microsoft 365 admin center (sites, libraries, and folders)

**What You Need to Know:**
- SharePoint organizes content into sites, libraries, and folders
- Sites are containers for content and collaboration
- Libraries store documents, media, and other files
- Folders organize files within libraries

**Key Concepts:**

#### SharePoint Sites

1. **Team Sites**
   - Collaboration workspace for teams
   - Automatically created with Microsoft 365 Groups and Teams
   - Includes document library, lists, pages
   - Private by default (members only)

2. **Communication Sites**
   - Broadcast information to broad audience
   - News, announcements, policies
   - One-to-many communication
   - Modern, mobile-friendly design

3. **Hub Sites**
   - Connect related sites
   - Shared navigation and branding
   - Aggregate content across sites
   - Organizational structure

#### Document Libraries
- **Default library:** "Documents" created with every site
- **Custom libraries:** Create for specific content types
- **File storage:** Office docs, PDFs, images, videos
- **Features:**
  - Version history
  - Check-in/check-out
  - Metadata columns
  - Views and filters
  - Content types

#### Folders
- **Traditional organization:** Hierarchical structure
- **Modern alternative:** Metadata and views (preferred)
- **Use cases:** Organize related files
- **Limitations:** Can complicate permissions and search

**SharePoint Structure:**
```
Tenant
└── Site Collection (root)
    ├── Site
    │   ├── Document Library
    │   │   ├── Folder
    │   │   │   └── Files
    │   │   └── Files
    │   └── Lists
    └── Subsites
```

**Hands-On:**
- Open SharePoint Admin Center: https://admin.microsoft.com/sharepoint
- View active sites: Sites → Active sites
- Create site: Create → Team site or Communication site
- Navigate to site
- Create document library: New → Document library
- Create folder within library
- Upload files

**Common Objects:**
- **Lists:** Structured data (tasks, issues, contacts)
- **Pages:** Web pages with web parts
- **Apps:** Extend site functionality

**Documentation:** https://learn.microsoft.com/en-us/sharepoint/

---

### Skill: Identify the appropriate roles and permissions for sites in SharePoint in Microsoft 365

**What You Need to Know:**
- SharePoint uses permission levels assigned to users/groups
- Permission inheritance flows from site to library to folder to file
- Breaking inheritance creates unique permissions

**Key Concepts:**

#### Default Permission Levels

| Permission Level | Capabilities | Typical Use |
|-----------------|--------------|-------------|
| **Full Control** | Complete control, change permissions, delete | Site owners, administrators |
| **Design** | View, add, update, delete, approve, customize | Designers, power users |
| **Edit** | View, add, update, delete items | Team members, contributors |
| **Contribute** | View, add, update, delete own items | Standard users |
| **Read** | View only, download | Read-only users, guests |
| **View Only** | View, cannot download | Highly restricted access |

#### Default SharePoint Groups

1. **[Site Name] Owners**
   - Permission Level: Full Control
   - Can change site settings, permissions
   - Manage site features

2. **[Site Name] Members**
   - Permission Level: Edit
   - Can add/edit/delete content
   - Standard contributors

3. **[Site Name] Visitors**
   - Permission Level: Read
   - Can view content
   - No editing capability

#### Permission Inheritance

```
Site (Full Control)
└── Library (Inherited)
    ├── Folder (Inherited)
    │   └── File (Inherited)
    └── Folder (Unique - Broken inheritance)
        └── File (Inherited from parent folder)
```

**Breaking Inheritance:**
- Site, library, folder, or file can have unique permissions
- "Stop inheriting permissions" breaks link to parent
- Use cases: Confidential folders, HR documents, executive content

**Best Practices:**
- Use groups instead of individual users
- Minimize broken inheritance (complicates management)
- Regular permission audits
- Document permission structure

**Hands-On:**
- Navigate to SharePoint site
- Site Settings → Site permissions
- View permission levels and groups
- Add user to group
- Navigate to library → Library settings → Permissions
- Check if inheriting or unique
- Break inheritance on folder (for testing only)
- Restore inheritance

**Common Scenarios:**
- **Team collaboration:** Members (Edit), Visitors (Read)
- **Department site:** Dept members (Edit), Others (Read)
- **Confidential:** Select users (Contribute), Others (No access)
- **Public news:** Everyone (Read)

**Documentation:** https://learn.microsoft.com/en-us/sharepoint/modern-experience-sharing-permissions

---

### Skill: Identify the appropriate objects to configure by using the Teams admin center (teams, channels, and policies)

**What You Need to Know:**
- Teams Admin Center manages Microsoft Teams environment
- Teams contain channels for organized conversations
- Policies control user capabilities and settings

**Key Concepts:**

#### Teams Structure

**Team:**
- Collaboration workspace for group of people
- Automatically creates Microsoft 365 Group
- Includes:
  - SharePoint site
  - Shared mailbox
  - OneNote notebook
  - Planner board

**Team Types:**
- **Private:** Invitation required to join
- **Public:** Anyone in org can join
- **Org-wide:** Automatic membership for everyone (max 10,000 users)

**Channels:**
- Dedicated sections within a team
- **Standard channels:** Conversations and files
- **Private channels:** Subset of team members, separate SharePoint site
- **Shared channels:** Collaborate with people outside team (even external orgs)

**Example Structure:**
```
Marketing Team (Private)
├── General (default channel)
├── Campaigns (standard channel)
├── Budget (private channel - Finance access only)
└── Agency Collaboration (shared channel - external partners)
```

#### Teams Admin Center Objects

**Teams:**
- View and manage all teams
- Team membership
- Channels within teams
- Settings and policies applied

**Channels:**
- Standard, private, shared channels
- Channel membership (for private/shared)
- Channel moderation settings

**Policies:**

1. **Messaging Policies**
   - Delete sent messages
   - Edit sent messages
   - Use Giphy, stickers, memes
   - Chat permissions

2. **Meeting Policies**
   - Allow Meet Now
   - Allow channel meeting scheduling
   - Allow private meeting scheduling
   - Recording permissions
   - Transcription settings
   - Copilot in meetings

3. **App Policies**
   - Installed apps
   - Pinned apps
   - Custom apps
   - Third-party apps

4. **Calling Policies**
   - Make private calls
   - Call forwarding
   - Voicemail
   - Call groups

5. **Live Events Policies**
   - Schedule live events
   - Recording settings
   - Attendee controls

**Hands-On:**
- Open Teams Admin Center: https://admin.teams.microsoft.com
- Navigate to Teams → Manage teams
- View team details, members, channels
- Navigate to Messaging policies
- Review "Global (Org-wide default)" policy
- Create custom messaging policy
- Assign policy to user or group
- Navigate to Meetings → Meeting policies
- Configure Copilot in Teams meetings setting

**Common Admin Tasks:**
- Create org-wide team
- Configure guest access
- Enable/disable apps
- Set meeting recording permissions
- Control who can create teams

**Documentation:** https://learn.microsoft.com/en-us/microsoftteams/

---

## Section 1.2: Understand the Microsoft 365 Security Principles

### Skill: Explain the core Zero Trust principles

**What You Need to Know:**
- Zero Trust assumes breach and verifies each request
- Replaces "trust but verify" with "never trust, always verify"
- Essential security model for modern cloud environments

**Key Concepts:**

#### Three Core Zero Trust Principles

1. **Verify Explicitly**
   - Always authenticate and authorize
   - Use all available data points: identity, location, device, data classification, anomalies
   - Context-aware access decisions
   - Examples:
     - MFA for all users
     - Conditional Access policies
     - Device compliance checks
     - Risk-based authentication

2. **Use Least Privilege Access**
   - Just-in-time (JIT) access
   - Just-enough-access (JEA)
   - Time-bound permissions
   - Minimize user permissions to only what's needed
   - Examples:
     - Privileged Identity Management (PIM)
     - Role-based access control (RBAC)
     - Regularly review permissions
     - Remove standing admin access

3. **Assume Breach**
   - Minimize blast radius
   - Segment access
   - End-to-end encryption
   - Analytics for threat detection
   - Examples:
     - Network segmentation
     - Micro-segmentation
     - Threat intelligence
     - Continuous monitoring and logging
     - Incident response readiness

#### Zero Trust in Microsoft 365

**Identity:**
- Microsoft Entra ID for identity verification
- Conditional Access for policy enforcement
- MFA for strong authentication
- Risk-based access controls

**Devices:**
- Intune for device management
- Compliance policies
- Conditional Access device controls
- App protection policies

**Applications:**
- Cloud App Security (Defender for Cloud Apps)
- OAuth app governance
- App-based Conditional Access

**Data:**
- Sensitivity labels
- Data Loss Prevention (DLP)
- Information Protection
- Encryption

**Infrastructure:**
- Defender for Endpoint
- Defender for Cloud
- Threat protection

**Network:**
- Private Access
- Internet Access
- Security Service Edge (SSE)

**Zero Trust Maturity Model:**
```
Traditional → Initial → Advanced → Optimal
```

**Hands-On Verification:**
- Review Conditional Access policies: Entra Admin → Protection → Conditional Access
- Check MFA enforcement: Entra Admin → Users → Per-user MFA
- Review device compliance: Intune Admin → Devices → Compliance policies
- Verify least privilege: Entra Admin → Roles and administrators

**Documentation:** https://learn.microsoft.com/en-us/security/zero-trust/zero-trust-overview

---

### Skill: Understand authorization

**What You Need to Know:**
- Authorization determines what authenticated users can access
- Different from authentication (who you are) vs authorization (what you can do)
- Role-Based Access Control (RBAC) is primary authorization model

**Key Concepts:**

#### Authorization vs Authentication

| Authentication | Authorization |
|----------------|---------------|
| **Who** you are | **What** you can do |
| Login, password, MFA | Permissions, roles, policies |
| First step | Second step |
| Identity verification | Access control |

#### Authorization Models in M365

**1. Role-Based Access Control (RBAC)**
- Assign roles to users
- Roles define permissions
- Examples:
  - Global Administrator
  - SharePoint Administrator
  - Exchange Administrator
  - User Administrator

**2. Permission-Based**
- Direct permissions on resources
- SharePoint: Full Control, Edit, Read
- Exchange: Full Access, Send As, Send on Behalf

**3. Attribute-Based Access Control (ABAC)**
- Access based on attributes
- User attributes: Department, Location, Job Title
- Resource attributes: Classification, Sensitivity
- Examples:
  - Conditional Access policies
  - Sensitivity label policies

#### Microsoft Entra Roles (Admin Roles)

**Global Administrator:**
- Full access to all features
- Can reset any user password
- Assign any admin role
- Limit number of Global Admins

**Exchange Administrator:**
- Manage Exchange Online
- Mailboxes, groups, transport rules
- Cannot manage other M365 services

**SharePoint Administrator:**
- Manage SharePoint and OneDrive
- Create/delete sites, manage settings
- Cannot manage Exchange or Teams

**Teams Administrator:**
- Manage Teams service
- Policies, settings, team creation
- Cannot manage underlying SharePoint

**Security Administrator:**
- Manage security features
- Security policies, threat management
- Cannot manage non-security features

**Compliance Administrator:**
- Manage compliance features
- DLP, retention, eDiscovery
- Cannot manage security policies

**Best Practices:**
- Principle of least privilege
- Use specific admin roles (not Global Admin)
- Limit number of Global Admins (max 3-5)
- Use Privileged Identity Management (PIM) for JIT access
- Regular access reviews
- Document role assignments

**Hands-On:**
- Navigate to Entra Admin → Roles and administrators
- View all admin roles
- Click role to see members
- Assign role to user (test environment)
- Check user's permissions in target service

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/

---

### Skill: Understand authentication methods

**What You Need to Know:**
- Authentication proves user identity
- Multiple methods available with varying security levels
- Multi-factor authentication (MFA) is critical for security

**Key Concepts:**

#### Authentication Methods in Microsoft 365

**1. Password**
- Traditional username + password
- Weakest method alone
- Vulnerable to phishing, brute force
- Should always combine with MFA

**2. Multi-Factor Authentication (MFA)**
- Requires 2+ verification factors:
  - Something you know (password)
  - Something you have (phone, security key)
  - Something you are (biometrics)

**MFA Methods:**

| Method | Security Level | User Experience | Use Case |
|--------|---------------|-----------------|----------|
| **Microsoft Authenticator App** | High | Push notification or code | Recommended for most users |
| **SMS Text Message** | Medium | Code via text | Fallback option |
| **Phone Call** | Medium | Automated call | Users without smartphones |
| **OATH Hardware Token** | High | Physical device generates code | High-security environments |
| **FIDO2 Security Key** | Highest | Physical USB/NFC key | Passwordless, most secure |
| **Windows Hello** | High | Biometrics or PIN | Windows devices |

**3. Windows Hello for Business**
- Biometric authentication (face, fingerprint)
- Device-based PIN
- Replaces passwords
- Public/private key cryptography

**4. Certificate-Based Authentication**
- X.509 certificates
- Smart cards
- High-security scenarios
- Requires PKI infrastructure

**5. Passwordless Authentication**
- No password needed
- Methods:
  - Microsoft Authenticator (passwordless)
  - FIDO2 security keys
  - Windows Hello for Business
  - Certificate-based

**6. Single Sign-On (SSO)**
- Authenticate once, access multiple apps
- Seamless user experience
- Based on token-based authentication
- Reduces password fatigue

#### Authentication Protocols

**Modern Authentication:**
- OAuth 2.0 and OpenID Connect
- Token-based
- Supports MFA and Conditional Access
- Required for Microsoft 365

**Legacy Authentication:**
- Basic authentication (deprecated)
- No MFA support
- Security risk
- Blocked by default in new tenants

**Hands-On:**
- Entra Admin → Users → Per-user MFA
- View MFA status for users
- Entra Admin → Protection → Authentication methods
- Configure available methods (Authenticator, SMS, FIDO2)
- Set default method
- Enable passwordless authentication
- User self-service: https://mysignins.microsoft.com/security-info

**Common Configurations:**
- Enable Microsoft Authenticator for all users
- Disable SMS (less secure)
- Enable FIDO2 security keys for admins
- Block legacy authentication

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/authentication/concept-authentication-methods

---

### Skill: Understand threat protection and intelligence

**What You Need to Know:**
- Threat protection defends against attacks targeting M365
- Threat intelligence provides insights into attack patterns
- Multiple layers of protection across email, identities, endpoints, data

**Key Concepts:**

#### Microsoft Defender XDR (Extended Detection and Response)

**Integrated Protection:**
- Defender for Office 365 (Email & collaboration)
- Defender for Identity (Identity-based attacks)
- Defender for Endpoint (Devices)
- Defender for Cloud Apps (Cloud applications)
- Unified portal: https://security.microsoft.com

#### Threat Protection Layers

**1. Email Protection (Defender for Office 365)**
- **Anti-phishing:** Detect impersonation and spoofing
- **Anti-spam:** Block unwanted email
- **Anti-malware:** Scan attachments for viruses
- **Safe Attachments:** Detonate files in sandbox
- **Safe Links:** Check URLs at click time
- **Zero-hour auto purge (ZAP):** Remove malicious emails after delivery

**2. Identity Protection (Defender for Identity)**
- Monitor on-premises AD for attacks
- Detect compromised identities
- Lateral movement detection
- Suspicious activities
- Integration with Entra ID Protection

**3. Endpoint Protection (Defender for Endpoint)**
- Antivirus and anti-malware
- Attack surface reduction
- Endpoint detection and response (EDR)
- Automated investigation and remediation
- Threat & vulnerability management

**4. Cloud App Protection (Defender for Cloud Apps)**
- Cloud Access Security Broker (CASB)
- Shadow IT discovery
- OAuth app governance
- App-to-app protection
- Data protection for SaaS apps

#### Threat Intelligence

**Microsoft Threat Intelligence:**
- **Global insights:** 65+ trillion signals per day
- **Research:** Microsoft Security Response Center
- **Threat actors:** Track known threat groups
- **Indicators of Compromise (IoCs):** IPs, domains, file hashes
- **Threat analytics:** Actionable reports

**Threat Intelligence Features:**
- Threat Explorer (Defender for Office 365)
- Threat analytics (Microsoft 365 Defender)
- Advanced hunting (KQL queries)
- Incident investigation
- Threat tracking

**Security Capabilities:**

| Feature | Purpose | Location |
|---------|---------|----------|
| **Attack Simulation** | Train users to recognize phishing | Microsoft 365 Defender → Attack simulation training |
| **Secure Score** | Measure security posture | Microsoft 365 Defender → Secure Score |
| **Incidents** | Correlated alerts | Microsoft 365 Defender → Incidents |
| **Threat Analytics** | Intelligence reports | Microsoft 365 Defender → Threat analytics |
| **Hunting** | Proactive threat search | Microsoft 365 Defender → Hunting |

**Hands-On:**
- Navigate to https://security.microsoft.com
- Review Secure Score
- Check recent incidents and alerts
- Explore Threat analytics
- Email & collaboration → Policies & rules → Threat policies
- Review anti-phishing, anti-spam, anti-malware policies
- Launch Attack simulation training

**Common Threat Scenarios:**
- **Phishing:** Fake emails to steal credentials
- **Business Email Compromise (BEC):** CEO fraud, invoice scams
- **Ransomware:** Encrypt files, demand payment
- **Account takeover:** Compromised credentials
- **Insider threat:** Malicious or negligent insiders
- **Data exfiltration:** Stealing sensitive data

**Documentation:** https://learn.microsoft.com/en-us/microsoft-365/security/

---

### Skill: Understand features and capabilities of Microsoft Defender XDR

**What You Need to Know:**
- Microsoft Defender XDR (Extended Detection and Response) unifies security across M365
- Provides coordinated defense and automated response
- Central portal for all security operations

**Key Concepts:**

#### Microsoft Defender XDR Components

**1. Microsoft Defender for Office 365**
- Plans: Plan 1 (protection), Plan 2 (investigation + response)
- **Protection:**
  - Safe Attachments
  - Safe Links
  - Anti-phishing (impersonation protection)
  - Spoof intelligence
- **Investigation:**
  - Threat Explorer
  - Email entity page
  - Campaign views
- **Response:**
  - Automated Investigation and Response (AIR)
  - Threat remediation

**2. Microsoft Defender for Identity**
- Monitors on-premises Active Directory
- Detects:
  - Compromised credentials
  - Lateral movement attempts
  - Domain dominance attacks (Golden Ticket, etc.)
- Sensor deployment on domain controllers
- Integration with Entra ID Protection

**3. Microsoft Defender for Endpoint**
- Endpoint detection and response (EDR)
- **Features:**
  - Next-gen antivirus
  - Attack surface reduction rules
  - Device isolation
  - Live response (remote shell)
  - Threat & vulnerability management
- Supported platforms: Windows, macOS, Linux, iOS, Android

**4. Microsoft Defender for Cloud Apps**
- Cloud Access Security Broker (CASB)
- **Capabilities:**
  - Discover and control shadow IT
  - Protect sensitive information
  - Protect against cyberthreats
  - Assess compliance
- App connectors for SaaS apps
- OAuth app governance

#### Unified Capabilities

**Incidents:**
- Correlated alerts across products
- Single incident for multi-stage attack
- Attack story visualization
- Automated investigation
- Response actions

**Advanced Hunting:**
- Kusto Query Language (KQL)
- Query across 30 days of data
- Create custom detections
- Proactive threat hunting

**Threat Analytics:**
- Real-time reports on emerging threats
- Analyst reports with mitigations
- Impacted devices and users
- Exposure and recommendations

**Secure Score:**
- Numerical score (0-100%) representing security posture
- Improvement actions with points
- Comparison to benchmarks
- Track progress over time

**Automated Investigation and Response (AIR):**
- Triggered by alerts
- Investigates entities (users, devices, emails, files)
- Determines verdict (malicious, suspicious, clean)
- Recommends or automatically applies remediation
- Action center for approval

**Action Center:**
- Pending actions requiring approval
- History of completed actions
- Unified view across all Defender products

**Microsoft Defender Portal:**
- Unified URL: https://security.microsoft.com
- Single pane of glass
- Role-based access control
- Customizable dashboards

#### Key Features by Plan

| Feature | Defender for Office 365 P1 | Defender for Office 365 P2 |
|---------|---------------------------|---------------------------|
| Safe Attachments | ✅ | ✅ |
| Safe Links | ✅ | ✅ |
| Anti-phishing | ✅ | ✅ |
| Threat Explorer | ❌ | ✅ |
| Automated Investigation | ❌ | ✅ |
| Attack Simulation Training | ❌ | ✅ |
| Threat Trackers | ❌ | ✅ |

**Hands-On:**
- Navigate to https://security.microsoft.com
- Explore Home dashboard
- View Incidents & alerts
- Check Secure Score and improvement actions
- Email & collaboration → Threat Explorer (if P2)
- Assets → Devices (Defender for Endpoint)
- Assets → Identities (Defender for Identity)
- Cloud apps (Defender for Cloud Apps)
- Advanced hunting → Run query
- Action center → Pending actions

**Common Use Cases:**
- Investigate phishing email: Threat Explorer → Email entity page
- Respond to ransomware: Incident → Automated investigation → Device isolation
- Hunt for threats: Advanced hunting → Query for suspicious PowerShell
- Improve posture: Secure Score → Implement actions
- Test security: Attack simulation training → Launch phishing simulation

**Documentation:** https://learn.microsoft.com/en-us/microsoft-365/security/defender/

---

## Section 1.3: Identify the Core Security Features of Microsoft 365 Services

### Skill: Understand features and capabilities of Microsoft Entra

**What You Need to Know:**
- Microsoft Entra (formerly Azure AD) is the identity and access management service
- Central to all M365 security
- Provides authentication, authorization, and identity protection

**Key Concepts:**

#### Microsoft Entra ID Core Features

**1. Identity Management**
- **Users:** Individual identities with credentials
- **Groups:**
  - Security groups (access control)
  - Microsoft 365 Groups (collaboration)
  - Dynamic groups (rule-based membership)
  - Assigned groups (manual membership)
- **Service principals:** Application identities
- **Managed identities:** For Azure resources

**2. Authentication Services**
- User authentication
- Multi-factor authentication (MFA)
- Self-service password reset (SSPR)
- Password protection (banned passwords)
- Smart lockout (brute force protection)

**3. Conditional Access**
- Policy-based access control
- Conditions: User, location, device, app, risk
- Controls: Block, require MFA, require compliant device, etc.

**4. Single Sign-On (SSO)**
- Access multiple apps with one login
- Support for SAML, OAuth, OpenID Connect, WS-Fed
- Enterprise app gallery (thousands of pre-integrated apps)
- Custom app integration

**5. Identity Protection**
- **Risk detections:**
  - User risk: Leaked credentials, unusual behavior
  - Sign-in risk: Atypical travel, anonymous IP, malware-linked IP
- **Risk-based Conditional Access:**
  - Require MFA for medium/high sign-in risk
  - Block or require password change for high user risk
- **Investigation:**
  - Risky users report
  - Risky sign-ins report
  - Risk detections report

**6. Privileged Identity Management (PIM)**
- Just-in-time admin access
- Time-bound role assignments
- Approval workflow for activation
- Access reviews
- Audit trail

**7. Identity Governance**
- **Entitlement Management:**
  - Access packages
  - Automated provisioning/deprovisioning
  - Guest access lifecycle
- **Access Reviews:**
  - Periodic review of group memberships
  - Application assignments
  - Admin role assignments
- **Lifecycle Workflows:**
  - Automate joiner/mover/leaver processes
  - Pre-hire, onboarding, offboarding tasks

**8. B2B Collaboration (Guest Access)**
- Invite external users
- Guest accounts in your directory
- Controlled access to resources
- Cross-tenant collaboration

**9. B2C (Customer Identity)**
- Consumer-facing applications
- Social identity providers
- Custom branding
- Separate from B2B

#### Microsoft Entra ID Editions

| Feature | Free | P1 | P2 |
|---------|------|----|----|
| Users and groups | ✅ | ✅ | ✅ |
| SSO | ✅ | ✅ | ✅ |
| Self-service password reset | Cloud only | ✅ Hybrid | ✅ Hybrid |
| Conditional Access | ❌ | ✅ | ✅ |
| PIM | ❌ | ❌ | ✅ |
| Identity Protection | ❌ | ❌ | ✅ |
| Access Reviews | ❌ | ❌ | ✅ |

**Microsoft Entra Suite:**
- Entra ID P2
- Entra ID Governance
- Entra Private Access
- Entra Internet Access
- Entra Permissions Management
- Entra Verified ID

**Hands-On:**
- Navigate to https://entra.microsoft.com
- Identity → Users → All users
- Identity → Groups → All groups
- Protection → Conditional Access
- Protection → Identity Protection
- Identity Governance → PIM
- Applications → Enterprise applications
- Review sign-in logs: Monitoring → Sign-in logs
- Check audit logs: Monitoring → Audit logs

**Common Admin Tasks:**
- Create user: Identity → Users → New user
- Create group: Identity → Groups → New group
- Assign app to user: Applications → Enterprise apps → Select app → Users and groups
- Configure SSPR: Protection → Password reset
- Review risky sign-ins: Protection → Identity Protection → Risky sign-ins

**Documentation:** https://learn.microsoft.com/en-us/entra/fundamentals/

---

### Skill: Understand conditional access policies

**What You Need to Know:**
- Conditional Access is policy-based access control
- "If-then" statements: IF user tries to access resource, THEN apply controls
- Critical for Zero Trust implementation

**Key Concepts:**

#### Conditional Access Policy Structure

**Assignments (Conditions):**
```
IF User/Group
AND Cloud app/action
AND Conditions:
  - User risk level
  - Sign-in risk level
  - Device platform
  - Location
  - Client apps
  - Device state
```

**Access Controls (Then):**
```
THEN Grant OR Block
  - Require MFA
  - Require compliant device
  - Require hybrid Azure AD joined device
  - Require app protection policy
  - Require password change
  - Block access
```

#### Policy Components in Detail

**1. Users and Groups**
- **Include:**
  - All users
  - Select users and groups
  - Guest and external users
- **Exclude:**
  - Emergency access accounts (break-glass)
  - Service accounts
  - Specific users/groups

**2. Cloud Apps or Actions**
- **All cloud apps** (not recommended for first policy)
- **Select apps:** Office 365, Azure Management, etc.
- **User actions:** Register security information, Join devices

**3. Conditions**

**Sign-in risk (requires Entra ID P2 & Identity Protection):**
- No risk, Low, Medium, High
- Based on real-time and offline detection

**Device platforms:**
- Android, iOS, Windows, macOS, Linux
- Use case: Block Linux devices from accessing finance data

**Locations:**
- Named locations (trusted IPs)
- Countries/regions
- All locations
- Use case: Block access from non-trusted countries

**Client apps:**
- Browser
- Mobile apps and desktop clients
- Exchange ActiveSync
- Other clients (legacy auth)

**Device state:**
- Compliant (Intune)
- Hybrid Azure AD joined
- Use case: Only allow compliant devices

**4. Grant Controls**

**Grant access with requirements:**
- Require MFA
- Require device to be marked as compliant
- Require hybrid Azure AD joined device
- Require approved client app
- Require app protection policy
- Require password change

**Require multiple controls:**
- Require ALL selected (most restrictive)
- Require ONE of selected

**5. Session Controls**
- Use app-enforced restrictions
- Use Conditional Access App Control
- Sign-in frequency
- Persistent browser session
- Customize continuous access evaluation

#### Common Conditional Access Policies

**1. Require MFA for all users:**
- Users: All users (exclude break-glass)
- Apps: All cloud apps
- Grant: Require MFA

**2. Require MFA for admins:**
- Users: Directory roles (Global Admin, etc.)
- Apps: All cloud apps
- Grant: Require MFA

**3. Block legacy authentication:**
- Users: All users
- Apps: All cloud apps
- Conditions: Client apps → Other clients
- Grant: Block access

**4. Require compliant device:**
- Users: All users
- Apps: Office 365
- Grant: Require compliant device OR Require hybrid Azure AD joined

**5. Require MFA from untrusted locations:**
- Users: All users
- Apps: All cloud apps
- Conditions: Locations → Any location, Exclude trusted locations
- Grant: Require MFA

**6. Block high-risk sign-ins:**
- Users: All users
- Apps: All cloud apps
- Conditions: Sign-in risk → High
- Grant: Block

**Policy Modes:**
- **Report-only:** Test policy without enforcement (see What If results)
- **On:** Policy enforced
- **Off:** Policy disabled

**What If Tool:**
- Test policy impact before enabling
- Entra Admin → Protection → Conditional Access → What If
- Specify user, app, conditions
- See which policies would apply

**Hands-On:**
- Navigate to Entra Admin → Protection → Conditional Access
- Review existing policies
- Click policy to see configuration
- Use "What If" tool: What If → Select user and app → What If
- Create new policy (report-only mode):
  - Conditional Access → New policy
  - Name: Test - Require MFA for executives
  - Users: Select executive group
  - Cloud apps: All cloud apps
  - Grant: Require MFA
  - Enable policy: Report-only mode
  - Create
- Monitor report-only: Sign-in logs → Filter by Conditional Access → Report-only

**Best Practices:**
- Always exclude emergency access (break-glass) accounts
- Start with report-only mode
- Use What If tool before enabling
- Document all policies
- Regular review and cleanup
- Layer policies (e.g., baseline + app-specific)

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/conditional-access/

---

### Skill: Understand the purpose and benefits of SSO

**What You Need to Know:**
- Single Sign-On (SSO) allows users to sign in once and access multiple applications
- Improves user experience and security
- Reduces password fatigue and help desk calls

**Key Concepts:**

#### What is SSO?

**Definition:**
- Authenticate once with identity provider (Microsoft Entra ID)
- Access multiple applications without re-entering credentials
- Based on trust relationship between identity provider and applications

**How SSO Works:**
1. User navigates to application (e.g., Salesforce)
2. App redirects to Microsoft Entra ID
3. User authenticates (if not already)
4. Entra ID issues security token
5. User redirected back to app with token
6. App validates token and grants access
7. Subsequent apps: Token reused, no re-authentication needed

**SSO Flow:**
```
User → App 1 → Entra ID (authenticate) → Token → App 1 (access)
User → App 2 → Entra ID (already authenticated) → Token → App 2 (access)
User → App 3 → Entra ID (already authenticated) → Token → App 3 (access)
```

#### Benefits of SSO

**For Users:**
- **One set of credentials:** Remember one password instead of many
- **Seamless access:** Switch between apps without re-authenticating
- **Faster access:** No repeated login prompts
- **Better security hygiene:** One strong password vs. many weak ones
- **Reduced password fatigue:** Less likely to write down passwords

**For IT/Admins:**
- **Reduced help desk calls:** Fewer password reset requests
- **Centralized access control:** Manage access in one place
- **Better security:** Enforce MFA and policies centrally
- **Audit trail:** Single source for access logs
- **Faster onboarding/offboarding:** Provision/deprovision once
- **Compliance:** Centralized identity governance

**For Organization:**
- **Cost savings:** Reduced IT support costs
- **Improved productivity:** Less time on authentication
- **Enhanced security posture:** Stronger authentication methods
- **Regulatory compliance:** Better access controls and audit logs

#### SSO in Microsoft 365

**Built-in SSO:**
- All Microsoft 365 apps use Entra ID SSO by default:
  - Outlook, Teams, SharePoint, OneDrive, Word, Excel, PowerPoint, etc.
- Sign in once, access all M365 apps

**Third-Party App SSO:**
- **Enterprise App Gallery:** 5,000+ pre-integrated SaaS apps
  - Salesforce, Dropbox, ServiceNow, Workday, SAP, etc.
- **SAML-based SSO**
- **OAuth 2.0 / OpenID Connect**
- **Password-based SSO** (less secure, legacy apps)
- **Linked SSO** (bookmark)

#### SSO Authentication Protocols

**1. SAML 2.0 (Security Assertion Markup Language)**
- XML-based
- Industry standard
- Use case: Enterprise SaaS apps
- Flow: Service Provider-initiated or Identity Provider-initiated

**2. OAuth 2.0 + OpenID Connect (OIDC)**
- Modern, token-based
- JSON Web Tokens (JWT)
- Use case: Modern web and mobile apps
- Microsoft's preferred protocol

**3. WS-Federation**
- Legacy protocol
- Still supported for older apps

**4. Password-based SSO (Password Vaulting)**
- Entra ID stores encrypted credentials
- Auto-fills login forms
- Less secure, use only when SAML/OIDC not available

#### Configuring SSO

**For Gallery Apps:**
1. Entra Admin → Enterprise applications → New application
2. Browse Azure AD Gallery → Search for app (e.g., "Salesforce")
3. Add application
4. Set up single sign-on → Select SAML
5. Follow guided setup:
   - Basic SAML configuration (URLs)
   - User attributes & claims
   - SAML certificate
   - Set up application (app-side config)
6. Assign users/groups
7. Test SSO

**For Custom Apps:**
1. Enterprise applications → New application → Create your own
2. Integrate any other application not in the gallery
3. Configure SSO manually with app's SAML/OIDC settings

#### Seamless SSO (Windows)

**For Domain-Joined Windows Devices:**
- Automatic sign-in to Entra ID using on-prem AD credentials
- No password prompt for Entra ID authentication
- Windows Hello for Business integration
- Primary Refresh Token (PRT)

**Hands-On:**
- Navigate to Entra Admin → Enterprise applications → All applications
- View apps configured for SSO
- Click app → Single sign-on → Review configuration
- View assigned users: Users and groups
- Test SSO: Click "Test" in SSO settings
- User experience: https://myapps.microsoft.com (all SSO apps)

**User Portal:**
- **My Apps:** https://myapps.microsoft.com
- Single portal for all SSO-enabled apps
- Organized collections
- Self-service access request (if enabled)

**Common Scenarios:**
- **Salesforce SSO:** Sales team accesses Salesforce with M365 credentials
- **ServiceNow SSO:** IT team accesses ServiceNow without separate login
- **Custom LOB app:** Internal HR app uses Entra ID for authentication

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/what-is-single-sign-on

---

### Skill: Identify the appropriate security object to use in an organization (users and groups)

**What You Need to Know:**
- Users and groups are fundamental security objects in M365
- Groups simplify permission management
- Different group types serve different purposes

**Key Concepts:**

#### User Types

**1. Member Users (Internal)**
- Employees of organization
- Full user accounts in Entra ID
- Source: Cloud-only or synced from on-prem AD
- User Principal Name (UPN): user@contoso.com
- Licenses assigned directly or via group

**2. Guest Users (External)**
- Partners, vendors, contractors
- B2B collaboration
- User type: Guest
- UPN: externaluser_vendor.com#EXT#@contoso.onmicrosoft.com
- Limited permissions by default
- Invitation required

**3. Service Accounts**
- Non-human identities
- Automation, applications, scripts
- Should NOT use MFA (use managed identities or certificates instead)
- Example: Application accounts, sync accounts

#### Group Types

**1. Security Groups**
- **Purpose:** Access control, permission assignment
- **Members:** Users, devices, service principals, other groups (nested)
- **Membership:**
  - **Assigned:** Manual membership
  - **Dynamic:** Rule-based (e.g., department=Sales)
- **Use cases:**
  - SharePoint site permissions
  - App access
  - Conditional Access policies
  - License assignment
- **Email-enabled:** Optional (mail-enabled security group)

**2. Microsoft 365 Groups (Unified Groups)**
- **Purpose:** Collaboration
- **Includes:**
  - Shared mailbox
  - SharePoint site
  - Planner
  - OneNote
  - Calendar
  - Teams (if Teams-connected)
- **Membership:** Users only (not devices or groups)
- **Visibility:**
  - Public: Anyone can join
  - Private: Invitation required
- **Use cases:**
  - Project teams
  - Department collaboration
  - Community groups

**3. Distribution Groups**
- **Purpose:** Email distribution only
- **Members:** Users, contacts, other distribution groups
- **No security permissions**
- **Use cases:**
  - Department mailing lists
  - Company-wide announcements
  - Legacy email distribution

**4. Mail-Enabled Security Groups**
- **Purpose:** Email + Security
- **Combines:** Distribution group + Security group
- **Use cases:**
  - Email AND resource access (e.g., legal-team@contoso.com has email and SharePoint permissions)

#### Dynamic Groups (Entra ID P1/P2)

**Dynamic User Groups:**
- Membership based on user attributes
- **Rules:**
  ```
  user.department -eq "Sales"
  user.country -eq "United States"
  user.jobTitle -contains "Manager"
  ```
- Automatically add/remove based on rule
- Updates within minutes to hours

**Dynamic Device Groups:**
- Membership based on device attributes
- **Rules:**
  ```
  device.deviceOSType -eq "Windows"
  device.managementType -eq "MDM"
  ```
- Use case: Device management policies

**Rule Builder:**
- Simple or advanced mode
- AND/OR logic
- Validation before saving

#### When to Use Each

| Scenario | Recommended Object |
|----------|-------------------|
| Grant SharePoint site access to team | Security Group (Assigned) |
| Project collaboration workspace | Microsoft 365 Group → Teams |
| All sales department members (auto) | Security Group (Dynamic) |
| Company-wide email announcements | Distribution Group |
| Legal team email + document access | Mail-Enabled Security Group |
| External partner access to specific files | Guest User + Security Group |
| Conditional Access for executives | Security Group (Assigned - critical users) |
| License assignment to department | Security Group (Dynamic) |

#### Best Practices

**Users:**
- Naming convention: firstname.lastname@domain
- Populate all relevant attributes (department, manager, title)
- Use guest access for external users (don't create member accounts)
- Disable accounts immediately when employees leave
- Regular access reviews

**Groups:**
- **Prefer groups over individual permissions**
- Descriptive naming: `SG-SharePoint-Finance-Owners`, `M365-Marketing-Team`
- Document group purpose in description
- Use dynamic groups for department-wide access
- Regular group membership reviews
- Limit number of group owners
- Nested groups sparingly (complicates troubleshooting)

**Security:**
- Principle of least privilege
- Use security groups for permissions
- Use M365 groups for collaboration
- Don't use distribution groups for security
- Monitor guest access

**Hands-On:**
- Entra Admin → Identity → Users → All users
- View user types (filter: User type = Guest)
- Click user → View properties, group memberships
- Create user: New user → Create new user
- Entra Admin → Identity → Groups → All groups
- Filter by group type
- Create security group: New group → Security → Assigned
- Create dynamic security group: New group → Security → Dynamic user → Add dynamic query
- Create M365 group: New group → Microsoft 365
- View group members and owners
- Test adding user to group
- Verify user sees new access (e.g., SharePoint site)

**Common Admin Tasks:**
- Bulk user creation: Users → Bulk operations → Bulk create
- Add guest: Users → New user → Invite external user
- Assign group to app: Enterprise applications → Select app → Users and groups → Add user/group
- License via group: Groups → Select group → Licenses → Assignments

**Documentation:**
- Users: https://learn.microsoft.com/en-us/entra/fundamentals/add-users
- Groups: https://learn.microsoft.com/en-us/entra/fundamentals/concept-learn-about-groups

---

*[Due to length limits, I'll continue with the remaining skills in the next message]*

Would you like me to continue with the remaining skills? I have:
- Remaining Domain 1 skills (troubleshooting, Identity Secure Score, audit logs, PIM, App registrations)
- All of Domain 2 (Data Protection and Governance - 35-40%)
- All of Domain 3 (Copilot and Agent Administration - 25-30%)
### Skill: Identify the appropriate tools to troubleshoot common sign-in issues (MFA, conditional access, and risky sign-ins)

**What You Need to Know:**
- Multiple tools available for diagnosing authentication problems
- Sign-in logs are primary troubleshooting resource
- Different issues require different troubleshooting approaches

**Key Concepts:**

#### Common Sign-In Issues

**1. MFA Issues**
- User not registered for MFA
- MFA method not working (phone lost, app deleted)
- MFA timeout or failed verification
- Legacy apps blocking (don't support modern auth)

**2. Conditional Access Issues**
- Access blocked by policy
- MFA required but user not registered
- Compliant device required but device not compliant
- Location-based blocking
- Unsupported client app

**3. Risky Sign-In Issues**
- Sign-in blocked due to high risk
- Atypical travel detected
- Anonymous IP address
- Malware-linked IP
- Unfamiliar sign-in properties

#### Troubleshooting Tools

**1. Sign-In Logs (Primary Tool)**
- **Location:** Entra Admin → Monitoring → Sign-in logs
- **Information Available:**
  - User attempting sign-in
  - Application being accessed
  - Date/time of sign-in
  - IP address and location
  - Device information
  - Success/failure status
  - Failure reason
  - Conditional Access policies applied
  - Authentication method used
  - MFA result

**Filtering Sign-In Logs:**
- By user
- By application
- By status (success/failure/interrupted)
- By Conditional Access (success/failure/not applied)
- By date range
- By location
- By client app

**Reading Sign-In Log Entry:**
```
User: john.doe@contoso.com
Status: Failure
Error code: 50074
Reason: "Strong authentication required"
Application: Office 365 SharePoint Online
IP: 203.0.113.45 (Seattle, WA)
Conditional Access: 1 policy applied
  - "Require MFA for all users" → Not satisfied
```

**2. Conditional Access "What If" Tool**
- **Location:** Entra Admin → Protection → Conditional Access → What If
- **Purpose:** Predict which policies apply to a sign-in
- **Use Cases:**
  - Before creating new policy
  - Troubleshooting unexpected blocks
  - Understanding policy interactions

**How to Use:**
1. Select user
2. Select cloud app
3. Specify conditions (IP address, device platform, location)
4. Click "What If"
5. Review which policies would apply

**3. MFA Registration Information**
- **Location:** Entra Admin → Users → Select user → Authentication methods
- **Shows:**
  - Registered MFA methods
  - Default method
  - Registration status
  - Last used

**User Self-Service:**
- https://aka.ms/mfasetup
- https://mysignins.microsoft.com/security-info

**4. Identity Protection Reports (Entra ID P2)**
- **Risky Users:** Users flagged as potentially compromised
- **Risky Sign-Ins:** Individual sign-in attempts with risk
- **Risk Detections:** Specific risks detected

**Location:** Entra Admin → Protection → Identity Protection

**5. Audit Logs**
- **Location:** Entra Admin → Monitoring → Audit logs
- **Shows:** Admin actions, configuration changes
- **Use Cases:**
  - Who created/modified Conditional Access policy
  - When MFA was enforced for user
  - Changes to security settings

**6. User Sign-Ins (User's Perspective)**
- **Location:** https://mysignins.microsoft.com
- Users can view their own sign-in history
- Users can review unusual activity

#### Troubleshooting Scenarios

**Scenario 1: User Cannot Sign In - MFA Required**

**Error:** "Strong authentication required"

**Troubleshooting Steps:**
1. Check sign-in logs → Find entry → Review "Authentication details"
2. Verify MFA policy: Conditional Access → Check policies targeting user
3. Check user's MFA registration: Users → Select user → Authentication methods
4. **Resolution:**
   - User not registered: Direct to https://aka.ms/mfasetup
   - Policy issue: Adjust Conditional Access policy or grant exception

**Scenario 2: Access Blocked by Conditional Access**

**Error:** "Access has been blocked"

**Troubleshooting Steps:**
1. Sign-in logs → Find entry → Conditional Access tab
2. Identify blocking policy
3. Review policy requirements (compliant device, location, etc.)
4. **Resolution:**
   - Device not compliant: Enroll in Intune, meet compliance requirements
   - Wrong location: VPN to trusted network or adjust policy
   - Legacy app: Upgrade to modern auth app

**Scenario 3: Risky Sign-In Blocked**

**Error:** "Your account is at risk"

**Troubleshooting Steps:**
1. Identity Protection → Risky sign-ins → Find entry
2. Review risk detections (atypical travel, anonymous IP, etc.)
3. Determine if legitimate or attack
4. **Resolution:**
   - Legitimate: User confirms via MFA, risk dismissed
   - Compromised: Force password reset, revoke sessions
   - Admin action: Dismiss risk or confirm compromise

**Scenario 4: "Can't Access from This Location"**

**Error:** Location-based block

**Troubleshooting Steps:**
1. Sign-in logs → Check IP address and location
2. Conditional Access → What If → Enter user and IP
3. Identify location-based policy
4. **Resolution:**
   - Add location to allowed locations
   - User uses VPN to allowed location
   - Grant temporary exception

**Scenario 5: Legacy App Sign-In Failure**

**Error:** AADSTS50055 or AADSTS50020

**Troubleshooting Steps:**
1. Sign-in logs → Client app column shows "Other clients"
2. Conditional Access → Check for "Block legacy authentication" policy
3. **Resolution:**
   - Upgrade app to modern authentication
   - Use app passwords (if enabled)
   - Create exception (not recommended)

#### Quick Reference: Common Error Codes

| Error Code | Meaning | Solution |
|------------|---------|----------|
| **50074** | Strong authentication required | Register for MFA |
| **50055** | Invalid password | User resets password |
| **50057** | User account disabled | Re-enable account |
| **50058** | Silent sign-in failed | Interactive sign-in required |
| **50076** | MFA required | Complete MFA |
| **53000** | Conditional Access blocked | Meet policy requirements |
| **53003** | Access blocked by CA policy | Check CA policies |
| **65001** | App not consented | Admin consent required |
| **7000215** | Invalid password (on-prem) | Check password with on-prem AD |

**Hands-On Practice:**
1. Navigate to Entra Admin → Monitoring → Sign-in logs
2. Filter by Status = Failure
3. Click entry to view details
4. Review:
   - Basic info tab (user, app, date, IP)
   - Conditional Access tab (policies applied)
   - Authentication Details tab (MFA result)
5. Use What If tool:
   - Conditional Access → What If
   - Select test user and app
   - Review applied policies
6. Check user's MFA:
   - Users → Select user → Authentication methods
7. Review risky sign-ins (if P2):
   - Identity Protection → Risky sign-ins

**Best Practices:**
- Enable sign-in logs retention (default 30 days)
- Export logs to Log Analytics for long-term storage
- Create alerts for failed sign-ins
- Regularly review risky users and sign-ins
- Document known good IP ranges
- Communicate policy changes to users before enforcement

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-sign-ins

---

### Skill: Interpret Identity Secure Score in Microsoft Entra ID

**What You Need to Know:**
- Identity Secure Score measures identity security posture
- Provides improvement actions with points
- Helps prioritize security enhancements

**Key Concepts:**

#### What is Identity Secure Score?

**Definition:**
- Numerical score representing your identity security posture
- Scale: 0-100% (or points out of maximum)
- Higher = better security
- Based on Microsoft security best practices

**Location:** Entra Admin → Protection → Identity Secure Score

**Components:**
- **Current Score:** Your organization's score
- **Maximum Score:** Total possible points
- **Percentage:** Current / Maximum
- **Comparison Score:** Industry average for your sector
- **Improvement Actions:** Specific recommendations

#### How Score is Calculated

**Points Awarded For:**
- Enabling security features (MFA, Conditional Access, PIM)
- Following best practices (password policies, legacy auth blocks)
- Implementing identity protection
- Configuring secure defaults

**Categories:**
1. **Identity** (Entra ID features)
2. **Data** (Information protection)
3. **Device** (Intune/Endpoint management)
4. **Apps** (Application security)

**Example Improvement Actions:**

| Action | Points | Status | Impact |
|--------|--------|--------|--------|
| Enable MFA for all users | 50 | Not started | High |
| Block legacy authentication | 22 | In progress | High |
| Enable self-service password reset | 8 | Completed | Medium |
| Require MFA for admin roles | 10 | Not started | High |
| Enable password hash sync | 15 | Completed | Medium |
| Configure Conditional Access policies | 30 | Partially | High |

#### Improvement Action Details

**For Each Action:**
- **Points:** How many points you'll gain
- **Status:** Not started, Planned, In progress, Completed, Resolved through third party
- **Affects:** Users/devices/apps impacted
- **Category:** Identity, Device, Apps, Data
- **Threats Addressed:** Which attacks this mitigates
- **Implementation:** Step-by-step instructions
- **User Impact:** Low/Medium/High

**Statuses Explained:**
- **To address:** Action not yet started
- **Planned:** Scheduled for future implementation
- **Accepted risk:** Conscious decision not to implement
- **Resolved through third party:** Implemented via non-Microsoft solution
- **Resolved through alternate mitigation:** Different approach used
- **Completed:** Fully implemented

#### How to Use Identity Secure Score

**1. Assess Current Posture**
- Review current score
- Compare to industry benchmark
- Identify security gaps

**2. Prioritize Improvements**
- Sort by points (quick wins)
- Filter by impact (high-impact first)
- Consider user impact (balance security vs. usability)
- Review implementation difficulty

**3. Implement Actions**
- Follow step-by-step instructions
- Test in pilot group first
- Monitor impact
- Mark status as "In progress" → "Completed"

**4. Monitor Progress**
- Regular reviews (monthly/quarterly)
- Track score over time
- Celebrate improvements
- Report to leadership

#### Common Improvement Actions

**High-Impact, Easy to Implement:**
1. **Enable security defaults** (if not using Conditional Access)
   - Points: 62
   - Impact: Enables baseline protection (MFA, block legacy auth, protect admins)

2. **Require MFA for administrators**
   - Points: 10
   - Impact: Protects privileged accounts

3. **Block legacy authentication**
   - Points: 22
   - Impact: Prevents bypass of modern security

4. **Enable self-service password reset**
   - Points: 8
   - Impact: Reduces help desk load, improves security

5. **Use passwordless authentication**
   - Points: Varies
   - Impact: Eliminates password risks

**High-Impact, Moderate Effort:**
1. **Implement Conditional Access policies**
   - Points: 30+
   - Impact: Granular access control

2. **Enable Password Protection**
   - Points: 12
   - Impact: Blocks weak/common passwords

3. **Configure risk-based Conditional Access**
   - Points: 25
   - Impact: Automated threat response

**Understanding Score Changes:**
- Score may decrease if:
  - Microsoft adds new recommendations
  - Your environment grows (more users)
  - Best practices evolve
- Score increases when you complete actions

#### Integration with Microsoft Secure Score

**Identity Secure Score** is part of broader **Microsoft Secure Score**:
- **Microsoft Secure Score:** Overall security (M365, Azure, Defender)
- **Identity Secure Score:** Identity-specific subset
- Both use similar methodology
- Coordinated improvement actions

**Location for Overall Secure Score:** https://security.microsoft.com/securescore

#### Best Practices

**Regular Reviews:**
- Monthly score check
- Quarterly deep dive
- Annual strategic planning

**Prioritization Strategy:**
1. Address high-impact, low-effort first (quick wins)
2. Plan high-impact, high-effort (strategic initiatives)
3. Accept or mitigate low-impact (document decisions)

**Change Management:**
- Communicate changes to users
- Provide training for new security measures
- Phase rollouts (pilot → production)
- Monitor help desk tickets

**Documentation:**
- Why action implemented or skipped
- Implementation date
- User impact assessment
- Rollback procedures

**Stakeholder Reporting:**
- Executive dashboards with score trends
- Improvement roadmap
- Risk accepted items with justification
- Comparison to industry benchmarks

**Hands-On:**
1. Navigate to Entra Admin → Protection → Identity Secure Score
2. Review current score and percentage
3. Click "Improvement actions"
4. Sort by "Score impact" (descending)
5. Click high-value action (e.g., "Enable MFA for all users")
6. Review:
   - Points available
   - Implementation tab (instructions)
   - User impact
   - Threats addressed
7. Update status: Mark action as "Planned"
8. View history: See score changes over time
9. Export report for management

**Common Questions:**

**Q: Why did my score decrease?**
A: Microsoft may add new recommendations, or your user base grew

**Q: Can I accept risk instead of implementing?**
A: Yes, mark as "Accepted risk" with justification

**Q: How long until score updates after implementation?**
A: Usually 24-48 hours for detection

**Q: Should I aim for 100%?**
A: Not necessarily - balance security with usability and business needs

**Documentation:** https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-identity-secure-score

---

### Skill: Use the appropriate tools to review audit logs for user and admin activity

**What You Need to Know:**
- Audit logs track configuration changes and admin actions
- Different from sign-in logs (which track authentication)
- Critical for compliance, security investigations, troubleshooting

**Key Concepts:**

#### Types of Logs in Microsoft 365

**1. Entra ID Audit Logs**
- **What:** Admin actions and configuration changes in Entra ID
- **Location:** Entra Admin → Monitoring → Audit logs
- **Examples:**
  - User created/deleted
  - Group membership changed
  - Password reset
  - Role assigned
  - Conditional Access policy modified
  - Application registered

**2. Entra ID Sign-In Logs**
- **What:** User authentication events
- **Location:** Entra Admin → Monitoring → Sign-in logs
- **Examples:**
  - User logged in
  - MFA completed
  - Conditional Access applied
  - Sign-in failed

**3. Microsoft 365 Unified Audit Log**
- **What:** Activity across all M365 services
- **Location:** Purview Compliance → Audit
- **Examples:**
  - Email sent/received
  - File accessed/modified in SharePoint
  - Teams meeting created
  - Mailbox permissions changed
  - DLP policy hit
  - Copilot usage

**4. Exchange Audit Logs**
- **What:** Mailbox and Exchange admin actions
- **Location:** Exchange Admin Center → Auditing
- **Examples:**
  - Mailbox accessed by non-owner
  - Mailbox permissions changed
  - Mail flow rule created

**5. SharePoint Audit Logs**
- **What:** SharePoint and OneDrive activity
- **Location:** Purview Compliance → Audit (search for SharePoint activities)
- **Examples:**
  - File downloaded
  - Permissions changed
  - Site created
  - File shared externally

#### Entra ID Audit Logs (Primary Focus for AB-900)

**Accessing Audit Logs:**
- Entra Admin Center → Monitoring → Audit logs
- Default view: Last 7 days
- Can filter and search

**Audit Log Columns:**
- **Date:** When activity occurred
- **Service:** Which service (Core Directory, Group Management, etc.)
- **Category:** Type of activity (UserManagement, RoleManagement, etc.)
- **Activity:** Specific action (Add user, Update group, Delete policy, etc.)
- **Status:** Success, Failure
- **Target:** Object that was modified (user, group, policy)
- **Initiated by (actor):** Who performed the action

**Filtering Audit Logs:**

**By Date Range:**
- Last 24 hours, 7 days, 1 month, 3 months, 12 months (P2 only)
- Custom date range

**By Service:**
- Core Directory
- Self-service Group Management
- Self-service Password Management
- Invited Users
- B2B
- Privileged Identity Management
- Access Reviews
- Identity Protection
- And more...

**By Category:**
- UserManagement
- GroupManagement
- ApplicationManagement
- RoleManagement
- DirectoryManagement
- Policy
- Authentication

**By Activity:**
- Add user
- Update user
- Delete user
- Reset password
- Add member to group
- Add owner to group
- Add app role assignment to service principal
- Update conditional access policy
- And hundreds more...

**By Initiated By:**
- Specific user email
- Service principal
- System

**By Target:**
- Specific user, group, app

#### Common Audit Log Scenarios

**Scenario 1: Who Deleted This User?**

**Steps:**
1. Audit logs → Activity filter → "Delete user"
2. Target → Enter deleted user's name or UPN
3. Review entry:
   - Initiated by: admin@contoso.com
   - Date: 2025-01-15 14:30:00
   - Status: Success

**Scenario 2: When Was MFA Enabled for This User?**

**Steps:**
1. Audit logs → Activity → "Update user"
2. Target → Enter user
3. Find entry with "StrongAuthenticationMethods" in modified properties

**Scenario 3: Who Created/Modified This Conditional Access Policy?**

**Steps:**
1. Audit logs → Category → "Policy"
2. Activity → "Update conditional access policy" or "Add conditional access policy"
3. Target → Policy name
4. Click entry → Modified Properties shows before/after

**Scenario 4: Track Group Membership Changes**

**Steps:**
1. Audit logs → Activity → "Add member to group"
2. Target → Group name
3. Review all adds/removes

**Scenario 5: Application Consent Audit**

**Steps:**
1. Audit logs → Category → "ApplicationManagement"
2. Activity → "Consent to application"
3. Review who granted consent to which apps

#### Viewing Audit Log Entry Details

**Click on entry to see:**
- **Activity:** High-level description
- **Status:** Success/Failure with reason
- **Targets:** What was modified (with object ID)
- **Initiated by:** Who did it (user, service principal, system)
- **Modified Properties:** Before and after values (JSON format)
- **Additional Details:** Extra context

**Example Entry:**
```
Activity: Update user
Status: Success
Target: john.doe@contoso.com (ObjectId: abc123...)
Initiated by: admin@contoso.com
Modified Properties:
  - Property: StrongAuthenticationRequirements
    Old Value: []
    New Value: [{"RelyingParty":"*","State":"Enabled"}]
```

#### Retention and Export

**Retention:**
- **Entra ID Free/P1:** 7 days
- **Entra ID P2:** 30 days
- **Unified Audit Log:** 90 days (E3), 365 days (E5/A5/G5)

**Long-Term Storage:**
- Export to Azure Monitor (Log Analytics)
- Export to Azure Storage
- SIEM integration (Sentinel, Splunk, etc.)

**Exporting:**
- Download current view: Download button (CSV format)
- Programmatic: Microsoft Graph API
- Automated: Diagnostic settings → Stream to Log Analytics

#### Microsoft 365 Unified Audit Log

**Location:** Purview Compliance Portal → Audit

**Enabling Unified Audit:**
- Must be enabled (on by default for new tenants)
- Purview → Audit → Turn on auditing (if not enabled)

**Searching:**
1. Purview → Audit → Search
2. Select activities (or all)
3. Date range
4. Users (optional)
5. File/folder/site (optional)
6. Search
7. Export results (CSV)

**Activity Examples:**
- **Exchange:** Email sent, Mailbox accessed, Mail forwarding enabled
- **SharePoint:** File downloaded, File shared, Permissions changed
- **Teams:** Team created, Member added, Meeting scheduled
- **Entra ID:** User added, Role assigned
- **Copilot:** Copilot interaction, Prompt submitted
- **Purview:** DLP policy match, Sensitivity label applied

**Copilot Audit Events:**
- Location: Unified Audit Log
- Activity: "CopilotInteraction"
- Details: Prompt, response summary, data sources accessed

#### Best Practices

**Regular Monitoring:**
- Review admin actions weekly
- Set up alerts for critical changes
- Monitor privileged role assignments
- Track application consents

**Automated Alerting:**
- Use alert policies in Purview
- Examples:
  - Email when Global Admin role assigned
  - Alert on Conditional Access policy deletion
  - Notify when guest user added

**Compliance:**
- Retain logs per regulatory requirements
- Export for long-term storage
- Include in audit procedures
- Document log review process

**Investigation:**
- Start with high-level filters
- Drill down to specific events
- Correlate across log types
- Export evidence

**Hands-On:**
1. Navigate to Entra Admin → Monitoring → Audit logs
2. Review recent activities
3. Filter:
   - Category: "UserManagement"
   - Activity: "Add user"
4. Click entry to view details
5. Check "Initiated by" to see who created users
6. Export: Download → CSV
7. Navigate to Purview Compliance → Audit
8. Verify auditing is enabled
9. Search audit log:
   - Activities: File and folder activities → File downloaded
   - Date range: Last 7 days
   - Search
10. Review results and export

**Common Filters:**

**Security Reviews:**
- Activity: "Add member to role" (monitor privileged access)
- Activity: "Consent to application" (OAuth apps)
- Category: "Policy" (Conditional Access changes)

**Compliance:**
- Service: All
- Activity: Export all for records

**Troubleshooting:**
- Filter by specific user or resource
- Look for failures
- Check timing of changes

**Documentation:**
- Entra Audit: https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-audit-logs
- M365 Audit: https://learn.microsoft.com/en-us/purview/audit-log-search

---

### Skill: Identify the role of Privileged Identity Management (PIM) in an organization

**What You Need to Know:**
- PIM provides just-in-time access to privileged roles
- Reduces standing admin access (security best practice)
- Requires Entra ID P2 or Microsoft Entra ID Governance license

**Key Concepts:**

#### What is Privileged Identity Management (PIM)?

**Definition:**
- Service that manages, controls, and monitors access to important resources
- Provides time-based and approval-based role activation
- Implements "just-in-time" privileged access

**Problem PIM Solves:**
- **Standing admin access = security risk**
  - Admins have 24/7 elevated permissions
  - Compromised account = full control
  - Users may have forgotten they have admin rights
  - Excessive permissions increase attack surface

**PIM Solution:**
- **Eligible assignments:** Users activate when needed
- **Time-bound access:** Roles expire automatically
- **Approval workflows:** Require approval for activation
- **MFA enforcement:** Additional verification
- **Audit trail:** Track all activations

**Location:** Entra Admin → Identity Governance → Privileged Identity Management

**Requires:** Entra ID P2 or Entra ID Governance license

#### PIM Core Concepts

**Role Assignment Types:**

**1. Eligible**
- User CAN activate the role when needed
- Not active by default
- Requires activation process
- Best practice for most admin roles

**2. Active**
- User HAS the role permissions immediately
- No activation required
- Permissions always on
- Use sparingly (emergency accounts only)

**Assignment Duration:**

**1. Permanent**
- No end date
- Assignment doesn't expire
- Example: Emergency access (break-glass) accounts

**2. Time-Bound**
- Has start and end dates
- Automatically expires
- Example: 3-month contractor project

**Activation:**
- **Max duration:** How long role stays active (e.g., 8 hours)
- **Justification:** Required reason for activation
- **MFA:** Require MFA at activation
- **Approval:** Require approver to approve request
- **Ticket system:** Reference ticket number

#### How PIM Works

**Admin Workflow:**
1. Admin makes user "eligible" for Global Administrator role
2. Assignment configured: Max 8 hours, requires justification + approval

**User Workflow (Activation):**
1. User navigates to PIM portal
2. Clicks "Activate" on Global Administrator role
3. Enters justification: "Need to configure Conditional Access"
4. Submits activation request
5. Approver receives notification
6. Approver reviews and approves
7. User receives notification
8. User now has Global Admin for 8 hours
9. After 8 hours: Role automatically deactivates

**Activation Flow:**
```
User → Request Activation → Provide Justification → MFA (if required) 
→ Approval (if required) → Role Active → Auto-Expire after Duration
```

#### PIM Roles Covered

**Entra ID Roles:**
- Global Administrator
- User Administrator
- Conditional Access Administrator
- Security Administrator
- Privileged Role Administrator
- All other Entra built-in roles
- Custom roles

**Azure Roles:**
- Owner
- Contributor
- User Access Administrator
- All Azure RBAC roles

**M365 Roles:**
- Via Entra role assignments

#### PIM Settings and Configuration

**For Each Role, Configure:**

**1. Activation Requirements**
- Maximum duration (1-24 hours)
- Require MFA on activation
- Require justification
- Require ticket information
- Require approval
- Select approvers

**2. Assignment Requirements**
- Allow permanent eligible assignment
- Allow permanent active assignment
- Expire eligible assignments after X days
- Expire active assignments after X days

**3. Notification Settings**
- Email when role activated
- Email when role assigned
- Email approvers when request pending

**4. Access Reviews (Optional)**
- Periodic review of who has roles
- Attestation of continued need
- Auto-remove if no response

#### Benefits of PIM

**Security:**
- **Reduces attack surface:** Fewer standing admins
- **Just-in-time:** Admins only have privileges when needed
- **Just-enough-access:** Specific role for specific time
- **Audit trail:** Full history of activations
- **MFA at activation:** Additional verification layer

**Compliance:**
- **Documented access:** When, why, who approved
- **Regular reviews:** Periodic attestation
- **Least privilege:** Demonstrable compliance
- **Audit-ready:** Complete logs

**Operational:**
- **Accountability:** Justification required
- **Oversight:** Approval workflows
- **Time-bound:** No forgotten permissions
- **Emergency access:** Break-glass accounts still available

#### Common PIM Scenarios

**Scenario 1: Help Desk Analyst**
- **Need:** Occasionally reset user passwords
- **Without PIM:** Permanent User Administrator role (excessive)
- **With PIM:**
  - Eligible for User Administrator
  - Activates for 4 hours when needed
  - Provides justification
  - Auto-expires after shift

**Scenario 2: Security Team Member**
- **Need:** Investigate security incidents
- **Without PIM:** Permanent Security Administrator (risky)
- **With PIM:**
  - Eligible for Security Administrator
  - Activates during incident
  - Requires manager approval
  - 8-hour duration
  - MFA required

**Scenario 3: Project-Based Contractor**
- **Need:** Azure Owner role for 3-month project
- **With PIM:**
  - Time-bound eligible assignment (3 months)
  - Can activate for 8 hours at a time
  - Automatically loses eligibility after 3 months

**Scenario 4: Emergency Access (Break-Glass)**
- **Need:** Always-available admin access for emergencies
- **With PIM:**
  - Permanent active assignment (exception)
  - Highly monitored
  - Alert on any usage
  - Only 2 accounts organization-wide

#### PIM for End Users

**User Portal:**
- https://portal.azure.com → Privileged Identity Management
- OR: https://aka.ms/myroles

**User Actions:**
- **View eligible roles:** "My roles" → Eligible assignments
- **Activate role:**
  1. Select role
  2. Click Activate
  3. Enter justification
  4. Submit
  5. Wait for approval (if required)
- **View active roles:** Currently activated
- **View request history:** Past activations

**Notifications:**
- Email when role eligible
- Email when activation approved
- Reminder before expiration

#### PIM Administration

**Admins Can:**
- Assign eligible/active roles
- Configure role settings
- Approve activation requests
- View audit history
- Run access reviews
- Export reports

**Reports Available:**
- Resource audit (who activated what)
- Role assignments (who has what)
- Access reviews results
- Alerts (anomalous activations)

#### PIM Alerts

**Built-in Alerts:**
- **Too many global admins:** > 5 permanent Global Admins
- **Roles are being assigned outside PIM:** Direct role assignments bypass PIM
- **Admins aren't using their roles:** Eligible roles never activated
- **Duplicate role assignments:** User has same role via multiple paths

**Custom Alerts:**
- Configure via Azure Monitor
- Email on specific activations
- Integration with SIEM

#### Best Practices

**Implementation:**
- Start with high-privilege roles (Global Admin, Security Admin)
- Pilot with IT team
- Gradually expand to all admin roles
- Convert standing admins to eligible

**Configuration:**
- Require justification always
- Require MFA for sensitive roles (Global Admin, Security Admin)
- Require approval for highly privileged roles
- Set realistic activation durations (4-8 hours typical)
- No permanent active assignments except break-glass

**Governance:**
- Quarterly access reviews
- Monitor alerts
- Review activation patterns
- Audit justifications

**User Experience:**
- Train admins on activation process
- Document common justifications
- Set expectations on approval times
- Provide self-service portal link

**Hands-On:**
1. Navigate to Entra Admin → Identity Governance → Privileged Identity Management
2. Click "Entra ID roles"
3. View "My roles" (your own eligible roles)
4. If eligible, practice activation:
   - Select role → Activate
   - Enter justification → Activate
5. As admin, view "Roles":
   - See all PIM-managed roles
   - Click role (e.g., "User Administrator")
   - View current assignments
6. Configure role settings:
   - Roles → Select role → Settings
   - Edit:
     - Activation maximum duration: 8 hours
     - On activation, require: MFA
     - Require justification: Yes
     - Update
7. Assign eligible role:
   - Roles → Select role → Assignments → Add assignments
   - Select member
   - Assignment type: Eligible
   - Duration: Permanent or time-bound
   - Assign
8. View audit:
   - Resource audit → See all activations

**Common Tasks:**
- Make user eligible for role (not active)
- Require approval for Global Admin activation
- Set role to expire after 90 days
- Review who has activated roles this month

**Documentation:** https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/

---

### Skill: Understand App registrations and Enterprise apps

**What You Need to Know:**
- App registrations define app identity in Entra ID
- Enterprise apps are instances of apps in your tenant
- Used for SSO, API access, OAuth consent

**Key Concepts:**

#### App Registrations vs. Enterprise Apps

**App Registrations:**
- **What:** Define the app's identity for authentication
- **Who creates:** Developers building apps
- **Purpose:** Register app to use Entra ID for authentication
- **Creates:** Application object (global)
- **Location:** Entra Admin → Applications → App registrations

**Enterprise Apps:**
- **What:** Instance of an app in your tenant
- **Who creates:** Automatically created when app is used/consented
- **Purpose:** Manage app access, SSO, permissions in your tenant
- **Creates:** Service principal object (tenant-specific)
- **Location:** Entra Admin → Applications → Enterprise applications

**Relationship:**
```
App Registration (App Object - Global)
    ↓ creates
Service Principal (Enterprise App - Per Tenant)
    ↓ enables
User Authentication & Access
```

**Analogy:**
- **App Registration:** Recipe/template for the app
- **Enterprise App:** The actual deployed instance in your kitchen

#### App Registrations (Detailed)

**Purpose:**
- Define app identity
- Get Application (client) ID
- Configure authentication (redirect URIs)
- Define API permissions
- Create client secrets/certificates

**Key Components:**

**1. Application (client) ID**
- Unique identifier for app (GUID)
- Used in authentication requests
- Public value

**2. Directory (tenant) ID**
- Your Entra tenant ID
- Specifies which tenant app authenticates against

**3. Authentication Settings**
- **Redirect URIs:** Where auth responses sent
  - Web: https://app.contoso.com/auth/callback
  - SPA: http://localhost:3000
  - Mobile: myapp://auth
- **Supported account types:**
  - Single tenant (this directory only)
  - Multitenant (any Entra directory)
  - Multitenant + personal Microsoft accounts
  - Personal Microsoft accounts only

**4. Client Credentials (Secrets/Certificates)**
- **Client Secret:** Password for app (expires)
- **Certificate:** More secure than secret
- Used for confidential clients (backend apps)
- **Never use for SPA or mobile apps** (can't keep secret)

**5. API Permissions**
- What app requests access to
- **Microsoft Graph:** User.Read, Mail.Send, etc.
- **Other APIs:** Custom APIs
- **Types:**
  - Delegated: Act on behalf of user
  - Application: Act as app itself (no user)
- **Consent:**
  - User consent (low-privilege permissions)
  - Admin consent (high-privilege permissions)

**6. Expose an API (Optional)**
- If your app IS an API
- Define scopes other apps can request
- Example: api://contoso-app/Tasks.Read

**7. App Roles (Optional)**
- Define roles users/apps can be assigned
- Example: TaskAdmin, TaskViewer
- Used for authorization in app

**Creating App Registration:**
1. Entra Admin → App registrations → New registration
2. Name: MyCustomApp
3. Supported account types: Single tenant
4. Redirect URI: Web → https://myapp.com/callback
5. Register
6. Note Application ID and Tenant ID
7. Certificates & secrets → New client secret → Add
8. Copy secret value (shown once!)
9. API permissions → Add permission → Microsoft Graph → Delegated → User.Read → Add
10. Grant admin consent (if required)

#### Enterprise Apps (Detailed)

**Purpose:**
- Manage app in your tenant
- Assign users/groups to app
- Configure SSO
- Monitor usage
- Control permissions

**Automatic Creation:**
- Created when:
  - You add app from gallery
  - User consents to app
  - Service principal created programmatically
  - App registration created (with matching service principal)

**Key Components:**

**1. Users and Groups**
- Who can access the app
- Assignment required (on/off)
  - On: Only assigned users can access
  - Off: All users can access

**2. Single Sign-On (SSO)**
- SSO method:
  - SAML
  - OAuth/OIDC
  - Password-based
  - Linked
  - Disabled
- SAML configuration (if SAML)
- Test SSO functionality

**3. Permissions**
- What permissions app has
- Admin consent status
- User consent settings

**4. Provisioning (if supported)**
- Automatic user provisioning to app
- Examples: Workday, ServiceNow
- SCIM protocol

**5. Application Proxy (if configured)**
- Publish on-prem apps through Entra
- No VPN required

**6. Activity Logs**
- Sign-ins to this app
- Audit changes to app

**Common Enterprise Apps:**
- **Microsoft apps:** Office 365, Azure Portal, Teams
- **Gallery apps:** Salesforce, Dropbox, ServiceNow, Zoom
- **Custom apps:** Your internal LOB apps

#### Gallery Apps (Pre-Integrated)

**What:** 5000+ apps pre-integrated with Entra ID

**Adding Gallery App (Example: Salesforce):**
1. Entra Admin → Enterprise applications → New application
2. Browse gallery → Search "Salesforce"
3. Select "Salesforce" → Create
4. Set up single sign-on → SAML
5. Follow guided setup:
   - Configure SAML (URLs, certificate)
   - Set up Salesforce side
   - Test SSO
6. Assign users/groups:
   - Users and groups → Add user/group
7. (Optional) Configure provisioning:
   - Provisioning → Automatic → Salesforce credentials → Save

**Benefits:**
- Pre-configured SSO
- Tutorials provided
- Tested integrations
- Automatic updates

#### OAuth Consent and Permissions

**User Consent:**
- User sees permission request
- User can grant for themselves
- Low-risk permissions only

**Admin Consent:**
- Admin grants for all users
- Required for high-privilege permissions
- Examples:
  - Read all users' full profiles
  - Access all mailboxes
  - Modify directory

**OAuth Consent Flow:**
1. User tries to access app
2. App requests permissions (scopes)
3. Entra shows consent prompt
4. User/admin grants consent
5. App receives access token
6. App can now call APIs with token

**Consent Governance:**
- Control which apps users can consent to
- Require admin approval for risky permissions
- Block low-security publishers
- Location: Entra → Enterprise apps → Consent and permissions

#### Common Scenarios

**Scenario 1: Internal Web App with Entra Authentication**
1. Developer creates app registration
2. Configures redirect URI, permissions
3. App uses Application ID and client secret
4. Enterprise app automatically created
5. Admin assigns users to enterprise app
6. Users can now SSO to app

**Scenario 2: Add Salesforce SSO**
1. Admin adds Salesforce from gallery (enterprise app)
2. Configures SAML SSO
3. Assigns sales team to app
4. Sales team can access Salesforce with M365 credentials

**Scenario 3: Audit App Permissions**
1. Navigate to Enterprise applications
2. Filter: Application type = All apps
3. Review apps with extensive permissions
4. Check sign-in activity (unused apps?)
5. Disable or delete unnecessary apps

**Scenario 4: User Consents to Risky App**
1. Review: Enterprise applications → Consent and permissions → Requests pending
2. See user requested access to "SuperApp"
3. Review permissions requested (Mail.Read, Contacts.Read)
4. Decision:
   - Approve (allow this app)
   - Deny (block request)
   - Investigate (review app publisher)

#### Security Best Practices

**App Registrations:**
- Rotate client secrets regularly (every 6-12 months)
- Use certificates instead of secrets (more secure)
- Least privilege permissions
- Remove unused app registrations
- Monitor ownership (who owns this app registration?)

**Enterprise Apps:**
- Require assignment for sensitive apps
- Regular access reviews
- Audit app permissions (who consented to what?)
- Block user consent for risky apps
- Enable admin consent workflow
- Remove unused apps

**OAuth Governance:**
- Configure consent policies
- Review and revoke risky consents
- Monitor OAuth apps activity
- Use Microsoft Defender for Cloud Apps for OAuth app governance

**Hands-On:**

**App Registrations:**
1. Entra Admin → App registrations → New registration
2. Name: TestApp
3. Supported accounts: Single tenant
4. Register
5. Note Application (client) ID
6. Certificates & secrets → New client secret → Add
7. API permissions → Add → Microsoft Graph → Delegated → User.Read
8. Overview → Delete (cleanup)

**Enterprise Apps:**
1. Entra Admin → Enterprise applications → All applications
2. Filter: Application type = Microsoft Applications
3. Click "Office 365 SharePoint Online"
4. View users and groups assigned
5. View sign-ins (Activity → Sign-in logs)
6. Return to all apps
7. Click enterprise app → Properties
8. Assignment required: Yes/No toggle
9. Explore consent and permissions

**Useful Filters:**
- Recently created apps (find new OAuth consents)
- Apps with no sign-ins (unused apps)
- Apps with admin consent (high-privilege apps)

**Documentation:**
- App registrations: https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-register-app
- Enterprise apps: https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/what-is-application-management

---


# Domain 2: Understand Data Protection and Governance Tasks for Microsoft 365 and Copilot (35-40%)

**⚠️ LARGEST EXAM SECTION - Focus here!**

## Section 2.1: Understand Microsoft Purview

### Skill: Understand features and capabilities of Microsoft Purview (Information Protection, DLP, Insider Risk, Communication Compliance, DSPM for AI, Data Lifecycle Management)

**What You Need to Know:**
- Microsoft Purview is comprehensive data governance and compliance platform
- Multiple services working together for data protection
- Critical for Copilot deployments

**Key Concepts:**

#### Microsoft Purview Overview

**Definition:**
- Unified data governance, security, risk, and compliance platform
- Protects data across Microsoft 365, Azure, on-premises, multi-cloud
- Essential for AI and Copilot governance

**Location:** https://compliance.microsoft.com

**Core Capabilities:**

#### 1. Microsoft Purview Information Protection

**Purpose:** Discover, classify, protect, and govern sensitive information

**Features:**
- **Sensitivity Labels:**
  - Classify data (Public, Internal, Confidential, Highly Confidential)
  - Apply encryption and access controls
  - Add headers, footers, watermarks
  - Persist across apps and services
  - User-applied or auto-applied

- **Data Classification:**
  - Sensitive Information Types (SITs): Credit cards, SSNs, passport numbers
  - Trainable classifiers: Use ML to identify content types
  - Content Explorer: View labeled content
  - Activity Explorer: Monitor labeling activities

- **Encryption:**
  - Microsoft Purview Message Encryption (email)
  - Rights Management (persistent file protection)
  - Customer Key (bring your own key)

**Use Cases:**
- Protect confidential documents
- Encrypt emails with sensitive data
- Control who can access/edit/forward files
- Track document usage

**Copilot Integration:**
- Copilot respects sensitivity labels
- Won't expose labeled content to unauthorized users
- Labels persist in Copilot-generated content

#### 2. Microsoft Purview Data Loss Prevention (DLP)

**Purpose:** Prevent accidental or intentional data leakage

**How It Works:**
- Monitor content for sensitive information
- Detect policy violations in real-time
- Block, warn, or allow with justification
- Notify users and admins

**Locations Protected:**
- Exchange Online (email)
- SharePoint Online (sites)
- OneDrive for Business
- Microsoft Teams (chat, channel messages)
- Endpoints (Windows devices)
- Microsoft Defender for Cloud Apps (SaaS apps)
- On-premises repositories (via scanner)

**Policy Components:**
- **Conditions:** What triggers policy (credit card numbers, labels, keywords)
- **Actions:** Block, notify user, send incident report, quarantine
- **Exceptions:** When to skip (executive group, legal team)
- **User notifications:** Policy tips, email alerts
- **Incident reports:** Admin notifications

**DLP for Copilot:**
- Prevents Copilot from exposing protected data
- Blocks prompts/responses containing sensitive info
- Audits DLP violations in Copilot interactions

**Adaptive Protection:**
- Dynamic DLP enforcement based on user risk level
- Integration with Insider Risk Management
- Higher risk = stricter DLP controls

#### 3. Microsoft Purview Insider Risk Management

**Purpose:** Detect and mitigate insider threats (malicious or negligent)

**Risk Indicators:**
- Data exfiltration (copying to USB, cloud, email)
- Data theft by departing employees
- Security policy violations
- Excessive data access
- After-hours activity
- Office misuse

**How It Works:**
1. Define policies (e.g., "Data theft by departing users")
2. Specify indicators (downloads, print, USB transfer)
3. Monitor user activities (privacy-preserving)
4. ML assigns risk scores
5. Alerts for high-risk users
6. Investigate in private case
7. Take action (coaching, investigation, termination)

**Common Policies:**
- Data theft by departing users
- General data leaks
- Data leaks by priority users
- Data leaks by disgruntled users
- Security policy violations
- Patient data misuse (healthcare)

**Privacy Features:**
- Pseudonymization (usernames hidden initially)
- Role-based access to investigations
- Audit trail of admin actions

#### 4. Microsoft Purview Communication Compliance

**Purpose:** Detect inappropriate communications and regulatory violations

**What It Monitors:**
- Email (Exchange Online)
- Teams messages and channels
- Yammer posts
- Third-party platforms (via connectors)

**Detection Methods:**
- **Built-in classifiers:**
  - Adult/racy images
  - Threat
  - Harassment
  - Profanity
  - Discrimination
- **Custom keywords:** Your organization's terms
- **Sensitive info types:** Credit cards, PHI
- **ML models:** Context-aware detection

**Regulatory Use Cases:**
- Financial services (SEC, FINRA)
- Healthcare (HIPAA)
- Harassment prevention
- Data security
- Conflict of interest

**Workflow:**
1. Define policy (e.g., "Harassment detection")
2. Specify users in scope
3. Select detection methods
4. Reviewers receive alerts
5. Review flagged content
6. Remediate (notify user, escalate, delete)
7. Document resolution

#### 5. Microsoft Purview Data Security Posture Management (DSPM) for AI

**Purpose:** Protect and govern AI applications and data

**Capabilities:**
- **Discover AI apps:** Find Copilots, ChatGPT, custom AI
- **Assess risks:** Data exposure, oversharing, unauthorized access
- **Monitor activity:** Who's using AI, what data accessed
- **Policy enforcement:** DLP for AI interactions
- **Compliance:** Ensure AI follows data governance

**AI-Specific Risks:**
- Prompt injection (malicious prompts)
- Data leakage through AI responses
- Unauthorized AI app usage (shadow AI)
- Sensitive data in training/prompts

**DSPM Features:**
- AI app inventory
- Data flow mapping
- Risk scoring
- Recommendations
- Integration with DLP and Insider Risk

#### 6. Microsoft Purview Data Lifecycle Management

**Purpose:** Retain what you need, delete what you don't

**Retention Policies:**
- Specify how long to keep content
- Auto-delete after retention period
- Apply to email, SharePoint, Teams, OneDrive
- **Example:** Keep all email for 7 years, then delete

**Retention Labels:**
- Apply to specific items (vs. policies for locations)
- User or auto-applied
- Can trigger disposition review
- **Example:** Label "Contracts" → Retain 10 years

**Disposition Review:**
- Manual review before deletion
- Approver decides keep vs. delete
- Audit trail of decisions

**Records Management:**
- Declare items as records
- Immutable (can't delete/edit)
- Compliance records for regulations

**Use Cases:**
- Regulatory compliance (SOX, HIPAA)
- Litigation hold
- Reduce storage costs
- Information governance

**Copilot and Retention:**
- Copilot-generated content subject to retention
- Copilot prompts/responses can be retained
- Audit logs retained per policy

#### Purview Portal Navigation

**Main Sections:**
- **Data classification:** Labels, SITs, classifiers
- **Information protection:** Sensitivity labels, encryption
- **Data loss prevention:** DLP policies and alerts
- **Insider risk management:** Risk detection and cases
- **Communication compliance:** Policy violations
- **Records management:** Retention and records
- **eDiscovery:** Legal hold and search
- **Audit:** Unified audit log
- **Compliance Manager:** Risk assessment
- **Data lifecycle management:** Retention policies

#### Integration and Automation

**How Purview Components Work Together:**
1. **Classify:** Information Protection labels data
2. **Prevent:** DLP blocks unauthorized sharing
3. **Detect:** Insider Risk identifies threats
4. **Monitor:** Communication Compliance scans messages
5. **Govern:** Lifecycle Management retains/deletes
6. **Secure AI:** DSPM protects AI interactions

**Automation:**
- Auto-labeling based on content
- Auto-apply retention
- Automated investigation (DLP, Insider Risk)
- Alerts to SIEM/SOAR

**Hands-On:**
1. Navigate to https://compliance.microsoft.com
2. Data classification → Overview → View data classification summary
3. Information protection → Labels → Review sensitivity labels
4. Data loss prevention → Policies → Review existing DLP policies
5. Insider risk management → Overview → Check if enabled
6. Communication compliance → Policies → See if configured
7. Data lifecycle management → Retention policies
8. Audit → Search audit log for recent activity

**Documentation:** https://learn.microsoft.com/en-us/purview/

---

### Skill: Identify the use cases for sensitivity labels in Microsoft Purview

**What You Need to Know:**
- Sensitivity labels classify and protect data
- Applied manually by users or automatically
- Follow data everywhere (persistence)

**Key Concepts:**

#### What Are Sensitivity Labels?

**Definition:**
- Tags that classify data based on sensitivity
- Apply protection (encryption, marking, access control)
- Persist across apps and services

**Typical Label Taxonomy:**
| Label | Use For | Protection |
|-------|---------|------------|
| **Public** | Public information | None (or watermark) |
| **General** | Internal, non-sensitive | Watermark "Internal" |
| **Confidential** | Business sensitive | Encryption, limited sharing |
| **Highly Confidential** | Trade secrets, legal | Strong encryption, no external sharing |

#### Use Cases for Sensitivity Labels

**Use Case 1: Protect Confidential Documents**

**Scenario:** Legal contracts, financial reports, M&A documents

**Configuration:**
- Label: "Highly Confidential"
- Encryption: Yes, only Legal team can open
- Watermark: "CONFIDENTIAL"
- Prevent copying/printing

**Result:**
- Only authorized users can open file
- File encrypted even if stolen
- Label visible in all apps

**Use Case 2: Prevent External Sharing**

**Scenario:** Internal strategy documents

**Configuration:**
- Label: "Confidential - Internal Only"
- Encryption: All employees can read
- Block external sharing
- Remove ability to forward/share

**Result:**
- SharePoint/OneDrive prevents external sharing
- Email warns if sending outside org
- DLP enforces restrictions

**Use Case 3: Classify Emails Automatically**

**Scenario:** All emails from CEO are sensitive

**Configuration:**
- Auto-labeling policy
- Condition: Sender = CEO
- Label: "Confidential"
- Apply encryption

**Result:**
- CEO's emails automatically labeled
- Recipients see classification
- Protected from forwarding

**Use Case 4: Copilot Data Protection**

**Scenario:** Ensure Copilot doesn't expose HR data

**Configuration:**
- Label: "Highly Confidential - HR Only"
- Applied to: Personnel files, salary data
- Encryption: HR group only

**Result:**
- Copilot won't surface HR data to unauthorized users
- Label respected in Copilot responses
- Users without access can't see content even through Copilot

**Use Case 5: Regulatory Compliance**

**Scenario:** Healthcare - HIPAA compliance

**Configuration:**
- Label: "PHI - Protected Health Information"
- Encryption: Healthcare workers only
- Watermark: "CONTAINS PHI"
- Auto-apply to: Files with SSN, medical record numbers

**Result:**
- Automatic classification of PHI
- Encryption enforced
- Audit trail for compliance
- DLP prevents accidental disclosure

**Use Case 6: Customer Data Protection**

**Scenario:** Marketing has customer contact lists

**Configuration:**
- Label: "Customer Data - Confidential"
- Apply: Marketing can edit, Sales can view
- Block: Download, print, copy
- Expire: 1 year

**Result:**
- Granular permissions
- Data can't be exfiltrated
- Time-limited access

**Use Case 7: Project-Based Protection**

**Scenario:** Merger & Acquisition - Project Phoenix

**Configuration:**
- Label: "Project Phoenix - Restricted"
- Encryption: Project team only
- Auto-apply: Files in specific SharePoint site
- Block external access

**Result:**
- All project docs auto-protected
- Only team members can access
- Label follows docs if moved

**Use Case 8: Public Disclosure**

**Scenario:** Marketing materials for public use

**Configuration:**
- Label: "Public"
- Protection: Watermark "Public - Approved for Release"
- Allow: External sharing, download

**Result:**
- Clear indication content is approved
- No encryption (public)
- Safe to share externally

#### Label Capabilities

**Visual Marking:**
- Headers
- Footers
- Watermarks
- Customizable text and formatting

**Encryption:**
- Who can access (users, groups, external partners)
- Permissions (view, edit, print, copy, forward)
- Expiration (content becomes inaccessible after date)
- Offline access (how long cached)

**Content Marking:**
- Apply automatically based on:
  - Sensitive information types (credit cards, SSN)
  - Keywords
  - Document properties
  - Trainable classifiers

**Integration:**
- Office apps (Word, Excel, PowerPoint, Outlook)
- SharePoint/OneDrive
- Teams
- Power BI
- Azure Information Protection client (files on disk)
- Third-party apps (via SDK)

#### Label Scope

Labels can apply to:
- **Files:** Office docs, PDFs, images
- **Emails:** Outlook messages
- **Meetings:** Teams meetings
- **Sites:** SharePoint sites/Teams
- **Groups:** Microsoft 365 Groups
- **Schema items:** Power BI dashboards, SQL columns

#### Sub-Labels

**Hierarchy:**
```
Confidential
├── Confidential - Finance
├── Confidential - HR
└── Confidential - Legal
```

**Benefits:**
- Organized taxonomy
- Granular protection
- User-friendly selection

**Best Practices:**

**Label Design:**
- Clear, intuitive names
- 3-5 labels (not too many)
- Consistent protection within tier
- Document in policy

**Deployment:**
- Pilot with subset of users
- Train users on when to use each label
- Monitor adoption via Activity Explorer
- Adjust based on usage

**Automation:**
- Start with recommended labels (user sees suggestion)
- Move to auto-labeling for well-defined scenarios
- Use default labels for sites/groups

**Enforcement:**
- Combine with DLP (enforce label restrictions)
- Mandatory labeling (force users to classify)
- Block removal of labels

**Hands-On:**
1. Purview → Information protection → Labels
2. Review existing labels
3. Create new label:
   - Name: "Test - Confidential"
   - Scope: Files & emails
   - Encryption: Yes, assign permissions
   - Content marking: Watermark "CONFIDENTIAL"
   - Auto-labeling: Keywords "confidential", "secret"
4. Publish label policy:
   - Labels → Publish labels
   - Select label
   - Publish to: Test users
5. Test in Word:
   - Open Word
   - Sensitivity button → Select label
   - See watermark applied
6. View usage:
   - Data classification → Activity Explorer
   - Filter by label

**Documentation:** https://learn.microsoft.com/en-us/purview/sensitivity-labels

---

### Skill: Understand data classification in Microsoft Purview

**What You Need to Know:**
- Data classification identifies and categorizes information
- Foundation for protection (labels, DLP, retention)
- Uses sensitive information types and trainable classifiers

**Key Concepts:**

#### What is Data Classification?

**Purpose:**
- Discover what sensitive data you have
- Understand where it's stored
- Who's accessing it
- How it's being shared

**The Classification Process:**
```
1. Scan → 2. Detect → 3. Classify → 4. Label → 5. Protect → 6. Monitor
```

#### Components of Data Classification

**1. Sensitive Information Types (SITs)**

**Built-in SITs (300+):**
- **Financial:** Credit card, bank account, routing number
- **Government IDs:** SSN, passport, driver's license (by country)
- **Health:** Medical record number, DEA number, health service number
- **Personal:** Email address, phone number, date of birth
- **Business:** IP address, Azure credentials

**Custom SITs:**
- Define your own patterns
- Regular expressions
- Keywords
- Confidence levels

**Example SIT Match:**
```
Content: "My credit card is 4532-1234-5678-9010"
Detected: Credit Card Number (Visa)
Confidence: High (pattern + checksum valid)
```

**2. Trainable Classifiers**

**Built-in Classifiers:**
- Resumes
- Source code
- Harassment
- Profanity
- Threat
- Offensive language
- Customer complaints
- Agreements (NDAs, SOWs, SLAs)

**Custom Trainable Classifiers:**
- Train ML model with your content
- Provide positive examples (this IS the type)
- Provide negative examples (this is NOT)
- Classifier learns patterns
- Use case: Company-specific document types

**Training Process:**
1. Seed: Provide 50-500 positive examples
2. Test: System evaluates on test set
3. Publish: Deploy classifier
4. Monitor: Track performance, retrain if needed

**3. Content Explorer**

**Purpose:** See all your classified content

**What It Shows:**
- Documents with sensitivity labels
- Items containing sensitive info types
- Location (SharePoint, OneDrive, Exchange)
- Who owns it
- Last modified date

**Navigation:**
- By label: "Show me all 'Confidential' files"
- By SIT: "Show me all files with credit cards"
- By location: "What's in Finance team site?"

**Uses:**
- Audit: Verify protection applied correctly
- Cleanup: Find overclassified content
- Risk assessment: Identify exposed sensitive data

**4. Activity Explorer**

**Purpose:** Monitor classification activities

**Tracks:**
- Labels applied/changed/removed
- Who applied them
- When and where
- Auto-labeling events
- DLP policy matches

**Filters:**
- Date range
- User
- Activity type (labeled, changed sensitivity)
- Label name
- Location

**Uses:**
- Adoption tracking: Are users labeling?
- Compliance: Audit trail for regulations
- Troubleshooting: Why was this auto-labeled?
- Investigation: Who removed this label?

#### Classification Methods

**Manual Classification:**
- User selects label in app
- Sensitivity button in Office
- Right-click → Classify and protect

**Recommended Labels (Semi-Auto):**
- System suggests label based on content
- User accepts or chooses different label
- Tooltip explains why suggested

**Automatic Classification:**
- Rules trigger auto-labeling
- Conditions:
  - Content contains SITs (3+ credit cards)
  - Trainable classifier match (resume detected)
  - Document properties (author = CEO)
- No user interaction needed

**Default Labels:**
- Auto-apply to new items
- Examples:
  - All files in HR site: "Confidential - HR"
  - All emails from Finance: "Financial Data"

#### Classification Hierarchy

**Combination Rules:**
- If document has SSN AND credit card → "Highly Confidential"
- If document has only email addresses → "General"
- If sent to external domain → "Public"

**Confidence Levels:**
- Low confidence: 60-75%
- Medium: 75-90%
- High: 90-100%
- Set thresholds: Only auto-label if high confidence

#### Data Classification Dashboard

**Location:** Purview → Data classification → Overview

**Metrics:**
- **Top sensitivity labels:** Most used labels
- **Top sensitive info types:** Most found SITs
- **Locations with sensitive data:** SharePoint, Exchange, OneDrive counts
- **Label activities:** Trending over time
- **Policy matches:** DLP, retention

**Insights:**
- "80% of finance team's files unlabeled" → Need training
- "Spike in SSN detections in Marketing site" → Investigate
- "Confidential label removed 50 times this week" → Audit

#### Common Scenarios

**Scenario 1: Discover Where Credit Cards Are Stored**
1. Data classification → Content Explorer
2. Filter: Sensitive info types → Credit Card Number
3. Review results
4. Export list
5. Remediate: Apply DLP, move to secure location

**Scenario 2: Track Labeling Adoption**
1. Data classification → Activity Explorer
2. Filter: Activity = Sensitivity label applied
3. Date range: Last 30 days
4. Group by: User
5. Identify low adopters
6. Provide training

**Scenario 3: Create Custom Classifier for Invoices**
1. Gather 200 sample invoices (positive examples)
2. Gather 200 non-invoice docs (negative examples)
3. Trainable classifiers → Create classifier
4. Name: "Company Invoices"
5. Upload examples
6. Train model
7. Test and publish
8. Use in auto-labeling policy

**Scenario 4: Audit Sensitive Data in Copilot**
1. Enable DSPM for AI
2. Content Explorer → Filter: AI interactions
3. Review sensitive data accessed via Copilot
4. Check if properly labeled
5. Verify DLP coverage

#### Classification Best Practices

**SIT Usage:**
- Review built-in SITs before creating custom
- Test regex patterns thoroughly
- Set appropriate confidence thresholds
- Combine multiple SITs for accuracy (e.g., SSN + name)

**Trainable Classifiers:**
- Provide diverse, representative examples
- 200+ examples for best results
- Update with new examples quarterly
- Monitor false positives/negatives

**Content Explorer:**
- Regular reviews (monthly)
- Focus on high-risk locations first
- Address unlabeled sensitive data
- Export reports for management

**Activity Explorer:**
- Set up alerts for unusual activity (labels removed)
- Review auto-labeling effectiveness
- Track user adoption trends
- Correlate with DLP events

**Hands-On:**
1. Purview → Data classification → Overview
2. Review dashboard metrics
3. Content Explorer:
   - Filter: Sensitivity labels → Confidential
   - View files, note locations
4. Activity Explorer:
   - Filter: Last 7 days
   - Activity: Sensitivity label applied
   - Review who's labeling
5. Sensitive info types:
   - Browse built-in SITs
   - Search: "Credit Card"
   - View pattern
6. Trainable classifiers:
   - Review built-in classifiers
   - Consider custom classifier need

**Documentation:** https://learn.microsoft.com/en-us/purview/data-classification-overview

---


### Skill: Understand retention

**What You Need to Know:**
- Retention keeps content for compliance/legal requirements
- Prevents premature deletion
- Automatically deletes after retention period

**Key Concepts:**

#### What is Retention?

**Purpose:**
- **Regulatory compliance:** Meet legal requirements (SOX, HIPAA, etc.)
- **Litigation hold:** Preserve evidence for lawsuits
- **Information governance:** Keep what you need, delete what you don't
- **Cost reduction:** Delete old data to reduce storage

**How It Works:**
- Specify retention period (e.g., 7 years)
- Content preserved for that duration
- After period: Disposition (review or delete)
- Users can't permanently delete during retention

#### Retention Policies vs. Retention Labels

| Feature | Retention Policy | Retention Label |
|---------|------------------|-----------------|
| **Applied to** | Entire location (all email, all SharePoint) | Specific items (this contract, that email) |
| **Assignment** | Automatic (all content in location) | Manual or auto (based on rules) |
| **User control** | None | Users can apply labels |
| **Granularity** | Broad | Precise |
| **Use case** | "Keep all email 7 years" | "Keep this contract 10 years" |

#### Retention Policies (Location-Based)

**Supported Locations:**
- Exchange email and public folders
- SharePoint sites
- OneDrive accounts
- Microsoft 365 Groups
- Skype for Business
- Teams channel messages
- Teams chats
- Teams private channel messages
- Yammer messages

**Configuration:**
1. Choose location (e.g., Exchange email)
2. Set retention period (e.g., 7 years)
3. Action after period:
   - Delete automatically
   - Delete after disposition review
   - Retain only (no deletion)
4. Scope: All users or specific users/sites

**Example:**
- **Policy:** "Email Retention 7 Years"
- **Location:** Exchange email (all mailboxes)
- **Period:** 7 years
- **Action:** Delete automatically

**Result:** All email retained 7 years, then auto-deleted

#### Retention Labels (Item-Based)

**Purpose:** Apply specific retention to individual items

**Label Settings:**
- **Retain for:** Duration (3 years, 5 years, forever)
- **Start period:**
  - When created
  - Last modified
  - When labeled
  - Event-based (employee leaves, contract expires)
- **Action after retention:**
  - Delete automatically
  - Trigger disposition review
  - Nothing (retain forever)
- **Declare as record:** Make immutable

**Publishing Labels:**
- Publish to: Exchange, SharePoint, OneDrive, Groups
- Users: All or specific users
- Auto-apply: Rules trigger automatic labeling

**User Experience:**
- "Apply retention label" button in Outlook/SharePoint
- Select label from list
- Label shows in item properties

**Example Labels:**
| Label | Retention | Use For |
|-------|-----------|---------|
| **Contracts** | 10 years, then review | Legal agreements |
| **Tax Records** | 7 years, then delete | Financial docs |
| **Transitory** | 30 days, then delete | Temporary communications |
| **Permanent** | Forever | Critical records |

#### Retention Principles

**When Multiple Policies/Labels Apply:**
1. **Retention wins over deletion:** If one says retain 5 years, another delete 1 year → Retain 5 years
2. **Longest retention period wins:** 7 years beats 3 years
3. **Explicit wins over implicit:** Label overrides policy
4. **Deletion after longest retention:** Delete after longest period ends

**Scenario:**
- Email has label "Retain 3 years"
- Policy on mailbox "Retain 7 years"
- **Result:** Retained 7 years (longest wins)

#### Event-Based Retention

**Concept:** Retention starts when event occurs, not when created

**Use Cases:**
- **Employee leaves:** Start 7-year retention on departure date
- **Contract expires:** Retain 5 years after expiration
- **Product discontinued:** Retain data 10 years after discontinuation

**Implementation:**
1. Define event type (e.g., "Employee Departure")
2. Create label with event-based retention
3. Apply label to employee files
4. When employee leaves: Trigger event
5. Retention period starts counting

**Example:**
- Label: "Employee Files"
- Retention: 7 years after "Employee Departure" event
- Applied to: John's OneDrive
- John leaves Feb 1, 2025
- Trigger event: Feb 1, 2025
- Files retained until: Feb 1, 2032

#### Records Management

**Records:** Important documents requiring special handling

**Record Types:**
- **Regular record:** Can be edited, but not deleted
- **Regulatory record:** Cannot be edited or deleted (immutable)

**Declaring Records:**
- Via retention label
- "Declare as record" or "Declare as regulatory record"
- Once declared: Restrictions apply

**Restrictions on Records:**
- Cannot delete
- Cannot edit (regulatory record)
- Cannot change label
- Exempt from some retention policies

**Use Cases:**
- SEC regulations (financial records)
- HIPAA (medical records)
- Legal holds
- Contracts

**Disposition:**
- When retention period ends
- Records require review before deletion
- Designated reviewer approves/denies deletion
- Audit trail maintained

#### Disposition Review

**Process:**
1. Retention period ends
2. Item flagged for disposition review
3. Reviewer notified
4. Reviewer examines item
5. Decision:
   - **Delete:** Permanently remove
   - **Extend retention:** Keep longer (specify duration)
   - **Relabel:** Apply different label
6. Action logged for compliance

**Reviewers:**
- Designated in label settings
- Multiple reviewers possible
- Email notifications
- Portal: Records management → Disposition

**Example:**
- Label: "Contracts - 10 years"
- After 10 years: Disposition review required
- Reviewer: Legal team
- Decision: Delete expired contracts, extend active ones

#### Adaptive Scopes

**Problem:** Applying policies to dynamic groups

**Solution:** Adaptive scopes use attributes

**Examples:**
- **All executives:** Department = Executive
- **Finance department:** Department = Finance
- **Remote workers:** Office = Remote
- **Contractors:** UserType = Guest

**Benefits:**
- Automatic membership
- No manual updates
- Granular targeting

**Use Case:**
- Policy: "Executive Email Retention"
- Scope: Adaptive - Department = C-Suite
- Retention: 10 years
- Result: All executive email auto-retained

#### Retention for Copilot

**Copilot Content Retention:**
- Copilot prompts: Subject to email retention (if in email)
- Copilot responses: Part of document retention (if in doc)
- Copilot chats: Subject to Teams chat retention
- Copilot meeting summaries: Teams meeting retention

**Audit Logs:**
- Copilot interactions logged
- Subject to audit retention (90 days default, up to 1 year)

**Best Practices:**
- Apply retention to Teams chats (where Copilot used)
- Ensure SharePoint retention covers Copilot-generated docs
- Retain Copilot audit logs for compliance

#### Common Retention Scenarios

**Scenario 1: Email Retention for Compliance**
- **Requirement:** SEC requires 7 years
- **Solution:**
  - Retention policy on Exchange (all mailboxes)
  - 7 years from creation
  - Auto-delete after 7 years

**Scenario 2: Contracts with Disposition Review**
- **Requirement:** Keep contracts 10 years, then review
- **Solution:**
  - Retention label "Contracts"
  - 10 years from created
  - Disposition review required
  - Legal team reviews before deletion

**Scenario 3: Employee File Retention**
- **Requirement:** Keep employee files 7 years after departure
- **Solution:**
  - Event-based retention label
  - Event: "Employee Departure"
  - Retention: 7 years after event
  - Applied to employee OneDrive
  - Trigger event when employee leaves

**Scenario 4: Clean Up Old Email**
- **Requirement:** Delete email older than 2 years
- **Solution:**
  - Deletion policy on Exchange
  - Delete after 2 years
  - Scope: All users
  - Exception: Legal hold users

#### Retention Lock

**Purpose:** Prevent policy/label changes

**When Locked:**
- Cannot delete policy/label
- Cannot reduce retention period
- Can only extend period
- **Use:** Regulatory requirements (immutable policies)

**Hands-On:**
1. Purview → Data lifecycle management → Retention policies
2. Review existing policies
3. Create test retention policy:
   - Policy name: "Test Email Retention"
   - Location: Exchange email (choose specific mailboxes)
   - Retention: 3 years
   - Action: Delete automatically
   - Save
4. Retention labels → Create label:
   - Name: "Test Contract"
   - Retention: 5 years from created
   - Action: Trigger disposition review
   - Declare as record: Yes
   - Publish to SharePoint
5. View disposition:
   - Records management → Disposition
   - See items pending review (if any)
6. Test in SharePoint:
   - Upload document
   - Apply retention label
   - Try to delete (blocked during retention)

**Best Practices:**
- Start with generous retention (can always extend)
- Document retention schedules
- Regular disposition review
- Train users on retention labels
- Use adaptive scopes for dynamic targeting
- Test deletion policies on small scope first

**Documentation:** https://learn.microsoft.com/en-us/purview/retention

---

## Section 2.2: Understand Data Security Implications of Copilot

### Skill: Understand how Copilot accesses data

**What You Need to Know:**
- Copilot only accesses data user already has permission to see
- No elevation of privileges
- Real-time permission checks

**Key Concepts:**

#### Copilot Data Access Model

**Core Principle: Permission-Based Access**
- Copilot impersonates the user
- Queries Microsoft Graph on user's behalf
- Graph enforces existing permissions
- **Result:** User sees through Copilot what they can already see directly

**Example:**
```
User: "Summarize Project Phoenix documents"

Copilot Process:
1. Query Graph for "Project Phoenix" documents
2. Graph checks: Does THIS user have access?
3. Returns: Only docs user can access
4. Copilot summarizes accessible docs

If user lacks access: "I don't have access to that information"
```

**What Copilot CANNOT Do:**
- Access files user can't access
- Read emails in someone else's mailbox (unless delegated)
- Bypass sensitivity labels
- Override DLP policies
- Ignore conditional access
- See SharePoint sites user isn't member of

#### Microsoft Graph - The Data Layer

**What is Microsoft Graph?**
- API that provides unified access to M365 data
- Used by Copilot, apps, integrations
- Enforces permissions at API level

**Graph Data Sources:**
- **Outlook:** Email, calendar, contacts
- **SharePoint:** Files, sites, lists
- **OneDrive:** Personal files
- **Teams:** Chats, channels, meetings
- **People:** Org chart, colleague info
- **Planner:** Tasks, plans
- **OneNote:** Notebooks
- **Insights:** Analytics

**Permission Check Flow:**
```
Copilot Prompt
    ↓
Microsoft Graph API
    ↓
Permission Check (Entra ID)
    ↓
Data Source (SharePoint, Exchange)
    ↓
Return Results (only accessible data)
    ↓
Copilot Response
```

#### Semantic Index for Copilot

**What It Is:**
- AI-powered index of user's M365 data
- Built per user (respects permissions)
- Enables semantic search (concepts, not just keywords)

**How It Works:**
1. Indexes user's accessible content
2. Creates vector embeddings (AI representation)
3. Enables conceptual understanding
4. Copilot queries index for relevant data
5. Returns results matching intent, not just keywords

**Example:**
- User prompt: "What's our strategy for Q4?"
- Semantic index finds: Documents about plans, goals, objectives (even if they don't say "strategy")
- Returns: Relevant docs, emails, meetings

**Privacy:**
- Index is per user
- Only contains data user can access
- Not shared across users
- Respects real-time permission changes

**Permission Updates:**
- If user loses access to file
- Semantic index updates
- Copilot can no longer access
- **Timeline:** Within minutes to hours

#### Data Grounding

**Definition:** How Copilot grounds responses in organizational data

**Grounding Sources:**
1. **Web (Optional):** Public internet
2. **Microsoft Graph:** User's M365 data
3. **Conversations:** Current chat context
4. **Documents:** Specific files referenced

**Admin Controls:**
- Enable/disable web grounding
- Location: M365 Admin Center → Copilot settings
- **Web On:** Copilot can reference public info
- **Web Off:** Only organizational data

**Response Attribution:**
- Copilot cites sources
- Links to documents used
- User can verify information
- Click link → View source (if permitted)

**Example:**
```
User: "What were the Q3 results?"
Copilot: "Based on the Q3 Financial Report.xlsx..."
[Link to report]
```

#### Permission Boundaries

**SharePoint Permissions:**
- Copilot respects site members, visitors, owners
- Unique permissions on folders/files honored
- Broken inheritance respected

**Email Permissions:**
- User's own mailbox
- Delegated mailboxes (if granted access)
- Shared mailboxes (if member)
- **NOT:** Other users' mailboxes

**Sensitivity Labels:**
- Copilot cannot decrypt if user lacks rights
- Will not surface labeled content to unauthorized users
- Label restrictions apply (no copy/paste if blocked)

**DLP Policies:**
- Copilot prompts/responses scanned
- DLP can block sensitive content in responses
- User sees policy tip if DLP triggered

**Conditional Access:**
- Copilot access subject to CA policies
- If user blocked from Teams → No Copilot in Teams
- Device compliance required if policy enforces

#### Copilot and External Data

**External Sharing:**
- If user can access externally shared file → Copilot can too
- If guest user has limited access → Copilot limited too

**Cross-Tenant:**
- Copilot doesn't cross tenant boundaries
- Only accesses data in user's tenant

**Public Sites:**
- If web grounding enabled
- Copilot can reference public sites
- Admin can disable

#### Temporal Access

**Real-Time Checks:**
- Every Copilot query re-checks permissions
- Not cached (always current)

**Scenario:**
1. User asks Copilot about Project Phoenix (has access)
2. Copilot responds with info
3. Admin removes user from Phoenix site
4. User asks again 5 minutes later
5. Copilot: "I don't have access to that information"

#### Copilot in Different Apps

**Copilot in Word:**
- Accesses: Current document + user's OneDrive/SharePoint
- Permissions: User's file access rights

**Copilot in Excel:**
- Accesses: Current workbook data
- Permissions: User's workbook access

**Copilot in PowerPoint:**
- Accesses: Current presentation + user's files for images/content
- Permissions: User's file access rights

**Copilot in Outlook:**
- Accesses: User's emails, calendar, contacts
- Permissions: User's mailbox permissions

**Copilot in Teams:**
- Accesses: Teams chats, channels, meetings user is part of
- Permissions: Team membership

**Microsoft 365 Chat (Business Chat):**
- Accesses: All user's M365 data (email, files, chats, calendar)
- Permissions: Combined permissions across all apps

#### Oversharing Risk

**Problem:** Copilot surfaces data user shouldn't have seen

**Why It Happens:**
- Overly permissive SharePoint permissions
- Everyone in org can access Finance site
- Copilot shows finance data to non-finance users

**Solution:**
- Audit SharePoint permissions
- Use SharePoint Advanced Management
- Data access governance reports
- Remediate oversharing BEFORE Copilot rollout

**Preparation Checklist:**
- Review "Everyone except external" permissions
- Check "Company wide" links
- Audit site memberships
- Run data access governance report
- Implement least privilege

#### Hands-On:**
1. Test Copilot permission boundaries:
   - Access Microsoft 365 Chat
   - Ask: "Show me files about [confidential project]"
   - If no access → Copilot says can't access
   - Have admin grant access
   - Ask again → Copilot now shows results
2. Check web grounding setting:
   - M365 Admin Center → Copilot
   - View web search setting
3. Test with sensitivity labels:
   - Label file as "Highly Confidential - Exec Only"
   - Ask Copilot about file (as non-exec)
   - Verify Copilot doesn't expose content
4. Review semantic index (conceptual):
   - Ask Copilot broad question
   - Note how it finds relevant docs even without exact keywords

**Key Takeaways:**
- Copilot = User permissions (no elevation)
- Real-time permission checks
- Respects labels, DLP, CA policies
- Semantic index is per-user, permission-aware
- Prepare environment: Fix oversharing first!

**Documentation:** https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-privacy

---

