# AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
## Practice Questions

**Version:** 1.0
**Last Updated:** 2025-01-19
**Total Questions:** 15 (5 per domain)

---

## Domain 1: Core Microsoft 365 Features and Objects (30-35%)

### Question 1: License Assignment and Copilot Activation

**Scenario:** You are the Microsoft 365 administrator for Contoso, Ltd. The company has 500 users with Microsoft 365 E3 licenses. Management wants to enable Microsoft 365 Copilot for 50 users in the Sales department. You assign Copilot licenses to the 50 users at 9:00 AM on Monday. At 10:00 AM, users report that they cannot see Copilot features in Microsoft Teams or Outlook.

**Question:** What is the MOST likely explanation for why users cannot access Copilot features?

A) Microsoft 365 E3 licenses are not eligible for Copilot; users need E5 licenses
B) Copilot features can take up to 24 hours to appear after license assignment
C) You must enable Copilot in the Microsoft 365 admin center before users can access it
D) Users need to restart their computers before Copilot features become available

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
After assigning Copilot licenses, there is a typical delay of up to 24 hours before the features become available to users. This is a well-documented behavior in Microsoft 365 license activation. The system needs time to propagate the license changes across all services (Teams, Outlook, Word, Excel, PowerPoint, etc.). This is one of the most common "gotchas" that administrators encounter during Copilot deployment.

**Why A is incorrect:**
Microsoft 365 E3 licenses ARE eligible for Copilot. Copilot can be added as an add-on license to E3, E5, Business Standard, and Business Premium subscriptions. The prerequisite license tier is correctly met in this scenario.

**Why C is incorrect:**
While there are Copilot settings in the admin center (such as web search controls and data grounding settings), these are configuration options, not required enablement switches. Simply assigning the license is sufficient for users to gain access, though the 24-hour delay applies.

**Why D is incorrect:**
Restarting computers is not required for Copilot features to appear. The features are cloud-based and activate automatically once the license propagation is complete. Users may need to restart their Microsoft 365 applications (like Teams or Outlook), but not the entire computer, and this still doesn't address the 24-hour activation window.

**Microsoft Learn References:**
- [Microsoft 365 Copilot Licensing](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-licensing)
- [Microsoft 365 Copilot Setup](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-setup)

---

### Question 2: Microsoft Entra Conditional Access

**Scenario:** Fabrikam, Inc. has deployed Microsoft 365 Copilot to all employees. The security team wants to ensure that Copilot can only be accessed from corporate-managed devices and requires multi-factor authentication (MFA) when users access Copilot from outside the corporate network.

**Question:** Which Microsoft Entra ID feature should you configure to meet these requirements?

A) Privileged Identity Management (PIM)
B) Conditional Access policies
C) Identity Protection
D) Microsoft Entra Connect

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
Conditional Access policies are the correct solution for implementing context-aware access controls in Microsoft Entra ID (formerly Azure AD). You can create policies that:
- Require device compliance (corporate-managed devices)
- Require MFA based on network location (outside corporate network)
- Apply to specific applications or services, including Microsoft 365 Copilot
- Enforce conditions based on user, device, location, and risk signals

This is exactly the type of "never trust, always verify" Zero Trust control that Conditional Access was designed for.

**Why A is incorrect:**
Privileged Identity Management (PIM) is used for managing, controlling, and monitoring access to privileged administrative roles. It provides just-in-time (JIT) privileged access and time-bound role assignments. While important for security, PIM doesn't control device compliance or location-based MFA requirements for end-user access to applications.

**Why C is incorrect:**
Identity Protection is focused on detecting and responding to identity-based risks, such as compromised credentials, unusual sign-in behavior, or leaked credentials. While it can integrate with Conditional Access to block risky sign-ins, it doesn't directly enforce device compliance or location-based MFA policies.

**Why D is incorrect:**
Microsoft Entra Connect (formerly Azure AD Connect) is a synchronization tool that connects on-premises Active Directory with Microsoft Entra ID. It's used for hybrid identity scenarios to sync users, groups, and passwords, but it doesn't provide access control policies or MFA enforcement.

**Microsoft Learn References:**
- [What is Conditional Access?](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)
- [Azure Active Directory Conditional Access](https://learn.microsoft.com/en-us/training/modules/azure-active-directory/)
- [Zero Trust Security](https://learn.microsoft.com/en-us/security/zero-trust/zero-trust-overview)

---

### Question 3: SharePoint Advanced Management and Oversharing

**Scenario:** You are reviewing data access governance reports in SharePoint Advanced Management and discover that several SharePoint sites containing sensitive financial data are shared with "Everyone except external users." The CISO wants you to remediate this oversharing while ensuring that legitimate users can still access the content they need.

**Question:** Which THREE actions should you take to remediate this oversharing issue? (Choose three)

A) Use data access governance reports to identify all overshared sites
B) Enable restricted access control to limit sharing to specific users or groups
C) Delete the SharePoint sites to prevent further oversharing
D) Configure block download policies to prevent data exfiltration
E) Conduct site access reviews to validate who needs access
F) Disable all external sharing across the entire tenant

