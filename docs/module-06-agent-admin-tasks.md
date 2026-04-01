# Module 6: Perform Basic Administrative Tasks for Microsoft 365 Copilot Agents

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/perform-admin-tasks-microsoft-365-copilot-agents/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)

---

## Unit 1: Create a Copilot Chat Agent -- Part 1 (Describe Tab)

### Copilot Studio Two Experiences
- **Lite experience:** for everyday business users; no coding; simplified UI
- **Full experience:** for developers; advanced customization, multi-step workflows, custom connectors, lifecycle management, security controls

### Two Authoring Methods in Lite Experience
- **Describe tab:** use plain language to describe what you want; Copilot Studio interprets and creates draft
- **Configure tab:** manually build step-by-step by choosing options and entering details
- Both tabs are synchronized and work seamlessly together

### Describe Tab Workflow

**1. Optionally Select a Template**
- Provides preconfigured settings, description, instructions
- Benefits: ease of creation, consistency, best practices, customizable, efficiency

**2. Define Name, Description, Instructions**
- Enter description in natural language; Copilot Studio assigns or recommends a name
- Auto-generates starter prompts based on description
- Enter instructions (purpose, guidelines, skills)
- Copilot Studio interprets, parses, and progressively refines through follow-up questions:
  - Clarification of purpose
  - Target audience
  - Contextual information
  - Response style and tone
  - Handling specific queries
  - Integration with other systems
  - Fallback mechanisms

**3. Test Draft on Describe Tab**
- Agent uses built-in general knowledge (no specific knowledge sources yet)
- Useful for testing natural language instructions
- Full testing with knowledge sources happens on Configure tab

---

## Unit 2: Create a Copilot Chat Agent -- Part 2 (Configure Tab)

### Configure Tab Features

**Template:** can override Describe tab template choice (WARNING: resets all customizations)

**Agent Icon:** default icon can be changed; must be .png, max 1 MB

**Name, Description, Instructions:** review and edit; if entered on Describe tab, shows interpreted version in bullet format; Configure tab does NOT ask follow-up questions like Describe tab

**Knowledge Sources (up to 20 per agent):**
- Files and folders (.docx, .doc, .pptx, .ppt, .html)
- SharePoint sites or folders
- Enable or disable web access (depends on org "Allow web search in Copilot" policy)
- Microsoft Copilot connectors (formerly Graph connectors) for external systems
- Considerations: Restricted SharePoint Search blocks SharePoint as source; max file size 200 MB with Copilot license; newly uploaded files may show "Preparing" status

**Capabilities (off by default):**
- **Code Interpreter:** converts natural language prompts to Python code behind the scenes
- **Image Generator:** creates images using DALL-E technology (based on Microsoft Designer)

**Starter Prompts:** add, remove, edit; unlimited number for Copilot Chat agents; auto-generated if template selected or based on description

**Test:** test draft version before creating

**Create Button Actions:**
- Activates the agent
- Deploys to specified environment
- Synchronizes Describe and Configure tab settings
- Makes agent available for sharing
- Sets up monitoring and analytics

---

## Unit 3: Create a SharePoint Agent

### Prerequisites
- User must have **Edit** permissions or higher for the SharePoint site or document library

### Four Entry Points to Create a SharePoint Agent
1. **Site homepage:** +New > Agent
2. **Document library command bar:** Create an agent (all supported files)
3. **Context menu of selected files:** right-click selected files > Create an agent
4. **Agent chat pane:** Copilot button (upper right) > dropdown > Create an agent

### SharePoint Agent Form (3 Tabs)

**Overview Tab:** name, description, icon (png, max 1 MB)

**Sources Tab:**
- Default: "Source from entire site"
- Option: "Sourced from document libraries, folders, or files" > Pick items
- Up to 20 sources per agent
- Hub sites automatically include associated sites

**Behavior Tab:**
- **Welcome message** (available in SharePoint agents, NOT in Copilot Chat agents)
- **Starter prompts:** maximum of 3 (vs. unlimited in Copilot Chat)
- **Instructions:** natural language, but NO conversational refinement like Copilot Studio

### Key Differences: SharePoint Agent vs. Copilot Chat Agent

