# Segment 2: Data Protection and Governance - Official Resources

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Official Microsoft Documentation

### Microsoft Purview Overview
- **Microsoft Purview Main Page**
  - https://learn.microsoft.com/en-us/purview/
  - Comprehensive data governance, security, and compliance portfolio
  - Unified platform for information protection, DLP, insider risk, and more

- **Microsoft Purview Portal**
  - https://purview.microsoft.com
  - Central hub for all data security, governance, and compliance activities
  - This is a single URL for every solution. Navigate via **Solutions** > the solution name. There are **NO** per-solution URLs.
  - The former compliance portal at compliance.microsoft.com is retired. Do **NOT** use it.

### Information Protection
- **Sensitivity Labels Overview**
  - Create and apply classification labels to data
  - Configure encryption and access controls
  - Implement automatic labeling rules
  - Label inheritance and propagation

- **Data Classification**
  - **Data explorer:** Identify sensitive information. This is the tool the July 2026 AB-900 objectives name. Path: Solutions > **Information Protection** > **Explorers** > **Data explorer**.
  - **Content Explorer (classic):** The renamed legacy view of labeled content. Path: Solutions > **Data Lifecycle Management** > **Explorers** > **Content explorer**. Counts can take up to 7 days to update, and 14 days for files in SharePoint.
  - **Activity explorer:** Monitor labeling and DLP activities. Offers about 50 filters plus predefined filter sets such as Endpoint DLP activities, Sensitivity labels applied/changed/removed, Egress activities, and Network DLP activities. Filter options are generated from the first 500 records.
  - **Trainable classifiers:** Machine-learning-based content classification. Note the Purview portal renamed "Classification" to **Classifiers** and moved it into each solution's left navigation.
  - **Sensitive information types:** Pre-built and custom patterns

  Licensing note: data classification analytics (the explorer interfaces) requires E5/A5/G5, but Content Explorer data aggregation continues for E3/A3/G3 tenants.

### Data Loss Prevention (DLP)
- **Microsoft Purview DLP Overview**
  - Monitor and prevent accidental data leaks
  - Cross-platform protection (M365, endpoints, cloud apps)
  - Policy-based prevention and alerting

- **Microsoft Learn DLP Module**
  - https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-prevent-data-loss/
  - Comprehensive DLP training covering:
    - DLP policy creation and deployment
    - Adaptive Protection for risk-aware safeguards
    - DLP analytics for performance optimization
    - Alert management and activity monitoring

- **DLP Components:**
  - **Locations:** Where to apply policies (Exchange, SharePoint, Teams, OneDrive, endpoints)
  - **Conditions:** What triggers the policy (sensitive info types, labels)
  - **Actions:** What happens (block, notify, override, quarantine)
  - **Exceptions:** When to skip the policy
  - **User notifications:** Policy tips and email alerts
  - **Incident reports:** Admin notifications

### Insider Risk Management
- **Detect and Mitigate Internal Threats**
  - Monitor user activities for risky behavior
  - Data theft prevention
  - Departing employee monitoring
  - Security policy violation detection
  - Machine learning-based risk scoring

- **Risk Indicators:**
  - Unusual file activity
  - Data exfiltration patterns
  - After-hours access
  - Risky browsing behavior

### Communication Compliance
- **Monitor Organizational Communications**
  - Scan emails, Teams messages, and Viva Engage posts
  - Detect policy violations (harassment, inappropriate content)
  - Regulatory compliance (SEC, FINRA)
  - Built-in and custom policies

- **Communication Compliance over Copilot prompts**
  - https://learn.microsoft.com/purview/communication-compliance-copilot
  - Create the policy at purview.microsoft.com > **Communication Compliance** > **Policies** > **Create policy** > **Detect Microsoft Copilot interactions** template
  - Detects any message with the `IPM.SkypeTeams.Message.Copilot.*` item class
  - To add generative AI to an existing policy, edit it and on the **Choose locations to detect communications** page select **Microsoft Copilot experiences**, **Enterprise AI apps**, and/or **Other AI apps**
  - In the **Pending** tab, AI matches show a Subject of `[Copilot]` for Microsoft Copilots and `[AI app]` for all other generative AI. The Sender column shows Copilot, Connected AI app, or Cloud AI app. Prompts and responses appear as separate entries.
  - **Billing trap:** there is **NO** pay-as-you-go charge for detecting Microsoft 365 Copilot data. Pay-as-you-go **IS** required to detect non-Microsoft-365 AI data, including Copilot in Fabric, Security Copilot, Copilot Studio, connected generative AI applications, and browser-detected AI apps.
  - To investigate, you need the Communication Compliance, Communication Compliance Investigators, or Communication Compliance Analysts role **AND** to be listed in the policy's Reviewers field

