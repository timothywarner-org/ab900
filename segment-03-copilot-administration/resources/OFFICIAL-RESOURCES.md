# Segment 3: Copilot Administration - Official Resources

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Official Microsoft Documentation

### Microsoft 365 Copilot Overview
- **Main Copilot Documentation Hub**
  - https://learn.microsoft.com/microsoft-365/copilot/
  - Comprehensive resource for Copilot features, setup, and administration
  - Described as "Your AI assistant for work and school"
  - Embedded in apps you use daily, connected to work data
  - Enterprise-grade security, privacy, and compliance

- **Microsoft 365 Copilot Product Page**
  - https://www.microsoft.com/microsoft-365-copilot
  - Product overview, pricing, and plans

### Copilot Setup and Deployment
- **Microsoft 365 Copilot Setup Guide**
  - https://learn.microsoft.com/copilot/microsoft-365/microsoft-365-copilot-setup
  - Complete deployment framework with three phases:
    - **Get ready:** Deploying Copilot
    - **Drive adoption:** Workforce preparation
    - **Deliver impact:** Measuring usage and performance

- **Deployment Components:**
  1. **Prerequisites and Roles**
     - Access to M365 admin center, SharePoint admin center, Purview portal
     - Required admin roles vary by task

  2. **Pre-Deployment Readiness**
     - Test environment establishment
     - Pilot testing with selected users
     - Communication strategy development
     - Conditional access policy review
     - SharePoint Advanced Management implementation
     - Network requirements validation

  3. **Security Implementation**
     - **MFA:** Enable for all users through admin center
     - **Conditional Access:** Configure based on user risk and device compliance
     - **Audit Logging:** Enable unified audit logging in Purview
     - **Data Protection:** Identify high-risk sites, restrict access, implement controls

  4. **Deployment Steps:**
     - **Update Channels:** Use Current or Monthly Enterprise Channel (not Semi-Annual)
     - **License Assignment:** Via M365 admin center (individual or groups)
     - **Configuration:** Copilot Control System in admin center
     - **Phased Rollout:**
       - Pilot: High-engagement early adopters
       - Deployment: Org-wide with oversharing prevention
       - Operations: Monitor via Copilot Dashboard

### Licensing

Full detail is in `COPILOT-LICENSING-GUIDE.md` in this folder.

- **Microsoft 365 Copilot Licensing**
  - https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing
  - **Add-on license.** Copilot requires an eligible base subscription. **30.00 USD** per user per month (annual billing).
  - **There is NO seat minimum.** The original 300-seat minimum was removed in January 2024, along with the Microsoft 365 prerequisite, which made Office 365 E3 and E5 customers eligible.
  - **Prerequisites include:** Microsoft 365 E7, E5, E3, F1, F3; Business Basic, Standard, Premium; Microsoft 365 Apps for business and enterprise; Office 365 E5, E3, E1, F3; Teams Essentials and Enterprise; Exchange Kiosk, Plan 1, Plan 2; SharePoint Kiosk, Plan 1, Plan 2; OneDrive for work and school Plan 1 and Plan 2; Planner Plan 1; Project Plan 3 and Plan 5; Project Online Essentials; Visio Plan 1 and Plan 2; and Microsoft Clipchamp

- **Microsoft 365 Copilot Business (SMB SKU)**
  - https://learn.microsoft.com/microsoft-365/copilot/copilot-business-faq
  - **300-seat maximum** per tenant. Requires a Microsoft 365 Business plan or Microsoft 365 Apps for Business.
  - List price 21.00 USD per user per month; 18 USD under a 15 percent promotion extended through December 2026
  - Microsoft states it delivers **the same capabilities** as the enterprise offering. The difference is price point and eligibility, not features.
  - Annual commitment only. There is **NO** month-to-month agreement, and existing enterprise Copilot licenses do **NOT** auto-convert at renewal.

- **Microsoft 365 E7 (the Frontier Suite)**
  - https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-license-feature-overview
  - Generally available **May 1, 2026**. E7 = E5 + Microsoft 365 Copilot + Microsoft Entra Suite + Agent 365, a strict superset of E5.
  - E7 customers do **NOT** buy the Copilot add-on separately. Any licensing slide that stops at E5 is incomplete.

