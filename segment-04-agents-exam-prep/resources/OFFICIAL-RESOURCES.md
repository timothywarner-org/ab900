# Segment 4: Agents and Exam Prep - Official Resources

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Official Microsoft Documentation

### Agents Overview
- **Microsoft 365 Copilot Agents**
  - https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-overview
  - **Definition:** "Agents are scoped or focused versions of Microsoft 365 Copilot that act as AI assistants and can automate business processes"
  - Customized implementations for specific organizational needs
  - Integration with organizational data sources

### Agent Types

Microsoft documents **two** primary approaches. Everything else is a variation.

#### Declarative Agents
- Hosted in Microsoft 365; **NO** additional hosting required
- Use Copilot's own AI infrastructure, model, and orchestrator
- Designed for individual use
- Do **NOT** support proactive interactions; they rely on user-initiated interactions
- Run in Microsoft 365 Copilot and Microsoft 365 apps such as Teams, Word, Excel, and Outlook
- Inherit Microsoft 365 compliance
- Built with **Agent Builder**, **SharePoint**, Copilot Studio, or the Microsoft 365 Agents Toolkit

#### Custom Engine Agents
- Require hosting **outside** Microsoft 365
- Fully customizable, including choice of AI models and orchestration
- Support individual use **and** group collaboration
- **DO** support proactive interactions and can trigger actions without direct user input
- Available for Microsoft 365 and external apps
- The builder must ensure their own compliance, Responsible AI practices, and security. They do **NOT** automatically inherit Microsoft 365 compliance.

#### Microsoft-installed agents: Researcher and Analyst
- Generally available since **June 2, 2025**. They are GA, **NOT** preview.
- Require a Microsoft 365 Copilot license. There is **NO** separate add-on for either.
- The only agents Microsoft currently deploys via the "Microsoft-installed agents and features" method: preinstalled and pre-pinned for all licensed users. End users cannot unpin Researcher.
- **Researcher** performs deep multi-step research combining Microsoft Graph work data, Copilot connectors, and the Bing index. Limit: 25 queries per user per month. It adheres to the tenant-level **Allow web search in Copilot** toggle, and there is **NO** granular per-site allow list for standard Researcher.
- **Analyst** performs advanced data analysis using chain-of-thought reasoning and is better suited than Researcher for Microsoft Excel tasks.
- They are **NOT** governed by agent settings. Microsoft's wording: they "are part of the core Copilot chat experience and will not fall under any agent-related settings." They remain under **Tools** in Copilot Chat even when agents are disabled.
- To disable, use the tenant-wide **Block** action. The **Edit users** panel is disabled, so per-user assignment is not possible.

#### Naming corrections
- **Agent Builder in Microsoft 365 Copilot**, not "Copilot Studio lite"
- **Microsoft Copilot Studio**, not "Power Virtual Agents"
- **Microsoft 365 Agents Toolkit**, not "Teams Toolkit"
- **Microsoft Foundry** in agent contexts, not "Azure AI Studio"
- **Agent Store** is the user-facing storefront; "organizational catalog" survives only as the submission target

#### Agent Use Cases
- **Help desk automation:** Create tickets, track issues
- **Employee information lookup:** Query HR systems
- **Research assistants:** Gather and synthesize information
- **Data analysts:** Analyze data and generate insights
- **Custom business processes:** Organization-specific workflows

### Building Declarative Agents
- **Build Declarative Agents Guide**
  - https://learn.microsoft.com/microsoft-365/copilot/extensibility/build-declarative-agents
  - Comprehensive guide for creating agents

- **Prerequisites:**
  - Sandbox M365 organization with Copilot (TAP membership) OR production with Copilot license
  - Visual Studio Code installed
  - Microsoft 365 Agents Toolkit extension (v6.0+)
  - Familiarity with Teams Store validation guidelines

- **Creation Process:**
  1. **Initialize:** Open Agents Toolkit in VS Code, then select "Create a New Agent/App"
  2. **Select Template:** Choose "Declarative Agent", then "No Action" for a basic agent
  3. **Configure:** Name project and select storage location
  4. **Provision:** Use Lifecycle pane to provision agent

- **Testing:**
  - Access via m365.cloud.microsoft/chat
  - Select agent from conversation drawer
  - Verify functionality and responses

### Agent Components