### Data Security Posture Management (DSPM)
- **Assess and Improve Security Stance**
  - https://learn.microsoft.com/purview/data-security-posture-management-learn-about
  - Discover sensitive data across environments
  - Identify security gaps and misconfigurations
  - Implement security recommendations
  - Monitor posture improvements

- **Three entries now appear under Solutions.** Microsoft Learn states it plainly: do not confuse the new **DSPM** with the previous versions, now named **Data Security Posture Management (classic)** and **DSPM for AI (classic)**. DSPM for AI and DSPM converged into a single solution, and Microsoft says most new features will be added to the new version only. The new unified DSPM reached general availability in May 2026.

- **New DSPM key pages:** Posture, Objectives, AI observability, Asset explorer, Reports, and Setup tasks. **AI observability** is the inventory of AI apps and agents, including Microsoft Agent 365, with activity in the last 30 days. Note that **Discover** > **Apps and agents** does **NOT** include Agent 365 agents; use AI observability for those.

- **DSPM for AI (classic) behaviors worth knowing:** it automatically runs a weekly data risk assessment for the top 100 SharePoint sites by usage, with no activation needed. Custom data risk assessments are in preview. Allow at least 24 hours for one-click policies to collect data.

- **Access requirements:** Microsoft Entra Compliance Administrator, Microsoft Entra Global Administrator, or the Microsoft Purview Compliance Administrator role group. The classic experience additionally requires Microsoft 365 E5 or the Microsoft Purview Suite.

### Compliance Manager
- **Microsoft Purview Compliance Manager**
  - https://learn.microsoft.com/en-us/purview/compliance-manager
  - Automated compliance assessment and management
  - 360+ regulatory templates (GDPR, HIPAA, SOX, ISO, etc.)
  - Risk-based compliance score
  - Improvement actions with step-by-step guidance

- **Key Components:**
  - **Controls:** Requirements for system configuration and processes
  - **Assessments:** Groupings of controls from regulations
  - **Regulations:** Pre-built templates for standards
  - **Improvement Actions:** Recommended tasks to improve compliance

- **Compliance Score:**
  - Measures progress in completing improvement actions
  - Points awarded for implementing controls
  - Baseline score from M365 data protection defaults

### Copilot Data Protection
- **How Copilot Accesses Data**
  - Copilot respects existing permissions (no elevation)
  - Users only see data they already have access to
  - Semantic Index for enhanced retrieval
  - Real-time permission checks

- **Copilot and Governance**
  - DLP policies apply to Copilot through the **Microsoft 365 Copilot and Copilot Chat** location
  - Sensitivity labels honored in responses, subject to the **EXTRACT** usage right rule
  - No customer data used for foundation model training
  - Tenant boundary protection and data grounding within your organization

- **The EXTRACT usage right (heavily tested)**
  - https://learn.microsoft.com/purview/ai-microsoft-purview
  - When a sensitivity label applies encryption, the user needs **EXTRACT** in addition to **VIEW** for Copilot to return the data
  - With VIEW but **NOT** EXTRACT, Copilot will not summarize the content but can still reference it with a link

- **eDiscovery over Copilot data**
  - User prompts and responses are stored in the user's **mailbox**
  - Create a case, select the user's mailbox as the data source, then in the query builder select **Add condition** > **Type** > **Contains any of** > **Edit** > **Copilot activity**
  - That condition covers all Copilot and other AI application activity

- **Insider Risk Management over Copilot**
  - Uses the **Risky AI usage** policy template, which detects prompt injection attacks and access to protected materials
  - As of June 2026 you can select which generative AI apps to monitor in IRM policy indicators, reducing alert noise and avoiding unnecessary pay-as-you-go charges