**Correct Answers:** A, B, E

**Explanation:**

**Why A is correct:**
Data access governance reports in SharePoint Advanced Management are specifically designed to identify overshared content. These reports show you which sites, libraries, or files are shared too broadly (like "Everyone except external users"). This is the essential first step in understanding the scope of the oversharing problem and prioritizing remediation efforts.

**Why B is correct:**
Restricted access control is a SharePoint Advanced Management feature that allows you to limit content access to specific users or groups, even if the site has broader sharing settings. This directly addresses the oversharing issue by enforcing least privilege access while maintaining functionality for legitimate users.

**Why E is correct:**
Conducting site access reviews is a critical governance practice that validates whether users actually need the access they currently have. This helps ensure that when you remediate oversharing, you're granting access only to users with legitimate business needs, not just maintaining the status quo with a different sharing method.

**Why C is incorrect:**
Deleting SharePoint sites is an extreme and unnecessary action that would result in data loss and business disruption. The goal is to remediate oversharing while preserving legitimate access to business-critical content, not to eliminate the content entirely.

**Why D is incorrect:**
While block download policies can be part of a comprehensive data protection strategy (and may be appropriate in some scenarios), they don't address the core oversharing issue. Users would still have overly broad access to view the content; they just couldn't download it. This doesn't follow the principle of least privilege access.

**Why F is incorrect:**
Disabling all external sharing tenant-wide is overly restrictive and doesn't address the specific issue described. The scenario mentions "Everyone except external users," which means external sharing isn't the problem—internal oversharing is. Additionally, many organizations require external sharing for legitimate business collaboration.

**Microsoft Learn References:**
- [SharePoint Advanced Management](https://learn.microsoft.com/en-us/sharepoint/advanced-management)
- [Data access governance reports](https://learn.microsoft.com/en-us/sharepoint/data-access-governance-reports)
- [Restricted access control for SharePoint](https://learn.microsoft.com/en-us/sharepoint/restricted-access-control)

---

### Question 4: Exchange Online Mailbox Types

**Scenario:** The HR department at your organization needs a mailbox that multiple HR team members can access to manage employee onboarding requests. The mailbox should receive emails at hr-onboarding@contoso.com, and multiple HR staff members should be able to send emails from this address.

**Question:** Which type of Exchange Online mailbox should you create?

A) User mailbox
B) Shared mailbox
C) Resource mailbox
D) Distribution list

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
A shared mailbox is specifically designed for this scenario. Shared mailboxes:
- Allow multiple users to access the same mailbox
- Enable users to send emails as the shared mailbox address (or on behalf of)
- Don't require a separate license (for mailboxes under 50 GB)
- Provide a shared calendar and contacts
- Are ideal for departmental email addresses like hr@, support@, sales@, etc.

This is the standard solution for collaborative email management in Microsoft 365.

**Why A is incorrect:**
A user mailbox is designed for an individual person and is tied to a single user account. While you could grant multiple people access to a user mailbox through delegation permissions, this is not the recommended approach. User mailboxes require a license, and using them for shared purposes creates complications with password management and account ownership.

**Why C is incorrect:**
Resource mailboxes are specifically designed for bookable resources like conference rooms, equipment, or vehicles. They are used with the Calendar booking system and are not appropriate for general collaborative email management. You can't easily send emails "from" a resource mailbox address.

**Why D is incorrect:**
A distribution list (or distribution group) is used to send emails to multiple recipients at once. It doesn't provide a mailbox for receiving and storing emails, nor does it allow multiple people to access a shared inbox. It's simply an email forwarding mechanism that routes messages to group members' individual mailboxes.

**Microsoft Learn References:**
- [Shared mailboxes in Exchange Online](https://learn.microsoft.com/en-us/exchange/collaboration-exo/shared-mailboxes)
- [Exchange Online Overview](https://learn.microsoft.com/en-us/exchange/exchange-online)

---

### Question 5: Microsoft Teams Policy Management

**Scenario:** Your organization is deploying Microsoft 365 Copilot. The IT security team wants to control which third-party apps can be used with Microsoft Teams to ensure data security and compliance. Specifically, they want to block all third-party apps except for a pre-approved list of business-critical applications.

**Question:** Where should you configure these app permissions?

A) Microsoft Entra ID Enterprise Applications
B) Microsoft Teams admin center app permission policies
C) Microsoft 365 admin center integrated apps
D) Microsoft Purview Compliance portal

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
The Microsoft Teams admin center is the correct location to manage app permissions for Teams. Specifically, you would use:
- **App permission policies** to allow or block specific apps
- **App setup policies** to pin apps and control default installations
- **Manage apps** section to set org-wide app availability