#### Instructions and Persona
- Define agent purpose and behavior
- Set tone and communication style
- Specify capabilities and limitations
- Create clear boundaries

#### Knowledge Configuration

Connect the agent to data sources: SharePoint sites, libraries, and files; OneDrive files and folders; embedded (uploaded) files; public website URLs; Teams chat URLs; and Copilot connectors.

**Limits differ by platform, and the exam likes that distinction:**

| Platform | Knowledge limits |
|----------|------------------|
| **Agent Builder** | 20 knowledge sources total per agent; up to 100 SharePoint files, folders, or sites; 1 SharePoint list; 50 OneDrive files; 20 embedded files; 4 public website URLs; 5 Teams chat URLs. Description field 1,000 characters; Instructions field 8,000 characters. |
| **SharePoint agents** | 20 source items total, in any combination of sites, libraries, folders, and files. If you need more, nest the data at a higher level and source the agent there. |
| **Copilot Studio** | 500 knowledge sources per agent across all types; 8,000 characters of instructions; 500 files uploaded; 512 MB file upload size; 100 skills; 1,000 topics in Dataverse environments; 200 trigger phrases per topic; 25 SharePoint site URLs with generative orchestration. |

**Public website rules in Agent Builder:** maximum 4 URLs, URLs must be only two levels deep, and URLs cannot contain query parameters.

**Starter prompts.** Microsoft documents **NO** maximum. The published statement is only that there is no minimum number of starter prompts. Do **NOT** assert a ceiling in course materials.

**Capabilities enabled by default in Agent Builder:** **Code interpreter** (UI label "Create documents, charts, and code") and **image generator** (UI label "Create images"), both under **Capabilities** on the **Configure** tab.

**Licensing trap on knowledge sources.** Code interpreter, image generator, web search, and scoped web search do **NOT** require a Copilot license or metered usage. Copilot connectors, SharePoint, OneDrive, embedded file content, and Dataverse **DO** require a license or metered usage. Email, People, Teams messages, and Teams meetings require a Copilot **license** specifically; metered usage is not sufficient.

**Grounding caveat.** Agent Builder's "Only use specified sources" toggle **prioritizes** the designated sources rather than fully blocking general AI knowledge. Microsoft explicitly states Agent Builder cannot fully block general knowledge; use Copilot Studio for stricter control.

**Two more gotchas.** If **Restricted SharePoint Search** is enabled in the tenant, SharePoint cannot be used as a knowledge source for a declarative agent. And Purview **Information Barriers are NOT supported on embedded files**, so any user who can reach the agent sees responses grounded in that content.

#### Actions and Skills
- Power Automate flows
- Microsoft Graph API calls
- Custom connectors
- Pre-built certified connectors (Salesforce, ServiceNow, Zendesk, etc.)

#### Conversation Starters
- Pre-defined prompts to guide users
- Common questions and tasks
- Help users discover capabilities

### Agent Extensibility
- **Business Applications Overview**
  - https://learn.microsoft.com/microsoft-365/copilot/extensibility/overview-business-applications
  - Actions creation through Power Platform
  - Built-in actions (Power Automate, connectors)
  - Development paths for custom actions

### Agent Governance and Management

#### The Agents workload in the Microsoft 365 admin center

The Agents workload is a **top-level node** in the left navigation, **NOT** nested under Copilot. It has four sub-pages:

| Page | Contents |
|------|----------|
| **Agents > Overview** | Dashboard with hero metrics and governance action cards |
| **Agents > All agents** | Contains the **Registry** and **Requests** tabs |
| **Agents > Tools** | MCP server registration and approval |
| **Agents > Settings** | Agent policy configuration |

Hero metrics on Overview: **Agent registry** (total agents), **Active users** (unique users who sent a prompt and got a response in the last 30 days), **Agent run-time** (total agent hours in the last 30 days), and **Registry sync** (external connected platforms scanned).

Governance action cards: **Pending Requests for Agents**, **Agents at risk**, **Agents without owners**, and **Agents with exceptions**.

#### Approval workflow

**Path: admin.microsoft.com > Agents > All agents > Requests.** Generally available since July 15, 2026.

Three request states: **Pending review**, **Pending update**, and **Pending activate**. The Requests list filters by State and by Channel (Microsoft Teams, Copilot, Office, Outlook, Word, Excel, PowerPoint).

