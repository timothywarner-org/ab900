# Segment 1: Core Microsoft 365 Features and Objects - Official Resources

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Official Microsoft Documentation

### Microsoft 365 Overview
- **Microsoft 365 Enterprise Overview**
  - https://learn.microsoft.com/microsoft-365/enterprise/
  - Comprehensive overview of Microsoft 365 architecture and services

- **Microsoft 365 admin center**
  - https://admin.microsoft.com/
  - Central hub for Microsoft 365 administration
  - https://admin.cloud.microsoft also resolves. Microsoft is consolidating user-facing apps and services onto the `*.cloud.microsoft` domain, and Learn procedures increasingly link the newer host. If you maintain network allow lists, include `*.cloud.microsoft`, `*.static.microsoft`, and `*.usercontent.microsoft` or users hit connectivity failures.

### Exchange Online
- **Exchange Online Documentation**
  - https://learn.microsoft.com/exchange/exchange-online
  - Mailbox management, distribution groups, and administrative tasks

- **Exchange admin center**
  - https://admin.exchange.microsoft.com
  - Web-based interface for Exchange administration. The current product name is **Exchange admin center**, abbreviated EAC. Do **NOT** call it the "Exchange Online admin center".

- **Key Topics:**
  - Mailbox types (user, shared, resource)
  - **Distribution groups**, also called distribution lists. Both terms are current; the UI tab label is **Distribution list**. Create one at **Recipients** > **Groups** > **Distribution list** > **Add a group** > group type **Distribution**. The Groups page has four tabs: Microsoft 365, Distribution list, Dynamic distribution list, and Mail-enabled security.
  - Shared mailboxes store up to 50 GB without a license. Exceeding 50 GB, using in-place archiving, or applying litigation hold requires an Exchange Online Plan 2 license.
  - Mail flow and transport rules
  - Calendar permissions and delegation

### SharePoint in Microsoft 365
- **SharePoint Administrator Role**
  - https://learn.microsoft.com/sharepoint/sharepoint-admin-role
  - Site management, permissions, and sharing settings

- **SharePoint Advanced Management**
  - https://learn.microsoft.com/sharepoint/advanced-management
  - Content sprawl prevention, lifecycle management, permissions streamlining
  - Data access governance reports, oversharing remediation
  - Restricted access control (RAC) and restricted content discovery (RCD)
  - Site ownership policies, inactive sites management

- **SharePoint admin center**
  - https://admin.microsoft.com/sharepoint
  - Central administration for SharePoint in Microsoft 365. The current product name is **SharePoint admin center**.

- **Key Topics:**
  - Sites, libraries, and folders (the objects the exam objective names)
  - Roles and permissions for sites in SharePoint in Microsoft 365
  - Permission levels and groups
  - Sharing policies (internal and external)
  - SharePoint Advanced Management. The Copilot-readiness subset unlocks when at least one user in the organization holds a Microsoft 365 Copilot license. The **full** feature set still requires the SharePoint Advanced Management Plan 1 add-on; restricted site creation is one example that a Copilot license does not unlock.

### Microsoft Teams
- **Teams Administration Overview**
  - https://learn.microsoft.com/en-us/microsoftteams/teams-overview
  - Administrative controls, policies, and management features

- **Teams Admin Center**
  - https://admin.teams.microsoft.com/
  - Manage Teams policies, users, and settings

- **Key Topics:**
  - Teams and channels structure
  - Messaging policies
  - Meeting policies
  - App permissions and governance
  - Guest access policies
  - External access configuration

### Microsoft Entra ID

Terminology rule for this course: the identity service is **Microsoft Entra ID**, the portal is the **Microsoft Entra admin center**, and "Microsoft Entra" without ID is correct when naming the product family. Never use "Azure AD", "AAD", or "Azure Active Directory". Related renames: Azure AD Connect is now **Microsoft Entra Connect**, and Azure AD Connect Cloud Sync is **Microsoft Entra Cloud Sync**.