You can create custom app permission policies that block all third-party apps by default, then create exceptions for approved apps. These policies can be assigned to specific users or groups, providing granular control over the Teams app ecosystem.

**Why A is incorrect:**
Microsoft Entra ID (Azure AD) Enterprise Applications manages SSO, authentication, and authorization for cloud applications across the organization. While it's important for enterprise app integration, it's not where you control which apps are available within Microsoft Teams. Teams apps have their own permission and policy system managed through the Teams admin center.

**Why C is incorrect:**
The Microsoft 365 admin center integrated apps section is used to manage certain Microsoft 365 add-ins and integrated applications that work across multiple Microsoft 365 services. However, Teams-specific app policies and permissions are managed in the dedicated Teams admin center, which provides more granular controls for the Teams app ecosystem.

**Why D is incorrect:**
Microsoft Purview Compliance portal is used for data governance, compliance, information protection, DLP, insider risk management, and similar compliance features. While these features may monitor or protect data within Teams, the Purview portal doesn't control which apps users can install or use in Teams.

**Microsoft Learn References:**
- [Teams app permission policies](https://learn.microsoft.com/en-us/microsoftteams/teams-app-permission-policies)
- [Manage Teams policies](https://learn.microsoft.com/en-us/microsoftteams/policy-assignment-overview)
- [Teams Administration](https://learn.microsoft.com/en-us/microsoftteams/teams-overview)

---

## Domain 2: Data Protection and Governance (35-40%)

### Question 6: Data Loss Prevention Policy Configuration

**Scenario:** Contoso, Ltd. wants to prevent employees from sharing credit card numbers in Microsoft Teams chats and channel messages. The DLP policy should detect credit card patterns, notify users when they attempt to share this information, but allow users to override the restriction with a business justification.

**Question:** Which DLP policy action should you configure?

A) Block the content and send an incident report to administrators
B) Block the content with no option to override
C) Notify users with a policy tip and allow override with justification
D) Audit only and send an alert to administrators

**Correct Answer:** C

**Explanation:**

**Why C is correct:**
"Notify users with a policy tip and allow override with justification" is the correct configuration that meets all the scenario requirements:
- **Policy tips** appear in Teams to notify users they're about to share sensitive information
- **User override** allows users to proceed if they have a legitimate business reason
- **Business justification** requires users to provide a reason, creating an audit trail and encouraging thoughtful decisions

This approach balances security with usability, following the principle of "educate and empower" rather than "block everything." It's particularly appropriate for credit cards, which may sometimes need to be shared for legitimate business purposes (e.g., processing customer orders).

**Why A is incorrect:**
"Block the content and send an incident report" would prevent sharing but doesn't allow the user override with justification that the scenario requires. This would be too restrictive for the business need described. While it sends alerts to admins, it doesn't give users the flexibility to make informed decisions about legitimate sharing.

**Why B is incorrect:**
"Block with no override" is the most restrictive option and explicitly contradicts the requirement to "allow users to override the restriction with a business justification." While this might be appropriate for highly regulated data (like patient health information in HIPAA scenarios), it's too strict for this use case.

**Why D is incorrect:**
"Audit only" mode collects data about policy matches but takes no preventive or educational action. Users wouldn't receive policy tips, wouldn't be prompted for justification, and could freely share credit card information. While useful during DLP policy testing and tuning, it doesn't meet the requirement to notify users and control sharing.

**Microsoft Learn References:**
- [Data Loss Prevention policies](https://learn.microsoft.com/en-us/purview/dlp-policy-reference)
- [Plan for DLP](https://learn.microsoft.com/en-us/purview/dlp-overview-plan-for-dlp)
- [DLP policy tips](https://learn.microsoft.com/en-us/purview/dlp-policy-tips-reference)

---

### Question 7: Sensitivity Labels and Encryption

**Scenario:** Your organization has created a sensitivity label called "Confidential - Finance" that applies encryption to documents. Users in the Finance department report that when they apply this label to Excel files, external auditors who need to review the files cannot open them, even though the files are explicitly shared with the auditors.

**Question:** What should you do to allow the external auditors to access the encrypted files while maintaining the confidentiality protection?

A) Remove encryption from the sensitivity label
B) Add the external auditors as authorized users in the label's encryption settings
C) Disable the sensitivity label for files shared externally
D) Convert the Excel files to PDF before sharing

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
Sensitivity labels with encryption settings allow you to define exactly which users or groups can access the protected content. You can add external users (including external auditors) as authorized users in the label's encryption settings. When you do this, you can specify their permissions (e.g., View only, Edit, etc.). The external users can then authenticate (typically using their own organizational account or a Microsoft account) to decrypt and access the content. This maintains the encryption protection while allowing controlled access to authorized external parties.

