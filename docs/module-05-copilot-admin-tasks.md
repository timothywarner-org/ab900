# Module 5: Perform Basic Administrative Tasks for Microsoft 365 Copilot

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/perform-admin-tasks-microsoft-365-copilot/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)

---

## Unit 1: Manage Copilot Licenses and Pay-as-You-Go Billing

### Assigning Licenses to Individual Users
- Portal path: **admin.microsoft.com > Users > Active users > [select user] > Licenses and apps > Microsoft 365 Copilot > Save changes**
- Best for small orgs or pilot testing
- Precise control but does not scale well

### Assigning Licenses Through Groups
- Portal path: **admin.microsoft.com > Groups > Active groups > [select group] > Licenses > Assign licenses > Microsoft 365 Copilot > Save**
- Recommended for medium-to-large organizations
- Auto-inherits license for all group members
- Requires group maintenance in Microsoft Entra ID
- Implement periodic group audits or automated provisioning

### Enabling Pay-as-You-Go Billing (Two-Step Process)

**Step 1 -- Create a Billing Policy:**
- Portal path: **admin.microsoft.com > Copilot > Billing & usage > Billing policies tab > +Add a billing policy**
- Requires: Global Administrator, Billing Administrator, or AI Administrator
- Must have Azure subscription and resource group with owner or contributor permissions
- Configure: policy name, Azure subscription and resource group and region, user scope (all users or specific group), budget limit, reset period, alert thresholds, alert recipients
- Up to 10 policies per tenant
- This step alone does NOT enable Copilot -- it only creates the billing arrangement

**Step 2 -- Connect Billing Policy to a Copilot Service:**
- Portal path: **admin.microsoft.com > Copilot > Billing & usage > Pay-as-you-go services tab**
- Select the Copilot service (e.g., Microsoft 365 Copilot Chat or SharePoint agents)
- Assign the billing policy created in Step 1
- Can assign multiple policies to one service
- **If this step is skipped, pay-as-you-go remains disabled**

---

## Unit 2: Monitor and Adjust Pay-as-You-Go Copilot Usage

### Billing Dashboards

**Microsoft 365 Admin Center Dashboards:**
- **Billing > Bills & payments:** current and past invoices
- **Billing > Licenses:** active Copilot licenses, assigned vs. available
- **Users > Active users:** filter for Copilot-enabled users
- **Settings > Org settings > Reports:** enable email usage updates

**Microsoft Cost Management Dashboards (Azure portal):**
- **Cost Management + Billing > Cost analysis:** detailed Copilot charges
- **Budgets > + Add:** create budget for Copilot costs with alert thresholds
- Filter by Service name = "Microsoft 365 Copilot (PAYG)"
- Time granularity: Daily (spot spikes) or Monthly (track trends)
- Group by: Resource, Resource group, Tag, or User principal name
- Export to CSV or Excel or Power BI for deeper analysis

### Usage Monitoring Best Practices
- **Weekly:** quick check in M365 admin center
- **Monthly:** deep dive using Azure Cost Management
- Watch for patterns: quarterly spikes (Finance), daily consistency (Operations), unexpected jumps (misconfig)
- If a group shows consistent daily usage, consider switching to permanent licenses

---

## Unit 3: Monitor Microsoft 365 Copilot Usage and Adoption

### Tracking User Adoption
- Two basic counters: **Enabled** (has license) vs. **Active** (used Copilot in reporting period)
- Low active-rate suggests rollout or communication gap, permissions issue, or applicability mismatch
- Portal path: **Reports > Usage > Microsoft 365 Copilot > Usage tab**
- Export user-level details to CSV for filtering and joins
- Data has 24-48 hour ingestion delay; small groups may be anonymized for privacy
- Use Microsoft Graph reporting APIs for programmatic extraction and longer retention

### Copilot Analytics (Deeper Analysis)
- **Viva Insights Copilot Dashboard:** feature-level and impact signals (meeting summaries generated, email threads summarized, time saved)
- Access: https://insights.cloud.microsoft/ > Copilot Dashboard
- Privacy controls: Settings > Microsoft Viva > Microsoft Viva Insights > Manage minimum group size and Exclusion list
- Prebuilt Power BI templates: Copilot adoption, Copilot impact, Copilot Studio agents
- Service-specific analytics: enable in Copilot Service admin center (Dynamics 365) under Insights > Manage > Enable Copilot analytics