- **Microsoft Entra ID Overview**
  - https://learn.microsoft.com/entra/fundamentals/whatis
  - Cloud-based identity and access management service
  - Authentication, Conditional Access, and SSO

- **Microsoft Entra admin center**
  - https://entra.microsoft.com/
  - https://learn.microsoft.com/entra/fundamentals/entra-admin-center
  - Navigation is organized into five product areas: **Entra ID**, **ID Protection**, **ID Governance**, **Verified ID**, and **Global Secure Access**
  - The Entra ID node now also includes an **Agents** area documented as Microsoft Entra Agent ID

- **Conditional Access**
  - https://learn.microsoft.com/entra/identity/conditional-access/overview
  - Path: entra.microsoft.com > **Entra ID** > **Conditional Access**. The area has an Overview page, a **Coverage** tab showing application policy coverage over the past seven days, and a **Policies** page.
  - The target selector is now labeled **Resources (formerly cloud apps)**, and the all-resources option reads **All resources (formerly 'All cloud apps')**
  - Security Reader is enough to view; Conditional Access Administrator is required to create policies
  - Risk-based access policies, MFA requirements, device compliance checks, location-based policies

- **Authentication methods and mandatory MFA**
  - https://learn.microsoft.com/entra/identity/authentication/concept-mandatory-multifactor-authentication
  - Methods are managed in the unified **Authentication methods policy** at Entra ID > **Authentication methods** > **Policies**. Managing methods in the legacy MFA and legacy SSPR policies retired September 30, 2025. Per-user MFA enable/disable state itself was **NOT** retired.
  - Mandatory MFA Phase 1 has covered the Microsoft 365 admin center since February 2025 and the Azure portal, Entra admin center, and Intune admin center since October 2024. Phase 2 began October 1, 2025 for Azure CLI, Azure PowerShell, and Resource Manager control-plane Create/Update/Delete operations. The final postponement date was July 1, 2026, which has passed.
  - Phase 2 scope is server-side at Azure Resource Manager: only requests to management.azure.com are in scope. Microsoft Graph APIs are generally **NOT** in scope. Workload identities are not impacted; user accounts used as service accounts **ARE**.
  - No opt-out. Applies to break-glass accounts, B2B guests, and test tenants. Public Azure cloud only.
  - Check enforcement status at https://aka.ms/managemfaforazure (Phase 1) and https://aka.ms/postponePhase2MFA (Phase 2).

- **Passkeys and the SMS/voice retirement**
  - https://learn.microsoft.com/entra/identity/authentication/concept-sms-voice-retirement
  - September 1, 2026: users enabled for SMS or voice are auto-enabled for passkeys, and the tenant Registration Campaign moves to Microsoft Managed state targeting passkeys
  - February 1, 2027: Microsoft-provided telecom delivery for SMS and voice is fully retired. Users whose only method is SMS or voice get a blocking prompt to register a passkey. Microsoft states there is no opt-out from the February 1 behavior.
  - Two passkey types: **synced** passkeys (saved to a platform credential manager) and **device-bound** passkeys (Passkey in Microsoft Authenticator, Entra Passkey on Windows, FIDO2 hardware security key)
  - Microsoft publishes a discovery script at https://github.com/microsoft/entra-sms-voice-usage-analyzer

- **Identity Secure Score**
  - https://learn.microsoft.com/entra/identity/monitoring-health/concept-identity-secure-score
  - Path: entra.microsoft.com > **Entra ID** > **Identity Secure Score**, or Entra ID > **Overview** > **Recommendations** with the Security filter. It is **NOT** under a top-level "Protection" or "Security" node.
  - Available to free and paid customers; some recommendations require a paid license. Scores recalculate every 24 hours.
  - It is the Identity category of the broader **Microsoft Secure Score**, which also covers Data, Devices, Infrastructure, and Apps and is viewed in the Microsoft Defender portal.

