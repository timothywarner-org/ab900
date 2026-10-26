# Segment 1: Core Features and Objects of Microsoft 365 Services

**Duration:** 50 minutes

**Maps to AB-900 Domain 1: Identify the core features and objects of Microsoft 365 services (30-35%)**

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Learning Objectives

By the end of this segment, you will be able to:

- Describe the core architecture of Microsoft 365
- Identify key Microsoft 365 services that support Copilot
- Understand identity and authentication mechanisms
- Navigate Microsoft 365 licensing models
- Monitor service health and performance

## Topics Covered

### 1. Microsoft 365 Architecture Overview (10 minutes)

- Cloud architecture fundamentals
- Service interconnections and dependencies
- Data flow between services
- Microsoft 365 tenant structure

### 2. Key Microsoft 365 Services (15 minutes)

#### Exchange Online
Administered from the **Exchange admin center** at admin.exchange.microsoft.com.
- Mailbox management and mailbox types (user, shared, resource)
- Distribution groups, also called distribution lists. The **Groups** page has four tabs: Microsoft 365, Distribution list, Dynamic distribution list, and Mail-enabled security. Create one at **Recipients** > **Groups** > **Distribution list** > **Add a group**.
- Mail flow and transport rules
- Calendar and scheduling

Note on terminology: the current objective bullet reads "by using the Exchange admin center (mailboxes and distribution groups)". Microsoft uses "distribution list" and "distribution group" interchangeably, and the admin center tab label is **Distribution list**. Both terms are current.

#### SharePoint in Microsoft 365
Administered from the **SharePoint admin center** at admin.microsoft.com/sharepoint.
- Sites, libraries, and folders
- Content organization
- Roles, permissions, and sharing

Note on terminology: the admin center is now simply the **SharePoint admin center**. The phrase "SharePoint in Microsoft 365" remains correct when naming the **service**, as in "roles and permissions for sites in SharePoint in Microsoft 365".

#### Microsoft Teams
Administered from the **Microsoft Teams admin center** at admin.teams.microsoft.com.
- Teams, channels, and policies
- Chat and collaboration features
- App permission and app setup policies
- Integration with other services

#### OneDrive for work and school
- Personal storage
- File synchronization
- Sharing and collaboration

### 3. Identity and Authentication (10 minutes)

Administered from the **Microsoft Entra admin center** at entra.microsoft.com, whose navigation is organized into five product areas: Entra ID, ID Protection, ID Governance, Verified ID, and Global Secure Access.

- **Microsoft Entra ID.** Never say or write "Azure AD", "AAD", or "Azure Active Directory"; those names are retired.
- User and group management
- **Authentication methods.** Managed in the unified **Authentication methods policy** at Entra ID > **Authentication methods** > **Policies**. Managing methods in the legacy MFA and legacy SSPR policies retired on September 30, 2025.
- **Conditional Access.** Entra ID > **Conditional Access**. The target selector is now labeled **Resources (formerly cloud apps)**, and the all-resources option reads **All resources (formerly 'All cloud apps')**. Demoing the old "Cloud apps" label is stale.
- **Multifactor authentication and mandatory MFA.** Microsoft's mandatory MFA enforcement is separate from, and additive to, both security defaults and Conditional Access. Phase 1 has covered the Microsoft 365 admin center since February 2025. Phase 2 began rolling out October 1, 2025 for Azure CLI, Azure PowerShell, and Azure Resource Manager control-plane write operations; the last postponement date was July 1, 2026, so both phases are in force now. There is no opt-out, and it applies to break-glass accounts and B2B guests.
- **Passkey-first direction.** Microsoft-provided SMS and voice authentication are being retired. On September 1, 2026, users enabled for SMS or voice are auto-enabled for passkeys. On February 1, 2027, telecom delivery is fully retired and users whose only method is SMS or voice receive a blocking prompt to register a passkey. Teach passkeys (FIDO2) as the default phishing-resistant method.
- **Identity Secure Score.** Entra ID > **Identity Secure Score**. Available to free and paid customers; some recommendations need a paid license. Scores recalculate every 24 hours. It represents the Identity category of the broader Microsoft Secure Score, viewed in the Microsoft Defender portal at security.microsoft.com.
- **Privileged Identity Management (PIM).** Found under **ID Governance** > **Privileged Identity Management**, **NOT** under Entra ID. Covers Microsoft Entra roles, Azure resource roles, and Groups. Assignment types are **Eligible** and **Active**.
- **App registrations versus Enterprise applications.** App registrations hold application objects, the definition of an app (name, redirect URIs, secrets, API permissions, app roles), and exist only in the app's home tenant. Enterprise applications are service principal objects, the local instance of an app in a tenant, and are where you configure single sign-on, user assignment, and provisioning.
- **Audit logs.** Unified audit log search has two current entry points and neither is the retired compliance portal: purview.microsoft.com > **Audit**, and security.microsoft.com > **Audit**.

