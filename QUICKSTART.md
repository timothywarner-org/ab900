# Quick Start Guide

Get up and running quickly with the course materials and labs.

> **Currency:** Aligned to the **Skills measured as of July 22, 2026** version of the AB-900 study guide. Content last reviewed **July 26, 2026**.

## For Students

### Before the Live Session

1. **Clone the Repository**
   ```bash
   git clone https://github.com/timothywarner-org/ab900.git
   cd ab900
   ```

2. **Review Prerequisites**
   - [ ] Microsoft 365 tenant access (trial or production)
   - [ ] Administrative credentials
   - [ ] Modern web browser (Edge, Chrome, Firefox)
   - [ ] Stable internet connection

3. **Set Up Your Lab Environment**
   - Sign up for the [Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program). Eligibility is limited to Visual Studio Professional or Enterprise subscribers and members of qualifying programs, so confirm you qualify before relying on it.
   - Or activate a [Microsoft 365 trial](https://www.microsoft.com/microsoft-365/try)
   - Ensure you have an administrative role that covers the labs you plan to run. Microsoft recommends least privilege over standing Global Administrator: use **AI Administrator** for Copilot and agent tasks, **Billing Administrator** for pay-as-you-go setup, **SharePoint Administrator** for oversharing reports, and **Compliance Administrator** for Microsoft Purview.
   - Mandatory multifactor authentication is enforced for the Microsoft 365 admin center, the Microsoft Entra admin center, and the Azure portal. There is no opt-out, and it applies to break-glass and test accounts. Register a method before the session.

4. **Install Required Tools (Optional)**
   ```powershell
   # For PowerShell automation
   Install-Module Microsoft.Graph -Scope CurrentUser
   
   # For Microsoft Entra ID management
   Install-Module Microsoft.Graph.Identity.DirectoryManagement -Scope CurrentUser
   ```

### During the Live Session

1. **Navigate Course Materials**
   - Start with segment folders in order (01, 02, 03, 04)
   - Each segment has README with detailed content
   - Follow along with demonstrations

2. **Hands-On Labs**
   - Lab instructions are in each segment's README
   - Use your test environment
   - Do not worry if you fall behind -- labs are self-paced
   - Take notes of any issues for Q&A

3. **Ask Questions**
   - Use Q&A feature during live session
   - Note questions for later in Q&A section of READMEs

### After the Live Session

1. **Complete Labs**
   - Work through any labs you did not finish
   - Try the optional challenge exercises
   - Document your results

2. **Review Materials**
   - Re-read segment READMEs
   - Watch any recorded sessions
   - Practice in your environment

3. **Additional Practice**
   - Explore the shared resources
   - Try the PowerShell scripts
   - Customize templates for your org

## For Administrators Planning Deployment

### Week 1: Assessment

1. **Review Current State**
   - [ ] Inventory existing M365 licenses
   - [ ] Document current security policies
   - [ ] Assess data governance maturity
   - [ ] Review network capacity

2. **Learn the Technology**
   - [ ] Complete this course
   - [ ] Review Microsoft documentation
   - [ ] Understand Copilot architecture
   - [ ] Study security considerations

3. **Plan Your Approach**
   - [ ] Define business objectives
   - [ ] Identify pilot users
   - [ ] Determine success metrics
   - [ ] Create deployment timeline

### Week 2-3: Preparation

1. **Technical Preparation**
   - [ ] Ensure OneDrive is provisioned for all users
   - [ ] Update Microsoft 365 Apps to Current Channel
   - [ ] Configure sensitivity labels
   - [ ] Implement DLP policies
   - [ ] Set up audit logging

2. **Licensing**
   - [ ] Choose the right SKU. **Microsoft 365 Copilot** is the enterprise add-on. **Microsoft 365 Copilot Business** is the SMB add-on, capped at a **maximum of 300 seats** per tenant. **Microsoft 365 E7** includes Microsoft 365 Copilot in the base SKU, so E7 customers do not buy the add-on separately.
   - [ ] Confirm there is **NO** seat minimum. Microsoft removed the original 300-seat minimum in January 2024. The only surviving 300 figure is the seat cap on the SMB SKUs.
   - [ ] Decide whether unlicensed users need pay-as-you-go access to Copilot Chat and SharePoint agents
   - [ ] Plan license distribution
   - [ ] Create assignment groups
   - [ ] Test license assignment process

3. **Governance**
   - [ ] Create acceptable use policy
   - [ ] Define support process
   - [ ] Establish monitoring approach
   - [ ] Create incident response plan

### Week 4-6: Pilot

1. **Execute Pilot**
   - [ ] Assign licenses to pilot users (20-100 users)
   - [ ] Conduct training session
   - [ ] Provide support resources
   - [ ] Monitor usage daily

2. **Gather Feedback**
   - [ ] Weekly pilot user surveys
   - [ ] Track support requests
   - [ ] Analyze usage metrics
   - [ ] Document issues and resolutions

3. **Optimize**
   - [ ] Refine policies based on feedback
   - [ ] Update training materials
   - [ ] Adjust support process
   - [ ] Prepare for broader rollout

### Week 7+: Rollout

1. **Phased Deployment**
   - [ ] Deploy to departments/teams incrementally
   - [ ] Provide training for each wave
   - [ ] Monitor adoption rates
   - [ ] Adjust based on lessons learned

2. **Ongoing Management**
   - [ ] Regular usage reporting
   - [ ] Policy reviews and updates
   - [ ] Continuous user education
   - [ ] Stay current with new features

## Quick Reference - Common Tasks

### Assign a Copilot License (PowerShell)

The SKU part number varies by the plan the tenant purchased. Run `Get-MgSubscribedSku | Select-Object SkuPartNumber, SkuId` first and match against what your own tenant returns rather than assuming a name.

```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# List the SKUs this tenant owns, then pick the Copilot one by its actual part number
Get-MgSubscribedSku | Select-Object SkuPartNumber, SkuId

# Get the Copilot SKU (confirm the part number against the list above)
$sku = Get-MgSubscribedSku | Where-Object {$_.SkuPartNumber -eq "MICROSOFT_365_COPILOT"}

# Assign to user
$user = Get-MgUser -UserId "user@contoso.com"
Set-MgUserLicense -UserId $user.Id -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()
```

### Check Copilot Readiness
```powershell
# Check OneDrive provisioning
Get-MgUser -UserId "user@contoso.com" -Property OnPremisesSyncEnabled, AccountEnabled

# Check app versions (run on user device)
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration
```

### Create a Simple DLP Policy (Portal)
1. Go to https://purview.microsoft.com
2. Go to **Solutions** > **Data Loss Prevention** > **Policies**
3. Select **+ Create policy**
4. Choose a template, or choose **Custom template** > **Custom policy**
5. Configure locations. To govern Copilot grounding, turn on the location named **Microsoft 365 Copilot and Copilot Chat**.
6. Define rules and conditions
7. Set actions such as block or notify. For the Copilot location the action is **Prevent Copilot from processing content**.
8. Test before enforcing

Exam trap for the Copilot location: you can **NOT** combine the "Content contains sensitive info types" condition and the "Content contains sensitivity labels" condition in the same rule. Create one rule per condition inside the same policy.

### Run a Data Access Governance Report (Portal)
1. Go to the SharePoint admin center at https://admin.microsoft.com/sharepoint
2. In the left pane expand **Reports**
3. Select **Data access governance**
4. Choose a snapshot report such as **Site permissions across your organization**, or an activity report such as **Sharing links**
5. Remediate from the report using restricted access control, the Change history report, or Site access review

### View Copilot Usage (Portal)
1. Go to https://admin.microsoft.com
2. In the navigation menu select **Reports**. If **Reports** is not visible, select **Show all** first.
3. Select **Usage**
4. Under **Reports**, select **Microsoft 365 Copilot**, then select **Copilot**
5. Select the **Usage** tab for adoption and usage metrics. The **Readiness** tab shows license eligibility and app readiness.

Sibling reports under the same **Microsoft 365 Copilot** node: **Credits** for Copilot Credit consumption, and **Agents** for agent adoption. Copilot usage data is typically available within 48 hours of the end of a day in UTC.

Exam trap: Microsoft Purview audit log data is **NOT** intended as the basis for Copilot usage reporting, and metrics built on it may not match the official usage reports.

### View the Copilot Dashboard
The Copilot Dashboard is part of Copilot Analytics and is **NOT** in the Microsoft 365 admin center. An AI Administrator first enables it and delegates access from the admin center. Users then open the **Viva Insights** app in Microsoft Teams or the Viva Insights web app and select **Copilot Dashboard**.

## AB-900 Exam Logistics

| Attribute | Value |
|-----------|-------|
| Status | Generally available. AB-900 is **NO** longer in beta, so scores are reported immediately rather than after a beta scoring window. |
| Skills measured version | July 22, 2026 |
| Exam duration | 45 minutes. Block roughly 65 minutes of seat time for instructions and the candidate agreement. |
| Question count | Microsoft does **NOT** publish an AB-900-specific count. Microsoft states most exams typically contain 40-60 questions. |
| Passing score | 700 or greater, on a scale where 1000 is the maximum |
| Languages | English only |
| Retake | 24 hours after a first failed attempt |
| Renewal | **NONE**. Microsoft states that Fundamentals certifications do not expire. The annual renewal assessment applies only to associate, expert, and specialty certifications. |
| Learn access during the exam | **NOT** available on Fundamentals exams |
| Breaks | Unscheduled breaks are allowed, but the clock keeps running and you cannot return to any question you already viewed |

Domain weights: Domain 1 at 30-35%, Domain 2 at 35-40% (heaviest), Domain 3 at 25-30%.

Free preparation resources:

- [AB-900 study guide](https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900)
- [Official practice assessment](https://learn.microsoft.com/credentials/certifications/practice-assessments-for-microsoft-certifications)
- [Exam sandbox](https://aka.ms/examdemo) to try the question types. The secure browser is not enabled in the sandbox.

## Using the AB-900 Cert Buddy Agent

This repository includes a **GitHub Copilot agent** that helps you study for the AB-900 exam. The agent is read-only and does not modify files in the repository.

### Slash Commands

Use these slash commands in GitHub Copilot Chat:

| Command | Purpose |
|---------|---------|
| `/ab900-practice-questions` | Generate exam-realistic multiple-choice questions |
| `/ab900-scenario-walkthrough` | Walk through realistic admin scenarios step by step |
| `/ab900-study-planner` | Generate a personalized study plan based on your confidence ratings |

### MCP Servers

The agent uses three MCP servers defined in `.vscode/mcp.json`:

| Server ID | Package | Purpose |
|-----------|---------|---------|
| `ab900buddy-context7` | `@upstash/context7-mcp@1.0.31` | Version-specific docs and snippets for M365 admin PowerShell and Graph API |
| `ab900buddy-markitdown` | `markitdown-mcp@0.0.1a4` | Convert PDFs and Office docs to Markdown for analysis |
| `ab900buddy-mslearn` | `@microsoft/learn-cli@0.1.0` | Search and fetch official Microsoft Learn documentation |

### Local Knowledge Corpus

Six distilled module documents from the AB-900T00 Microsoft Learn course are available in the `docs/` directory (module-01 through module-06). These cover security foundations, core services administration, data protection and governance, Copilot and agents, Copilot admin tasks, and agent admin tasks.

## Getting Help

### During Course
- Ask questions during live session
- Use course discussion forums
- Check FAQ.md in this repository

### After Course
- Review Microsoft documentation
- Post in Microsoft Tech Community
- Open issues in this repository
- Contact Microsoft Support for production issues

## Next Steps

1. **Complete the Course** - Follow all 4 segments
2. **Practice Hands-On** - Complete all labs
3. **Plan Your Deployment** - Use templates and checklists
4. **Stay Updated** - Follow Microsoft announcements
5. **Share Knowledge** - Help your organization succeed

---

**Ready to start?** Jump to [Segment 1: Core Features and Objects of Microsoft 365 Services](./segment-01-core-m365-services/)!
