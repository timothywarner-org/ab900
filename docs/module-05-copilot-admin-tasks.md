# Module 5: Perform Basic Administrative Tasks for Microsoft 365 Copilot

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/perform-admin-tasks-microsoft-365-copilot/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)
**Verified:** 2026-07-26 (against the AB-900 skills measured as of July 22, 2026)

> **Objective mapping.** This module supports the Domain 3 subsection "Perform basic administrative tasks for Copilot": assign Copilot licenses; monitor and manage Copilot pay-as-you-go billing policies; monitor Copilot usage and adoption including **Copilot Analytics** and the Microsoft 365 admin center; and manage prompts including saving, sharing, scheduling, and deleting. Domain 3 has **no rows in the July 22, 2026 change log**.

---

## Unit 1: Manage Copilot Licenses and Pay-as-You-Go Billing

### Assigning Licenses to Individual Users
- Portal path: **admin.microsoft.com > Users > Active users > [select user] > Licenses and apps > Microsoft 365 Copilot > Save changes**
- Alternate path from the product side: **admin.microsoft.com > Billing > Licenses > Microsoft 365 Copilot**, then assign on the product details page
- Best for small orgs or pilot testing
- Precise control but does not scale well
- **After assignment, users might need to wait up to 24 hours for Copilot to appear in some apps**, and might also need to restart or refresh the app. Files must be editable, not read-only.
- **Not supported:** assigning Copilot licenses to cross-tenant users, including guests
- **Education tenants:** the Copilot license is listed under **Microsoft 365 A3 Extra Features for faculty** or **Microsoft 365 A5 Extra Features for faculty**
- **Update channel prerequisite:** Copilot is available in all Microsoft 365 Apps update channels **EXCEPT** Semi-Annual Enterprise Channel. Use Current Channel or Monthly Enterprise Channel.

### Assigning Licenses Through Groups
- Portal path: **admin.microsoft.com > Groups > Active groups > [select group] > Licenses > Assign licenses > Microsoft 365 Copilot > Save**
- Recommended for medium-to-large organizations
- Auto-inherits license for all group members
- Requires group maintenance in Microsoft Entra ID
- Implement periodic group audits or automated provisioning

### Enabling Pay-as-You-Go Billing (Two-Step Process)

> **The admin path in these materials is CORRECT and stays: admin.microsoft.com > Copilot > Billing & usage.** The **Billing policies** tab holds the policies; the **Pay-as-you-go services** tab connects them to services. The warning against **Billing > Pay-as-you-go** for Copilot is also correct -- that Billing-node page covers Microsoft 365 Backup, Microsoft 365 SharePoint Storage, and High Volume Email, and only surfaces a "Go to Copilot Billing & usage" redirect link for Copilot services. Microsoft states explicitly: "Manage Copilot services in Copilot > Billing & usage."

**Prerequisites (all required):**
- **Billing Administrator, AI Administrator, or Global Administrator** role
- An **Azure subscription in the same tenant** as Microsoft 365
- An **Azure resource group** in that subscription
- **Owner or Contributor** rights to **both** the subscription and the resource group
- The tenant must have **at least one SharePoint license**, or a license that includes SharePoint

**The full setup sequence is four steps inside the wizard:** (1) create a billing policy and add billing details (name, Azure subscription, resource group, region, accept terms of service); (2) choose users (**All users** or a **Specific group**); (3) set an optional budget; (4) review and select **Create policy**.

**Step 1 -- Create a Billing Policy:**
- Portal path: **admin.microsoft.com > Copilot > Billing & usage > Billing policies tab > +Add a billing policy**
- Configure: policy name, Azure subscription, resource group, region, user scope, budget limit, alert thresholds, alert recipients
- **A tenant can create up to 50 pay-as-you-go billing policies.** (The separate 10-policy limit applies to **SharePoint agent** billing policies and to **Copilot credit policies**. Do not conflate the three numbers.)
- Selecting specific users rather than All users applies **only** to Microsoft 365 Copilot pay-as-you-go services; for all other services the All users option is applied automatically
- This step alone does **NOT** enable Copilot -- it only creates the billing arrangement