**Why A is incorrect:**
Removing encryption from the sensitivity label would eliminate the protection for ALL files with this label, not just those shared with auditors. This would leave all "Confidential - Finance" documents unprotected, which defeats the entire purpose of the label and creates a significant security risk. The goal is to maintain protection while enabling controlled external access.

**Why C is incorrect:**
Disabling the sensitivity label for externally shared files would require either removing the label entirely (losing the protection and classification) or creating complex conditional policies. This doesn't solve the root problem and creates inconsistent protection. Additionally, it puts the burden on users to remember to handle external sharing differently, which is error-prone.

**Why D is incorrect:**
Converting to PDF doesn't solve the encryption access problem. If the sensitivity label with encryption is applied to a PDF, external auditors still couldn't open it. Furthermore, converting to PDF is a manual workaround that doesn't scale, could result in data loss (Excel formulas, multiple sheets, etc.), and removes the automated protection that sensitivity labels provide.

**Microsoft Learn References:**
- [Encryption using sensitivity labels](https://learn.microsoft.com/en-us/purview/encryption-sensitivity-labels)
- [Restrict access to content using sensitivity labels](https://learn.microsoft.com/en-us/purview/encryption-sensitivity-labels)
- [Microsoft Purview Information Protection](https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-governance/)

---

### Question 8: Insider Risk Management

**Scenario:** Tailspin Toys has deployed Microsoft Purview Insider Risk Management to detect potential data theft by departing employees. You configure a policy using the "Data theft by departing users" template. An HR manager asks you how the system will know when an employee is departing.

**Question:** Which TWO data sources can Insider Risk Management use to identify departing users? (Choose two)

A) Microsoft Entra ID account deletion events
B) HR connector importing resignation dates from an HR system
C) Manual user termination dates entered in the Microsoft 365 admin center
D) Exchange Online out-of-office messages containing "last day"
E) Anomalous login patterns suggesting job searching behavior

**Correct Answers:** A, B

**Explanation:**

**Why A is correct:**
Insider Risk Management can detect Microsoft Entra ID (Azure AD) account deletion or disablement events. When an admin deletes or disables a user account, this triggers the system to look for risky activities that may have occurred before the termination (typically in a lookback window). This is a built-in signal that doesn't require additional configuration.

**Why B is correct:**
The HR connector is specifically designed to import employee data from HR systems, including resignation dates, termination dates, and performance review levels. This is the recommended approach for proactive insider risk detection because it identifies departing employees BEFORE their last day, allowing the system to monitor for data exfiltration during the notice period when risk is highest.

**Why C is incorrect:**
While the Microsoft 365 admin center allows you to manage user accounts, there's no specific field for manually entering "termination dates" that integrates with Insider Risk Management. The admin center is where you disable accounts or remove licenses, which would fall under option A (account deletion/disablement events), not a separate manual date entry system.

**Why D is incorrect:**
Insider Risk Management does not parse the content of out-of-office messages to detect departing employees. While this might seem creative, it's not a supported data source. Out-of-office messages are inconsistent, not all departing employees set them, and the system doesn't analyze email content for this purpose.

**Why E is incorrect:**
While Insider Risk Management does detect anomalous behavior patterns, "job searching behavior" based on login patterns is not a specific indicator used to identify departing users. The system focuses on actual HR data (like resignation notices) and concrete events (like account deletion), not speculative behavioral analysis about job searching.

**Microsoft Learn References:**
- [Insider Risk Management](https://learn.microsoft.com/en-us/purview/insider-risk-management)
- [Insider risk management policies](https://learn.microsoft.com/en-us/purview/insider-risk-management-policies)
- [HR connector](https://learn.microsoft.com/en-us/purview/import-hr-data)

---

### Question 9: Microsoft Purview Compliance Manager

**Scenario:** Your organization is preparing for a GDPR compliance audit. The legal team asks you to provide a comprehensive view of your organization's compliance posture, identify gaps, and recommend specific actions to improve compliance.

**Question:** Which Microsoft Purview feature provides a dashboard with compliance score, improvement actions, and regulatory assessment templates?

A) Compliance Manager
B) Content Explorer
C) Activity Explorer
D) Data Security Posture Management

**Correct Answer:** A

**Explanation:**

