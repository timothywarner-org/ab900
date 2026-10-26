# Segment 2: Data Protection and Governance for Microsoft 365 and Copilot

**Duration:** 50 minutes

**Maps to AB-900 Domain 2: Understand data protection and governance tasks for Microsoft 365 and Copilot (35-40%)** -- the heaviest-weighted domain on the exam.

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Learning Objectives

By the end of this segment, you will be able to:

- Implement data protection strategies for Microsoft 365
- Configure Data Loss Prevention (DLP) policies
- Apply sensitivity labels to protect information
- Establish retention and deletion policies
- Ensure compliance with regulatory requirements
- Understand data residency and sovereignty considerations

## Topics Covered

### 1. Microsoft Purview Overview (10 minutes)

- Microsoft Purview unified platform, reached at purview.microsoft.com
- The six Purview solutions the exam enumerates by name: Information Protection, Data Loss Prevention (DLP), Insider Risk Management, Communication Compliance, Data Security Posture Management (DSPM) for AI, and Data Lifecycle Management
- Data classification: sensitive information types, trainable classifiers, and sensitivity labels
- Retention, and how Data Lifecycle Management differs from Records Management
- Integration with Microsoft 365 and Copilot

**Portal navigation change to call out on stage.** The Purview portal now shows **three** posture-management entries under **Solutions**:

1. **DSPM** -- the new unified experience, generally available since May 2026. Most new features ship here only.
2. **Data Security Posture Management (classic)** -- the previous general posture experience.
3. **DSPM for AI (classic)** -- the previous AI-specific experience.

The AB-900 objective wording still says "Microsoft Purview Data Security Posture Management (DSPM) for AI", which maps to the classic label. Teach the classic label as the exam answer, then show learners the new unified DSPM in the live portal so they are not surprised. Microsoft has published **NO** retirement date for the classic experiences.

Old-to-new navigation mapping for the new DSPM:

| Task | New DSPM path |
|------|---------------|
| Setup tasks | DSPM > **Getting Started**, or DSPM > **Actions** > **Setup tasks** |
| Recommendations for AI apps | DSPM > **Actions** > **Remediation actions** |
| Microsoft 365 Copilot overview | DSPM > **Reports** > **Microsoft 365 Copilot** |
| Apps and agents | DSPM > **Discover** > **Apps and agents** |
| Activity explorer, AI activity | DSPM > **Discover** > **Activity explorer** > **AI activities** tab |
| Data risk assessments | DSPM > **Discover** > **Data risk assessments** |

### 2. Data Loss Prevention (DLP) (12 minutes)

#### DLP Fundamentals
- What is DLP and why it matters
- Sensitive information types
- DLP policy components
- Conditions, actions, and exceptions

#### Implementing DLP for Copilot

The DLP policy **location** is named **Microsoft 365 Copilot and Copilot Chat**. Create it at purview.microsoft.com > **Data Loss Prevention** > **Policies** > **+ Create policy** > **Custom template** > **Custom policy**, then turn on that location on the **Locations** page.

Supported condition and action pairs:

| Condition | Action | Effect |
|-----------|--------|--------|
| Content contains > **Sensitivity labels** | Prevent Copilot from processing content | Item is excluded from the response summary but may still appear in citations |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Processing prompts** | Copilot does not respond to the prompt at all |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Performing Web Searches** | Blocks external web search as a grounding source |
| **Email is received from** > External users (preview) | Prevent Copilot from processing content | Excludes external email from grounding, summarization, and citation, reducing prompt injection risk |

**Exam trap.** You can **NOT** combine the "Content contains sensitive info types" condition and the "Content contains sensitivity labels" condition in the same rule. You can create a rule for each condition in the same policy, but not both in one rule.

Coverage limits worth stating out loud: sensitivity-label rules cover stored files, actively open files, and emails sent on or after January 1, 2025. Calendar invites are **NOT** supported. In Word, Excel, and PowerPoint the policy is evaluated at file open, so a label applied mid-session takes effect the next time the file is opened.

