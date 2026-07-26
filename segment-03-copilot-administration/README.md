# Segment 3: Copilot Features and Administration

**Duration:** 50 minutes

**Maps to AB-900 Domain 3: Perform basic administrative tasks for Copilot and agents (25-30%)**

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Learning Objectives

By the end of this segment, you will be able to:

- Understand Microsoft 365 Copilot architecture and capabilities
- Plan and execute Copilot deployment
- Configure Copilot settings and policies
- Manage user access and permissions
- Monitor Copilot usage and adoption
- Troubleshoot common Copilot issues
- Optimize Copilot for your organization

## Topics Covered

### 1. Copilot Architecture and Capabilities (10 minutes)

#### Architecture Components
- Foundation models from multiple providers, including OpenAI and Anthropic
- **Work IQ**, the intelligence layer that personalizes Copilot for users and organizations. Work IQ is an **umbrella** over three layers named data, context, and skills/tools. Microsoft Graph tenant data and Copilot connectors sit inside the **data** layer, and the **semantic index** sits inside the **context** layer. Work IQ is **NOT** a sibling component alongside Microsoft Graph.
- **Semantic index**, still current under that name, described as a superset of content within Microsoft Graph plus content ingested from Copilot connectors, mapped into a lexical and semantic index that respects permission structures
- **Microsoft 365 Copilot connectors**, formerly Microsoft Graph connectors. Two models exist: **synced** connectors that ingest and index content into Microsoft Graph and support semantic indexing, and **federated** connectors that retrieve content in real time over Model Context Protocol with no data movement and **NO** semantic indexing.
- Data grounding, retrieval, and real-time orchestration

#### Copilot Experiences
- **Copilot in Word** - Drafting, editing, summarizing
- **Copilot in Excel** - Data analysis, formula generation, insights. Note the rename: what was "Agent Mode" in Excel is now **Edit with Copilot in Excel**.
- **Copilot in PowerPoint** - Presentation creation, design suggestions
- **Copilot in Outlook** - Email drafting, meeting summaries
- **Copilot in Teams** - Meeting recaps, chat assistance, call summaries
- **Microsoft 365 Copilot Chat** - Cross-app AI assistant. Use this name, not "Business Chat".
- **Copilot in Loop** - Collaborative workspace assistance
- **Researcher** and **Analyst** - Microsoft-installed advanced agents that a Copilot license unlocks. Generally available since June 2, 2025.

### 2. Licensing and Prerequisites (8 minutes)

Full detail lives in `resources/COPILOT-LICENSING-GUIDE.md`. The headlines:

#### License Requirements
- **Microsoft 365 Copilot** is a per-user **add-on** at 30.00 USD per user per month paid yearly, requiring an eligible base subscription: Microsoft 365 E7/E5/E3/F1/F3, Business Basic/Standard/Premium, Office 365 E5/E3/E1/F3, and several standalone Teams, Exchange, SharePoint, and OneDrive plans
- **There is NO seat minimum.** The original 300-seat minimum was removed in January 2024. The only surviving 300 is a **maximum** on the SMB SKUs.
- **Microsoft 365 Copilot Business** is a separate SMB add-on capped at **300 seats**, requiring a Microsoft 365 Business plan, sold annual-commitment only
- **Microsoft 365 E7** (the Frontier Suite, generally available May 1, 2026) **includes** Microsoft 365 Copilot in the base SKU, alongside Microsoft Entra Suite and Agent 365. E7 customers do **NOT** buy the add-on separately.
- **Microsoft 365 Copilot Chat** is included at no additional cost with an eligible subscription. Web-based chat is free; **work-based chat grounded in tenant data requires a Copilot license.**
- License assignment methods: individual, group-based, and PowerShell via the Microsoft Graph SDK
- Allow up to 24 hours after assignment for features to appear

#### Technical Prerequisites
- Supported Microsoft 365 apps versions
- OneDrive account provisioning
- Outlook new experience
- Teams new client
- Browser requirements

#### Data Prerequisites
- Minimum data in Microsoft Graph
- SharePoint and OneDrive content
- Email and calendar history
- Teams chat and meeting data