- **App registrations and Enterprise applications**
  - https://learn.microsoft.com/entra/identity-platform/how-applications-are-added
  - Both are under entra.microsoft.com > **Entra ID**
  - **App registrations** hold application objects: the definition of an app (name, redirect URIs, secrets, API permissions, app roles). They exist only in the app's home tenant.
  - **Enterprise applications** are service principal objects: the local instance of an app in a tenant. This is where you configure single sign-on, user assignment, and provisioning.

- **Single Sign-On (SSO)**
  - Seamless authentication across Microsoft 365 apps
  - Configured per application under Enterprise applications
  - Third-party application integration

- **Privileged Identity Management (PIM)**
  - https://learn.microsoft.com/entra/id-governance/privileged-identity-management/pim-configure
  - Path: entra.microsoft.com > **ID Governance** > **Privileged Identity Management**. It is **NOT** under Entra ID.
  - Manages three scopes: Microsoft Entra roles, Azure resource roles, and Groups (PIM for Groups)
  - Just-in-time access, time-bound role assignments, approval workflows, MFA on activation, audit trails and access reviews
  - PIM audit data in the admin center covers the past 30 days only; longer retention requires routing to an Azure storage account via Azure Monitor

- **PIM Assignment Types:**
  - **Eligible:** Requires activation when needed
  - **Active:** Immediately usable
  - Each can additionally be **Permanent** (no expiration) or **Time-bound** (expires on specified dates)

### Audit logs
- **Unified audit log search**
  - https://learn.microsoft.com/purview/audit-search
  - Two current entry points, and neither is the retired compliance portal: **purview.microsoft.com** > **Audit**, and **security.microsoft.com** > **Audit**
  - Audit (Standard) default retention is **180 days**. E5 and equivalent tiers get one year by default for Entra ID, Exchange, and SharePoint activity.
  - `Search-UnifiedAuditLog` in Exchange Online PowerShell is **NOT** deprecated and still backs the search tool. For programmatic bulk download Microsoft recommends the Microsoft 365 Management Activity API.
  - Search jobs keep running after the browser closes. Completed jobs are retained 30 days. Each admin can have up to 10 concurrent search jobs, with a limit of one unfiltered job.

### Zero Trust Security
- **Zero Trust Principles**
  - Verify explicitly (authenticate and authorize)
  - Use least privilege access
  - Assume breach (minimize blast radius)

- **Implementation:**
  - Strong identity verification
  - Conditional access policies
  - Device compliance
  - Application protection
  - Data classification and encryption

## Microsoft Learn Training Modules

### Microsoft 365 Fundamentals
- **MS-900 retired on March 31, 2026.** AB-900 is the successor Fundamentals credential in the Microsoft 365 space. Do **NOT** present MS-900 as a currently available alternative.

### Microsoft Entra ID
- **Microsoft Entra ID training and documentation**
  - https://learn.microsoft.com/entra/fundamentals/whatis
  - Identity and access management
  - Authentication and authorization
  - Conditional Access configuration
  - Security controls in Microsoft Entra ID

### Exchange, SharePoint, and Teams
- **Microsoft 365 Service Administration**
  - Core service administration concepts
  - User and group management
  - License assignment
  - Service configuration

## Licensing

### Microsoft 365 Licensing Overview
- **Microsoft 365 Service Descriptions**
  - https://learn.microsoft.com/office365/servicedescriptions/office-365-service-descriptions-technet-library
  - Detailed breakdown of what is included in each license

### Copilot Licensing Requirements
- **Microsoft 365 Copilot Licensing**
  - https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing
  - Microsoft 365 Copilot is an **add-on** requiring an eligible base subscription
  - There is **NO** seat minimum. The 300-seat minimum was removed in January 2024.
  - License assignment methods: individual, group-based, and PowerShell

### License Types

Eligibility marker: **Yes** means the base license qualifies for the Microsoft 365 Copilot add-on.

