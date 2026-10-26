# Module 6: Perform Basic Administrative Tasks for Microsoft 365 Copilot Agents

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/perform-admin-tasks-microsoft-365-copilot-agents/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)
**Verified:** 2026-07-26 (against the AB-900 skills measured as of July 22, 2026)

> **Objective mapping.** This module supports the Domain 3 subsection "Perform basic administrative tasks for agents": identify how to configure user access to agents; create an agent; understand the approval process for agents; and monitor agents including usage, operational insights, and agent lifecycle by working with the **Microsoft 365 admin center** and the **Microsoft Power Platform admin center**. Domain 3 has **no rows in the July 22, 2026 change log**.

> **Naming update applied throughout this module.** The low-code authoring surface is now **Agent Builder in Microsoft 365 Copilot**, reached via the **New agent** option in the Microsoft 365 Copilot app. "Copilot Studio lite" survives only in Learn URL slugs and one FAQ phrase. The agent management surface is now a **top-level Agents node** in the Microsoft 365 admin center, not a page nested under Copilot.

---

## Unit 1: Create an Agent -- Part 1 (Describe Tab)

### Two Authoring Surfaces
- **Agent Builder in Microsoft 365 Copilot:** for everyday business users; no coding; simplified UI. Available to users with a Microsoft 365 Copilot license **OR** in tenants with pay-as-you-go enabled for Copilot Studio.
- **Copilot Studio (full):** for makers and developers; advanced customization, multi-step workflows, custom connectors, lifecycle management, security controls

### Two Authoring Methods in Agent Builder
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

**Knowledge Sources (up to 20 total per agent in Agent Builder):**
- Embedded (uploaded) files -- up to **20 files** per agent
- SharePoint sites, folders, and files -- up to **100**
- SharePoint lists -- up to **1**
- OneDrive files -- up to **50**
- Teams chat URLs -- up to **5**
- Public website URLs -- up to **4**, only two levels deep, and **NO** query parameters
- **Microsoft 365 Copilot connectors** (formerly Microsoft Graph connectors) for external systems
- Web access toggle (subject to the org **Allow web search in Copilot** policy, which takes precedence)

**Field character limits:** Description **1,000 characters**; Instructions **8,000 characters**.

**Constraints to state carefully:**
- If **Restricted SharePoint Search** is enabled in the tenant, SharePoint **cannot** be used as a knowledge source for a declarative agent
- **Microsoft Purview Information Barriers is NOT supported on embedded files.** Any user who can access the agent can see responses grounded in embedded file content.
- The **"Only use specified sources"** toggle **prioritizes** the designated sources; Microsoft explicitly states Agent Builder **cannot fully block** general AI knowledge. For stricter control, use Copilot Studio.
- Embedded files are stored in tenant-owned **SharePoint Embedded containers**, visible in the SharePoint admin center and in PowerShell under the application name **Declarative Agent**. Do not delete these containers -- doing so might break dependent agents.
- Newly uploaded files may show a "Preparing" status

<!-- VERIFY: Microsoft documents conflicting per-file-type size limits for embedded files. The admin center article lists 512 MB for .docx/.pptx/.pdf and 150 MB for .doc/.ppt/.xls/.xlsx/.txt; the extensibility article's table lists 512 MB for .doc/.ppt/.txt and 30 MB for .xls/.xlsx. The 20-file COUNT is consistent across both. Teach the count; do not assert a single per-type size number without qualification. -->

**Capabilities (both ENABLED BY DEFAULT in Agent Builder -- corrected):**
- **Code interpreter** -- UI toggle label **"Create documents, charts, and code"** under Capabilities on the Configure tab. To disable or re-enable it, select **Skip to configure**, then use that toggle. In Agents Toolkit manifests it is the `CodeInterpreter` value.
- **Image generator** -- UI toggle label **"Create images"** under Capabilities. In Agents Toolkit manifests it is the `GraphicArt` value. **Known limitation:** the image generator does not currently work in the Agent Builder test pane.
- Both require declarative agent manifest schema version **1.2 or later**.
- **Licensing note:** code interpreter and image generator do **NOT** require a Microsoft 365 Copilot license or metered usage. Web search and scoped web search also do not.

**Response modes** are set in the **Model** section of the Configure tab: **Auto** (default), **Quick response**, and **Think deeper**. Users can override with the model selector. Known issue: the default response mode is not applied when the agent is invoked via @mention from the main Copilot experience.