### 3. Deployment Planning and Rollout (12 minutes)

#### Deployment Phases
1. **Readiness Assessment**
   - Technical readiness
   - Data quality and availability
   - Security and compliance posture
   - Network capacity

2. **Pilot Program**
   - Selecting pilot users
   - Defining success metrics
   - Gathering feedback
   - Adjusting policies

3. **Phased Rollout**
   - Department-by-department deployment
   - Role-based rollout
   - Usage monitoring
   - Support preparation

4. **Organization-Wide Deployment**
   - License assignment at scale
   - Change management
   - Training and enablement
   - Ongoing optimization

#### Deployment Best Practices
- Start with power users and early adopters
- Ensure data governance is in place
- Provide comprehensive training
- Set up feedback mechanisms
- Monitor usage and adjust

### 4. Managing Copilot Settings and Policies (10 minutes)

#### Admin Controls
- **Web search in Copilot** - the tenant-level **Allow web search in Copilot** toggle. This matters beyond the obvious: Researcher adheres to it, and if web search is off at the tenant level Researcher uses no web data at all.
- **Agent settings** - admin.microsoft.com > **Agents** > **Settings**, containing five areas: Agent management rules, Allowed agent types, Security templates, Sharing, and User access
- **Copilot pay-as-you-go billing** - admin.microsoft.com > **Copilot** > **Billing & usage**
- **Data access settings** - Copilot > **Settings** > **Data access**
- **Copilot Frontier** enrollment - Copilot > **Settings** > **View all** > **Copilot Frontier**, with three options: No access (the default), All users, and Specific users

#### Policy Configuration
- **Cloud Policy service for Microsoft 365** (renamed from Office cloud policy service)
- Group Policy for domain-joined devices
- Intune policies for mobile devices
- Conditional Access policies

#### Release channels
Microsoft documents a three-tier audience-based release model. Knowing the names is worth a question:

| Channel | Behavior |
|---------|----------|
| **Frontier** | Opt-in early access to pre-GA capabilities, under preview terms. Requires a Microsoft 365 Copilot license. Frontier agents appear in the Agent Store tagged **(Frontier)** under "Built by Microsoft". Allow up to three hours for availability. |
| **Standard release** | The default |
| **Deferred release** | Delays deferred-capable GA features up to 30 days |

Modern standard and deferred release channels are **NOT** available for GCC, GCC High, and DoD. Note also that the Frontier control does **NOT** override agent settings: an agent turned off in the Agents view stays unavailable regardless of Frontier enrollment.

#### Feature Controls
- Disabling specific Copilot features
- App-specific settings
- User-level vs. tenant-level controls

### 5. User Enablement and Adoption (5 minutes)

- Adoption resources and materials
- Training programs and workshops
- Champions program
- Success metrics and KPIs
- Feedback collection and iteration

### 6. Usage Analytics and Reporting (3 minutes)

There are **four** distinct reporting sources, and exam items often turn on picking the right one:

| Source | What it gives you | Where |
|--------|-------------------|-------|
| Microsoft 365 admin center | Readiness and usage numbers | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** |
| Viva Insights Copilot Analytics | Adoption, impact (assisted hours), sentiment | Viva Insights app > **Copilot Dashboard** |
| Microsoft Purview audit logs | Compliance and security auditing | purview.microsoft.com > **Audit** |
| Power Platform and Copilot Studio Analytics | Agent consumption and performance | Power Platform admin center |

Within the admin center report, three views matter: **Usage**, **Credits**, and **Agents**. Data is typically available within 48 hours of the end of a day in UTC.

**Copilot Analytics** is the umbrella term covering six areas: the readiness and adoption report in the admin center, the Copilot Dashboard in Viva Insights, the Agent Dashboard in Viva Insights, the Consumption Dashboard, ready-to-use Copilot Analytics reports, and Advanced Reporting through Viva Insights and Power BI.

**Path correction worth stating.** The Copilot Dashboard is in the **Viva Insights** app, in Microsoft Teams or the Viva Insights web app, **NOT** the admin center. An AI Administrator first enables it and delegates access from the Microsoft 365 admin center.