| License | Copilot add-on eligible | Key Features |
|---------|-------------------------|--------------|
| Microsoft 365 E7 | Included, no add-on needed | E5 + Microsoft 365 Copilot + Microsoft Entra Suite + Agent 365. Generally available May 1, 2026. A strict superset of E5. |
| Microsoft 365 E5 | Yes | All E3 plus advanced security, compliance, and analytics |
| Microsoft 365 E3 | Yes | Enterprise apps, security, compliance |
| Microsoft 365 Business Standard | Yes | Business apps, Teams, Exchange, SharePoint |
| Microsoft 365 Business Premium | Yes | All Standard plus security and device management |
| Microsoft 365 F1 / F3 | Yes | Frontline worker plans |
| Office 365 E1 / E3 / E5 / F3 | Yes | Cloud services; Office 365 became eligible in January 2024 |
| Microsoft Teams, Exchange, SharePoint, OneDrive standalone plans | Yes | See the licensing article for the full prerequisite list |

**Separate SMB SKU.** **Microsoft 365 Copilot Business** is a distinct add-on requiring Microsoft 365 Business Basic, Business Standard, Business Premium, or Microsoft 365 Apps for Business. It caps at **300 seats** per tenant. Microsoft states it delivers the same capabilities as the enterprise Microsoft 365 Copilot offering; the difference is price point and eligibility, not feature set. It sells only as an annual commitment.

**The only surviving "300" is a maximum, not a minimum.** Teaching a "300-seat minimum for Copilot" is flatly wrong today.

## Hands-On Labs and Practice

### Microsoft 365 Developer Program
- **Sign up for free M365 tenant**
  - https://developer.microsoft.com/en-us/microsoft-365/dev-program
  - Instant sandbox with sample data
  - 25 user licenses for testing
  - Renewable 90-day subscription

### Practice Tasks
1. **User Management**
   - Create users in Microsoft Entra ID
   - Assign licenses to users and to groups
   - Review the Authentication methods policy and register a passkey
   - Set up a Conditional Access policy using the **Resources** selector

2. **Exchange Online**
   - Create shared mailboxes
   - Configure distribution groups at **Recipients** > **Groups** > **Distribution list**
   - Set calendar permissions
   - Test mail flow

3. **SharePoint**
   - Create site collections
   - Configure sharing settings
   - Set permissions
   - Review SharePoint Advanced Management

4. **Teams**
   - Create teams and channels
   - Configure policies
   - Test guest access
   - Manage apps

5. **Security**
   - Configure conditional access
   - Set up PIM roles
   - Review audit logs
   - Test Zero Trust policies

## AB-900 Exam Focus Areas

### Domain 1: Core Microsoft 365 Features and Objects (30-35%)

Domain 1 contains exactly three subsections: "Identify the core objects of Microsoft 365 services", "Understand the Microsoft 365 security principles", and "Identify the core security features of Microsoft 365 services". Two of the three are flagged **Minor changed** in the July 22, 2026 change log: the core objects subsection and the core security features subsection.

**What to Study:**
- [ ] How license types assigned to users **and groups** affect access to Microsoft 365 features
- [ ] Exploring organization configuration in the Microsoft 365 admin center (domain names and org settings)
- [ ] Objects to configure in the **Exchange admin center** (mailboxes and **distribution groups**)
- [ ] Objects to configure in the **SharePoint admin center** (sites, libraries, and folders)
- [ ] Roles and permissions for sites in SharePoint in Microsoft 365
- [ ] Objects to configure in the **Teams admin center** (teams, channels, and policies)
- [ ] Zero Trust principles, authorization, authentication methods
- [ ] Threat protection and intelligence, and **Microsoft Defender XDR** capabilities
- [ ] Microsoft Entra ID features and capabilities
- [ ] Conditional Access policies
- [ ] Purpose and benefits of SSO
- [ ] Choosing the appropriate security object (users and groups)
- [ ] Tools to troubleshoot sign-in issues (MFA, Conditional Access, risky sign-ins)
- [ ] Interpreting **Identity Secure Score** in Microsoft Entra ID
- [ ] Reviewing audit logs for user and admin activity
- [ ] The role of **Privileged Identity Management (PIM)**
- [ ] **App registrations versus Enterprise applications**