The Pending review flow: sign in to admin.microsoft.com, go to **Agents** > **All agents** > **Requests**, select the agent and review capabilities, data sources, security and permissions, and custom actions, select **Publish to store**, choose users or groups who can install it, optionally choose users who get it preinstalled, select **Next**, choose a policy template, select **Next**, review permissions and grant admin consent if appropriate, select **Next**, then **Publish**.

For **Pending update**, the button reads **Update in store**, not Publish to store. Users keep the previous version until approval.

**Reject submission** is available from the ellipses to the right of the agent name.

A fourth state, **Allow user to install**, appears when a user requests a blocked Microsoft-built agent. The admin must select **Unblock agent** first, then Approve or Reject.

**Roles.** Only **AI Administrator** and **Global Administrator** can approve requests or assign ownership. Global Reader, AI Reader, Security Administrator, Security Reader, Reports Reader, and User Experience Success Manager can view but cannot act.

#### Agent Registry

**Path: admin.microsoft.com > Agents > All agents > Registry.**

Three summary tiles: **Total agents**, **Agents without owners**, and **Unmanaged agents** (created or managed outside Agent 365, without its risk protection and observability).

Filters: Status, Publisher Type, Channel, Platform, and Data source. Actions: Refresh, Export to CSV, Add agent (upload a manifest ZIP), Manage pinned agents, Customize view, and Search.

**Pinning limit:** admins can pin a maximum of **three** agents for end users, with three slots reserved per user. End users cannot unpin admin-pinned or Microsoft-pinned agents. Allow up to six hours for the pin to appear. An agent must be deployed and not blocked before it can be pinned.

#### Agent settings

**Path: admin.microsoft.com > Agents > Settings.** Five areas: **Agent management rules**, **Allowed agent types**, **Security templates**, **Sharing**, and **User access**.

- **Allowed agent types** offers three toggles: allow apps and agents built by Microsoft, by your organization, and by external publishers. **Trap:** Microsoft-built agents remain **visible** even when the setting is disabled; users simply cannot install them.
- **User access** options: All users (the default), No users, Specific users/groups.
- **Sharing** options: All users, No users, Specific users. **Trap:** only agents built with Agent Builder are governed by Sharing, and under "No users" users can **STILL** share directly with specific individuals.
- **Agent management rules** support exactly two bulk actions today: **Install Microsoft agents**, and **Reassign ownerless agents created with Agent Builder to manager** (which follows the Microsoft Entra ID hierarchy). The reassignment rule works **ONLY** for Agent Builder agents.

An alternate legacy path to agent access settings still exists at **Copilot** > **Settings** > **Data access** > **Agents**, which includes a "Manage all agents" link to Agents > All agents. Both paths are current; the Agents > Settings path is the fuller surface.

#### Agent actions and their scope

The agent details fly-out exposes up to ten tabs, shown conditionally: Details, Users, Data & Tools, Security, Permissions, Certification, Activity, Agent instances, Connected Agents, and Computer use. Available actions: Install, Uninstall, Block, Update in store, and Pin for users.

**Block versus Remove.** Block prevents any user in the tenant from accessing the agent **AND** removes it from users who already installed it. Uninstall/Remove takes it out of inventory but it can be re-acquired from the store; admins can only remove shared agents and custom LOB agents.

**Blocking scope trap.** Blocking an agent created with Agent Builder or Copilot Studio affects availability in Microsoft 365 Copilot **and** other hosts such as Outlook and Teams. Blocking an agent created with SharePoint or Microsoft Foundry affects **only** Microsoft 365 Copilot Chat.

**Availability versus installation** are independent settings on the Users tab. **Installed for** controls automatic pre-installation (Just me, Entire organization, Specific users/groups). **Available to** controls who can install and use it. Installing to the entire organization installs automatically regardless of availability scope.

#### MCP tool governance

Separate from agent governance. After a developer registers a tool such as a remote MCP server, an admin reviews it at **Agents** > **Tools** > **Requests**, then selects Approve or Reject. Only AI Administrator and Global Administrator meet both requirements: page access plus the ability to grant tenant-wide consent.

#### Monitoring

The per-agent **Activity** tab reports Active users, Sessions (a new session starts after 30 minutes of inactivity), Exceptions (sessions that had an error), and Agent run-time, defaulting to the last 30 days. Activity metrics are currently supported only for Agent Builder, SharePoint, and Microsoft 365 Agents Toolkit agent types.

