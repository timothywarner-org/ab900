# AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
## Practice Questions

**Version:** 2.0
**Last Updated:** 2026-07-26
**Total Questions:** 15 (5 per domain)

Aligned to the AB-900 skills measured as of **July 22, 2026**. Answer keys were re-verified against current Microsoft Learn documentation for this revision. Two answer keys changed; see the notes on Question 11 and Question 13.

---

## Domain 1: Identify the core features and objects of Microsoft 365 services (30-35%)

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
Restarting computers is not required for Copilot features to appear. The features are cloud-based and activate automatically once the license propagation is complete. Users may need to restart their Microsoft 365 applications (like Teams or Outlook), but not the entire computer, and this still does not address the 24-hour activation window.

**Microsoft Learn References:**
- [Microsoft 365 Copilot Licensing](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing)
- [Microsoft 365 Copilot Setup](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-setup)

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
Conditional Access policies are the correct solution for implementing context-aware access controls in Microsoft Entra ID. You can create policies that:
- Require device compliance (corporate-managed devices)
- Require MFA based on network location (outside corporate network)
- Apply to specific applications or services, including Microsoft 365 Copilot
- Enforce conditions based on user, device, location, and risk signals

This is exactly the type of "never trust, always verify" Zero Trust control that Conditional Access was designed for.

**Why A is incorrect:**
Privileged Identity Management (PIM) is used for managing, controlling, and monitoring access to privileged administrative roles. It provides just-in-time (JIT) privileged access and time-bound role assignments. While important for security, PIM does not control device compliance or location-based MFA requirements for end-user access to applications.

**Why C is incorrect:**
Identity Protection is focused on detecting and responding to identity-based risks, such as compromised credentials, unusual sign-in behavior, or leaked credentials. While it can integrate with Conditional Access to block risky sign-ins, it does not directly enforce device compliance or location-based MFA policies.

**Why D is incorrect:**
Microsoft Entra Connect is a synchronization tool that connects on-premises Active Directory with Microsoft Entra ID. It is used for hybrid identity scenarios to sync users, groups, and passwords, but it does not provide access control policies or MFA enforcement.

