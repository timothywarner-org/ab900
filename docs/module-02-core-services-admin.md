# Module 2: Introduction to Microsoft 365 Core Services and Admin Controls

**Learning Path:** Explore Microsoft 365 Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/introduction-microsoft-365-core-services-admin-control/
**AB-900 Domain:** 1 -- Identify the core features and objects of Microsoft 365 services (30-35%)

---

## Unit 1: Explore the Microsoft 365 Ecosystem

### Layered Architecture
- **Identity layer:** Microsoft Entra ID -- authentication, conditional access, identity protection
- **Service layer:** Exchange Online, Teams, SharePoint Online, OneDrive, Copilot
- **Data layer:** Microsoft Graph -- RESTful API connecting data across services, powers Copilot contextual intelligence
- **Intelligence layer:** Copilot and AI-powered agents deliver personalized assistance, recommendations, automation
- **Security and compliance layer:** DLP, eDiscovery, retention, auditing (unified under Microsoft Purview)

### Cross-Service Integration
- Microsoft Entra is the broader platform encompassing Entra ID, Entra Permissions Management, and Entra Verified ID
- Supports Zero Trust principles -- manage identities, govern permissions, verify credentials from a unified platform
- A Conditional Access policy change in Entra ID affects Teams, SharePoint, and Exchange simultaneously
- DLP policies in Microsoft Purview apply across email, chat, and file storage

### Domain Names
- Default domain: `contoso.onmicrosoft.com`; most orgs add custom domains (e.g., `contoso.com`)
- Adding a custom domain requires DNS record verification
- Microsoft 365 supports multiple domains per tenant (useful for subsidiaries, brands, regions)
- Security and compliance features respect domain boundaries

### Core Service Components

**Exchange Online**
- Cloud-based email and calendaring; anti-malware, anti-spam, DLP built in
- Object types: user mailboxes, shared mailboxes, distribution lists (distribution groups)
- Transport rules (mail flow rules) inspect content and headers to enforce policies
- Supports hybrid configurations (on-premises plus cloud)

**Microsoft Teams**
- Collaboration hub: chat, meetings, calling, app integration
- Built on Microsoft 365 Groups and SharePoint -- every team provisions a SharePoint site and Exchange group mailbox
- Channels organized by topic or project; support threaded conversations, shared files, app tabs
- Meetings integrated with Outlook; support recording, transcription, breakout rooms

**SharePoint Online**
- Content management and intranet platform
- Two site types: communication sites (broadcast info) and team sites (group collaboration tied to M365 Groups)
- Document libraries support versioning, metadata tagging, real-time co-authoring
- Lists for structured data, enhanced with Power Automate and Power Apps

**OneDrive for Business**
- Personal cloud storage; typically 1 TB per user
- Known Folder Move (KFM) redirects Desktop, Documents, Pictures to OneDrive
- Sharing controls: view or edit permissions, expiration dates, passwords
- Admins configure sharing policies via Microsoft Purview portal

**Copilot and AI-Powered Agents**
- Built-in AI assistant using large language models plus organizational data
- Features: contextual assistance, content generation, workflow automation, personalized insights
- Agents are task-oriented digital helpers that automate workflows, answer questions, and act on user intent
- Custom agents built with Microsoft Copilot Studio
- Managed through Microsoft 365 admin centers with controls for data access, compliance, responsible AI

### Copilot as Intelligence Layer Engine
- Powers experiences across the platform via Microsoft Graph data layer
- Graph respects security controls: role-based access, sensitivity labels, conditional access
- Key functions: contextual intelligence, cross-service automation, personalized recommendations, conversational interaction, extensibility via Copilot Studio, governance and control

### Security and Compliance
- Zero Trust security model: access based on identity, device health, location, behavior
- Microsoft Defender XDR (includes Defender for Office 365): protection against phishing, malware, business email compromise
- Microsoft Purview: sensitivity labels (encryption, watermarking, access restrictions), DLP, eDiscovery, audit logs, retention policies
- Copilot respects data access permissions, DLP, sensitivity labels; interactions logged for auditing

---

## Unit 2: Explore the Microsoft 365 Admin Center and Key Admin Tools

### Admin Center Overview
- Web portal at **https://admin.microsoft.com**
- Role-aware interface: features visible depend on assigned admin roles
- Dashboard: user activity, license usage, service health, recommended actions
- Navigation categories: Users, Devices, Roles, Billing, Reports, Settings
- Links to specialized portals: Exchange admin center, Teams admin center, SharePoint admin center

### User and License Management
- **Users > Active Users:** create users (manual or bulk import), assign or remove licenses, reset passwords, configure MFA, set metadata
- **Billing > Licenses:** view subscriptions, assign licenses, purchase more
- License types determine feature access (E3 = core productivity; E5 = advanced security, compliance, eDiscovery)
- Group-based licensing: auto-provision licenses to group members; max 20 groups per assignment; no nested group support; users must have location set
- Groups: M365 groups, security groups, distribution lists