**People data** ("Reference people in organization") is **enabled by default** for agents created by users who hold a Microsoft 365 Copilot license, and is available only to those users.

**Starter Prompts:** add, remove, edit; auto-generated if a template is selected or based on the description. **Microsoft documents NO maximum number of starter prompts for Agent Builder** -- only that there is no minimum number. Do not assert an Agent Builder starter-prompt ceiling.

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

### Licensing prerequisite

**Either** an assigned Microsoft 365 Copilot license **OR** pay-as-you-go billing configured for the organization. Microsoft's wording: "If you are assigned a Microsoft 365 Copilot license, or your organization has the Pay-As-You-Go billing set up, you can use agents in SharePoint."

### Entry Points to Create a SharePoint Agent

Microsoft documents three UI entry points:
1. **Site homepage:** **New > Agent**
2. **Document library command bar:** the **AI actions** menu
3. **A file's right-click or ellipsis context menu**

**Where agents are stored:** agents created from the homepage go to **Site contents > Site Assets > Copilots**. Agents created from a library are saved to the current folder. SharePoint agents are stored as **.agent files**, and the permissions on the .agent file determine who can access or edit the agent. Only users who can create or access files on a site can create or access agents there.

### SharePoint Agent Form (3 Tabs)

**Overview Tab:** name, description, icon (png, max 1 MB)

**Sources Tab:**
- Default: "Source from entire site"
- Option: "Sourced from document libraries, folders, or files" > Pick items
- **Up to 20 source items per agent** -- sites, document libraries, folders, and files in any combination (for example 20 files, or 10 files plus 10 sites). If more than 20 are needed, nest the data at a higher level and source the agent to that level. This 20-source-item limit is the **SharePoint agent** number and is distinct from Agent Builder's 100-SharePoint-file limit.
- Hub sites automatically include associated sites

**Behavior Tab:**
- **Welcome message** (available in SharePoint agents, NOT in Copilot Chat agents)
- **Starter prompts:** maximum of 3 (vs. unlimited in Copilot Chat)
- **Instructions:** natural language, but NO conversational refinement like Copilot Studio

### Key Differences: SharePoint Agent versus Agent Builder Agent

| Feature | Agent Builder agent | SharePoint agent |
|---------|--------------------|------------------|
| Tool used | Agent Builder in Microsoft 365 Copilot | Copilot agent tool in SharePoint |
| Templates | Yes | No |
| Welcome message | No | Yes |
| Starter prompts | **No documented maximum** (and no minimum) | Maximum 3 |
| Knowledge limit | 20 knowledge sources total, with per-type sublimits | 20 source items total |
| Instruction refinement | Conversational follow-up questions on the Describe tab | Manual only |
| Code interpreter | Yes, **enabled by default** | Not documented as available |
| Image generator | Yes, **enabled by default** | Not documented as available |

<!-- VERIFY: Microsoft does not publish an explicit statement that code interpreter and image generator are UNSUPPORTED for SharePoint agents. The SharePoint agent documentation simply does not list them as available capabilities. State this as "not documented as available", not as a hard denial. -->

### Blocking scope differs by where the agent was built

This is a distinct exam trap. **Blocking an agent created with Agent Builder or Copilot Studio** affects its availability in Microsoft 365 Copilot **AND** other host products such as Outlook and Teams. **Blocking an agent created with SharePoint or Microsoft Foundry** only affects its availability in **Microsoft 365 Copilot Chat**. SharePoint documentation adds that blocking an agent affects only its availability in Copilot Chat, and does not yet apply to OneDrive, SharePoint, or Teams.

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
1. **Free:** Copilot Chat plus Agent Store agents that are available at no additional cost, provided the admin enables them (included with an eligible Microsoft 365 or Office 365 subscription and a Microsoft Entra account)
2. **Licensed:** agents whose knowledge sources require a Microsoft 365 Copilot license
3. **Consumption-billed:** agents that incorporate organizational data for **unlicensed** users, billed via metered consumption in **Copilot Credits** through **Copilot Studio capacity packs** or pay-as-you-go against an Azure subscription. "Message packs" is the retired name.

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
- **Published by your org (LOB) agents:** built in the tenant; go through admin approval
- **Shared by creator (shared) agents:** configured for multiple users or groups
- **Microsoft agents:** developed by Microsoft (Researcher, Analyst, Prompt Coach, Writing Coach, and others)
- **External partner-built agents:** created by external developers or vendors
- **Frontier agents:** experimental or advanced agents using new capabilities, which might be in early development or testing. Two named Frontier agent types are the **App Builder agent** and the **Workflows agent**, both Microsoft-developed and also manageable in the Power Platform admin center.