**Why A is correct:**
Compliance Manager is the correct tool for comprehensive compliance posture assessment. It provides:
- **Compliance Score** - A risk-based score representing your compliance posture
- **Improvement Actions** - Specific recommended actions to enhance compliance
- **Assessments** - Pre-built templates for regulations like GDPR, HIPAA, ISO 27001, etc.
- **Dashboard** - Visual representation of compliance status across regulations
- **Progress Tracking** - Monitor implementation of compliance controls

Compliance Manager is specifically designed to help organizations understand their compliance requirements, track progress, and identify gaps—exactly what the legal team is requesting.

**Why B is incorrect:**
Content Explorer is a data classification tool that allows you to view content that has been classified with sensitivity labels or contains sensitive information types. While useful for understanding what sensitive data you have and where it's located, it doesn't provide compliance scoring, regulatory assessments, or improvement actions for overall compliance posture.

**Why C is incorrect:**
Activity Explorer shows user and admin activities related to sensitivity labels and DLP policies (e.g., labels applied, changed, or removed; DLP policy matches). It's useful for monitoring data protection activities but doesn't provide compliance assessments, scores, or regulatory templates. It's an audit and monitoring tool, not a compliance assessment tool.

**Why D is incorrect:**
Data Security Posture Management (DSPM) is a newer Purview capability focused on discovering and assessing security risks related to data storage and access. While it identifies security gaps, it doesn't provide the regulatory compliance assessments, compliance scoring, or improvement action framework that Compliance Manager offers. DSPM is more security-focused than compliance-focused.

**Microsoft Learn References:**
- [Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager)
- [Compliance Manager assessments](https://learn.microsoft.com/en-us/purview/compliance-manager-assessments)
- [Compliance score calculation](https://learn.microsoft.com/en-us/purview/compliance-score-calculation)

---

### Question 10: Copilot Data Access and Permissions

**Scenario:** Your organization has deployed Microsoft 365 Copilot. A department manager is concerned that Copilot might allow users to access SharePoint documents they don't have permissions to view. The manager asks you to explain how Copilot respects existing permissions.

**Question:** Which statement BEST describes how Microsoft 365 Copilot handles data access and permissions?

A) Copilot has elevated permissions and can access all organizational data to provide better responses
B) Copilot uses the signed-in user's identity and respects all existing Microsoft 365 permissions and security policies
C) Copilot creates a separate permission layer that must be configured independently from Microsoft 365 permissions
D) Copilot only accesses data that has been explicitly marked as "Copilot-accessible" in SharePoint settings

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
Microsoft 365 Copilot operates within the user's existing security context. This is a fundamental design principle:
- Copilot uses **Microsoft Graph** to access data on behalf of the signed-in user
- It respects all **existing permissions** - if a user can't access a SharePoint site, Copilot can't access it either
- **No permission elevation** - Copilot doesn't grant users access to data they couldn't already access
- **Existing security policies apply** - DLP, sensitivity labels, retention policies, etc., all continue to work
- **Zero Trust principles** - Copilot follows "never trust, always verify" with every data access request

This is often called "Copilot sees what you see" - it has the same access as the user, no more, no less.

**Why A is incorrect:**
This is a common misconception. Copilot does NOT have elevated permissions or privileged access to organizational data. If it did, it would create massive security and compliance risks. Copilot explicitly operates within the user's permission boundaries to maintain data security and prevent unauthorized access to sensitive information.

**Why C is incorrect:**
There is no separate "Copilot permission layer" that needs independent configuration. Copilot leverages existing Microsoft 365 permissions through Microsoft Graph. This is a key advantage—you don't need to recreate or duplicate your permission structure. Your existing SharePoint permissions, Entra ID groups, sensitivity labels, and DLP policies automatically apply to Copilot's data access.

**Why D is incorrect:**
There is no "Copilot-accessible" flag or setting in SharePoint or other Microsoft 365 services. Copilot automatically works with all content the user has permission to access. Administrators don't need to (and can't) mark individual documents, sites, or libraries as accessible to Copilot. The existing permission model handles everything.

**Microsoft Learn References:**
- [Microsoft 365 Copilot data security](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-privacy)
- [Data, Privacy, and Security for Microsoft 365 Copilot](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-privacy)
- [Microsoft 365 Copilot Overview](https://learn.microsoft.com/en-us/copilot/microsoft-365/)

---

## Domain 3: Copilot and Agent Administration (25-30%)

### Question 11: Copilot Licensing Models

**Scenario:** Woodgrove Bank is planning to deploy Microsoft 365 Copilot. The Finance department wants to understand the licensing options. They have 5,000 employees with Microsoft 365 E3 licenses. They want to enable Copilot for 100 power users who will use it extensively every day, and make it available occasionally for 500 other knowledge workers who might use it a few times per month.

**Question:** Which licensing approach would be MOST cost-effective for this scenario?

A) Purchase 600 monthly Copilot subscriptions for all potential users
B) Purchase 100 monthly subscriptions for power users and 500 pay-as-you-go licenses for occasional users
C) Purchase 100 monthly subscriptions for power users and enable pay-as-you-go billing for the organization
D) Purchase Microsoft 365 E5 licenses for all users, which include Copilot