- **License Assignment:**
  - Through the Microsoft 365 admin center: **Users** > **Active users** > select user > **Licenses and apps**
  - Group-based assignment for bulk deployment
  - PowerShell via the Microsoft Graph SDK. See `shared-resources/scripts/Assign-CopilotLicenses.ps1`.
  - Allow up to **24 hours** for activation after assignment

- **Licensing Models:**
  - **Per-user subscription:** flat monthly fee per assigned seat
  - **Pay-as-you-go:** consumption billed to an Azure subscription at **0.01 USD per Copilot Credit**
  - **Prepaid capacity packs:** 200.00 USD per pack per month for 25,000 Copilot Credits, consumed before pay-as-you-go
  - **Copilot Credit Pre-Purchase Plan:** an Azure reservation over a one-year term at tiered discounts. Cancellations and exchanges are **NOT** supported.

### Copilot Product Options
- **Microsoft 365 Copilot Chat**
  - Included at no additional cost with an eligible Microsoft 365 subscription
  - Requires sign-in with a Microsoft Entra work or school account for enterprise data protection
  - **Web-based chat** (internet results) is free. **Work-based chat** (results the Entra account can access) requires a Microsoft 365 Copilot license.
  - Available at https://m365.cloud.microsoft/chat

- **Microsoft 365 Copilot**
  - Embedded in Word, Excel, PowerPoint, Outlook, Teams, and Loop
  - Unlocks the advanced agents **Researcher** and **Analyst**

- **Agents**
  - Customizable extensions that perform tasks and use tools
  - Declarative agents and custom engine agents; see Segment 4

### Copilot Administration Settings
- **Copilot Control System** is the current umbrella framework name for Copilot and agent governance, with three pillars: Security and governance, Management controls, and Measurement and reporting.
  - https://learn.microsoft.com/microsoft-365/copilot/copilot-control-system/overview

- **Admin Controls:**
  - **Allow web search in Copilot** toggle. Researcher adheres to this; with web search off at the tenant level, Researcher uses no web data.
  - **Agents** > **Settings** for agent management rules, allowed agent types, security templates, sharing, and user access
  - **Copilot** > **Settings** > **Data access** for who can access agents and which types they can install
  - **Copilot** > **Settings** > **View all** > **Copilot Frontier** for early-access enrollment

- **Policy Configuration Methods:**
  - **Cloud Policy service for Microsoft 365** (renamed from Office cloud policy service)
  - Group Policy for domain-joined devices
  - Intune policies for mobile devices
  - Conditional Access policies

### Pay-as-you-go billing setup

**The path is admin.microsoft.com > Copilot > Billing & usage.** The **Billing policies** tab holds the policies; the **Pay-as-you-go services** tab connects them to services. An alternate route: **Copilot** > **Settings** > **User access** > **Copilot pay-as-you-go billing**.

- https://learn.microsoft.com/microsoft-365/commerce/services/pay-as-you-go-setup-copilot

**Do NOT use Billing > Billing policies for Copilot.** That Billing node covers Microsoft 365 Backup, Microsoft 365 SharePoint Storage, and High Volume Email, and only surfaces a "Go to Copilot Billing & usage" redirect for Copilot.

**Prerequisites:** Billing Administrator, AI Administrator, or Global Administrator; an Azure subscription in the same tenant; an Azure resource group; Owner or Contributor on both; and at least one SharePoint license in the tenant.

**Four setup steps:** create a billing policy with billing details, choose users (All users or a specific group), set an optional budget, then review and select **Create policy**.

**Services available:** Microsoft 365 Copilot Chat, SharePoint agents, and the Microsoft Copilot Retrieval API (preview, billed at 0.10 USD per API call).

**Budget exam trap.** A budget triggers **email notifications only**. Microsoft states the system does **NOT** enforce the budget or prevent the organization from exceeding it, and usage continues uninterrupted. Default alert threshold is 100 percent, and alerts can take up to 24 hours.

**SharePoint migration trap.** Policies previously configured under **Org settings** > **Pay-as-you-go services** must be disconnected there (select **SharePoint agents**, then **Disconnect previous billing**) before linking a new Copilot-node policy.

**Limits:** 50 pay-as-you-go billing policies per tenant, 10 Copilot credit policies, and 10 SharePoint agent billing policies each assigned one security group.

### Copilot Credits

The unit of consumption is the **Copilot Credit**, not the message, and the rate is **0.01 USD per credit**.