> **Researcher and Analyst are the exception to all of this.** Microsoft states they "are part of the core Copilot chat experience and will not fall under any agent-related settings." They remain accessible in Microsoft 365 Copilot Chat under **Tools** even when Copilot agents are disabled for some or all users. The **Edit users** panel is **disabled** for both, so granular per-user assignment is not possible. The only disable mechanism is the tenant-wide **Block** action.

**Word, Excel, and PowerPoint Agents** are installed by Microsoft and appear in the Tools menu and the All agents section of the left navigation pane for **both** Copilot Chat users (unlicensed) and Microsoft 365 Copilot licensed users. They exclusively use Anthropic's AI models, so the Anthropic provider must be enabled for the tenant.

**Sovereign cloud notes:** publishing agents to the organization is supported in **GCC High (GCCH)** and **GCC Moderate (GCCM)** environments. However, **embedded file content as a knowledge source is NOT supported in GCC** environments.

### Admin Roles for Agent Management
- **AI Administrator** and **Global Administrator** are the **only** roles that can perform governance actions such as approving agent requests or assigning ownership
- **Global Reader**, **AI Reader**, **Security Administrator**, **Security Reader**, **Reports Reader**, and **User Experience Success Manager** can view agent registry information but **cannot** take administrative action
- Use least-privilege roles; limit Global Administrator to emergency scenarios

### Three-Stage Approval Process
1. **Submission:** user or developer requests approval (purpose, audience, permissions)
2. **Review:** admins plus compliance officers assess technical and organizational factors
3. **Decision:** approve, reject, or send back for revisions

### THE AUTHORITATIVE APPROVAL PATH (corrected)

**admin.microsoft.com > Agents > All agents > Requests**

The older path "admin.microsoft.com > Copilot > Agents > Requested agents tab" is **stale on both counts**. The Agents workload is a **top-level node** in the Microsoft 365 admin center left navigation, not nested under Copilot, and the tab is named **Requests**, not "Requested agents". One legacy sentence in the agents admin guide still says "Requested agents tab", but its own numbered procedure directly below instructs "Select Agents > All agents > Requests".

**"Manage agent requests in Microsoft 365 admin center" is generally available**, with a release-notes date of **July 15, 2026**.

### Three request states under the Requests tab

| State | What it means | Admin action button |
|-------|---------------|---------------------|
| **Pending review** | A new agent is submitted for publication | **Publish to store** |
| **Pending update** | An updated version of an already-published agent is submitted. Until the admin approves, users continue to access the **previous version**. | **Update in store** |
| **Pending activate** | A member of the organization requests to activate an agent so they can create **agent instances** | Approve and activate, or reject; the admin can scope its audience to specific users, groups, or everyone |

**Reject submission** is available from the ellipses to the right of the agent name in the Requests list.

The Requests list can be filtered by **State** (Pending activate, Pending review, Pending update) and by **Channel** (Microsoft Teams, Copilot, Office, Outlook, Word, Excel, PowerPoint).

**A fourth request state exists for blocked Microsoft-built agents.** A user selects **Request** from the store, and the request appears under Agents > All agents > Requests with the state **"Allow user to install"**. The admin must first select **Unblock agent**, then select the request and choose **Approve** or **Reject**.

### The Pending review approval workflow, end to end

1. Sign in to admin.microsoft.com > **Agents > All agents > Requests**
2. Select the agent and review **capabilities, data sources, security and permissions, and custom actions**
3. Select **Publish to store**
4. Select users or groups that **can install** the agent
5. Optionally select users or groups who will have the agent **preinstalled**
6. Select **Next**, then choose a **policy template** (existing, default, or custom)
7. Select **Next**, then **Review permissions** and grant admin consent if appropriate
8. Select **Next**, then **Publish**

### MCP tool governance is a separate queue

After a developer registers a tool such as a remote MCP server, an admin reviews it at **Microsoft 365 admin center > Agents > Tools > Requests**, then selects **Approve** or **Reject**. Only the **AI Administrator** and **Global Administrator** roles meet both requirements (page access plus the ability to grant tenant-wide consent).