**Correct Answer:** C

**Explanation:**

**Why C is correct:**
This is the most cost-effective approach because:
- **Monthly subscriptions for power users (100)** - These users will use Copilot extensively every day, making the flat monthly rate ($30/user/month as of 2025) more economical than pay-per-use
- **Pay-as-you-go for occasional users (500)** - With pay-as-you-go enabled at the organizational level, these 500 users can access Copilot when needed and the organization only pays for actual usage (per AI interaction)
- **Flexibility** - Users aren't pre-assigned; any of the 500 knowledge workers can use Copilot when needed
- **Cost optimization** - Occasional users who use Copilot a few times per month will cost far less on pay-as-you-go than a full monthly subscription

This hybrid approach optimizes costs based on usage patterns.

**Why A is incorrect:**
Purchasing 600 monthly subscriptions would result in the highest total cost. The 500 occasional users who only use Copilot "a few times per month" would waste most of their subscription value. At $30/user/month, this would be $18,000/month ($216,000/year) when most of those occasional users might only generate a few dollars of pay-as-you-go usage.

**Why B is incorrect:**
You cannot purchase individual "pay-as-you-go licenses" for specific users. Pay-as-you-go is a billing model enabled at the organizational or billing policy level, not assigned to individual users like traditional licenses. Once enabled, eligible users can access Copilot and usage is metered and billed. The concept of "500 pay-as-you-go licenses" doesn't align with how the pay-as-you-go model actually works.

**Why D is incorrect:**
Microsoft 365 E5 licenses do NOT include Copilot. Copilot is a separate add-on license that must be purchased in addition to the base M365 license (whether E3, E5, Business Standard, or Business Premium). Upgrading all 5,000 users to E5 (which is significantly more expensive than E3) would be extremely costly and wouldn't solve the Copilot licensing question—you'd still need to purchase Copilot separately.

**Microsoft Learn References:**
- [Microsoft 365 Copilot licensing](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-licensing)
- [Copilot pay-as-you-go billing](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-licensing)

---

### Question 12: Copilot Usage Monitoring with Viva Insights

**Scenario:** You deployed Microsoft 365 Copilot to 200 users three months ago. Leadership wants to understand adoption and measure the value Copilot is delivering to the organization. They specifically want to know: how many users have activated Copilot, how many are actively using it, which applications they're using it in, and whether it's saving time.

**Question:** Where should you access this information?

A) Microsoft 365 admin center Usage Reports
B) Microsoft Purview Compliance portal Activity Explorer
C) Copilot Dashboard in Viva Insights
D) Microsoft Entra ID Sign-in logs

**Correct Answer:** C

**Explanation:**

**Why C is correct:**
The Copilot Dashboard in Viva Insights is specifically designed for Copilot adoption and usage analytics. It provides:

**Readiness Metrics:**
- Licensed users
- Enabled users
- Active users

**Adoption Metrics:**
- Usage across apps (Teams, Outlook, Word, Excel, PowerPoint, OneNote)
- Active users over time
- Adoption trends

**Impact Metrics:**
- Copilot-assisted hours (time saved)
- Productivity improvements
- Efficiency gains

**Sentiment Metrics:**
- User satisfaction
- Feedback trends

This dashboard answers all of leadership's questions in one comprehensive view and is the official tool for Copilot usage monitoring.

**Why A is incorrect:**
While the Microsoft 365 admin center Usage Reports provide general usage data for Microsoft 365 services (email activity, Teams usage, SharePoint activity, etc.), they don't provide the detailed Copilot-specific metrics that leadership is requesting. You won't find Copilot adoption rates, time saved, or app-specific Copilot usage in the general usage reports.

**Why B is incorrect:**
Activity Explorer in the Purview Compliance portal shows activities related to sensitivity labels and DLP (labels applied, DLP policy matches, etc.). It's a compliance and data governance tool, not an adoption analytics tool. It won't show you Copilot usage patterns, time savings, or which applications users are engaging with Copilot in.

**Why D is incorrect:**
Microsoft Entra ID sign-in logs show authentication events—when users sign in, from which devices, locations, whether MFA was used, etc. While you could theoretically see if users are authenticating to Copilot-enabled apps, this doesn't provide the business value metrics leadership wants (active usage, time saved, adoption across applications). It's an identity audit log, not an application usage analytics tool.