<!-- VERIFY: Microsoft documentation is inconsistent. The Copilot Studio billing-rates page and the Power Platform meters page use "Copilot Credits", and the admin center report is named "Credits". The Microsoft 365 Copilot pay-as-you-go Meters page still reads "$0.01 per message" with the meter named "Copilot Studio". Dollar figure matches; unit noun does not. Teach credits, and note the Azure invoice meter is still named Copilot Studio. -->

| Feature | Credits |
|---------|---------|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding | 10 |
| Agent flow actions | 13 per 100 actions |
| Content processing tools | 8 per page |

**Licensed users incur no charge** for these in employee-facing scenarios, subject to fair usage. Credits are consumed by **unlicensed** users.

**The SharePoint agent number to memorize:** SharePoint agents are always grounded in the tenant graph, so a single complex prompt from an unlicensed user costs a generative answer (2) plus tenant graph grounding (10) equals **12 credits**, or 0.12 USD.

### Copilot Security and Governance
- **Data Protection:**
  - Copilot operates within existing security boundaries
  - Respects user permissions (no privilege elevation)
  - Honors sensitivity labels
  - Subject to DLP policies
  - No data used for foundation model training
  - Tenant boundary enforcement

- **Audit Logging:**
  - Unified audit log captures Copilot activities
  - eDiscovery support
  - Legal hold capabilities
  - Data retention controls

- **Ethical AI Principles:**
  - Fairness, reliability, safety
  - Privacy and security
  - Inclusiveness
  - Transparency
  - Accountability

### Usage Monitoring and Analytics

There are **four** distinct reporting sources. Exam items in this domain often turn on picking the right one.

| Source | What it gives you | Where |
|--------|-------------------|-------|
| Microsoft 365 admin center | Readiness and usage numbers, credits, agents | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** |
| Viva Insights Copilot Analytics | Adoption, impact, sentiment | Viva Insights app > **Copilot Dashboard** |
| Microsoft Purview audit logs | Compliance and security auditing | purview.microsoft.com > **Audit** |
| Power Platform and Copilot Studio Analytics | Agent consumption and performance | Power Platform admin center |

- **Microsoft 365 Copilot usage report**
  - https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-usage
  - Path: admin.microsoft.com > **Reports** (select **Show all** if not visible) > **Usage** > under Reports select **Microsoft 365 Copilot** > **Copilot**, then the **Usage** tab
  - Data is typically available within **48 hours** of the end of a day in UTC

- **Copilot Credits report**
  - https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-credits
  - Path: admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Credits**
  - Shows total credits used, cumulative and daily trends, and credits per user, per agent, per billing policy, and per agent-user pair
  - Alerts administrators when a user exceeds **2,000 credits**. During preview it shows a maximum of 30 days of history, has no data before May 3, 2025, and filters to the last 7 or 30 days only.

- **Copilot Dashboard in Viva Insights**
  - https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-reports-for-admins
  - **Path correction:** the Copilot Dashboard is in the **Viva Insights** app, reached in Microsoft Teams or the Viva Insights web app, **NOT** the admin center. An AI Administrator first enables it and delegates access from the Microsoft 365 admin center.

- **Copilot Analytics** is the umbrella term, covering six areas: the readiness and adoption report in the admin center, the Copilot Dashboard in Viva Insights, the Agent Dashboard in Viva Insights, the Consumption Dashboard, ready-to-use Copilot Analytics reports (Viva Insights web app > **Reports**), and Advanced Reporting through Viva Insights and Power BI.
  - https://learn.microsoft.com/viva/insights/copilot-analytics-introduction

- **Role mapping for reporting:** AI Administrator accesses Copilot reports in the admin center and enables/delegates the Copilot Dashboard. Global Administrator assigns the Insights Analyst and Insights Administrator roles. Audit Reader searches Purview audit logs. Copilot Studio Author accesses per-agent analytics.

- **Exam trap.** Microsoft explicitly warns that Purview audit log data is **NOT** intended as the basis for Copilot usage reporting, and aggregated metrics built on it may not match the official reports. Use the Microsoft 365 Copilot usage report or the Copilot Dashboard.

- **Four Copilot Dashboard metric categories:**
  1. **Readiness** -- licenses purchased, licenses assigned, enabled users
  2. **Adoption** -- user engagement across the Microsoft 365 apps, active users over time, app-specific usage
  3. **Impact** -- Copilot assisted hours and related value measures
  4. **Sentiment** -- user satisfaction and feedback