### Stakeholders in Approval
- Administrators (gatekeepers)
- Business owners (provide context)
- Security and compliance officers (minimize risk)
- Document every decision (e.g., SharePoint list)

### The Agent Registry (replaces the older "Agent inventory tab")

**Portal path: admin.microsoft.com > Agents > All agents > Registry**

Three tenant-wide summary tiles: **Total agents**, **Agents without owners**, and **Unmanaged agents** (agents created or managed outside Agent 365, without its risk protection and observability).

**Registry filters:** Status, Publisher Type, Channel (Copilot, Teams, Outlook, Microsoft 365 apps, SharePoint), Platform, and Data source (Embedded knowledge, Fine-tuned models).

**Registry actions:** Refresh, Export (to CSV), Add agent (upload an agent manifest ZIP), Manage pinned agents, Customize view, and Search.

**Pinning limits:** admins can pin a maximum of **three agents** for end users; the administrator has three slots reserved per user. End users **cannot** unpin administrator-pinned or Microsoft-pinned agents. After pinning, it can take up to **six hours** for end users to see the agent pinned. An agent must be deployed and not blocked before it can be pinned.

**Programmatic access:** Agent Registry data is available through Microsoft Graph APIs, currently **in preview** -- `GET packages` (list all agents in the tenant) and `GET` package details. The API works with the AI Admin role.

**Draft agents:** currently, draft agents can only be viewed from Copilot Studio. Draft agent support for Agent Builder, Foundry, and SharePoint is not currently available. The Agent Registry Overview card shows only the **top 5** most-used agent platforms; go to the Registry tab to see all of them.

### The agent details fly-out pane

Up to **ten tabs**, shown conditionally based on agent capability: **Details, Users, Data & Tools, Security, Permissions, Certification, Activity, Agent instances, Connected Agents, and Computer use**.

**Available agent actions:** Install, Uninstall, **Block**, Update in store, and Pin for users.

**Availability and installation are INDEPENDENT settings on the Users tab:**
- **Installed for** controls which users automatically have the agent pre-installed: Just me, Entire organization, or Specific users/groups
- **Available to** controls which users can install and use it: No users can install, All users can install, or Specific users/groups can install
- If you install an agent to the entire organization, it is automatically installed **regardless** of its availability scope

**A Microsoft E7 or Agent 365 license is required** to see the **Risks** column in the Agent Registry, the agent's **Security** tab details, and the agent's **Activity** tab details.

**Connected Agents:** an admin can connect up to **10** agents to a selected agent, excluding agents added by the agent's maker.

### The Agents Overview dashboard

**Portal path: admin.microsoft.com > Agents > Overview**

**Four hero metrics:** **Agent registry** (total agents in the catalog), **Active users** (unique users who sent a prompt and received a response in the last 30 days), **Agent run-time** (total hours worked by agents in the last 30 days), and **Registry sync** (external connected platforms scanned).

**Four governance action cards:** **Pending Requests for Agents** (Manage requests navigates to All agents > Requests), **Agents at risk**, **Agents without owners**, and **Agents with exceptions**.

**Documented agent risk types and severities** (signals aggregate from Microsoft Entra, Microsoft Defender, and Microsoft Purview):

| Risk type | Severity |
|-----------|----------|
| Shadow agent | Critical |
| No owner assigned | Critical |
| Excessive permissions | Critical |
| Security misconfiguration | High |
| Prompt injection | High |
| Sensitive data access | High |
| Conditional access violation | High |
| Pending approval | Medium |
| Operational exceptions | Medium |
| Compliance/retention gap | Medium |

### Agents > Settings -- five configuration areas

**Portal path: admin.microsoft.com > Agents > Settings**