**Key Concepts:**
- License assignment to users and to groups, and the downstream feature impact
- Navigating the current admin centers by their current names
- Mailbox types and when a shared mailbox needs a license
- SharePoint permission inheritance and oversharing remediation
- Teams policies and governance
- Zero Trust: verify explicitly, least privilege, assume breach
- Conditional Access conditions and controls, using the current **Resources** label
- PIM just-in-time access, and Eligible versus Active
- The application object versus service principal distinction behind App registrations and Enterprise applications
- Where Identity Secure Score sits relative to Microsoft Secure Score

## Additional Resources

### Video Training
- **Microsoft Mechanics YouTube Channel**
  - https://techcommunity.microsoft.com/t5/microsoft-mechanics-blog/bg-p/MicrosoftMechanicsBlog
  - Technical deep dives and feature demos

### Community
- **Microsoft Tech Community**
  - https://techcommunity.microsoft.com/
  - Forums, blogs, and discussions

- **Microsoft 365 Community (PnP)**
  - https://aka.ms/m365pnp
  - Community samples and best practices

### Blogs
- **Microsoft 365 Blog**
  - https://www.microsoft.com/en-us/microsoft-365/blog/
  - Product announcements and updates

### Tools
- **Microsoft 365 admin center:** https://admin.microsoft.com/ (admin.cloud.microsoft also resolves)
- **Microsoft Entra admin center:** https://entra.microsoft.com/
- **Exchange admin center:** https://admin.exchange.microsoft.com/
- **SharePoint admin center:** https://admin.microsoft.com/sharepoint
- **Microsoft Teams admin center:** https://admin.teams.microsoft.com/
- **Microsoft Defender portal:** https://security.microsoft.com/
- **Microsoft Purview portal:** https://purview.microsoft.com/

## PowerShell Resources

### Microsoft Graph PowerShell
- **Microsoft Graph PowerShell SDK**
  - https://learn.microsoft.com/en-us/powershell/microsoftgraph/
  - Manage M365 services via PowerShell

### Exchange Online PowerShell
- **Exchange Online PowerShell**
  - https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell
  - Automate Exchange administration

### SharePoint Online PowerShell
- **SharePoint Online Management Shell**
  - https://learn.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online
  - SharePoint automation

## Quick Reference

### Common Administrative Tasks

| Task | Admin center | Key steps |
|------|--------------|-----------|
| Assign license | Microsoft 365 admin center | **Users** > **Active users** > select user > **Licenses and apps** |
| Create mailbox | Exchange admin center | **Recipients** > **Mailboxes** > **Add a shared mailbox** |
| Create distribution group | Exchange admin center | **Recipients** > **Groups** > **Distribution list** > **Add a group** |
| Create SharePoint site | SharePoint admin center | **Sites** > **Active sites** > **Create** |
| Configure Teams policy | Microsoft Teams admin center | Policy packages, or the specific policy area |
| Set up Conditional Access | Microsoft Entra admin center | **Entra ID** > **Conditional Access** > **Policies** > **New policy** |
| Configure PIM | Microsoft Entra admin center | **ID Governance** > **Privileged Identity Management** |
| View Identity Secure Score | Microsoft Entra admin center | **Entra ID** > **Identity Secure Score** |
| Search audit logs | Microsoft Purview portal | **Audit** (or security.microsoft.com > **Audit**) |
| Run data access governance report | SharePoint admin center | **Reports** > **Data access governance** |

### Service Health Monitoring
- **Message Center:** Stay informed of changes
- **Service Health:** Monitor incidents and advisories
- **Admin App:** Mobile administration via iOS/Android

---

**Related Segments:**
- [Segment 2: Data Protection and Governance](../../segment-02-data-protection-governance/)
- [Segment 3: Copilot Administration](../../segment-03-copilot-administration/)
- [Segment 4: Agents and Exam Prep](../../segment-04-agents-exam-prep/)