<!-- VERIFY before quoting a specific number on stage: the exact Copilot Dashboard active-user definition window and its data-refresh delay were not re-confirmed against a current Microsoft Learn page in this revision. Prior course material asserted a 28-day active-user window and a delay of up to 6 days. Check the Copilot Dashboard documentation in the live tenant before stating either figure. The Microsoft 365 admin center usage report latency IS confirmed at approximately 48 hours. -->

- **Microsoft 365 admin center usage reports:**
  - Path: admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot**
  - Three views: **Usage**, **Credits**, and **Agents**
  - Data typically available within 48 hours of the end of a day in UTC

- **Agent usage reports.** Note there are **two**, and they differ in status. The original **Microsoft 365 Copilot Agent usage report** is generally available but excludes SharePoint agents and agents built by Microsoft and Microsoft partners, with up to 72 hours of latency. The newer **Microsoft 365 Copilot Agents usage report** is **in preview**, covers declarative, SharePoint, and custom engine agents including those built by the org, Microsoft, and partners, and shows usage within an hour. Both are at **Reports** > **Usage** > **Microsoft 365 Copilot** > **Agents**.

- **Monitoring gap worth naming.** The Researcher FAQ states there is **NO** existing reporting tool for Copilot agents like Researcher and Analyst, and that by default the **content** of Researcher sessions is not accessible to admins or compliance tools. Admins see usage metrics, not conversation content. The only exception is when a user explicitly submits feedback including session data.

### Copilot Experiences by Application

#### Copilot in Word
- Document drafting and writing assistance
- Content rewriting and tone adjustment
- Summarization of long documents
- Content generation from prompts

#### Copilot in Excel
- Data analysis and insights
- Formula generation and explanation
- Pivot table creation
- Chart and visualization suggestions
- Natural language queries

#### Copilot in PowerPoint
- Presentation creation from prompts
- Slide design and layout suggestions
- Content generation from documents
- Image and visual recommendations

#### Copilot in Outlook
- Email drafting and composition
- Email thread summarization
- Meeting preparation and briefs
- Action item extraction

#### Copilot in Teams
- Meeting recap and summaries
- Key decisions and action items
- Chat thread summarization
- Call summaries and notes
- Follow-up task generation

#### Microsoft 365 Copilot Chat
- Cross-application AI assistant
- Query across emails, documents, meetings, chats
- Project status summaries
- Information synthesis from multiple sources

#### Copilot in Loop
- Collaborative workspace assistance
- Content generation in Loop pages
- Team collaboration support

## Microsoft Learn Training Modules

### Core Copilot Training
- **Introduction to Microsoft 365 Copilot**
  - https://learn.microsoft.com/training/modules/introduction-microsoft-365-copilot/
  - **Learning Objectives:**
    - Describe purpose and functionalities
    - Outline working principles
    - Identify core components
    - Understand responsible AI commitment

  - **Module Units (7 total):**
    1. Introduction
    2. What is Microsoft 365 Copilot?
    3. Explore how Microsoft 365 Copilot works
    4. Explore the core components
    5. Examine Microsoft's responsible AI commitment
    6. Module assessment
    7. Summary

  - **Target Audience:** Administrators, business owners, users
  - **Level:** Beginner
  - **Prerequisites:** None

### Adoption and Training
- **Microsoft 365 Copilot Adoption Resources**
  - https://adoption.microsoft.com/copilot/
  - User training materials
  - Admin guidance
  - Champions program resources

## Hands-On Practice

### Lab Scenarios

#### Lab 1: Verify Copilot Prerequisites
1. Check Microsoft 365 app versions (Current or Monthly Enterprise Channel)
2. Verify base license assignments (E3/E5 or Business)
3. Confirm OneDrive provisioning for all users
4. Review network connectivity requirements
5. Validate security and compliance settings
6. Check conditional access policies

#### Lab 2: Assign Copilot Licenses
1. Access Microsoft 365 admin center
2. Go to **Billing** > **Licenses**
3. Select Microsoft 365 Copilot
4. Assign to pilot users (individual or group)
5. Verify assignment in user properties
6. Document 24-hour activation wait time
7. Communicate to pilot users

#### Lab 3: Configure Copilot Settings
1. Access Copilot Control Center in admin center
2. Review tenant-wide Copilot settings
3. Configure web search (enable/disable)
4. Manage plugin permissions
5. Set data sharing preferences
6. Apply Cloud Policy for user-specific controls
7. Test setting inheritance