**There are two agent usage reports and they differ in status.** The original **Microsoft 365 Copilot Agent usage report** is generally available but excludes SharePoint agents and agents built by Microsoft and Microsoft partners, with up to 72 hours of latency. The newer **Microsoft 365 Copilot Agents usage report** is **in preview**, covers declarative, SharePoint, and custom engine agents including those built by the org, Microsoft, and partners, and shows usage within an hour. Both are at **Reports** > **Usage** > **Microsoft 365 Copilot** > **Agents**.

**Monitoring gap.** The Researcher FAQ states there is **NO** existing reporting tool for agents like Researcher and Analyst, and that by default the **content** of Researcher sessions is not accessible to admins or compliance tools. Admins see usage metrics, not conversation content, unless a user explicitly submits feedback including session data.

**Licensing gate.** A Microsoft 365 E7 or Agent 365 license is required to see the Risks column in the Registry, the Security tab details, and the Activity tab details.

### Copilot Studio
- **Copilot Studio Portal**
  - https://copilotstudio.microsoft.com/
  - Web-based agent development environment
  - Visual builder for agents
  - Integration with Power Platform

- **Branding note:** Power Virtual Agents is retired. The product is **Microsoft Copilot Studio**. Do not use the old name in course materials or distractors.

- **Division of labor between admin surfaces:**
  - Agents built with Microsoft 365 Copilot tooling (Agent Builder, SharePoint) are managed primarily through the **Microsoft 365 admin center**
  - Agents built with **Copilot Studio** are managed through the **Power Platform admin center**, which offers finer-grained enterprise controls
  - Copilot Studio agents still require Microsoft 365 admin center approval to reach the tenant-wide Microsoft 365 Copilot or Teams catalog
  - Controls that live **only** in the Power Platform admin center: DLP policies blocking publishing through specific channels, Editor and Viewer sharing roles, and block-or-limit-sharing rules at the managed environment or environment group level

- **Deprecation:** after the end of June 2026, the Copilot Studio for Teams app can no longer create classic chatbots; it redirects makers to the Copilot Studio web app.

## Microsoft Learn Training Modules

### Agent Development
- **Microsoft 365 Copilot Extensibility**
  - Documentation on extending Copilot with agents
  - Plugin development
  - Integration patterns

### Power Platform Training
- **Power Platform Fundamentals (PL-900)**
  - https://learn.microsoft.com/credentials/certifications/power-platform-fundamentals/
  - Foundation for understanding Power Platform integration

- **Power Platform Functional Consultant (PL-200)**
  - https://learn.microsoft.com/credentials/certifications/power-platform-functional-consultant-associate/
  - Advanced Power Platform skills for agent development

## AB-900 Exam Preparation

### About the AB-900 Exam

- **Certification:** Microsoft 365 Certified: Copilot and Agent Administration Fundamentals
- **Exam Code:** AB-900
- **Status: GENERALLY AVAILABLE.** AB-900 is **NOT** in beta. It exited beta on January 28, 2026, and the live certification and exam pages carry no "(beta)" designation anywhere. Scores are immediate, a full retake policy is published, and a free practice assessment is live. Remove every reference to beta scoring delays or beta discount codes from course delivery.
- **Skills measured as of:** July 22, 2026
- **Duration:** 45 minutes of exam time. Fundamentals exams carry **65 minutes** of seat duration, which includes reviewing instructions, accepting the Candidate Agreement, and leaving comments. Teach 45 as the working clock and 65 as the time to block off.
- **Passing Score:** 700 or greater. Scores are reported on a scale where 1000 is the maximum.
- **Question count:** Microsoft publishes **NO** AB-900-specific number. The official statement is generic: most Microsoft Certification exams typically contain between 40 and 60 questions, though the number can vary. Third-party sites asserting "AB-900 has 40-60 questions" are restating this generic sentence.
- **Language:** English only as of July 22, 2026. If the exam is not available in a candidate's preferred language, they can request an additional 30 minutes.
- **Format:** Proctored, and may have interactive components
- **Retakes:** 24 hours after the first attempt. Wait times increase for subsequent retakes.
- **Renewal: NOT required.** Microsoft states verbatim: "Fundamentals certifications do not expire." The annual renewal assessment applies only to associate, expert, and specialty certifications. The study guide's own boilerplate renewal row mentions those tiers, which learners routinely misread as applying to AB-900.
- **Microsoft Learn during the exam: NOT available.** Microsoft states the in-exam Learn resource "is only available on role-based exams, not fundamentals or Microsoft Office Specialist (MOS) exams."
- **Breaks:** unscheduled breaks are permitted, but the clock keeps running and you cannot return to any question viewed before the break. Five minutes of break time is built into the duration, with questions removed to accommodate it.
- **Scope rule (verbatim):** "Most questions cover features that are general availability (GA). The exam may contain questions on Preview features if those features are commonly used." Localized versions update roughly eight weeks after the English version.