| Feature | Copilot Chat Agent | SharePoint Agent |
|---------|-------------------|------------------|
| Tool used | Copilot Studio | Copilot agent tool in SharePoint |
| Templates | Yes | No |
| Welcome message | No | Yes |
| Starter prompts | Unlimited | Maximum 3 |
| Instruction refinement | Conversational follow-up questions | Manual only |
| Code Interpreter | Yes (optional) | No |
| Image Generator | Yes (optional) | No |

### Agent Storage
- From homepage: Site contents > Site Assets > Copilots (stored as .agent file)
- From other places: saved to current document library folder

---

## Unit 4: Test and Edit Your Agents

### Why Test
- Identify issues early
- Refine instructions
- Evaluate user experience
- Optimize performance
- Ensure compliance
- Both pre-deployment AND post-deployment testing are important

### What to Test
- **Instructions:** tones and styles, clarity and accuracy, consistency, adaptability, edge cases
- **Knowledge sources:** verify integration, update and retest, cross-reference testing (hub sites include associated sites)
- **Capabilities:** Code Interpreter (simple and complex queries, edge cases), Image Generator
- **Starter prompts:** evaluate defaults, customize, gather user feedback

### Editing Agents

**Edit a Copilot Chat Agent:**
- Hover over agent in navigation > More (...) > Edit; OR
- All agents > Agent Store > Your Agents > (...) > Edit
- Opens Copilot Studio Configure tab
- Make changes > Update button
- Shared users cannot see changes until agent is reshared

**Edit a SharePoint Agent:**
- Locate the .agent file in SharePoint
- Select > Edit > opens Copilot agent tool
- Make changes > Save
- Cannot edit a site ready-made (auto-created) agent

---

## Unit 5: Manage User Access and Permissions for Agents

### Agent Categories for Licensing
- **Declarative and public web-grounded agents:** generally free; available in M365 Agent store
- **Tenant-specific, Copilot Studio, and consumption-billed agents:** require extra licensing, Copilot Studio user licenses, or Azure subscription

### Three Licensing Buckets
1. **Free:** Copilot Chat plus many public and declarative agents (included with eligible M365 subscription)
2. **Licensed:** Tenant-specific or customized agents created in Copilot Studio (Copilot Studio license required)
3. **Consumption-billed:** High-volume or premium agents (message packs or pay-as-you-go Azure subscription)

### Two-Step Access Configuration

**Step 1 -- Assign Copilot License (M365 admin center):**
- Portal path: **admin.microsoft.com > Users > Active users > [select user] > Licenses and apps > select Copilot product license**
- Scope: tenant-wide

**Step 2 -- Assign Environment Role (Power Platform admin center):**
- Portal path: **admin.powerplatform.microsoft.com > Environments > [select environment] > Settings > Users + permissions > Users > [assign role]**
- Key roles:
  - **Environment Maker:** can create and edit agents
  - **Environment Admin:** full control over environment
  - **Basic User:** can only interact with agents shared with them
- Scope: environment-level only
- Tip: some environments require both Environment Maker AND Copilot Studio Author roles

### Group-Based Role Assignments
- Use Entra ID security groups to assign roles to groups instead of individuals
- Benefits: simplified management, consistency, scalability

### Security Best Practices
- Principle of least privilege
- Separate environments for development and production
- Regular access reviews (quarterly)
- Monitor usage via Power Platform admin center and M365 audit logs
- Combine with conditional access policies (MFA, block external devices)

### Key Clarifications
- Users of published agents do NOT need a Copilot Studio license or environment role -- they just need access to the published endpoint (Teams, SharePoint, etc.)
- Admins manage agent availability through the **Copilot Control System** in M365 admin center

---

## Unit 6: Examine Agent Approval and Governance

### Manageable Agent Types
- **Custom agents:** built with predefined instructions; go through admin approval
- **Shared agents:** configured for multiple users or groups
- **First-party agents:** developed by Microsoft (Researcher, Analyst, Writing Coach, etc.)
- **External agents:** created by external developers or vendors
- **Frontier agents:** experimental or advanced; may need more oversight

### Admin Roles for Agent Management
- **AI Administrator:** can manage agents
- **Global Reader:** view-only
- Use least-privilege roles; limit Global Administrator to emergencies

### Three-Stage Approval Process
1. **Submission:** user or developer requests approval (purpose, audience, permissions)
2. **Review:** admins plus compliance officers assess technical and organizational factors
3. **Decision:** approve, reject, or send back for revisions