### 3. Sensitivity Labels and Information Protection (12 minutes)

#### Information Protection Strategy
- Classification framework
- Sensitivity label schema
- Label policies and deployment
- Automatic vs. manual labeling

#### Copilot and Sensitivity Labels

- **The EXTRACT usage right.** This is the single most-tested detail in this subsection. When a sensitivity label applies encryption, the user needs the **EXTRACT** usage right in addition to **VIEW** for Copilot to return the data. If content grants VIEW but **NOT** EXTRACT, Copilot will not summarize the content, but it can still reference it with a link the user opens outside Copilot.
- **Label inheritance.** Copilot in Word, Copilot in PowerPoint, and Copilot in Outlook apply the source file's sensitivity label and its protection settings, including content markings such as footers, to newly created content. This covers "Draft with Copilot" plus "Reference a file" in Word, "Create presentation from file" in PowerPoint, and "Edit in Pages" from Copilot Chat.
- **Label display in responses.** Copilot Chat shows the sensitivity label for items listed in the response and its citations. Using the label's priority number set in the Purview portal, Copilot in Teams chat and channels displays the **highest priority** label from the data used, that is, the most restrictive one.
- **Encryption without labels.** Content encrypted by Azure Rights Management without a sensitivity label still has VIEW and EXTRACT checked, but there is no automatic inheritance of protection to new items. S/MIME protected emails are **NOT** returned by Copilot, and Copilot is unavailable in Outlook while an S/MIME email is open. Password-protected documents cannot be accessed unless the user already has them open in the same app. Items encrypted with Customer Key or BYOK **ARE** supported.

### 4. Retention Policies and Records Management (10 minutes)

- Retention policy fundamentals
- Adaptive scopes
- Retention labels vs. policies
- Disposition review
- Managing Copilot-generated content
- Compliance records

### 5. Compliance, Oversharing, and Regulatory Requirements (6 minutes)

- Common compliance frameworks (GDPR, HIPAA, SOX) via Compliance Manager regulatory templates
- Compliance score and improvement actions
- Auditing Copilot: prompts and responses are captured in the unified audit log automatically as part of **Audit (Standard)**. No extra configuration is needed if auditing is on. Reach them at purview.microsoft.com > **Audit**.
- **eDiscovery naming change.** There is now **ONE** unified solution named **eDiscovery**. The separate "eDiscovery (Standard)" and "eDiscovery (Premium)" solutions are gone, and all classic eDiscovery experiences retired on August 31, 2025. Capabilities now split into base eDiscovery features and premium eDiscovery features based on subscription.
- **Content search moved.** The current path is purview.microsoft.com > **Solutions** > **eDiscovery** > **Content Search**. All content searches live in a single system-generated eDiscovery case named "Content search". Do **NOT** demo a standalone Content Search node; it is retired.

#### Identify and monitor oversharing in SharePoint

This subsection is flagged **Minor changed** in the July 22, 2026 AB-900 change log, which makes it high-probability exam material.

**Data access governance (DAG) reports.** SharePoint admin center > expand **Reports** > select **Data access governance**. Snapshot reports include "Site permissions across your organization" (marked Recommended), "Sensitivity label applied to files", and a site permissions for users report. Activity reports include "Sharing links" and "Shared with 'Everyone except external users'" and cover the last 28 days.

**Restricted access control (RAC) versus restricted content discovery (RCD).** This distinction is the one to drill:

| Control | What it governs | Effect on permissions |
|---------|-----------------|-----------------------|
| **RAC** (restricted access control) | **ACCESS**. Restricts who can open the site at all, to members of specified Microsoft 365 groups or Entra security groups. Up to 10 groups per site. Blocks even prior link holders. | Enforcement. A user needs BOTH the content permission AND membership in the RAC group. |
| **RCD** (restricted content discovery) | **DISCOVERABILITY**. Prevents site content appearing in organization-wide search and Copilot unless the user recently interacted with it. | Concealment. Permissions are untouched. Users with access can still open content directly. |

One-line version for the exam: RAC is enforcement, RCD is concealment.