#### Lab 4: Test Copilot Across Apps
1. **Word:** Draft document from prompt
2. **Excel:** Analyze sample data, create formulas
3. **PowerPoint:** Generate presentation
4. **Outlook:** Compose email, summarize thread
5. **Teams:** Test meeting recap, chat summary
6. **Microsoft 365 Copilot Chat:** Cross-app query
7. Document user experience and feedback

#### Lab 5: Monitor Copilot Usage
1. Navigate to Viva Insights Copilot Dashboard
2. Review readiness metrics
3. Analyze adoption across apps
4. Measure impact (assisted hours)
5. Check sentiment scores
6. Export usage data
7. Create adoption report for leadership

#### Lab 6: Implement Copilot Security
1. Enable MFA for all users
2. Configure conditional access for Copilot
3. Enable audit logging in Purview
4. Review Copilot audit events
5. Test DLP policies with Copilot
6. Verify sensitivity label respect
7. Document security posture

#### Lab 7: Phased Rollout
1. Identify pilot users (champions, power users)
2. Assign initial licenses (10-50 users)
3. Provide pilot user training
4. Collect feedback (surveys, interviews)
5. Adjust policies based on learnings
6. Expand to department (100-500 users)
7. Monitor adoption and iterate
8. Plan organization-wide rollout

## AB-900 Exam Focus Areas

### Domain 3: Copilot and Agent Administration (25-30%)

**Critical Topics:**

Domain 3 has exactly three subsections: "Understand features and capabilities of Copilot and agents", "Perform basic administrative tasks for Copilot", and "Perform basic administrative tasks for agents". The July 22, 2026 change log lists **no** changes for Domain 3.

- [ ] **Compare built-in capabilities of Copilot and agents**

- [ ] **Compare the Copilot monthly license model to pay-as-you-go, including SharePoint**
  - The objective explicitly adds "including SharePoint", so cover SharePoint agent pay-as-you-go specifically, not just generic Copilot PAYG
  - Per-user add-on at 30.00 USD per user per month versus 0.01 USD per Copilot Credit
  - No seat minimum; 300-seat maximum on the SMB SKUs
  - Microsoft 365 E7 includes Copilot in the base SKU
  - 24-hour activation delay after assignment

- [ ] **Identify which Copilot features can be enabled or disabled**
  - The **Allow web search in Copilot** tenant toggle
  - Agent settings: allowed agent types, sharing, user access
  - Copilot Frontier enrollment

- [ ] **Identify use cases for Researcher**
  - Deep multi-step research combining Microsoft Graph work data, Copilot connectors, and the Bing web index
  - Microsoft-installed and pre-pinned for licensed users; 25 queries per user per month
  - Adheres to the tenant web search toggle

- [ ] **Identify use cases for Analyst**
  - Advanced data analysis using chain-of-thought reasoning
  - Better suited than Researcher for Microsoft Excel tasks

- [ ] **Identify use cases for custom agents**
  - Declarative agents versus custom engine agents

- [ ] **Assign Copilot licenses**
  - Individual, group-based, and PowerShell via the Microsoft Graph SDK

- [ ] **Monitor and manage Copilot pay-as-you-go billing policies**
  - Path: admin.microsoft.com > **Copilot** > **Billing & usage**
  - Budgets notify only; they do **NOT** enforce a spending cap
  - 50 policies per tenant

- [ ] **Monitor Copilot usage and adoption, including Copilot Analytics and the admin center**
  - The four reporting sources and which answers which question
  - Purview audit data is **NOT** the basis for usage reporting

- [ ] **Manage prompts, including saving, sharing, scheduling, and deleting**

**Key Concepts to Master:**

1. **Copilot Architecture**
   - LLM + Microsoft Graph + Semantic Index + Data
   - Real-time orchestration
   - Permission-based data access

2. **Deployment Phases**
   - Readiness, then Pilot, then Phased, then Organization-wide

3. **Licensing Requirements**
   - Base license (M365 E3/E5 or Business)
   - + Copilot add-on
   - + OneDrive provisioned

4. **Admin Centers**
   - M365 Admin: License assignment, Copilot settings
   - Purview: Security and compliance
   - SharePoint Admin: Content governance
   - Viva Insights: Usage dashboard

5. **Security Model**
   - Copilot = User permissions (no elevation)
   - Respects labels and DLP
   - No training on your data
   - Tenant isolation