### Viewing Pending Requests
- Portal path: **admin.microsoft.com > Copilot > Agents > Requested agents tab**

### Stakeholders in Approval
- Administrators (gatekeepers)
- Business owners (provide context)
- Security and compliance officers (minimize risk)
- Document every decision (e.g., SharePoint list)

### Agent Updates and Version Control
- Portal path: **admin.microsoft.com > Copilot > Agents > Agent inventory tab > [select agent]**
- Agent detail pane shows: description, deployment status, version history, availability, publisher, agent type
- Availability options: no users, all users, or selected users only
- Shows capabilities, knowledge sources, actions, security and compliance certification
- Review updates before deployment; maintain rollback strategies

### Governance Policies

**Copilot Control System (admin.microsoft.com > Copilot):**
- Block or allow agents
- Assign agents to specific users or groups
- Control agent extensibility
- Configure usage settings
- Manage billing policies

**Power Platform Admin Center Governance:**
- **Data policies:** permit or restrict Power Platform connectors; block anonymous access; block publish to specific channels
- **Sharing limits:** prevent non-certified solutions from being shared too broadly
- **Environment rules, groups, and routing:** create environment groups, route makers to personal dev environments
- **Maker onboarding:** custom welcome messages with step-by-step guidance
- **Advisor:** out-of-the-box recommendations; scans environment; identifies agents needing attention
- **Catalog:** centralized repository for certified connectors, templates, controls
- **MIP labels:** integrate with Microsoft Purview sensitivity labels
- **Audit logging to Microsoft Purview:** captures interactions, commands, responses, admin actions
- **Copilot Security checker:** performs security assessments before publishing
- **Security page:** consolidated security management for Power Platform workloads

### Compliance Monitoring
- Portal path: **admin.microsoft.com > Admin centers > Microsoft Purview > Solutions > Audit > Search page**
- Filter Activities by "Copilot" keywords
- Schedule periodic compliance reviews (quarterly): audit all active agents, permissions, usage patterns

---

## Unit 7: Monitor and Manage the Agent Lifecycle

### Monitoring Agent Usage and Performance
- Track: user adoption levels, performance metrics (response time, accuracy), error tracking
- Portal path: **admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot > Copilot > Agents tab > [select agent]**
- Use filters: date range, department, user group
- Export to Excel for deeper analysis

### Operational Insights
- Permission usage (scale back unused write permissions to read-only)
- Cross-service dependencies (identify which backend services agents rely on)
- Trend analysis (steady growth, seasonal peaks, unexpected drops)
- Portal path: **Reports > Copilot > Microsoft 365 Copilot > Copilot > Agents tab** and **Agents usage reports**

### Agent Lifecycle Stages
1. **Creation:** set guardrails, ensure no unnecessary permissions
2. **Approval and deployment:** communicate to users
3. **Maintenance:** update for new business processes; monitor stability and compliance
4. **Block:** prevents all users from accessing the agent
5. **Removal:** removes from inventory entirely (first-party or external agents can be re-acquired from store)

### Block or Remove an Agent
- Portal path: **admin.microsoft.com > Copilot > Agents > [select agent] > Remove or Block**
- Can apply to everyone or specific users or groups
- Best practice: communicate retirement plans 30 days in advance

### Dashboards

**M365 Admin Center:**
- Portal path: **Reports > Usage > Microsoft 365 Copilot**
- Shows: usage summaries, error and health indicators, top agents

**Power Platform Admin Center:**
- Portal path: **Power Platform admin center > Copilot > Copilot Studio > Agents section**
- Shows: average response time, abandonment rates, escalation frequency

### Who Can See Reports
- Global admins, Exchange admins, SharePoint admins, Skype for Business admins
- Global reader (no user details)
- Usage Summary Reports reader (no user details)
- Reports reader
- Teams Administrator, Teams Communications Administrator
- User Experience Success Manager (no user details)

### Troubleshooting Common Agent Issues
- **Connectivity problems:** check service health dashboards
- **Permission errors:** Settings > Integrated apps > Copilot agents > Manage permissions
- **Performance degradation:** review dashboards for usage spikes or error logs
- Troubleshooting flow: check service health > review permission set > examine logs for failed API calls > resolve (renew permissions, reconfigure connection)