**Microsoft Learn References:**
- [Copilot Dashboard in Viva Insights](https://learn.microsoft.com/en-us/viva/insights/org-team-insights/copilot-dashboard)
- [Microsoft 365 Copilot usage analytics](https://learn.microsoft.com/en-us/viva/insights/org-team-insights/copilot-dashboard)

---

### Question 13: Agent Types and Use Cases

**Scenario:** Your organization wants to create an AI agent that helps sales representatives quickly find competitive analysis information, market research reports, and product comparison documents stored across various SharePoint sites and Teams channels. The agent should be relatively simple to build and maintain without extensive development effort.

**Question:** Which type of agent is MOST appropriate for this scenario?

A) Researcher agent
B) Analyst agent
C) Custom plugin agent
D) Declarative agent

**Correct Answer:** A

**Explanation:**

**Why A is correct:**
A Researcher agent is specifically designed for information gathering, research, and retrieval tasks. This scenario describes exactly that use case:
- Finding information across multiple data sources (SharePoint sites, Teams channels)
- Retrieving specific types of content (competitive analysis, market research, product comparisons)
- Surfacing relevant documents quickly for sales reps

Researcher agents excel at searching, synthesizing, and presenting information from organizational content, making them ideal for this knowledge discovery scenario. They can be configured to focus on specific content types or locations without requiring extensive custom development.

**Why B is incorrect:**
Analyst agents are designed for data analysis, insights generation, and pattern recognition. They work with structured data to perform calculations, create visualizations, identify trends, and generate insights. The scenario describes information retrieval and document discovery, not data analysis. While an Analyst agent could work with the data once found, it's not optimized for the search and retrieval task described.

**Why C is incorrect:**
Custom plugin agents are for organization-specific scenarios that require integration with custom APIs, line-of-business applications, or unique business processes. They involve more complex development (often requiring coding and API integrations). The scenario describes a relatively straightforward document search task that doesn't require custom plugins—existing Microsoft Graph and SharePoint search capabilities can handle this.

**Why D is incorrect:**
Declarative agents are simple, instruction-based agents created with configuration rather than code. They're great for FAQs, simple question-answering, and basic workflows. While you *could* create a declarative agent for this purpose, a Researcher agent is a more specialized and powerful tool specifically designed for the research and information retrieval use case described. Researcher agents have built-in capabilities optimized for this type of task.

**Microsoft Learn References:**
- [Microsoft 365 Copilot Agents Overview](https://learn.microsoft.com/en-us/microsoft-365-copilot/microsoft-365-copilot-overview)
- [Agent types and capabilities](https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/overview-business-applications)

---

### Question 14: Agent Creation and Configuration

**Scenario:** You are creating a declarative agent using Copilot Studio for your company's IT Help Desk. The agent should help employees reset passwords, unlock accounts, and find answers to common IT questions. You want to ensure the agent has access to your organization's IT knowledge base stored in a SharePoint site.

**Question:** Which configuration step allows the agent to access the SharePoint knowledge base?

A) Add the SharePoint site as a conversation starter
B) Configure the SharePoint site as a knowledge source
C) Create a Power Automate flow to pull SharePoint data
D) Configure agent actions to query SharePoint via Microsoft Graph API

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
In Copilot Studio, when creating a declarative agent, you can configure **knowledge sources** that the agent will use to ground its responses. Knowledge sources can include:
- SharePoint sites
- OneDrive folders
- Uploaded files
- URLs/websites

By adding the SharePoint site containing the IT knowledge base as a knowledge source, the agent will automatically search and reference this content when responding to user queries. This is the straightforward, no-code way to connect your agent to organizational knowledge, and it's exactly what Copilot Studio is designed for.

**Why A is incorrect:**
Conversation starters are pre-defined prompts or example questions that help users get started with the agent. They appear as suggested questions users can click on (e.g., "How do I reset my password?" or "How do I unlock my account?"). They don't provide data access or connect the agent to knowledge repositories—they're just UI elements to guide user interaction.

**Why C is incorrect:**
While you *can* use Power Automate flows with agents to perform actions (like actually resetting a password or creating a support ticket), this is overly complex for simply giving the agent access to read knowledge base content. Knowledge sources are the built-in, simpler method for connecting agents to SharePoint content for reading and information retrieval. Power Automate is for actions and integrations, not for basic content access.

**Why D is incorrect:**
Configuring agent actions to query SharePoint via Microsoft Graph API is a developer-level approach that requires coding and custom development. For a declarative agent in Copilot Studio, this level of complexity isn't necessary. The platform provides built-in knowledge source configuration that handles Microsoft Graph integration automatically. This option would be relevant for custom plugin development, not declarative agents.