- **The three AI app categories Purview uses in the UI**
  1. **Copilot experiences and agents** (Microsoft 365 Copilot, Security Copilot, Copilot in Fabric, Copilot Studio)
  2. **Enterprise AI apps** (Microsoft Foundry, Entra-registered AI apps, Anthropic Claude Enterprise, ChatGPT Enterprise)
  3. **Other AI apps** (browser-detected apps categorized as Generative AI in the Defender for Cloud Apps catalog)

- **Data Lifecycle Management and Copilot**
  - Retention policies can automatically retain or delete user prompts and responses for AI apps
  - Where multiple policies apply, the principles of retention resolve conflicts: data is retained for the **longest** duration of all applied retention policies or eDiscovery holds

## Microsoft Learn Training Modules

### Data Governance and Compliance
- **Microsoft 365 Compliance Information Governance**
  - https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-governance/
  - Learning objectives:
    - Understand importance of data security and compliance
    - How Microsoft Purview addresses protection and management
    - Key concepts in data protection and lifecycle management
    - Identify Purview tools and solutions

- **Microsoft Purview Data Loss Prevention**
  - https://learn.microsoft.com/en-us/training/modules/m365-compliance-information-prevent-data-loss/
  - Comprehensive DLP training (intermediate level, 10 units)
  - Policy planning, deployment, simulation, management
  - Adaptive Protection integration
  - Analytics utilization and alert management

### Security Fundamentals
- **Microsoft Security Copilot Core Features**
  - https://learn.microsoft.com/en-us/training/modules/security-copilot-describe-core-features/
  - Security features and capabilities
  - Integration with Defender, Sentinel, Entra, Intune, Purview
  - Plugins and promptbooks

## Hands-On Practice

### Lab Scenarios

#### Lab 1: Create Sensitivity Labels
1. Sign in to the Microsoft Purview portal at purview.microsoft.com and go to **Solutions** > **Information Protection**
2. Create label taxonomy:
   - Public
   - Internal
   - Confidential
   - Highly Confidential
3. Configure label settings:
   - Encryption (who can access)
   - Content marking (headers, footers, watermarks)
   - Auto-labeling conditions
4. Publish label policy to users
5. Test in Word, Excel, PowerPoint, Outlook

#### Lab 2: Implement DLP Policies
1. Create DLP policy for credit card numbers
2. Configure locations (Exchange, SharePoint, Teams, OneDrive)
3. Set up conditions (sensitive info types)
4. Define actions:
   - Block sharing
   - Notify users with policy tip
   - Send incident report to admin
5. Configure user override options
6. Test policy with sample data
7. Review DLP reports and alerts

#### Lab 3: Configure Adaptive Protection (DLP)
1. Enable insider risk integration
2. Configure risk levels (elevated, moderate, minor)
3. Set up dynamic DLP enforcement based on risk
4. Test with different user risk levels
5. Monitor adaptive policy effectiveness

#### Lab 4: Use Compliance Manager
1. Navigate to Compliance Manager
2. Review compliance score
3. Explore improvement actions
4. Create assessment (e.g., GDPR)
5. Assign improvement actions to team members
6. Track progress and update status
7. Generate compliance reports

#### Lab 5: Discover Sensitive Data
1. Use **Data explorer** (Solutions > Information Protection > Explorers > Data explorer) to identify sensitive information. This is the tool named in the July 2026 objectives.
2. Compare against **Content explorer (classic)** under Data Lifecycle Management > Explorers, so learners recognize both labels
3. Use **Activity explorer** to monitor labeling activities
4. Create a custom sensitive information type
5. Review findings and remediate

#### Lab 6: Insider Risk Management
1. Configure insider risk settings
2. Create insider risk policy (data theft by departing users)
3. Define risk indicators
4. Specify users in scope
5. Review risk alerts
6. Investigate potential incidents
7. Take action on confirmed risks

#### Lab 7: SharePoint Oversharing Remediation
1. In the SharePoint admin center, expand **Reports** and select **Data access governance**
2. Run the "Site permissions across your organization" snapshot report and the "Shared with 'Everyone except external users'" activity report
3. Identify overshared sites and files
4. Apply **restricted access control (RAC)** to limit site access to specified groups (enforcement)
5. Apply **restricted content discovery (RCD)** to keep site content out of org-wide search and Copilot without changing permissions (concealment)
6. Review the **Change history** report to find the permission changes that caused the oversharing
7. Use **Site access review** to delegate permission review to site owners
8. Monitor oversharing reduction