### Exam Registration
- **Scheduling:** through Pearson VUE, or through Certiport for students and educators
- **Price:** varies by the country or region in which the exam is proctored. Microsoft publishes **NO** single global price.
- **Certification page**
  - https://learn.microsoft.com/credentials/certifications/copilot-and-agent-administration-fundamentals/
  - Official exam information, skills measured, and registration links

### Exam Sandbox
- https://aka.ms/examdemo
- Interact with the real exam question types and UI. Note the secure browser is **NOT** enabled in the sandbox.

### Official Study Resources

#### Study Guide
- **AB-900 Study Guide**
  - https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900
  - Detailed skill breakdown with percentages:
    - Core Microsoft 365 Features and Objects (30-35%)
    - Data Protection and Governance (35-40%)
    - Copilot and Agent Administration (25-30%)

#### Certification Page
- **M365 Copilot and Agent Administration Fundamentals Certification**
  - https://learn.microsoft.com/credentials/certifications/copilot-and-agent-administration-fundamentals/
  - Certification overview and benefits

#### Practice Assessments
- **Status: LIVE.** A free official AB-900 practice assessment is available on Microsoft Learn, listed on the practice assessments availability table as "AB-900: Copilot and Agent Administration Fundamentals".
- https://learn.microsoft.com/credentials/certifications/practice-assessments-for-microsoft-certifications
- Microsoft notes practice assessment questions are **NOT** the same as exam questions and are **NOT** illustrative of exam length.

### Study Plan for AB-900

#### Week 1-2: Core M365 Services (Domain 1: 30-35%)
- [ ] Microsoft 365 architecture
- [ ] Exchange Online administration
- [ ] SharePoint management and Advanced Management
- [ ] Teams administration
- [ ] License management
- [ ] Microsoft Entra ID and authentication
- [ ] Conditional access
- [ ] Privileged Identity Management
- [ ] Zero Trust principles

#### Week 3-4: Data Protection (Domain 2: 35-40%)
- [ ] Microsoft Purview overview
- [ ] Information Protection and sensitivity labels
- [ ] Data Loss Prevention policies
- [ ] Insider Risk Management
- [ ] Communication Compliance
- [ ] Data Security Posture Management
- [ ] Compliance Manager
- [ ] SharePoint oversharing remediation
- [ ] Copilot data access mechanisms

#### Week 5-6: Copilot Administration (Domain 3: 25-30%)
- [ ] Copilot architecture
- [ ] Licensing models (monthly, pay-as-you-go)
- [ ] License assignment
- [ ] Feature management
- [ ] Billing policies
- [ ] Usage monitoring (Viva Insights dashboard)
- [ ] Prompt management
- [ ] Copilot security and governance

#### Week 7: Agents
- [ ] Agent types (Researcher, Analyst, Custom)
- [ ] Declarative agent creation
- [ ] Agent configuration
- [ ] Agent approval processes
- [ ] Agent governance
- [ ] Hands-on agent building

#### Week 8: Review and Practice
- [ ] Review all domains
- [ ] Take the free official practice assessment on Microsoft Learn
- [ ] Hands-on labs in test tenant
- [ ] Review weak areas
- [ ] Exam strategies

### Hands-On Labs for Agents

#### Lab 1: Create First Declarative Agent
1. Install Visual Studio Code
2. Install Microsoft 365 Agents Toolkit extension
3. Create new declarative agent project
4. Define agent instructions and persona
5. Add conversation starters
6. Configure knowledge sources (upload FAQs)
7. Test in development environment
8. Provision to M365 tenant
9. Test via m365.cloud.microsoft/chat

#### Lab 2: Agent with Actions
1. Create new agent in Copilot Studio
2. Define agent purpose and capabilities
3. Create Power Automate flow
4. Add flow as agent action
5. Configure action parameters
6. Test action invocation
7. Handle action responses
8. Add error handling
9. Deploy to organization