**Microsoft Learn References:**
- [Build Declarative Agents](https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/build-declarative-agents)
- [Add knowledge sources to agents](https://learn.microsoft.com/en-us/microsoft-copilot-studio/knowledge-sources-configure)
- [Copilot Studio documentation](https://learn.microsoft.com/en-us/microsoft-copilot-studio/)

---

### Question 15: Agent Governance and Approval

**Scenario:** Your organization allows department managers to create custom agents for their teams using Copilot Studio. The IT security team wants to implement a governance process to ensure all agents are reviewed and approved before they can be shared with users. The process should require IT admin approval for any agent that accesses external data sources or third-party APIs.

**Question:** Which THREE actions should you take to implement this governance process? (Choose three)

A) Configure agent publication policies to require admin approval
B) Set up approval workflows in the Microsoft 365 admin center
C) Review agent submissions to validate data sources and security settings
D) Disable Copilot Studio access for all non-IT users
E) Monitor agent compliance with organizational policies
F) Require all agents to use sensitivity labels

**Correct Answers:** A, C, E

**Explanation:**

**Why A is correct:**
Configuring agent publication policies to require admin approval is the foundational governance control. In Copilot Studio and Microsoft 365 admin settings, you can configure policies that:
- Require approval before agents can be published or shared
- Define who can approve agents (IT admins, security team, etc.)
- Set conditions that trigger approval requirements (e.g., external data access)
- Control agent distribution scope

This ensures no agent goes live without proper review.

**Why C is correct:**
Reviewing agent submissions is the actual governance work that IT security needs to perform. During review, admins should:
- Validate what data sources the agent accesses (internal vs. external)
- Check if third-party APIs or plugins are used
- Verify security settings and permissions
- Ensure the agent follows organizational policies
- Assess potential compliance or privacy risks

This manual review process is critical for identifying security concerns before agents are deployed to users.

**Why E is correct:**
Monitoring agent compliance is an ongoing governance activity. After agents are approved and deployed, IT should:
- Monitor agent usage and access patterns
- Review audit logs for suspicious activity
- Ensure agents continue to comply with policies as they're updated
- Track which agents are active, who uses them, and how
- Identify agents that may need re-review if policies change

Governance isn't just about initial approval—it's about continuous monitoring and compliance.

**Why B is incorrect:**
While approval workflows are important, they're not configured in the Microsoft 365 admin center for agents. Agent governance and approval policies are configured in Copilot Studio settings and potentially integrated with Power Platform admin center. The M365 admin center handles broader organizational settings, but agent-specific approval workflows are managed within the agent creation platform.

**Why D is incorrect:**
Disabling Copilot Studio for all non-IT users defeats the purpose of enabling departmental innovation and citizen development. The scenario states that "department managers create custom agents for their teams"—the goal is to enable this creativity with appropriate governance, not to block it entirely. Modern governance is about "guard rails, not gates."

**Why F is incorrect:**
While sensitivity labels are valuable for data classification and protection, requiring all agents to use them doesn't directly address the governance requirement in the scenario (approval process for agents with external data access). Agents interact with data that may already have sensitivity labels, but the agent itself isn't typically labeled. This confuses document protection with agent governance.

**Microsoft Learn References:**
- [Manage agent governance](https://learn.microsoft.com/en-us/power-platform/admin/manage-power-apps)
- [Power Platform governance](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/governance)
- [Agent approval processes](https://learn.microsoft.com/en-us/microsoft-copilot-studio/security-and-governance)

---

## End of Practice Questions

**Study Tips:**

1. **Focus on scenarios** - The AB-900 exam emphasizes real-world application, not just memorization
2. **Understand the "why"** - Know why you'd choose one solution over another
3. **Practice with a trial tenant** - Hands-on experience is invaluable
4. **Review Microsoft Learn docs** - Official documentation is your best study resource
5. **Pay attention to details** - Words like "MOST," "BEST," "FIRST" matter in questions

**Next Steps:**

- Review the [Complete AB-900 Exam Guide](./AB-900-EXAM-GUIDE.md)
- Study the [AB-900 Skills Breakdown](./AB-900-SKILLS-BREAKDOWN.md)
- Set up a Microsoft 365 trial tenant for hands-on practice
- Join the Microsoft Tech Community for additional resources

**Good luck with your AB-900 certification!**

---

**Disclaimer:** These practice questions are created for educational purposes and are not official Microsoft certification materials. For official practice assessments, visit [Microsoft Learn](https://learn.microsoft.com/en-us/credentials/certifications/exams/ab-900/).