### Service Management Areas
- **Exchange admin center (EAC):** mailboxes, shared mailboxes, resource mailboxes, mail flow rules, connectors, accepted domains, retention policies, litigation hold
- **Teams admin center:** teams and channels, meeting policies, messaging settings, app permissions, call quality, usage analytics
- **SharePoint admin center:** site collections, storage quotas, sharing policies, access controls, activity and usage trends
- OneDrive settings managed within SharePoint admin center (sync, sharing, storage limits, retention, device access)

### Configuration Tasks
- Organization profile: company name, logo, contact info (appears in Outlook, Teams)
- Security defaults: enforce MFA, block legacy authentication
- External sharing: allow or restrict guest access, require authentication, set expiration dates; can be scoped per department
- Email signatures and disclaimers via transport rules in Exchange
- Domain management and DNS records under Org Settings
- Multitenant management: tenant roles, calendar sharing, cross-tenant collaboration

### Service Health and Monitoring
- **Service Health Dashboard:** real-time status of M365 services; incidents, advisories, planned maintenance; subscribe to email alerts
- **Usage Reports:** track adoption and engagement across Exchange, Teams, SharePoint, OneDrive (active users, storage, collaboration patterns)
- **Message Center:** updates on new features, deprecations, configuration recommendations

### PowerShell and Automation
- **Exchange Online PowerShell:** mailboxes, transport rules, compliance settings
- **Teams PowerShell Module:** policies, teams management, provisioning
- **SharePoint Online Management Shell:** sites, storage, sharing
- **Microsoft Graph PowerShell SDK:** unified API access across services
- Supports bulk operations, scheduled tasks, integration with other systems

---

## Unit 3: Examine Microsoft Exchange, Teams, and SharePoint

### Exchange Online Configuration

**Required Roles:**
- Global Administrator, Exchange Administrator, or Organization Management role group
- RBAC roles: Role Management (create and modify role groups), View-Only Organization Management (helpdesk access)
- End-user roles assigned through role assignment policies (manage own mailbox, create and manage distribution groups)

**Mailbox Creation:**
- **User mailboxes:** auto-provisioned when Exchange Online license assigned; default quota 50 GB or 100 GB depending on plan
- **Shared mailboxes:** no separate license needed (unless mobile access); created in EAC; assign send-as or send-on-behalf rights (e.g., support@contoso.com)
- **Resource mailboxes:** for rooms and equipment; auto-accept or decline based on availability; define scheduling options and delegates

**Mail Flow and Policies:**
- **Transport rules:** inspect content, headers, and attachments; block executables, encrypt sensitive emails, append disclaimers
- **Accepted domains:** define email domains Exchange Online handles; verify via DNS
- **Connectors:** route email between Exchange Online and on-premises or third-party systems (hybrid mail flow)

**Security and Compliance:**
- **Retention policies:** retention tags define how long messages kept before deletion (e.g., 30-day deleted item retention)
- **Litigation hold:** preserves all mailbox content including deleted items and original versions for legal discovery; set duration in EAC

### SharePoint Online Configuration

**Required Roles:** Global Administrator or SharePoint Administrator

**Site Provisioning:**
- **Team sites:** linked to M365 Groups; auto-provision shared library, group mailbox, calendar
- **Communication sites:** for broadcasting (company news, policies, training); visually rich layouts
- **Site templates:** built-in templates for document centers, project management, knowledge bases

**Document Libraries and Lists:**
- Libraries: versioning, metadata tagging, real-time co-authoring, content types, content approval workflows
- Custom lists: structured data (issue tracking, asset inventories, contacts); Power Automate triggers workflows on list activity

**Permissions and Sharing:**
- Permissions at site, library, folder, or item level using SharePoint groups or Entra ID
- **Permission inheritance:** hierarchical model; child objects inherit parent permissions unless inheritance is broken
- **External sharing:** guest access per site, authentication required for shared links, expiration dates
- **Sharing links:** View or Edit, expiration dates, password protection

### Microsoft Teams Configuration

**Required Roles:** Global Administrator or Teams Administrator

**Teams and Channels:**
- Teams can be created manually or auto-provisioned with M365 Groups
- Channel types: standard (open to all members), private (restricted), shared (across multiple teams)
- Channels support moderation, posting permissions, app tabs

**Policy Configuration:**
- **Meeting policies:** recording, transcription, anonymous join; assigned to users or groups (e.g., allow recording for managers only)
- **Messaging policies:** GIFs, stickers, external chat, file sharing; scoped by compliance needs
- **App permissions:** approve or block third-party and custom apps; configure integration settings

**Integration and Automation:**
- **Tabs:** pin apps (SharePoint, OneNote, Power BI) in channels
- **Connectors:** integrate external services (Trello, Salesforce)
- **Bots:** automate helpdesk, HR inquiries, project management
- **Power Automate:** route approvals, send notifications based on channel activity