RAC paths. Tenant enablement: SharePoint admin center > expand **Policies** > **Access control** > **Site-level access restriction** > **Allow access restriction** > **Save**. Per-site: SharePoint admin center > expand **Sites** > **Active sites** > select the site > **Settings** tab > **Edit** in the **Restricted site access** section.

RCD path: SharePoint admin center > **Sites** > **Active sites** > select a site > **Settings** tab > under **Restrict content discovery** select **On** > **Save**.

**Naming note.** Microsoft uses "restricted access control", "restricted site access control", and "site access restriction" interchangeably in the same articles. The July 2026 study guide bullet says "restricted access control". Teach RAC as the primary term and warn learners the admin center UI says "Restricted site access".

**Retirement alert.** **Restricted SharePoint Search (RSS) is retiring.** Starting **July 31, 2026** -- three days after this session -- new enablement is blocked. Microsoft directs customers to RCD instead. Do **NOT** teach RSS as a current recommendation.

**SharePoint Advanced Management licensing.** The answer is nuanced and exam-worthy. The Copilot-readiness subset of SAM unlocks when **at least one user** in the organization holds a Microsoft 365 Copilot license, and that user does not need to be a SharePoint administrator. The **full** SAM feature set still requires the **SharePoint Advanced Management Plan 1** add-on; Microsoft names restricted site creation as an example of a feature the Copilot license does not unlock. Microsoft 365 E7 also includes SAM.

## Hands-On Labs

### Lab 2.1: Create and Test DLP Policies
**Objective:** Implement DLP policies to protect sensitive information

**Steps:**
1. Sign in to the Microsoft Purview portal at purview.microsoft.com
2. Go to **Solutions** > **Data Loss Prevention** > **Policies** > **+ Create policy**
3. Create a DLP policy for credit card numbers
4. Configure policy rules and actions
5. Test the policy with sample content
6. Review DLP alerts and reports

### Lab 2.2: Configure Sensitivity Labels
**Objective:** Create and deploy sensitivity labels

**Steps:**
1. Design a label taxonomy (Public, Internal, Confidential, Highly Confidential)
2. Create sensitivity labels
3. Configure label settings (encryption, watermarks, headers)
4. Publish label policies to users
5. Test label application and inheritance

### Lab 2.3: Implement Retention Policies
**Objective:** Establish retention policies for different content types

**Steps:**
1. Create retention policy for email (7 years)
2. Create retention policy for Teams messages (1 year)
3. Configure adaptive scopes for departments
4. Test retention behavior
5. Review disposition settings

### Lab 2.4: Audit Copilot Activities
**Objective:** Enable and review audit logs for Copilot usage

**Steps:**
1. Confirm auditing is enabled for the organization. Copilot prompts and responses are captured automatically as part of Audit (Standard); no Copilot-specific configuration is required.
2. Go to purview.microsoft.com > **Audit** and search using the **Activities - operation names** field
3. Filter for the **CopilotInteraction** operation
4. Inspect record properties, including **AccessedResources** (which carries **SensitivityLabelId**) and **XPIADetected**, the boolean flagging a cross-prompt injection attack
5. Export audit data and analyze usage patterns

**Billing trap.** Audit logs for **non-Microsoft** AI applications use pay-as-you-go billing and are retained 180 days. All Microsoft applications, including Microsoft 365 Copilot, Security Copilot, Copilot in Fabric, and apps built with Copilot Studio and Microsoft Foundry, are included in Audit (Standard) at no extra charge.

**Reporting trap.** Microsoft explicitly warns that Purview audit log data is **NOT** intended as the basis for Copilot usage reporting. Aggregated metrics built on it may not match the official reports. Use the Microsoft 365 Copilot usage report or the Copilot Dashboard instead.

## Demonstrations

### Demo 1: End-to-End Data Protection
- Creating a comprehensive data protection strategy
- Implementing layered security controls
- Demonstrating how Copilot respects protection policies

### Demo 2: DLP in Action
- Live demonstration of DLP policy blocking sensitive data
- User experience with policy tips
- Administrator alert and investigation workflow