**Microsoft Learn References:**
- [What is Conditional Access?](https://learn.microsoft.com/entra/identity/conditional-access/overview)
- [Microsoft Entra ID overview](https://learn.microsoft.com/entra/fundamentals/whatis)
- [Zero Trust Security](https://learn.microsoft.com/security/zero-trust/zero-trust-overview)

**Terminology note.** Write **Microsoft Entra ID**. The names "Azure AD", "AAD", and "Azure Active Directory" are retired and must not appear in course content. Likewise Azure AD Connect is now **Microsoft Entra Connect**.

**Current UI note.** In the Conditional Access policy editor the target selector reads **Resources (formerly cloud apps)**, and the all-resources option reads **All resources (formerly 'All cloud apps')**. Do not demo the old "Cloud apps" label.

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
Conducting site access reviews is a critical governance practice that validates whether users actually need the access they currently have. This helps ensure that when you remediate oversharing, you are granting access only to users with legitimate business needs, not just maintaining the status quo with a different sharing method.

**Why C is incorrect:**
Deleting SharePoint sites is an extreme and unnecessary action that would result in data loss and business disruption. The goal is to remediate oversharing while preserving legitimate access to business-critical content, not to eliminate the content entirely.

**Why D is incorrect:**
While block download policies can be part of a comprehensive data protection strategy (and may be appropriate in some scenarios), they do not address the core oversharing issue. Users would still have overly broad access to view the content; they just could not download it. This does not follow the principle of least privilege access.

**Why F is incorrect:**
Disabling all external sharing tenant-wide is overly restrictive and does not address the specific issue described. The scenario mentions "Everyone except external users," which means external sharing is not the problem-- internal oversharing is. Additionally, many organizations require external sharing for legitimate business collaboration.

**Microsoft Learn References:**
- [SharePoint Advanced Management](https://learn.microsoft.com/sharepoint/advanced-management)
- [Data access governance reports](https://learn.microsoft.com/sharepoint/data-access-governance-reports)
- [Restricted access control for SharePoint](https://learn.microsoft.com/sharepoint/restricted-access-control)

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
- Do not require a separate license (for mailboxes under 50 GB)
- Provide a shared calendar and contacts
- Are ideal for departmental email addresses like hr@, support@, sales@, etc.

This is the standard solution for collaborative email management in Microsoft 365.

**Why A is incorrect:**
A user mailbox is designed for an individual person and is tied to a single user account. While you could grant multiple people access to a user mailbox through delegation permissions, this is not the recommended approach. User mailboxes require a license, and using them for shared purposes creates complications with password management and account ownership.

**Why C is incorrect:**
Resource mailboxes are specifically designed for bookable resources like conference rooms, equipment, or vehicles. They are used with the Calendar booking system and are not appropriate for general collaborative email management. You cannot easily send emails "from" a resource mailbox address.

**Why D is incorrect:**
A distribution list (or distribution group) is used to send emails to multiple recipients at once. It does not provide a mailbox for receiving and storing emails, nor does it allow multiple people to access a shared inbox. It is simply an email forwarding mechanism that routes messages to group members' individual mailboxes.

**Microsoft Learn References:**
- [Shared mailboxes in Exchange Online](https://learn.microsoft.com/exchange/collaboration-exo/shared-mailboxes)
- [Exchange Online Overview](https://learn.microsoft.com/exchange/exchange-online)

---

### Question 5: Microsoft Teams Policy Management

**Scenario:** Your organization is deploying Microsoft 365 Copilot. The IT security team wants to control which third-party apps can be used with Microsoft Teams to ensure data security and compliance. Specifically, they want to block all third-party apps except for a pre-approved list of business-critical applications.

**Question:** Where should you configure these app permissions?

A) Microsoft Entra ID Enterprise Applications
B) Microsoft Teams admin center app permission policies
C) Microsoft 365 admin center integrated apps
D) Microsoft Purview portal

**Correct Answer:** B

**Explanation:**

**Why B is correct:**
The Microsoft Teams admin center is the correct location to manage app permissions for Teams. Specifically, you would use:
- **App permission policies** to allow or block specific apps
- **App setup policies** to pin apps and control default installations
- **Manage apps** section to set org-wide app availability

You can create custom app permission policies that block all third-party apps by default, then create exceptions for approved apps. These policies can be assigned to specific users or groups, providing granular control over the Teams app ecosystem.

**Why A is incorrect:**
Microsoft Entra ID Enterprise applications manages SSO, authentication, and authorization for cloud applications across the organization. While it is important for enterprise app integration, it is not where you control which apps are available within Microsoft Teams. Teams apps have their own permission and policy system managed through the Teams admin center.

**Why C is incorrect:**
The Microsoft 365 admin center integrated apps section is used to manage certain Microsoft 365 add-ins and integrated applications that work across multiple Microsoft 365 services. However, Teams-specific app policies and permissions are managed in the dedicated Teams admin center, which provides more granular controls for the Teams app ecosystem.

**Why D is incorrect:**
The Microsoft Purview portal is used for data governance, compliance, information protection, DLP, insider risk management, and similar compliance features. While these features may monitor or protect data within Teams, the Purview portal does not control which apps users can install or use in Teams.

**Microsoft Learn References:**
- [Teams app permission policies](https://learn.microsoft.com/microsoftteams/teams-app-permission-policies)
- [Manage Teams policies](https://learn.microsoft.com/microsoftteams/policy-assignment-overview)
- [Teams Administration](https://learn.microsoft.com/microsoftteams/teams-overview)

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
- **Policy tips** appear in Teams to notify users they are about to share sensitive information
- **User override** allows users to proceed if they have a legitimate business reason
- **Business justification** requires users to provide a reason, creating an audit trail and encouraging thoughtful decisions

This approach balances security with usability, following the principle of "educate and empower" rather than "block everything." It is particularly appropriate for credit cards, which may sometimes need to be shared for legitimate business purposes (e.g., processing customer orders).

**Why A is incorrect:**
"Block the content and send an incident report" would prevent sharing but does not allow the user override with justification that the scenario requires. This would be too restrictive for the business need described. While it sends alerts to admins, it does not give users the flexibility to make informed decisions about legitimate sharing.

**Why B is incorrect:**
"Block with no override" is the most restrictive option and explicitly contradicts the requirement to "allow users to override the restriction with a business justification." While this might be appropriate for highly regulated data (like patient health information in HIPAA scenarios), it is too strict for this use case.

**Why D is incorrect:**
"Audit only" mode collects data about policy matches but takes no preventive or educational action. Users would not receive policy tips, would not be prompted for justification, and could freely share credit card information. While useful during DLP policy testing and tuning, it does not meet the requirement to notify users and control sharing.

**Microsoft Learn References:**
- [Data Loss Prevention policies](https://learn.microsoft.com/purview/dlp-policy-reference)
- [Plan for DLP](https://learn.microsoft.com/purview/dlp-overview-plan-for-dlp)
- [DLP policy tips](https://learn.microsoft.com/purview/dlp-policy-tips-reference)

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
Disabling the sensitivity label for externally shared files would require either removing the label entirely (losing the protection and classification) or creating complex conditional policies. This does not solve the root problem and creates inconsistent protection. Additionally, it puts the burden on users to remember to handle external sharing differently, which is error-prone.

**Why D is incorrect:**
Converting to PDF does not solve the encryption access problem. If the sensitivity label with encryption is applied to a PDF, external auditors still could not open it. Furthermore, converting to PDF is a manual workaround that does not scale, could result in data loss (Excel formulas, multiple sheets, etc.), and removes the automated protection that sensitivity labels provide.

**Microsoft Learn References:**
- [Encryption using sensitivity labels](https://learn.microsoft.com/purview/encryption-sensitivity-labels)
- [Restrict access to content using sensitivity labels](https://learn.microsoft.com/purview/encryption-sensitivity-labels)
- [Microsoft Purview Information Protection](https://learn.microsoft.com/training/modules/m365-compliance-information-governance/)

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
Insider Risk Management can detect Microsoft Entra ID account deletion or disablement events. When an admin deletes or disables a user account, this triggers the system to look for risky activities that may have occurred before the termination (typically in a lookback window). This is a built-in signal that does not require additional configuration.

**Why B is correct:**
The HR connector is specifically designed to import employee data from HR systems, including resignation dates, termination dates, and performance review levels. This is the recommended approach for proactive insider risk detection because it identifies departing employees BEFORE their last day, allowing the system to monitor for data exfiltration during the notice period when risk is highest.

**Why C is incorrect:**
While the Microsoft 365 admin center allows you to manage user accounts, there is no specific field for manually entering "termination dates" that integrates with Insider Risk Management. The admin center is where you disable accounts or remove licenses, which would fall under option A (account deletion/disablement events), not a separate manual date entry system.

**Why D is incorrect:**
Insider Risk Management does not parse the content of out-of-office messages to detect departing employees. While this might seem creative, it is not a supported data source. Out-of-office messages are inconsistent, not all departing employees set them, and the system does not analyze email content for this purpose.

**Why E is incorrect:**
While Insider Risk Management does detect anomalous behavior patterns, "job searching behavior" based on login patterns is not a specific indicator used to identify departing users. The system focuses on actual HR data (like resignation notices) and concrete events (like account deletion), not speculative behavioral analysis about job searching.

**Microsoft Learn References:**
- [Insider Risk Management](https://learn.microsoft.com/purview/insider-risk-management)
- [Insider risk management policies](https://learn.microsoft.com/purview/insider-risk-management-policies)
- [HR connector](https://learn.microsoft.com/purview/import-hr-data)

---

### Question 9: Microsoft Purview Compliance Manager

**Scenario:** Your organization is preparing for a GDPR compliance audit. The legal team asks you to provide a comprehensive view of your organization's compliance posture, identify gaps, and recommend specific actions to improve compliance.

**Question:** Which Microsoft Purview solution provides a dashboard with compliance score, improvement actions, and regulatory assessment templates?

A) Compliance Manager
B) Data explorer
C) Activity explorer
D) Data Security Posture Management (DSPM)

**Correct Answer:** A

**Explanation:**

**Why A is correct:**
Compliance Manager is the correct tool for comprehensive compliance posture assessment. It provides:
- **Compliance Score** - A risk-based score representing your compliance posture
- **Improvement Actions** - Specific recommended actions to enhance compliance
- **Assessments** - Pre-built templates for regulations like GDPR, HIPAA, ISO 27001, etc.
- **Dashboard** - Visual representation of compliance status across regulations
- **Progress Tracking** - Monitor implementation of compliance controls

Compliance Manager is specifically designed to help organizations understand their compliance requirements, track progress, and identify gaps-- exactly what the legal team is requesting.

**Why B is incorrect:**
**Data explorer** identifies sensitive information: where it lives, what labels and sensitive information types it carries. It is the tool the July 2026 objectives name for "Identify sensitive information", reached at purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Data explorer**. It surfaces what data you have, not how you measure against a regulation.

**Why C is incorrect:**
**Activity explorer** shows user and admin activities related to sensitivity labels and DLP, such as labels applied, changed, or removed, and DLP policy matches. It is a monitoring tool covering roughly 50 filters over recent activity, not a compliance assessment tool, and it produces no score, assessment, or regulatory template.

**Why D is incorrect:**
DSPM assesses **data security posture**: where sensitive data sits, which AI apps and agents touch it, and what remediation actions to take. It does identify risk, and Compliance Manager and DSPM are related, since a DSPM recommendation named "Get guided assistance to AI regulations" hands off to Compliance Manager's AI regulatory templates. But the compliance score, assessments, and improvement actions themselves live in Compliance Manager.

**Naming note for the live portal.** Learners will see three posture entries under Solutions: **DSPM** (the new unified experience, generally available May 2026), **Data Security Posture Management (classic)**, and **DSPM for AI (classic)**. The AB-900 objectives still use the "DSPM for AI" wording.

**Microsoft Learn References:**
- [Microsoft Purview Compliance Manager](https://learn.microsoft.com/purview/compliance-manager)
- [Compliance Manager assessments](https://learn.microsoft.com/purview/compliance-manager-assessments)
- [Data explorer](https://learn.microsoft.com/purview/data-classification-data-explorer)
- [Data Security Posture Management](https://learn.microsoft.com/purview/data-security-posture-management-learn-about)

---

### Question 10: Copilot Data Access and Permissions

**Scenario:** Your organization has deployed Microsoft 365 Copilot. A department manager is concerned that Copilot might allow users to access SharePoint documents they do not have permissions to view. The manager asks you to explain how Copilot respects existing permissions.

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
- It respects all **existing permissions** - if a user cannot access a SharePoint site, Copilot cannot access it either
- **No permission elevation** - Copilot does not grant users access to data they could not already access
- **Existing security policies apply** - DLP, sensitivity labels, retention policies, etc., all continue to work
- **Zero Trust principles** - Copilot follows "never trust, always verify" with every data access request

This is often called "Copilot sees what you see" - it has the same access as the user, no more, no less.

**Why A is incorrect:**
This is a common misconception. Copilot does NOT have elevated permissions or privileged access to organizational data. If it did, it would create massive security and compliance risks. Copilot explicitly operates within the user's permission boundaries to maintain data security and prevent unauthorized access to sensitive information.

**Why C is incorrect:**
There is no separate "Copilot permission layer" that needs independent configuration. Copilot leverages existing Microsoft 365 permissions through Microsoft Graph. This is a key advantage-- you do not need to recreate or duplicate your permission structure. Your existing SharePoint permissions, Entra ID groups, sensitivity labels, and DLP policies automatically apply to Copilot's data access.

**Why D is incorrect:**
There is no "Copilot-accessible" flag or setting in SharePoint or other Microsoft 365 services. Copilot automatically works with all content the user has permission to access. Administrators do not need to (and cannot) mark individual documents, sites, or libraries as accessible to Copilot. The existing permission model handles everything.

**Microsoft Learn References:**
- [Microsoft 365 Copilot data security](https://learn.microsoft.com/copilot/microsoft-365/microsoft-365-copilot-privacy)
- [Data, Privacy, and Security for Microsoft 365 Copilot](https://learn.microsoft.com/copilot/microsoft-365/microsoft-365-copilot-privacy)
- [Microsoft 365 Copilot Overview](https://learn.microsoft.com/copilot/microsoft-365/)

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
The hybrid approach matches the payment model to the usage pattern. The 100 power users who work in Copilot every day are cheapest on the flat per-user add-on at 30.00 USD per user per month paid yearly, while the 500 occasional users are cheapest on pay-as-you-go, where the organization pays 0.01 USD per Copilot Credit consumed rather than reserving a seat. Pay-as-you-go is enabled through a billing policy rather than assigned per person, so any of the 500 knowledge workers can use Copilot when they need it without a seat sitting idle.

**Why A is incorrect:**
Purchasing 600 per-user subscriptions produces the highest total cost, because the 500 occasional users who use Copilot "a few times per month" waste nearly all of their subscription value. At 30.00 USD per user per month that is 18,000 USD per month, roughly 216,000 USD per year, against occasional users who would each generate cents to low dollars of credit consumption.

**Why B is incorrect:**
There is no such thing as an individual "pay-as-you-go license" you assign to a named user. Pay-as-you-go is a **billing model** configured as a policy at admin.microsoft.com > **Copilot** > **Billing & usage**, scoped to All users or a specific group, and a tenant can create up to 50 such policies.

**Why D is incorrect:**
Microsoft 365 E5 does **NOT** include Copilot; the add-on must be purchased separately on top of E3, E5, Business Standard, or Business Premium. Note the trap has a newer wrinkle: **Microsoft 365 E7**, generally available since May 1, 2026, **does** include Microsoft 365 Copilot in the base SKU along with Microsoft Entra Suite and Agent 365, so an E7 answer option would change this item entirely.

**Watch the units.** The consumption unit is the **Copilot Credit** at 0.01 USD per credit, not the message. A single complex Copilot Chat or SharePoint agent prompt from an unlicensed user can consume 12 credits (a generative answer at 2 plus tenant graph grounding at 10), so 0.12 USD, not 0.01 USD. Do not assume one prompt equals one credit.

**Budget trap worth knowing for a related item.** A budget set on a pay-as-you-go billing policy triggers email notifications only. Microsoft states the system does **NOT** enforce the budget or prevent the organization from exceeding it, and usage continues uninterrupted past the budget.

**Microsoft Learn References:**
- [Microsoft 365 Copilot licensing](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing)
- [Set up pay-as-you-go for Copilot](https://learn.microsoft.com/microsoft-365/commerce/services/pay-as-you-go-setup-copilot)
- [Copilot pay-as-you-go setup and budgets](https://learn.microsoft.com/microsoft-365/copilot/pay-as-you-go/setup)
- [Copilot Studio billing rates and Copilot Credits](https://learn.microsoft.com/microsoft-copilot-studio/requirements-messages-management)

---

### Question 12: Copilot Usage Monitoring with Viva Insights

**Scenario:** You deployed Microsoft 365 Copilot to 200 users three months ago. Leadership wants to understand adoption and measure the value Copilot is delivering to the organization. They specifically want to know: how many users have activated Copilot, how many are actively using it, which applications they are using it in, and whether it is saving time.

**Question:** Where should you access this information?

A) Microsoft 365 admin center Reports > Usage > Exchange
B) Activity explorer in the Microsoft Purview portal
C) Copilot Dashboard in Viva Insights
D) Microsoft Entra ID sign-in logs

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

The Copilot Dashboard is reached in the **Viva Insights** app, either in Microsoft Teams or the Viva Insights web app, **NOT** in the admin center. An AI Administrator first enables it and delegates access from the Microsoft 365 admin center. It answers all of leadership's questions in one view, and it is the only one of these four options that reports the impact and sentiment metrics.

**Why A is incorrect:**
The Exchange usage report covers mailbox activity and storage, not Copilot. There **is** a Copilot-specific report in the admin center at **Reports** > **Usage** > **Microsoft 365 Copilot**, with **Usage**, **Credits**, and **Agents** views, and it is the right tool for readiness and raw adoption numbers. But it does not surface the assisted-hours impact metrics or the sentiment data that leadership asked for.

**Why B is incorrect:**
Activity explorer in the Microsoft Purview portal shows activities related to sensitivity labels and DLP, such as labels applied, changed, or removed, and DLP policy matches. It is a data governance tool, not an adoption analytics tool. Microsoft explicitly warns that Purview audit data is **NOT** intended as the basis for Copilot usage reporting, and metrics built on it may not match the official reports.

**Why D is incorrect:**
Microsoft Entra ID sign-in logs record authentication events: when users signed in, from which device and location, and whether MFA was satisfied. Even if you could infer that a user authenticated to a Copilot-enabled app, sign-in logs carry none of the business-value metrics requested, because they are an identity audit trail rather than an application usage analytics tool.

**Know the four reporting surfaces.** Microsoft documents four distinct sources, and items in this domain often turn on picking the right one: the Microsoft 365 admin center (readiness and usage), Viva Insights Copilot Analytics (Copilot Dashboard and the Advanced Insights analyst workbench), Microsoft Purview audit logs (compliance and security auditing), and Power Platform with Copilot Studio Analytics (agent consumption and performance).

**Microsoft Learn References:**
- [Copilot reports for admins, and the four reporting sources](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-reports-for-admins)
- [Copilot Analytics introduction](https://learn.microsoft.com/viva/insights/copilot-analytics-introduction)
- [Microsoft 365 Copilot usage report](https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-usage)

---

### Question 13: Agent Types and Use Cases

> **Answer key corrected 2026-07-26.** This item previously keyed to A (Researcher) on the reasoning that Researcher "excels at information retrieval." That reasoning does not survive contact with current documentation. Researcher is a **Microsoft-installed first-party agent** that an administrator cannot scope to a specific set of SharePoint sites, so it cannot satisfy "stored across various SharePoint sites and Teams channels" as a build target. The correct answer is **D**.

**Scenario:** Tailwind Traders wants to create an AI agent that helps sales representatives quickly find competitive analysis information, market research reports, and product comparison documents stored across specific SharePoint sites. The agent should be relatively simple to build and maintain without extensive development effort, and it must be scoped to only those sites.

**Question:** Which type of agent is MOST appropriate for this scenario?

A) Researcher
B) Analyst
C) Custom engine agent
D) Declarative agent built in Agent Builder

**Correct Answer:** D

**Explanation:**

**Why D is correct:**
A declarative agent uses Copilot's own AI infrastructure, model, and orchestrator, so there is nothing to host and no code to write. You point it at knowledge sources, which is exactly what this scenario needs. Agent Builder in Microsoft 365 Copilot accepts up to 100 SharePoint files, folders, or sites as knowledge, up to 20 knowledge sources total per agent, which covers a scoped set of sales content comfortably.

**Why A is incorrect:**
Researcher is a Microsoft-installed agent, preinstalled and pre-pinned for all Microsoft 365 Copilot licensed users, and it performs deep multi-step research across Microsoft Graph work data, Copilot connectors, and the Bing web index. An administrator cannot configure it to target a specific set of SharePoint sites, the **Edit users** panel is disabled for it, and it carries a documented limit of 25 queries per user per month, so it is neither scopeable nor a thing you "build" for a team.

**Why B is incorrect:**
Analyst is also a Microsoft-installed first-party agent, and it performs advanced data analysis using chain-of-thought reasoning, which Microsoft positions as better suited than Researcher for Microsoft Excel tasks. The scenario describes document discovery across SharePoint, not computation over structured data, and like Researcher it is not something you scope to named sites.

**Why C is incorrect:**
A custom engine agent is a fully customized assistant where you choose the AI models and orchestration, and it requires hosting outside Microsoft 365. The builder also assumes responsibility for compliance, Responsible AI practices, and security rather than inheriting them, which directly contradicts the requirement to build and maintain the agent "without extensive development effort."

**Microsoft Learn References:**
- [Agents overview and the declarative versus custom engine split](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agents-overview)
- [Agent Builder in Microsoft 365 Copilot](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agent-builder)
- [Add knowledge to an agent, including source limits](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agent-builder-add-knowledge)
- [Researcher FAQ](https://learn.microsoft.com/microsoft-365/copilot/faq-researcher)

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
Configuring the SharePoint site as a **knowledge source** is the built-in, no-code way to ground an agent in organizational content. Supported knowledge source types include SharePoint sites and files, OneDrive files and folders, uploaded (embedded) files, public website URLs, Teams chat URLs, and Copilot connectors.

Limits worth memorizing, because they differ per platform and the exam likes that:

| Platform | Knowledge limits |
|----------|------------------|
| Agent Builder in Microsoft 365 Copilot | 20 knowledge sources total per agent; up to 100 SharePoint files, folders, or sites; 1 SharePoint list; 50 OneDrive files; 20 embedded files; 4 public website URLs; 5 Teams chat URLs |
| SharePoint agents | 20 source items total, in any combination of sites, libraries, folders, and files |
| Copilot Studio | 500 knowledge sources per agent across all types; 25 SharePoint site URLs when using generative orchestration |

Two gotchas: if **Restricted SharePoint Search** is enabled in the tenant, SharePoint cannot be used as a knowledge source for a declarative agent. And Purview **Information Barriers are NOT supported on embedded files**, so any user who can reach the agent can see responses grounded in that embedded content.

**Why A is incorrect:**
Conversation starters are pre-defined prompts or example questions that help users get started with the agent. They appear as suggested questions users can click on (e.g., "How do I reset my password?" or "How do I unlock my account?"). They do not provide data access or connect the agent to knowledge repositories-- they are just UI elements to guide user interaction.

**Why C is incorrect:**
While you *can* use Power Automate flows with agents to perform actions (like actually resetting a password or creating a support ticket), this is overly complex for simply giving the agent access to read knowledge base content. Knowledge sources are the built-in, simpler method for connecting agents to SharePoint content for reading and information retrieval. Power Automate is for actions and integrations, not for basic content access.

**Why D is incorrect:**
Configuring agent actions to query SharePoint via Microsoft Graph API is a developer-level approach that requires coding and custom development. For a declarative agent in Copilot Studio, this level of complexity is not necessary. The platform provides built-in knowledge source configuration that handles Microsoft Graph integration automatically. This option would be relevant for custom plugin development, not declarative agents.

**Microsoft Learn References:**
- [Build Declarative Agents](https://learn.microsoft.com/microsoft-365-copilot/extensibility/build-declarative-agents)
- [Add knowledge sources to agents](https://learn.microsoft.com/microsoft-copilot-studio/knowledge-sources-configure)
- [Copilot Studio documentation](https://learn.microsoft.com/microsoft-copilot-studio/)

---

### Question 15: Agent Governance and Approval

> **Distractor corrected 2026-07-26.** Option B previously read "Set up approval workflows in the Microsoft 365 admin center" and was keyed **incorrect** on the claim that agent approval does not happen there. That claim is now false: the authoritative agent approval queue is admin.microsoft.com > **Agents** > **All agents** > **Requests**, and "Manage agent requests in Microsoft 365 admin center" reached general availability on July 15, 2026. Option B has been replaced so the item still has exactly three correct answers.

**Scenario:** Fabrikam, Inc. allows department managers to create custom agents for their teams using Copilot Studio. The IT security team wants a governance process ensuring all agents are reviewed and approved before they reach users, with IT admin approval required for any agent that accesses external data sources or third-party APIs.

**Question:** Which THREE actions should you take to implement this governance process? (Choose three)

A) Review and approve submitted agents in the Microsoft 365 admin center at Agents > All agents > Requests
B) Email each department manager a spreadsheet to self-certify their agent before publishing
C) Review agent submissions to validate data sources, permissions, and security settings
D) Disable Copilot Studio access for all non-IT users
E) Monitor agent compliance and usage after approval
F) Require all agents to be assigned a sensitivity label

**Correct Answers:** A, C, E

**Explanation:**

**Why A is correct:**
The agent approval queue is at admin.microsoft.com > **Agents** > **All agents** > **Requests**, and only the AI Administrator and Global Administrator roles can approve requests or assign ownership. Three request states appear there, **Pending review**, **Pending update**, and **Pending activate**, and the two primary actions are **Publish to store** and **Reject submission**. Note that a Pending update request uses **Update in store** rather than Publish to store, and until the admin approves it users continue to access the previous version.

**Why C is correct:**
Reviewing the submission is the governance work itself, and the approval wizard walks the admin through exactly this: review capabilities, data sources, security and permissions, and custom actions, then select the users or groups who can install the agent, choose a policy template, and grant admin consent where appropriate. This is where an agent reaching an external data source or a third-party API gets caught before users see it.

**Why E is correct:**
Governance does not end at approval. The **Agents** > **Overview** dashboard surfaces governance action cards for Pending Requests, **Agents at risk**, **Agents without owners**, and **Agents with exceptions**, aggregating risk signals from Microsoft Entra, Microsoft Defender, and Microsoft Purview. Documented risk types include Shadow agent, No owner assigned, and Excessive permissions, all rated Critical.

**Why B is incorrect:**
A manual self-certification spreadsheet is not an enforcement mechanism. Nothing prevents a manager from publishing without completing it, there is no audit trail tied to the agent object, and it does not integrate with the Requests queue where approval actually gates publication.

**Why D is incorrect:**
Disabling Copilot Studio for all non-IT users defeats the stated premise that department managers create agents for their teams. The goal is to enable that work with appropriate controls, not to block it. Governance here is guardrails, not gates.

**Why F is incorrect:**
Sensitivity labels classify and protect **content**, not agents. An agent is not itself assigned a sensitivity label as a governance control; labels apply to the data the agent grounds on, and Copilot surfaces the highest-priority label from the content used in a response. Requiring "labels on agents" confuses document protection with agent lifecycle governance.

**Related division of labor worth knowing.** Agents built with Microsoft 365 Copilot tooling (Agent Builder, SharePoint) are managed primarily through the Microsoft 365 admin center. Agents built with Copilot Studio are managed through the **Power Platform admin center** for finer-grained enterprise controls such as DLP policies that block publishing through specific channels, Editor and Viewer sharing roles, and environment-level sharing limits. Copilot Studio agents still require Microsoft 365 admin center approval to reach the tenant-wide Microsoft 365 Copilot or Teams catalog.

**Microsoft Learn References:**
- [Manage agent requests in the Microsoft 365 admin center](https://learn.microsoft.com/microsoft-365/admin/manage/agent-requests)
- [Agent registry and agent risk types](https://learn.microsoft.com/microsoft-365/admin/manage/agent-registry)
- [Agent roles and permissions](https://learn.microsoft.com/microsoft-365/admin/manage/agent-roles-perms)
- [Copilot Control System management controls](https://learn.microsoft.com/microsoft-365/copilot/copilot-control-system/management-controls)

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

**Disclaimer:** These practice questions are created for educational purposes and are not official Microsoft certification materials. For official practice assessments, visit [Microsoft Learn](https://learn.microsoft.com/credentials/certifications/exams/ab-900/).