---

## Unit 4: Establish Security, Identity, and Compliance Foundations

### Primary Tools
- **Microsoft Entra** (identity and access), **Microsoft Purview** (compliance and governance), **Microsoft Intune** (device management)

### Device Access Policies

**Device Compliance Policies (Intune):**
- Requirements: encryption (BitLocker), antivirus, firewall, minimum OS version, password complexity
- Devices meeting criteria marked "compliant"; status used in conditional access policies
- Noncompliant devices denied access until issues resolved

**Conditional Access Based on Device State:**
- Policies in Entra ID evaluate: compliant, hybrid Entra ID joined, Intune-managed
- Example: block Teams and Exchange access unless device is both compliant and hybrid Entra ID joined
- Personal devices can be allowed browser-only with limited functionality

**App Protection Policies (BYOD focus):**
- Operate at app level; no full device enrollment required
- Restrict: copy and paste from corporate apps, save data locally, access from rooted or jailbroken devices

### Conditional Access Policies

**User and Group Targeting:**
- Apply different controls by role, department, or risk profile
- Example: require MFA for Finance group accessing Exchange; block guest SharePoint access from noncompliant devices

**Sign-in Risk Evaluation:**
- Assesses each sign-in using signals from Microsoft Defender for Identity
- Detects: unfamiliar locations, impossible travel, leaked credentials, malware indicators
- Actions: require MFA, block access, prompt password reset

**Session Controls:**
- Enforced through Microsoft Defender for Cloud Apps
- Limit actions during active sessions: restrict downloads, copying, printing
- Example: browser-only SharePoint access from unmanaged devices with no download or print allowed

### Content Protection Policies

**Sensitivity Labels (Microsoft Purview Information Protection):**
- Classify and protect data; apply encryption, restrict access, add watermarks, headers, and footers
- Can be manually applied or auto-applied via content inspection
- Example: "Confidential -- Legal" label encrypts document, restricts to Legal group only

**Data Loss Prevention (DLP):**
- Monitor and control sharing of sensitive data (credit card numbers, SSNs, health records)
- Actions: block, notify user, generate admin alerts
- Enforced across Outlook, SharePoint, Teams
- Incidents logged in Microsoft Purview portal

**Retention Policies:**
- Manage content lifecycle across emails, documents, Teams messages
- Preserve or delete per business or regulatory requirements
- Example: HR SharePoint site -- retain all documents 7 years, then auto-delete unless on legal hold

### Policy Deployment and Monitoring
- **Microsoft Purview portal:** DLP alerts, audit logs, policy matches, incident investigation
- **Microsoft Entra admin center:** conditional access sign-in logs (policies applied, access granted or blocked)
- **Intune reporting dashboards:** device compliance status, app protection enforcement, trends

---

## Unit 5: Assign Admin Roles Using Role-Based Access Control (RBAC)

### RBAC Fundamentals
- Based on **principle of least privilege**: grant only the access needed
- Supports **separation of duties**: no single individual has unchecked power
- Prevents privilege creep (accumulation of unnecessary permissions over time)
- Creates clear, auditable structure for administrative access

### Predefined Admin Roles
- Assigned via **Microsoft 365 admin center** (search users or groups, review permissions, assign)
- Key built-in roles:
  - **Global Administrator:** full access across all M365 services (use sparingly)
  - **Exchange Administrator:** Exchange-related settings only
  - **Teams Administrator:** Teams policies and settings only
  - **SharePoint Administrator:** site collections, permissions, sharing
  - **Helpdesk Administrator:** password resets, basic user management
  - **Billing Administrator:** billing and subscription management
  - **Compliance Administrator:** audit logs, DLP policies
  - **User Administrator:** manage user accounts
- PowerShell supports bulk role assignments and reporting

### Custom Roles
- Created in **Microsoft Entra ID** when built-in roles are too broad or do not fit
- Three steps:
  1. **Define permissions:** select specific permissions (read directory data, manage devices, read audit logs, etc.)
  2. **Assign scope:** limit to specific groups, departments, or resources
  3. **Assign users or groups:** group-based assignment preferred for automatic updates

### Secure Delegation Best Practices
- Use groups for role assignment -- auto-update when members join or leave; prevents orphaned permissions
- Regularly review role assignments -- scheduled audits to find and remove outdated permissions
- Document role definitions and assignments -- purpose, assigned users and groups, relevant policies
- Revoke temporary elevated permissions as soon as the task is complete

### Monitor and Audit Role Assignments
- **Microsoft Purview portal:** audit logs of role changes and admin activities
- **Microsoft Entra admin center:** detailed views of current role assignments, access patterns, assignment timestamps
- **Automated alerts:** configure for critical role changes (Global Admin, Compliance Admin assignments or removals)
- Investigate anomalies (e.g., Global Admin assigned outside business hours)