### 3a. Microsoft 365 security principles and Defender (part of Domain 1)

- **Zero Trust principles:** verify explicitly, use least privilege access, assume breach
- Authentication versus authorization
- Threat protection and intelligence
- **Microsoft Defender XDR**, surfaced in the **Microsoft Defender portal** at security.microsoft.com. Defender XDR combines Defender for Office 365, Defender for Endpoint, Defender for Identity, and Defender for Cloud Apps. The portal itself also brings together Microsoft Sentinel, Defender Threat Intelligence, Security Exposure Management, and Defender for Cloud. Do **NOT** call it "Microsoft 365 Defender" or "the Microsoft 365 Defender portal"; both names are retired.

### 4. Licensing and Subscription Models (10 minutes)

- Microsoft 365 license types
- Copilot licensing requirements
- License assignment and management
- Usage rights and restrictions

### 5. Service Health and Monitoring (5 minutes)

- Microsoft 365 admin center
- Service health dashboard
- Message center notifications
- Incident response

## Hands-On Labs

### Lab 1.1: Explore Microsoft 365 Admin Center
**Objective:** Navigate the admin center and identify key administrative areas

**Steps:**
1. Access the Microsoft 365 admin center
2. Review the dashboard and key metrics
3. Explore user management
4. Check service health status

### Lab 1.2: Review Identity Configuration
**Objective:** Examine user identities and authentication settings

**Steps:**
1. Open the Microsoft Entra admin center at entra.microsoft.com
2. Review user accounts and properties under **Entra ID** > **Users**
3. Examine group memberships
4. Review the **Authentication methods** policy under Entra ID > **Authentication methods** > **Policies**
5. Check **Identity Secure Score** under Entra ID > **Identity Secure Score**

### Lab 1.3: Analyze License Assignments
**Objective:** Understand license distribution and availability

**Steps:**
1. Navigate to license management
2. Review available licenses
3. Check user license assignments
4. Identify Copilot license requirements

## Demonstrations

### Demo 1: Microsoft 365 Service Architecture
- Visual walkthrough of service interconnections
- Data flow demonstration
- Tenant configuration overview

### Demo 2: User Lifecycle Management
- Creating and configuring users
- Assigning licenses
- Setting up authentication
- Managing access

### Demo 3: Service Health Monitoring
- Monitoring dashboard overview
- Reading service advisories
- Understanding incident impact

## Key Takeaways

1. **Microsoft 365 is interconnected** - Services work together to provide comprehensive functionality
2. **Identity is foundational** - Microsoft Entra ID is central to all Microsoft 365 services
3. **Licensing matters** - Proper license assignment is crucial for Copilot enablement
4. **Monitoring is essential** - Proactive monitoring helps prevent and resolve issues
5. **Prerequisites understanding** - Core Microsoft 365 knowledge is essential for Copilot administration
6. **Names changed, and the exam knows it** - Microsoft Entra ID, not Azure AD. Microsoft Defender portal, not Microsoft 365 Defender. Microsoft Purview portal, not the compliance portal.

## Additional Resources

### Documentation
- [Microsoft 365 Enterprise Overview](https://learn.microsoft.com/microsoft-365/enterprise/)
- [Microsoft Entra ID Overview](https://learn.microsoft.com/entra/fundamentals/whatis)
- [Microsoft Entra admin center](https://learn.microsoft.com/entra/fundamentals/entra-admin-center)
- [Microsoft 365 Service Descriptions](https://learn.microsoft.com/office365/servicedescriptions/office-365-service-descriptions-technet-library)
- [Microsoft Defender portal](https://learn.microsoft.com/defender-xdr/microsoft-365-defender-portal)
- [Mandatory multifactor authentication](https://learn.microsoft.com/entra/identity/authentication/concept-mandatory-multifactor-authentication)

### Tools
- [Microsoft 365 admin center](https://admin.microsoft.com/) (admin.cloud.microsoft also resolves)
- [Microsoft Entra admin center](https://entra.microsoft.com/)
- [Exchange admin center](https://admin.exchange.microsoft.com/)
- [SharePoint admin center](https://admin.microsoft.com/sharepoint)
- [Microsoft Teams admin center](https://admin.teams.microsoft.com/)
- [Microsoft Defender portal](https://security.microsoft.com/)
- [Microsoft Purview portal](https://purview.microsoft.com/)

### Videos
- Microsoft 365 Architecture Overview
- Identity Management Best Practices
- License Management in Microsoft 365

## Q&A Notes

Use this section to capture questions and answers from the live session:

---

## Next Steps

Proceed to [Segment 2: Data Protection and Governance](../segment-02-data-protection-governance/) to learn about securing and governing your Microsoft 365 and Copilot environment.