**Role mapping.** AI Administrator accesses Copilot reports in the admin center and enables/delegates the Copilot Dashboard. Global Administrator assigns the Insights Analyst and Insights Administrator roles. Audit Reader searches Purview audit logs. Copilot Studio Author accesses per-agent analytics.

**Exam trap.** Microsoft explicitly warns that Purview audit log data is **NOT** intended as the basis for Copilot usage reporting, and aggregated metrics built on it may not match the official reports.

### 7. Troubleshooting Common Issues (2 minutes)

- Copilot not appearing in apps
- License assignment delays
- Feature availability issues
- Performance problems
- Data grounding issues

## Hands-On Labs

### Lab 3.1: Verify Copilot Prerequisites
**Objective:** Ensure environment meets Copilot requirements

**Steps:**
1. Check Microsoft 365 app versions
2. Verify base license assignments
3. Confirm OneDrive provisioning
4. Check network connectivity requirements
5. Review security and compliance settings

### Lab 3.2: Assign Copilot Licenses
**Objective:** Deploy Copilot licenses to pilot users

**Steps:**
1. Access Microsoft 365 admin center
2. Navigate to license management
3. Assign Copilot licenses to test users
4. Verify license assignment in user properties
5. Monitor license activation (may take up to 24 hours)

### Lab 3.3: Configure Copilot Policies
**Objective:** Set up administrative policies for Copilot

**Steps:**
1. Access Cloud Policy management
2. Create policy configuration for Copilot
3. Configure web search settings
4. Set plugin permissions
5. Apply policy to security groups
6. Verify policy application

### Lab 3.4: Test Copilot Experiences
**Objective:** Validate Copilot functionality across Microsoft 365 apps

**Steps:**
1. Test Copilot in Word (draft a document)
2. Test Copilot in Excel (analyze data, create formulas)
3. Test Copilot in PowerPoint (create presentation)
4. Test Copilot in Outlook (compose email, summarize thread)
5. Test Copilot in Teams (meeting recap, chat summary)
6. Test Microsoft 365 Copilot Chat (cross-app query)

### Lab 3.5: Monitor Copilot Usage
**Objective:** Access and interpret Copilot analytics

**Steps:**
1. In the Microsoft 365 admin center go to **Reports** > **Usage** > **Microsoft 365 Copilot**, then the **Usage** tab
2. Switch to the **Credits** view to see credit consumption per user, per agent, and per billing policy
3. Switch to the **Agents** view for agent usage
4. Open the **Copilot Dashboard** in the Viva Insights app for adoption, impact, and sentiment metrics
5. Export usage data for reporting

Note the Credits report alerts administrators when a user exceeds 2,000 credits, and during preview it displays a maximum of 30 days of history.

### Lab 3.6: Troubleshoot Copilot Issues
**Objective:** Diagnose and resolve common problems

**Steps:**
1. Simulate common issues (license delay, app version)
2. Check service health for Copilot
3. Review user settings and permissions
4. Clear app cache if needed
5. Verify network connectivity
6. Document resolution steps

## Demonstrations

### Demo 1: Copilot Across Microsoft 365
- Live demonstration of Copilot in action across all apps
- Real-world productivity scenarios
- Best practices for effective prompts
- Understanding AI-generated content

### Demo 2: Administrative Configuration
- Walkthrough of admin center settings
- Policy configuration demonstration
- License management at scale
- Plugin governance

### Demo 3: Adoption Dashboard
- Navigating usage analytics
- Interpreting metrics
- Creating adoption reports
- Identifying improvement opportunities

### Demo 4: Advanced Scenarios
- Copilot with Power Platform integration
- Custom plugins and extensibility
- Copilot Studio basics
- API and developer scenarios

## Key Takeaways