### Adoption Trends and Patterns
- Track: Adoption funnels (Enabled > Tried > Frequent user), Feature diffusion, Seasonality
- Watch for outliers (automated processes, departments without licenses showing usage)
- Agree on single "source of truth" metric (e.g., weekly active users who submitted at least 1 prompt)

### Strategies to Drive Adoption
- **Technical:** group-based licensing, pin Copilot Chat in Teams, targeted training, build simple Copilot Studio agents, reduce friction
- **Cultural:** leaders modeling use, share concrete success stories, visible adoption dashboards

### Reporting Tools Summary

| Tool | Best For |
|------|----------|
| M365 admin center (Reports > Usage) | Quick triage -- licenses, last activity, simple exports |
| Viva Insights (Copilot Dashboard) | Impact analysis -- time saved, meeting reduction |
| Service-specific analytics | Per-app zoom (Word, Excel, Teams) |
| Microsoft Graph Reports API | Automation, custom analysis, longer retention |
| Power BI templates, OData, CSV exports | Custom branded dashboards for leadership |

---

## Unit 4: Manage and Govern Microsoft 365 Copilot Prompts

### Prompt Management Levels
- **Admin level:** admin.microsoft.com > Settings > Copilot (tenant-wide settings, feature availability, data access, compliance)
- **User level:** in-app Copilot side panel (Word, Excel, Teams) -- create, save, organize personal prompts

### Core Prompt Tasks

**Saving:**
- Save Prompt option at bottom of Copilot panel; provide name and description
- Use clear naming convention (e.g., "Finance -- Monthly Summary Report")

**Sharing:**
- Settings > Copilot > Prompts > select prompt > Share
- Assign to groups or users; restrict to trusted groups

**Scheduling:**
- Copilot Scheduler (under prompt menu in supported apps)
- Define frequency and timing; monitor in admin center

**Deleting:**
- Prompt Library > select prompt > Delete
- Review quarterly; archive unused prompts

### Prompt Standardization
- Consistent naming conventions with department and purpose prefixes
- Document prompt usage with detailed descriptions (required input, expected output)
- Leverage prompt templates as baselines for teams to customize

### Prompt Governance and Security
- Control sharing permissions: Settings > Copilot > Prompt Policies -- restrict to specific roles or groups
- Audit prompt usage: Reports > Copilot Usage -- filter for prompts; identify rarely used or heavily used prompts
- Protect sensitive data: train users NOT to embed sensitive info in prompts; reference secure data sources instead

---

## Unit 5: Apply Operational Best Practices

### Admin Roles and Permissions
- Do NOT rely on Global Administrator -- adopt principle of least privilege
- Key roles:
  - **Helpdesk Administrator:** password resets only
  - **License Administrator:** assign and remove licenses without broader tenant access
  - **Compliance Administrator:** view usage data, run reports, review compliance alerts
  - **User Administrator:** create and manage user accounts without touching security policies
- Assign roles: admin.microsoft.com > Users > Active users > [select user] > Manage roles
- Bulk assignments: Entra admin center > Roles and administrators > [select role] > Add assignments

### License Assignment Best Practices
- Integrate license assignment into standard account creation process
- Use group-based licensing in Entra ID (auto-assign when added to department group, auto-remove on departure)
- Group-based licensing: Entra admin center > Groups > All groups > [select group] > Licenses > Assignments
- Send welcome email explaining where Copilot appears and what it can do

### Troubleshooting Common Issues

**Copilot not appearing:**
- Check license assignment: admin.microsoft.com > Users > Active users > [select user] > Licenses and apps
- Confirm app version: File > Account > Product Information (must be M365 Apps for Enterprise); Update Options > Update Now
- Check service health: admin.microsoft.com > Health > Service health -- review active advisories or incidents for Copilot
- Check network: ensure endpoints required for Copilot are accessible

### Communicating Changes to End Users
- **Email announcements:** include screenshots with Copilot button highlighted; include FAQ; send before rollout date
- **Training sessions:** 30-minute Teams meetings with live demos; record and publish; tailor to department needs
- **Support documentation:** SharePoint page or internal wiki with step-by-step instructions and troubleshooting advice