#### Lab 3: Agent Governance
1. Access Power Platform admin center
2. Review agent creation policies
3. Configure user permissions for agent building
4. Set up approval workflows
5. Enable audit logging for agents
6. Create DLP policy that includes agents
7. Monitor agent usage
8. Review compliance reports

#### Lab 4: Agent Analytics
1. Access agent analytics dashboard
2. Review conversation metrics
3. Identify common queries
4. Analyze success vs. escalation rate
5. Review user satisfaction scores
6. Identify improvement areas
7. Update agent knowledge based on findings

### Exam Tips

#### Question Types
- **Multiple choice:** Single correct answer
- **Multiple response:** Select all that apply
- **Interactive scenarios:** Hands-on simulations
- **Drag and drop:** Ordering or matching
- **Case studies:** Multi-question scenarios

#### Strategies
1. **Read Carefully:** Watch for "EXCEPT," "NOT," "LEAST"
2. **Manage Time:** 45 minutes for all questions
3. **Eliminate Wrong Answers:** Narrow choices
4. **Mark for Review:** Come back to uncertain questions
5. **Trust First Instinct:** Do not overthink
6. **Use Process of Elimination:** Remove clearly wrong options
7. **Look for Specifics:** Scenario details matter

#### Common Pitfalls
- Confusing licensing models
- Mixing up agent types
- Forgetting 24-hour license activation delay
- Not understanding Copilot's permission model
- Mixing up DLP and sensitivity labels
- Overlooking SharePoint Advanced Management features
- Not knowing Compliance Manager's role

### What to Memorize

#### Key Numbers
- **Passing score:** 700 or greater, out of 1000
- **Exam duration:** 45 minutes of exam time, 65 minutes of seat time
- **Retake wait:** 24 hours after the first attempt
- **License activation:** up to 24 hours
- **Copilot usage report latency:** approximately 48 hours
- **Copilot Credit rate:** 0.01 USD per credit
- **SharePoint agent prompt cost for an unlicensed user:** 12 credits (2 generative answer + 10 tenant graph grounding)
- **Capacity pack:** 200.00 USD per pack per month for 25,000 credits
- **Credits report alert threshold:** 2,000 credits per user
- **Researcher usage limit:** 25 queries per user per month
- **Copilot Business seat maximum:** 300
- **Copilot seat minimum:** none
- **Pay-as-you-go billing policies per tenant:** 50
- **Copilot credit policies per tenant:** 10
- **Admin-pinned agents:** maximum of 3 per user
- **Audit (Standard) retention:** 180 days

#### Admin Centers and URLs
- Microsoft 365 admin center: admin.microsoft.com (admin.cloud.microsoft also resolves)
- Microsoft Entra admin center: entra.microsoft.com
- **Microsoft Purview portal: purview.microsoft.com.** compliance.microsoft.com is **RETIRED**; do not use it.
- Microsoft Defender portal: security.microsoft.com
- SharePoint admin center: admin.microsoft.com/sharepoint
- Microsoft Teams admin center: admin.teams.microsoft.com
- Exchange admin center: admin.exchange.microsoft.com
- Copilot Studio: copilotstudio.microsoft.com
- Power Platform admin center: admin.powerplatform.microsoft.com
- Microsoft 365 Copilot Chat: m365.cloud.microsoft/chat

#### Paths worth memorizing verbatim
- Agent approval: admin.microsoft.com > **Agents** > **All agents** > **Requests**
- Agent registry: admin.microsoft.com > **Agents** > **All agents** > **Registry**
- MCP tool approval: admin.microsoft.com > **Agents** > **Tools** > **Requests**
- Copilot billing: admin.microsoft.com > **Copilot** > **Billing & usage**
- Copilot reports: admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot**
- Data access governance: SharePoint admin center > **Reports** > **Data access governance**
- Content search: purview.microsoft.com > **Solutions** > **eDiscovery** > **Content Search**
- Data explorer: purview.microsoft.com > **Solutions** > **Information Protection** > **Explorers** > **Data explorer**

#### Domain Percentages (skills measured as of July 22, 2026)
- Domain 1, Identify the core features and objects of Microsoft 365 services: 30-35%
- Domain 2, Understand data protection and governance tasks for Microsoft 365 and Copilot: 35-40% (heaviest)
- Domain 3, Perform basic administrative tasks for Copilot and agents: 25-30%