**Prerequisite gotcha.** DAG reports do not work if the tenant uses nonpseudonymized report data. A Global Administrator must go to the **Reports** setting in the Microsoft 365 admin center and clear **Display concealed user, group, and site names in all reports**. DAG reports are unavailable for Microsoft 365 operated by 21Vianet regardless of licensing.

## AB-900 Exam Focus Areas

### Domain 2: Data Protection and Governance (35-40%)

**Critical Topics:**

- [ ] **Microsoft Purview capabilities**
  - Information Protection
  - Data Loss Prevention
  - Insider Risk Management
  - Communication Compliance
  - Data Security Posture Management

- [ ] **Sensitivity labels**
  - Creating and configuring labels
  - Label policies and scopes
  - Automatic vs. manual labeling
  - Encryption and rights management
  - Label inheritance

- [ ] **Data Loss Prevention**
  - DLP policy creation
  - Conditions, actions, exceptions
  - User notifications and policy tips
  - DLP locations (Exchange, SharePoint, Teams, OneDrive, endpoints)
  - Alert response and investigation

- [ ] **Copilot data access**
  - How Copilot accesses organizational data
  - Permission model (no elevation)
  - Data grounding and semantic index
  - Web search controls
  - Tenant boundary protection

- [ ] **Compliance Manager**
  - Identifying compliance risks
  - Compliance score calculation
  - Improvement actions
  - Assessment creation and management
  - Regulatory templates

- [ ] **Sensitive data discovery**
  - **Data explorer** usage (the tool the objectives name)
  - Content explorer (classic), and knowing it is the renamed legacy tool
  - Activity explorer monitoring
  - Sensitive information types
  - Trainable classifiers, listed under **Classifiers** in the portal
  - Content search inside Microsoft Purview eDiscovery

- [ ] **Insider risk alerts**
  - Risk indicators and scoring
  - Alert investigation
  - Response actions
  - Integration with DLP (Adaptive Protection)

- [ ] **SharePoint oversharing** (flagged Minor changed in the July 22, 2026 change log)
  - Data access governance reports, and the exact path: SharePoint admin center > **Reports** > **Data access governance**
  - Oversharing identification via snapshot and activity reports
  - **Restricted access control (RAC)**, which gates ACCESS
  - **Restricted content discovery (RCD)**, which gates DISCOVERABILITY only
  - Site access reviews and Change history
  - SharePoint Advanced Management features and the split licensing rule
  - Restricted SharePoint Search is retiring; new enablement is blocked starting July 31, 2026

**Key Concepts to Master:**

1. **Layered Protection Approach**
   - Sensitivity labels -- classify data
   - DLP policies -- prevent leakage
   - Insider Risk Management -- detect threats
   - Compliance Manager -- track posture

2. **How Copilot Respects Governance**
   - Honors existing permissions
   - Respects sensitivity labels
   - Subject to DLP policies
   - No training on your data
   - Audit logging enabled

3. **Compliance Manager Workflow**
   - Baseline assessment
   - Identify gaps via controls
   - Implement improvement actions
   - Track progress via score
   - Generate reports for audits

4. **DLP Policy Structure**
   ```
   Location -- Condition -- Action -- Exception -- Notification
   ```

5. **SharePoint Advanced Management**
   - The Copilot-readiness subset unlocks when at least one user holds a Microsoft 365 Copilot license; the full feature set still needs the SharePoint Advanced Management Plan 1 add-on
   - Restricted content discovery (RCD)
   - Restricted access control (RAC)
   - Data access governance reports, sharing links reports, and EEEU insights
   - Site access review, Change history, and Recent admin actions
   - Requires SharePoint Administrator, or the broader SharePoint Advanced Management Administrator role

## Common Scenarios

### Scenario 1: Protecting Financial Data
**Requirement:** Prevent sharing of credit card and bank account numbers

**Solution:**
1. Create DLP policy with financial sensitive info types
2. Apply to Exchange, SharePoint, Teams, OneDrive
3. Configure action: Block external sharing
4. Enable user notifications
5. Set up admin incident reports
6. Monitor DLP dashboard

### Scenario 2: HIPAA Compliance for Healthcare
**Requirement:** Comply with HIPAA regulations for patient data