### Demo 3: Sensitivity Labels with Copilot
- Applying labels to documents
- Copilot interaction with labeled content
- Access restrictions and encryption

### Demo 4: Compliance Reporting
- Compliance score overview
- Improvement actions
- Audit log analysis
- eDiscovery for investigations

## Key Takeaways

1. **Layered Protection** - Combine DLP, sensitivity labels, and retention for comprehensive security
2. **Proactive Prevention** - DLP prevents data loss before it happens
3. **Classification is Critical** - Proper labeling ensures appropriate protection
4. **Copilot Respects Governance** - AI features honor existing security policies
5. **Compliance is Continuous** - Regular monitoring and adjustment required
6. **User Education Matters** - Train users on data protection practices

## Important Considerations for Copilot

### Data Protection
- Copilot operates within your security boundaries and uses the signed-in user's identity, with no permission elevation
- DLP policies apply to Copilot interactions through the **Microsoft 365 Copilot and Copilot Chat** location
- Sensitivity labels and their encryption usage rights are honored, subject to the EXTRACT rule above
- No customer data is used to train the foundation models
- **Information Barriers are NOT supported on embedded files** used as agent knowledge. Any user who can access the agent can see responses grounded in that embedded content.

### Governance Best Practices
- Apply sensitivity labels before Copilot rollout
- Configure DLP policies for AI interactions
- Monitor Copilot usage through audit logs
- Regular compliance reviews
- Document data handling procedures

## Additional Resources

### Documentation
- [Microsoft Purview Overview](https://learn.microsoft.com/purview/purview)
- [Data Loss Prevention](https://learn.microsoft.com/purview/dlp-learn-about-dlp)
- [Sensitivity Labels](https://learn.microsoft.com/purview/sensitivity-labels)
- [Data Lifecycle Management and Retention](https://learn.microsoft.com/purview/data-lifecycle-management)
- [Microsoft Purview Data Security and Compliance Protections for Copilot](https://learn.microsoft.com/purview/ai-microsoft-purview)
- [DLP for the Microsoft 365 Copilot and Copilot Chat location](https://learn.microsoft.com/purview/dlp-microsoft365-copilot-location-learn-about)

### Tools

The Microsoft Purview portal uses a single URL. There are **NO** per-solution URLs anymore. Reach every solution through **purview.microsoft.com** > **Solutions** > the solution name.

| Destination | Navigation path |
|-------------|-----------------|
| Microsoft Purview portal | https://purview.microsoft.com |
| Data Loss Prevention | purview.microsoft.com > **Solutions** > **Data Loss Prevention** > **Policies** |
| Information Protection | purview.microsoft.com > **Solutions** > **Information Protection** |
| Data explorer | purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Data explorer** |
| Activity explorer | purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Activity explorer** |
| Data Security Posture Management | purview.microsoft.com > **Solutions** > **DSPM** |
| Audit | purview.microsoft.com > **Audit** |

**Retired portal warning:** compliance.microsoft.com is the retired Microsoft Purview compliance portal. Do **NOT** use it in demos or documentation. The host still resolves and still starts a sign-in flow, so it will not fail loudly. It will simply take you somewhere you did not intend.

### Videos
- Microsoft Purview Deep Dive
- Implementing DLP Policies
- Sensitivity Labels Best Practices
- Copilot Data Security and Privacy

## Common Scenarios

### Scenario 1: Financial Services
- Protect customer financial data
- Comply with regulations (SOX, PCI-DSS)
- Prevent insider trading information leakage

### Scenario 2: Healthcare
- HIPAA compliance
- Protect patient health information (PHI)
- Secure electronic health records (EHR)

### Scenario 3: Legal/Professional Services
- Attorney-client privilege protection
- Document retention requirements
- Confidential client information

## Q&A Notes

Use this section to capture questions and answers from the live session:

---

## Next Steps

Proceed to [Segment 3: Copilot Features and Administration](../segment-03-copilot-administration/) to dive deep into Copilot-specific administration tasks.