1. **Agent management rules** -- exactly two rule-based bulk actions today: **Install Microsoft agents** (bulk-install Microsoft first-party agents tenant-wide) and **Reassign ownerless agents created with Agent Builder to manager** (transfers ownership to the previous owner's manager per the Microsoft Entra ID hierarchy). The reassignment rule is supported **ONLY** for agents created with Agent Builder.
2. **Allowed agent types** -- three toggles: Allow apps and agents built by Microsoft, built by your organization, and built by external publishers. **Exam trap:** agents built by Microsoft remain **VISIBLE** to users even when that setting is disabled; users simply cannot install them.
3. **Security templates** (policy templates)
4. **Sharing** -- All users, No users, or Specific users. **Exam trap:** only agents built with Agent Builder are governed by the Sharing control, and under **No users** users can **STILL** share directly with specific individuals.
5. **User access** -- All users (the default), No users, or Specific users/groups

**Alternate legacy path that still exists:** Microsoft 365 admin center > **Copilot > Settings > Data access > Agents**. This page configures who can access agents and which types they can install, and includes a **Manage all agents** link to Agents > All agents. Both paths are current; the **Agents > Settings** path is the fuller surface.

### Agent Store (the user-facing storefront)

**Agent Store** is the central hub inside the Microsoft 365 Copilot app where users discover and install agents. Users reach it in the Microsoft 365 Copilot app by selecting **Agents > All agents**. Admin-approved agents built in the tenant appear under **Agents > All agents > Built by your org**.

**Four inclusion methods:** deploy prebuilt agents (admin), create and publish with Copilot Studio (maker and admin), bring agents from external platforms (developer and admin), and integrate an agent with the Agent 365 SDK (developer and admin).

> **Naming rule.** "Integrated apps" is the retired name for this management surface -- SharePoint documentation states the Agents section of the Copilot Control System is "formerly known as integrated apps". "Organizational catalog" survives as the submission target that admins approve into the Agent Store "Built by your org" collection.

### Governance Policies

**Copilot Control System** remains the current umbrella framework name for Copilot and agent governance, with three pillars: **Security and governance**, **Management controls**, and **Measurement and reporting**. Its agent surface is now **admin.microsoft.com > Agents**:
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

### Division of labor between the two admin centers

The Domain 3 objective explicitly names both the Microsoft 365 admin center **and** the Microsoft Power Platform admin center. Know which controls live where.

| Built with | Managed primarily in | Notes |
|-----------|---------------------|-------|
| **Agent Builder, SharePoint** | Microsoft 365 admin center | |
| **Copilot Studio** | **Power Platform admin center** | Finer-grained controls for enterprise scenarios. Copilot Studio agents **still require Microsoft 365 admin center approval** to reach the tenant-wide Microsoft 365 Copilot or Teams catalog. |

**Copilot Studio agent controls that live ONLY in the Power Platform admin center:** Data Loss Prevention (DLP) policies to block publishing through specific channels, **Editor** and **Viewer** sharing roles, and block-or-limit-sharing rules set at the managed environment or environment group level.

The Power Platform admin center hosts a **Copilot area (Copilot hub)** for usage and cost insights and governance controls, plus **Power Platform inventory**, which gives tenant admins a unified view of all agents, apps, and flows built on Power Platform. **Power Platform inventory includes all agents created in Copilot Studio AND all agents created in Agent Builder.**

**Copilot Studio agents integrate with Agent 365 automatically across four dimensions:** identity (an Agent ID is created automatically), registry (the agent appears in the agent registry automatically), approvals (pre-approved via Power Platform admin center policies such as DLP and advanced connector policies, with additional approval required to add the agent to the tenant-wide Teams or Microsoft 365 Copilot catalog), and observability (telemetry flows to the Agent 365 observability backend automatically).

**Orchestration modes** are reported as either **Classic** (topic-based dialog trees) or **Generative** (the model dynamically selects topics and tools).

### Compliance Monitoring
- Portal path: **purview.microsoft.com > Solutions > Audit**
- Filter with the **Activities - operation names** field; the operation for Microsoft-developed Copilots is **CopilotInteraction**
- Schedule periodic compliance reviews (quarterly): audit all active agents, permissions, usage patterns

---

## Unit 7: Monitor and Manage the Agent Lifecycle

### Monitoring Agent Usage and Performance

**Both agent usage reports are reached at: admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot > Agents.**

**There are TWO agent usage reports and they differ in status. Know both.**

| Report | Status | Coverage | Latency |
|--------|--------|----------|---------|
| **Microsoft 365 Copilot Agent usage report** (original) | **GA** | **EXCLUDES** SharePoint agents and agents built by Microsoft and Microsoft partners | Up to **72 hours** |
| **Microsoft 365 Copilot Agents usage report** (new) | **PREVIEW** | Declarative, SharePoint, **and** custom engine agents, including agents built by the org, Microsoft, and Microsoft partners | Shows usage **within an hour** |

- Track: user adoption levels, performance metrics, error tracking
- Use filters: date range, department, user group
- Export to Excel for deeper analysis

### Per-agent Activity tab

The **Activity** tab in the agent details pane reports **Active users**, **Sessions** (a new session starts after **30 minutes of inactivity**), **Exceptions** (sessions that had an error), and **Agent run-time**, defaulting to the last 30 days.

**Activity metrics are currently supported only for Agent Builder, SharePoint, and Microsoft 365 Agents Toolkit agent types.** Seeing Activity tab details also requires a Microsoft E7 or Agent 365 license.

### Operational Insights
- Permission usage (scale back unused write permissions to read-only)
- Cross-service dependencies (identify which backend services agents rely on)
- Trend analysis (steady growth, seasonal peaks, unexpected drops)
- **Automate agent lifecycle management with policy-based rules** reached GA on **June 2, 2026**

### Agent Lifecycle Stages
1. **Creation:** set guardrails, ensure no unnecessary permissions
2. **Approval and deployment:** communicate to users
3. **Maintenance:** update for new business processes; monitor stability and compliance
4. **Block:** prevents all users from accessing the agent
5. **Removal:** removes from inventory entirely (first-party or external agents can be re-acquired from store)

### Block versus Remove or Uninstall (a tested distinction)

**Portal path: admin.microsoft.com > Agents > All agents > [select agent]**

| Action | Effect |
|--------|--------|
| **Block** | Prevents any user in the tenant from accessing the agent **AND removes it from users who already installed it** |
| **Uninstall / Remove** | Takes the agent out of the inventory, but the agent **can be re-added** by acquiring it from the store. Removal applies only to first-party or external agents; admins can only remove **shared agents and custom LOB agents**. |

**Remember the blocking scope split:** blocking an Agent Builder or Copilot Studio agent affects Microsoft 365 Copilot **and** other host products such as Outlook and Teams. Blocking a SharePoint or Microsoft Foundry agent affects only **Microsoft 365 Copilot Chat**.

Best practice: communicate retirement plans 30 days in advance.

### Agent instances -- a distinct lifecycle concept

Agents tagged as **"AI teammate"** in the Agent Registry are **templates** from which the organization instantiates one or more **agent instances**. Each instance receives its own Microsoft Entra-backed agent identity, license, mailbox, OneDrive, and Teams presence. Instance-level lifecycle actions are **Block**, **Unblock**, and **Delete**.

**Agent activation is a distinct workflow from agent publishing.** Users request a template agent from the Teams app store or Agent Store, the admin approves at **Agents > All agents > Requests**, then selects scope, chooses a default policy template that auto-assigns the Agent 365 license, reviews MCP server and tool permissions, applies policies, and activates.

### Dashboards

**Microsoft 365 admin center:**
- Portal path: **Reports > Usage > Microsoft 365 Copilot > Agents**
- Also **Agents > Overview** for the governance dashboard and hero metrics
- Shows: usage summaries, error and health indicators, top agents

**Power Platform admin center:**
- Portal path: **Power Platform admin center > Copilot** (Copilot hub), plus **Power Platform inventory**
- Shows: agent consumption, performance, and unified inventory of agents, apps, and flows

### Who Can See Reports
- **AI Administrator** -- the role Microsoft names for accessing Copilot reports in the Microsoft 365 admin center
- Global Administrator (use sparingly; least privilege first)
- Exchange Administrator, SharePoint Administrator
- Teams Administrator, Teams Communications Administrator
- Reports Reader
- Usage Summary Reports Reader (no user details)
- Global Reader (no user details)
- User Experience Success Manager (no user details)

For **agent governance actions** (approving requests, assigning ownership), only **AI Administrator** and **Global Administrator** qualify. Every other role in this list is view-only for agents.

### Troubleshooting Common Agent Issues
- **Connectivity problems:** check service health dashboards
- **Permission errors:** admin.microsoft.com > **Agents > All agents** > select the agent > **Permissions** tab. ("Settings > Integrated apps" is the retired surface -- the Agents section of the Copilot Control System is "formerly known as integrated apps".)
- **Performance degradation:** review dashboards for usage spikes or error logs
- Troubleshooting flow: check service health > review permission set > examine logs for failed API calls > resolve (renew permissions, reconfigure connection)