**Solution:**
1. Use Compliance Manager HIPAA template
2. Review improvement actions
3. Create sensitivity labels (PHI, ePHI)
4. Implement DLP for health-related info
5. Enable audit logging
6. Set up retention policies
7. Track compliance score

### Scenario 3: Departing Employee Risk
**Requirement:** Detect data theft by employees leaving organization

**Solution:**
1. Enable insider risk management
2. Create "Data theft by departing users" policy
3. Integrate with HR system for departure dates
4. Configure risk indicators (downloads, print, USB)
5. Set up alerts for high-risk activities
6. Investigate and respond to alerts

### Scenario 4: Copilot Data Governance
**Requirement:** Ensure Copilot only accesses appropriate data

**Solution:**
1. Review and clean up SharePoint permissions
2. Apply sensitivity labels to confidential content
3. Create DLP policies for Copilot interactions
4. Configure web search settings
5. Enable audit logging for Copilot activities
6. Use SharePoint Advanced Management to identify overshared content
7. Monitor Copilot usage via Viva Insights dashboard

## Tools and Portals

Every Microsoft Purview solution is reached through the single portal URL **https://purview.microsoft.com**, then **Solutions** > the solution name. The per-solution URLs that used to exist under compliance.microsoft.com are retired.

| Destination | Navigation path | Purpose |
|-------------|-----------------|---------|
| Microsoft Purview portal | https://purview.microsoft.com | Entry point for all solutions |
| Information Protection | Solutions > **Information Protection** | Labels and classification |
| Data explorer | Solutions > **Information Protection** > **Explorers** > **Data explorer** | Identify sensitive information (current tool) |
| Content explorer (classic) | Solutions > **Data Lifecycle Management** > **Explorers** > **Content explorer** | Legacy view of labeled content |
| Activity explorer | Solutions > **Information Protection** > **Explorers** > **Activity explorer** | Monitor label and DLP activity |
| Data Loss Prevention | Solutions > **Data Loss Prevention** > **Policies** | DLP policies and reports |
| Compliance Manager | Solutions > **Compliance Manager** | Compliance assessments and score |
| Insider Risk Management | Solutions > **Insider Risk Management** | Insider threat management |
| Communication Compliance | Solutions > **Communication Compliance** > **Policies** | Message and prompt policy violations |
| DSPM (new unified) | Solutions > **DSPM** | Current posture management front door |
| DSPM for AI (classic) | Solutions > **DSPM for AI (classic)** | The label the AB-900 objectives still use |
| eDiscovery and Content Search | Solutions > **eDiscovery** > **Content Search** | Search files and emails |
| Audit | **Audit** | Unified audit log search, including CopilotInteraction |
| Data access governance reports | SharePoint admin center > **Reports** > **Data access governance** | Oversharing identification |

**Exam wording trap.** The July 22, 2026 study guide says "Identify sensitive information by using Microsoft Purview **Data Explorer**", not Content explorer. Microsoft introduced a new **Data explorer** under Information Protection and renamed the old tool to **Content Explorer (classic)**. The access role groups differ too: Data Explorer List viewer and Data Explorer Content viewer for the new tool, Content Explorer List viewer and Content Explorer Content viewer for the classic one. These role groups are independent, not cumulative.

## Best Practices

### Information Protection
- Start with clear classification taxonomy
- Use auto-labeling where possible
- Train users on label meanings
- Implement least restrictive that meets requirements
- Monitor labeling adoption

### Data Loss Prevention
- Start with test mode, then report-only, then enforce
- Use policy tips to educate users
- Allow user overrides with business justification
- Review false positives regularly
- Tune policies based on reports

### Insider Risk Management
- Define clear policies and communicate
- Focus on risk indicators, not surveillance
- Investigate thoroughly before action
- Ensure privacy and legal compliance
- Regular review of policies

### Compliance Management
- Assess compliance posture regularly
- Assign improvement actions to owners
- Track progress consistently
- Generate reports for stakeholders
- Update assessments when regulations change

---

**Related Segments:**
- [Segment 1: Core M365 Services](../../segment-01-core-m365-services/)
- [Segment 3: Copilot Administration](../../segment-03-copilot-administration/)
- [Segment 4: Agents and Exam Prep](../../segment-04-agents-exam-prep/)
