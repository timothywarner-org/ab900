# Quick Start Guide

Get up and running quickly with the course materials and labs.

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
   - Sign up for [Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program) (free)
   - Or activate [Microsoft 365 trial](https://www.microsoft.com/microsoft-365/try)
   - Ensure you have Global Administrator access

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
   - [ ] Procure Copilot licenses
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
```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Get the Copilot SKU
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
2. Navigate to Data Loss Prevention > Policies
3. Click "Create policy"
4. Choose template or custom
5. Configure locations (Exchange, SharePoint, Teams)
6. Define rules and conditions
7. Set actions (block, notify, etc.)
8. Test before enforcing

### View Copilot Usage (Portal)
1. Go to https://admin.microsoft.com
2. Navigate to Reports > Copilot
3. Review adoption metrics
4. Analyze usage by application
5. Export data as needed

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