1. **Copilot is Intelligent** - Uses AI to understand context and provide relevant assistance
2. **Prerequisites Matter** - Ensure proper licensing and data availability
3. **Phased Rollout Works Best** - Start small, learn, and scale
4. **Governance is Essential** - Configure policies before broad deployment
5. **Training Drives Adoption** - Users need to learn effective prompt engineering
6. **Monitor and Optimize** - Use analytics to improve adoption and ROI
7. **Stay Updated** - Copilot features evolve rapidly

## Effective Prompt Engineering Tips

### For Users
- Be specific and provide context
- Break complex requests into steps
- Iterate and refine prompts
- Specify desired format/length
- Use natural language

### Examples of Good Prompts

**Word:**
- "Create a 2-page proposal for expanding our remote work policy, including benefits, challenges, and implementation timeline"
- "Summarize this 10-page document in bullet points, focusing on action items"

**Excel:**
- "Analyze sales data for Q4 and identify the top 5 performing products"
- "Create a pivot table showing revenue by region and product category"

**PowerPoint:**
- "Create a 10-slide presentation about our Q1 results, using a professional theme"
- "Add relevant images to slides about sustainability"

**Outlook:**
- "Draft a polite response declining the meeting request due to scheduling conflict"
- "Summarize this email thread and identify action items"

**Teams:**
- "Summarize key decisions from today's project meeting"
- "What were the action items assigned to me this week?"

**Microsoft 365 Copilot Chat:**
- "What are the latest updates on Project Phoenix across all my emails and Teams chats?"
- "Create a status report on customer requests from the past week"

## Copilot Readiness Checklist

- [ ] Base licenses assigned (M365 E3/E5 or Business)
- [ ] Copilot licenses acquired
- [ ] Users have OneDrive provisioned
- [ ] Microsoft 365 apps are updated
- [ ] Data governance policies in place
- [ ] DLP and sensitivity labels configured
- [ ] Security and compliance reviewed
- [ ] Network requirements verified
- [ ] Pilot users identified
- [ ] Training materials prepared
- [ ] Support process established
- [ ] Success metrics defined
- [ ] Feedback mechanism created
- [ ] Communication plan ready

## Additional Resources

### Documentation
- [Microsoft 365 Copilot documentation](https://learn.microsoft.com/microsoft-365/copilot/)
- [Microsoft 365 Copilot licensing](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing)
- [Set up pay-as-you-go for Copilot](https://learn.microsoft.com/microsoft-365/commerce/services/pay-as-you-go-setup-copilot)
- [Copilot reports for admins](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-reports-for-admins)
- [Copilot Control System overview](https://learn.microsoft.com/microsoft-365/copilot/copilot-control-system/overview)
- [Work IQ](https://learn.microsoft.com/microsoft-365/copilot/extensibility/work-iq)
- [Copilot Adoption Resources](https://adoption.microsoft.com/copilot/)

### Tools and paths

| Destination | Path |
|-------------|------|
| Microsoft 365 admin center | https://admin.microsoft.com/ |
| Copilot billing and usage | admin.microsoft.com > **Copilot** > **Billing & usage** |
| Copilot usage, credits, and agent reports | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** |
| Agent management | admin.microsoft.com > **Agents** > **All agents** |
| Copilot Dashboard | Viva Insights app > **Copilot Dashboard** |
| Cloud Policy service for Microsoft 365 | https://config.office.com/ |
| Microsoft 365 Copilot Chat | https://m365.cloud.microsoft/chat |

### Community
- [Microsoft 365 Community](https://aka.ms/m365pnp)
- [Copilot Technical Community](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/bd-p/Microsoft365Copilot)
- [Copilot Adoption Blog](https://techcommunity.microsoft.com/t5/microsoft-365-blog/bg-p/microsoft_365blog)

### Training
- [Copilot Learning Path](https://learn.microsoft.com/training/paths/copilot/)
- [Effective Prompts Guide](https://support.microsoft.com/copilot)
- [Admin Training](https://learn.microsoft.com/training/modules/microsoft-365-copilot-admin/)

## Q&A Notes

Use this section to capture questions and answers from the live session:

---

## Next Steps

Proceed to [Segment 4: Agent Administration and Exam Success](../segment-04-agents-exam-prep/) to explore AI Agents and prepare for certification.