The July 22, 2026 change log lists **three** subsections as Minor changed and **zero** as Major: "Identify the core objects of Microsoft 365 services", "Identify the core security features of Microsoft 365 services", and "Identify and monitor oversharing in SharePoint in Microsoft 365".

#### License Prerequisites for Copilot
- Microsoft 365 E7 (includes Copilot; **NO** add-on needed), E5, E3, F1, F3
- Microsoft 365 Business Basic, Standard, or Premium
- Office 365 E1, E3, E5, or F3
- Several standalone Teams, Exchange, SharePoint, OneDrive, Planner, Project, Visio, and Clipchamp plans
- Plus the Copilot add-on, except on E7
- **No seat minimum.** 300-seat **maximum** applies only to Copilot Business and the Business-with-Copilot SKUs.

#### Purview solutions the Domain 2 objective enumerates (know all 6)
1. Microsoft Purview Information Protection
2. Microsoft Purview Data Loss Prevention (DLP)
3. Microsoft Purview Insider Risk Management
4. Microsoft Purview Communication Compliance
5. Microsoft Purview Data Security Posture Management (DSPM) for AI
6. Microsoft Purview Data Lifecycle Management

Compliance Manager, Data explorer, activity explorer, and Content search appear in the risk-identification sub-objective.

#### Agent building approaches (the two-way split)
1. **Declarative agents** -- hosted in Microsoft 365, use Copilot's model and orchestrator, individual use, **NO** proactive interactions, inherit Microsoft 365 compliance
2. **Custom engine agents** -- hosted outside Microsoft 365, fully customizable models and orchestration, individual and group use, **support** proactive interactions, builder owns compliance

#### Microsoft-installed agents
- **Researcher** -- deep multi-step research across Microsoft Graph work data, Copilot connectors, and the Bing web index. 25 queries per user per month. Adheres to the tenant web search toggle.
- **Analyst** -- advanced data analysis using chain-of-thought reasoning; better suited than Researcher for Excel tasks.
- Both require a Microsoft 365 Copilot license, are pre-pinned, and are **NOT** governed by agent settings. Disable via the tenant-wide **Block** action; **Edit users** is disabled for them.

## Real-World Scenarios

### Scenario 1: IT Helpdesk Agent
**Business Need:** Reduce helpdesk ticket volume for common issues

**Solution:**
1. Create declarative agent with IT knowledge base
2. Add instructions for friendly, helpful persona
3. Configure actions:
   - Password reset via Power Automate + Graph API
   - Ticket creation via ServiceNow connector
4. Add conversation starters:
   - "How do I reset my password?"
   - "I cannot access my email"
   - "How do I set up MFA?"
5. Publish to organization via Teams
6. Monitor usage and satisfaction
7. Iterate based on analytics

### Scenario 2: HR Onboarding Agent
**Business Need:** Streamline employee onboarding

**Solution:**
1. Create agent with onboarding knowledge
2. Connect to SharePoint onboarding site
3. Configure actions:
   - Document checklist tracking
   - Meeting scheduling
   - Benefits enrollment guidance
4. Add personalized greetings
5. Implement approval workflow for manager review
6. Deploy to new hires on day 1
7. Track completion metrics

### Scenario 3: Sales Intelligence Agent
**Business Need:** Help sales team access customer data quickly

**Solution:**
1. Create analyst agent
2. Connect to CRM (Dynamics 365/Salesforce)
3. Configure data analysis actions
4. Implement security (sales team only)
5. Add conversation starters:
   - "Show me accounts at risk"
   - "What's the pipeline for Q2?"
   - "Find opportunities closing this month"
6. Test with pilot sales users
7. Gather feedback and refine
8. Roll out to entire sales org

## Additional Certifications

### Related Certifications to Consider

#### Microsoft 365 Track
- **MS-900:** Microsoft 365 Fundamentals
  - Foundation certification for M365
- **MS-102:** Microsoft 365 Administrator
  - Advanced M365 administration

#### Security and Compliance Track
- **SC-300:** Microsoft Identity and Access Administrator
  - Deep dive into Entra ID
- **SC-400:** Microsoft Information Protection Administrator
  - Advanced Purview and data protection

#### Power Platform Track
- **PL-900:** Power Platform Fundamentals
  - Foundation for agent development