**Step 2 -- Connect Billing Policy to a Copilot Service:**
- Portal path: **admin.microsoft.com > Copilot > Billing & usage > Pay-as-you-go services tab**
- Select the Copilot service and assign the billing policy created in Step 1
- **If this step is skipped, pay-as-you-go remains disabled**

**Second navigation route to the same destination:** Microsoft 365 admin center > **Copilot > Settings > User access > Copilot pay-as-you-go billing**, which opens the Copilot Billing & usage page. Switch to the **Pay-as-you-go services** tab and select Microsoft 365 Copilot Chat.

**Three services are available for Microsoft 365 Copilot pay-as-you-go billing:** Microsoft 365 Copilot Chat, SharePoint agents, and the **Microsoft Copilot Retrieval API** (in preview).

> **EXAM TRAP: a budget does NOT enforce a spending cap.** Microsoft states that the system does **NOT** enforce the budget or prevent the organization from exceeding it, and that usage can continue uninterrupted even after the budget is surpassed. A budget triggers **email notifications only**. The default alert threshold is **100%**, and alerts can take up to **24 hours** to arrive.

**Retrieval API billing differs.** The Microsoft Copilot Retrieval API pay-as-you-go preview is billed **per API call**, not per credit: the meter is "Pay as you go Copilot Credit" under meter category "Microsoft Copilot Studio" with feature tag `m365copilotretrievalapi`, priced at **$0.10 per API call**. It requires at least one Microsoft 365 Copilot license in the tenant.

**Billing has bifurcated -- know what this path does NOT cover.** **Copilot Cowork** and the **Work IQ API** are **NOT** managed through the Copilot node pay-as-you-go flow. They use a separate **Cost Management dashboard** in the Microsoft admin center with **Overview** and **Consumption** tabs, supporting prepaid credits, pay-as-you-go, or existing capacity.

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
- **The meter name on the Azure invoice is still "Copilot Studio."** Microsoft states charges for SharePoint agent usage "appear under the Copilot Studio meter in your invoice", while Microsoft Cost Management shows a detailed breakdown by feature. Filter on the Copilot Studio meter category, not on a "Microsoft 365 Copilot (PAYG)" service name.
- Time granularity: Daily (spot spikes) or Monthly (track trends)
- Group by: Resource, Resource group, Tag, or User principal name
- Export to CSV or Excel or Power BI for deeper analysis

**Copilot Credits report (Microsoft 365 admin center):**
- Path: **Reports > Usage > under Reports select Microsoft 365 Copilot > Credits**
- Shows total credits used, cumulative and daily time series, and credits used **per user, per agent, per billing policy, and per agent-user pair**
- **Alerts administrators when a user exceeds 2,000 credits**
- **Preview limits:** displays a maximum of **30 days** of history, has **no data before May 3, 2025**, and can be filtered to the last **7 or 30 days only**

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
- **Exact portal path:** **admin.microsoft.com > Reports** (select **Show all** if not visible) **> Usage > under Reports select Microsoft 365 Copilot > Copilot**, then select the **Usage** tab. The **Readiness** tab is the first tab on the same report.
- Export user-level details to CSV for filtering and joins
- **Data is typically available within 48 hours of the end of a day in UTC.** The readiness report is available within 72 hours, and once available its usage data can have up to 72 hours of latency. Small groups may be anonymized for privacy.
- Use Microsoft Graph reporting APIs for programmatic extraction and longer retention

> **EXAM TRAP.** Microsoft explicitly warns that **Purview audit log data is NOT intended as the basis for Copilot usage reporting**, and aggregated metrics built on it may not match the official Copilot usage reports. Use the Microsoft 365 Copilot usage report or the Copilot Dashboard instead.