## Prompt Engineering Best Practices

### Effective Prompt Principles
1. **Be Specific:** Provide clear, detailed requests
2. **Give Context:** Include background information
3. **Set Expectations:** Specify format, length, tone
4. **Iterate:** Refine based on results
5. **Break Down:** Split complex tasks into steps

### Prompt Examples by App

**Word:**
- "Create a 2-page proposal for remote work expansion including benefits, challenges, and implementation timeline"
- "Summarize this 10-page document in bullet points, focusing on action items"
- "Rewrite this section in a more formal tone suitable for executives"

**Excel:**
- "Analyze Q4 sales data and identify top 5 performing products"
- "Create a pivot table showing revenue by region and product category"
- "Explain what this VLOOKUP formula does and suggest improvements"

**PowerPoint:**
- "Create a 10-slide presentation about our Q1 results using a professional theme"
- "Add relevant images to slides about sustainability initiatives"
- "Summarize this Word document into a 5-slide presentation"

**Outlook:**
- "Draft a polite response declining the meeting due to scheduling conflict"
- "Summarize this email thread and identify action items assigned to me"
- "Prepare me for tomorrow's budget meeting by summarizing relevant emails"

**Teams:**
- "Summarize key decisions from today's project meeting"
- "What were the action items assigned to me this week?"
- "Create a recap of yesterday's standup meeting"

**Microsoft 365 Copilot Chat:**
- "What are the latest updates on Project Phoenix across all my emails and Teams chats?"
- "Create a status report on customer requests from the past week"
- "Find all documents related to the Q4 budget review"

## Copilot Readiness Checklist

### Technical Prerequisites
- [ ] Base licenses assigned (M365 E3/E5 or Business Standard/Premium)
- [ ] Copilot licenses acquired
- [ ] Users have OneDrive provisioned
- [ ] Microsoft 365 apps updated to Current or Monthly Enterprise Channel
- [ ] Browser compatibility verified
- [ ] Network requirements validated

### Security and Compliance
- [ ] Data governance policies in place
- [ ] DLP policies configured
- [ ] Sensitivity labels deployed
- [ ] Audit logging enabled
- [ ] MFA enabled for all users
- [ ] Conditional access policies reviewed
- [ ] Security baseline established

### Deployment Planning
- [ ] Pilot users identified
- [ ] Success metrics defined
- [ ] Training materials prepared
- [ ] Communication plan ready
- [ ] Support process established
- [ ] Feedback mechanism created
- [ ] Timeline developed

### Post-Deployment
- [ ] Monitor Copilot Dashboard regularly
- [ ] Collect user feedback
- [ ] Track adoption metrics
- [ ] Measure impact and ROI
- [ ] Iterate on policies and training
- [ ] Expand to additional users
- [ ] Share best practices

## Tools and Portals

| Tool | URL | Purpose |
|------|-----|---------|
| M365 Admin Center | https://admin.microsoft.com/ | License assignment, settings |
| Copilot Dashboard | admin.microsoft.com/Adminportal/Home#/copilot | Usage analytics |
| Microsoft 365 Copilot Chat | https://m365.cloud.microsoft/chat | Cross-app Copilot |
| Cloud Policy | https://config.office.com/ | Policy management |
| Viva Insights | insights.viva.office.com | Adoption metrics |
| Adoption Resources | https://adoption.microsoft.com/copilot/ | Training materials |

## Additional Resources

### Community
- **Microsoft 365 Copilot Tech Community**
  - https://techcommunity.microsoft.com/t5/microsoft-365-copilot/bd-p/Microsoft365Copilot
  - Forums, discussions, announcements

- **Microsoft 365 Community (PnP)**
  - https://aka.ms/m365pnp
  - Community resources and samples

### Blogs
- **Microsoft 365 Blog - Copilot**
  - https://techcommunity.microsoft.com/t5/microsoft-365-blog/bg-p/microsoft_365blog
  - Product updates and best practices

### Videos
- **Microsoft Mechanics**
  - https://www.youtube.com/c/MicrosoftMechanics
  - Technical demos and deep dives

---

**Related Segments:**
- [Segment 1: Core M365 Services](../../segment-01-core-m365-services/)
- [Segment 2: Data Protection and Governance](../../segment-02-data-protection-governance/)
- [Segment 4: Agents and Exam Prep](../../segment-04-agents-exam-prep/)