- **PL-200:** Power Platform Functional Consultant
  - Advanced Power Platform skills

#### AI Track
- **AI-900:** Microsoft Azure AI Fundamentals
  - Understanding AI concepts

## Post-Certification

### Maintain Your Skills
- Stay updated on Copilot features (monthly releases)
- Join Microsoft 365 community events
- Follow Tech Community blogs
- Attend Microsoft Ignite
- Participate in user groups

### Career Opportunities
- Microsoft 365 Administrator
- Copilot Administrator
- AI Governance Specialist
- Digital Workplace Consultant
- Modern Work Specialist

### Share Your Achievement
- Add to LinkedIn profile
- Update resume and CV
- Join Microsoft Certified community
- Mentor others studying for AB-900

## Tools and Resources

### Development Tools
| Tool | URL | Purpose |
|------|-----|---------|
| Visual Studio Code | https://code.visualstudio.com/ | Agent development |
| M365 Agents Toolkit | VS Code Extensions | Agent creation |
| Copilot Studio | https://copilotstudio.microsoft.com/ | Web-based agent builder |
| Power Automate | https://make.powerautomate.com/ | Create agent actions |

### Learning Resources
| Resource | URL | Purpose |
|----------|-----|---------|
| Microsoft Learn | https://learn.microsoft.com/ | Official training |
| Tech Community | https://techcommunity.microsoft.com/ | Forums and blogs |
| M365 PnP | https://aka.ms/m365pnp | Community resources |
| Microsoft Mechanics | https://techcommunity.microsoft.com/t5/microsoft-mechanics-blog/bg-p/MicrosoftMechanicsBlog | Video training |

### Exam Resources
| Resource | URL | Purpose |
|----------|-----|---------|
| Exam Registration | https://examregistration.microsoft.com/ | Schedule exam |
| AB-900 Exam Page | https://learn.microsoft.com/credentials/certifications/copilot-and-agent-administration-fundamentals/ | Official info |
| Practice Assessments | Microsoft Learn | Practice questions |
| Certification Profile | https://learn.microsoft.com/users/me/credentials | Track certifications |

## Community and Support

### Forums
- **Microsoft Tech Community - Copilot**
  - https://techcommunity.microsoft.com/t5/microsoft-365-copilot/bd-p/Microsoft365Copilot

- **Copilot Studio Community**
  - https://powerusers.microsoft.com/t5/Microsoft-Copilot-Studio/ct-p/PVACommunity

- **Power Platform Community**
  - https://powerusers.microsoft.com/

### Social Media
- Follow @Microsoft365 on Twitter/X
- Join Microsoft 365 LinkedIn groups
- Subscribe to Microsoft 365 YouTube channels

### Blogs to Follow
- Microsoft 365 Blog
- Tech Community Copilot Blog
- Microsoft Mechanics
- Copilot adoption blog

---

## Quick Reference: AB-900 at a Glance

### What It Certifies
- Support, secure, and protect AI-enabled M365 environments
- Manage M365 core services
- Implement security features
- Administer Copilot and agents

### Who Should Take It
- Microsoft 365 Administrators
- Copilot Administrators
- IT Professionals implementing AI
- Digital Workplace Specialists

### How to Prepare
1. Study all 3 domains (focus on Domain 2 - largest)
2. Get hands-on practice in M365 tenant
3. Use official Microsoft Learn modules
4. Review AB-900 Study Guide
5. Take the free official practice assessment on Microsoft Learn

### Exam Day
- 45 minutes of exam time, 65 minutes of seat time
- Proctored (online or testing center)
- Interactive + multiple choice
- 700 or greater to pass, out of 1000
- Results: immediate. AB-900 is generally available, NOT in beta, so there is no delayed beta scoring.

---

**Good luck with your AB-900 exam and agent development journey!**

For the latest information, visit:
- **Exam Page:** https://learn.microsoft.com/credentials/certifications/copilot-and-agent-administration-fundamentals/
- **Study Guide:** https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900

---

**Related Segments:**
- [Segment 1: Core M365 Services](../../segment-01-core-m365-services/)
- [Segment 2: Data Protection and Governance](../../segment-02-data-protection-governance/)
- [Segment 3: Copilot Administration](../../segment-03-copilot-administration/)
- [Complete AB-900 Exam Guide](../../shared-resources/references/AB-900-EXAM-GUIDE.md)