### Copilot Analytics (Deeper Analysis)

**Copilot Analytics is the umbrella term** and encompasses six areas: the readiness and adoption report in the Microsoft 365 admin center, the **Microsoft Copilot Dashboard** in Viva Insights, the **Agent Dashboard** in Viva Insights, the **Consumption Dashboard**, **ready-to-use Copilot Analytics reports**, and **Advanced Reporting** through Viva Insights and Power BI.

**Copilot Dashboard -- correct access path:**
- The Copilot Dashboard is reached in the **Viva Insights app**, not by an admin-center URL. Open **Viva Insights** (in Microsoft Teams or the Viva Insights web app) and select **Copilot Dashboard**.
- An **AI Administrator** first **enables** it and **delegates access** from the Microsoft 365 admin center.
- Feature-level and impact signals: adoption metrics, usage patterns, productivity impact, ROI indicators, actionable insights
- Privacy controls: Settings > Microsoft Viva > Microsoft Viva Insights -- manage minimum group size and exclusion list
- **Ready-to-use Copilot Analytics reports** are found in the Viva Insights web app by selecting **Reports** on the left navigation
- Prebuilt Power BI templates: Copilot adoption, Copilot impact, Copilot Studio agents

**Four distinct reporting sources for admins:**

| Source | What it covers |
|--------|----------------|
| **Microsoft 365 admin center** | Readiness and usage |
| **Viva Insights Copilot Analytics** | Copilot Dashboard and Advanced Insights Analyst workbench |
| **Microsoft Purview audit logs** | Compliance and security auditing (**not** usage reporting) |
| **Power Platform and Copilot Studio Analytics** | Agent consumption and performance |

**Role mapping for Copilot reporting:**

| Role | What it grants |
|------|----------------|
| **AI Administrator** | Accesses Copilot reports in the Microsoft 365 admin center; enables and delegates the Copilot Dashboard |
| **Global Administrator** | Assigns the Insights Analyst and Insights Administrator roles |
| **Insights Analyst** | Uses the Advanced Insights Analyst Workbench to build Copilot Power BI templates |
| **Insights Administrator** | Manages settings in the Analyst Workbench (security, privacy, org data uploads) |
| **Audit Reader** | Searches Purview audit logs |
| **Copilot Studio Author** | Accesses per-agent analytics for agents they create |

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
| Microsoft 365 admin center (Reports > Usage) | Quick triage -- readiness, licenses, last activity, simple exports |
| Microsoft 365 admin center (Reports > Usage > Microsoft 365 Copilot > **Credits**) | Copilot Credit consumption per user, agent, and billing policy |
| Viva Insights (Copilot Dashboard) | Impact analysis -- time saved, meeting reduction |
| Power Platform and Copilot Studio Analytics | Agent consumption and performance |
| Microsoft Purview audit logs | Compliance and security auditing (**not** usage reporting) |
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
- Do **NOT** rely on Global Administrator. Microsoft describes Global Administrator as "a highly privileged role" whose use should be limited to emergency scenarios when a lower-privileged role cannot be used. Least privilege is the answer posture AB-900 items expect.
- Key roles:
  - **AI Administrator:** the primary Copilot and agent administration role. Accesses Copilot reports in the Microsoft 365 admin center, enables and delegates the Copilot Dashboard, manages pay-as-you-go billing, and performs agent governance actions such as approving agent requests and assigning ownership.
  - **Billing Administrator:** can create and manage Copilot pay-as-you-go billing policies
  - **Helpdesk Administrator:** password resets only
  - **License Administrator:** assign and remove licenses without broader tenant access
  - **Compliance Administrator:** the role that accesses DSPM in Microsoft Purview; view usage data, run reports, review compliance alerts
  - **User Administrator:** create and manage user accounts without touching security policies
  - **Global Reader:** view-only, no edit rights
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
