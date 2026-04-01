# Module 4: Explore Microsoft 365 Copilot and Agents

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/explore-microsoft-365-copilot-agents/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)

---

## Unit 1: Introduction to Microsoft 365 Copilot

### Architecture
- Microsoft 365 Copilot is NOT a standalone app -- it is a collection of intelligent capabilities built into Microsoft 365 apps (Word, Excel, PowerPoint, Outlook, Teams)
- Four key components work together:
  - **Microsoft Graph** -- unified data layer connecting emails, files, meetings, chats
  - **Work IQ** -- intelligence layer that learns patterns, relationships, workflows, and preferences across everything you do; builds a "work memory"
  - **Large Language Models (LLMs)** -- hosted in Azure OpenAI Service, fine-tuned for enterprise use
  - **Orchestration Service** -- manages how prompts, Graph data, and LLMs interact

### Microsoft Graph and Work IQ
- Graph acts as the backbone -- aggregates data across Exchange Online, SharePoint, OneDrive, Teams
- **Data aggregation:** single API layer across all Microsoft 365 services
- **Relationship mapping:** models relationships between people, files, and activities (not just data storage)
- **Dynamic context:** filters information based on current activity and permissions
- **Security and compliance:** enforces RBAC, sensitivity labels, encryption, conditional access
- Advanced indexing understands meaning and intent, not just keywords (semantic search)
- Work IQ continuously analyzes work signals to anticipate needs and deliver proactive insights

### Large Language Models (LLMs)
- **Grounded prompting:** user prompts are enriched with Graph data plus system instructions before reaching the LLM
- **Isolation and security:** data never used to retrain public GPT models; tenant-isolated environment
- **Fine-tuned for business:** optimized for meeting recaps, spreadsheet analysis, contract drafting, etc.
- **Scalability:** Azure-hosted, handles 10 to 10,000+ simultaneous users

### Microsoft 365 Apps Integration
- **Native UI integration:** Copilot appears within each app natural workflow
  - Word: drafting and summarization pane
  - Excel: formulas, what-if analyses, charts via plain language
  - PowerPoint: outline to slide deck with visuals
  - Outlook: summarize threads, propose responses
  - Teams: post-meeting summaries with action items
- **Cross-app orchestration:** can pull data across apps (e.g., Excel numbers into PowerPoint)
- **User control:** users can iterate prompts, delete interaction history, provide feedback

### Copilot Orchestration Service (5-step process)
1. **Prompt intake** -- captures and classifies user request
2. **Evaluation** -- determines which data sources and plugins are needed
3. **Enrichment** -- pulls meeting notes, documents, formatting rules; creates precise prompt
4. **Execution** -- grounded prompt sent to LLM for response generation
5. **Formatting** -- formats response for target app; applies compliance checks (sensitivity labels, DLP, governance)
- Supports plugins and connectors to external systems (CRM, ERP, HR)

### Copilot Prompt Lifecycle
1. **User prompt** -- entered in a Microsoft 365 app
2. **Grounding** -- enriched with Graph data plus advanced indexing plus Work IQ context signals
3. **Response generation** -- grounded prompt processed by LLM, formatted, and returned
- Data encrypted in transit throughout; only authorized data used; data NOT stored for LLM training

### Key Capabilities
- Content generation (Word, PowerPoint)
- Data analysis (Excel -- trends, anomalies, forecasts)
- Meeting summaries (Teams -- action items, key decisions)
- Universal search (natural language across emails, docs, chats)

---

## Unit 2: What Are Agents?

### Definition
- Agents are intelligent software tools that automate tasks, answer questions, and provide personalized recommendations
- Unlike a personal assistant, agents can be tailored to have particular expertise
- Agents can: retrieve information, perform actions, operate independently

### Types of Agents

**1. Prebuilt Agents (Microsoft or Microsoft-approved vendor)**
- Rigorous approval by Microsoft AI and ML experts
- Ready to use, rapid deployment, reduced development costs
- Examples:
  - **Prompt Coach** -- helps craft effective prompts
  - **Writing Coach** -- detailed writing feedback
  - **Researcher agent** -- AI-powered research assistant; gathers, analyzes, synthesizes information into structured reports
  - **Analyst agent** -- virtual data scientist; transforms raw data into insights using Python and advanced reasoning

**2. Ready-made SharePoint Site Agents**
- Auto-created by Copilot when a new SharePoint site is created (if conditions are met: valid Copilot license, right permissions, properly configured M365 environment)
- Scoped to content within that site
- Assigned as the site default agent (site owner can later set a custom agent as default)

**3. Agents for Everyday Business Users (no programming required)**
- Created in SharePoint or Copilot Chat
- Limited capabilities -- no generative AI features
- Key features: ease of use, personalized assistance, permission compliance
- Can use templates or custom options and rules

**4. Advanced Agents (require programming skills)**
- Built using Copilot Studio or Visual Studio Code
- 1000+ prebuilt and custom data connectors
- Generative AI capabilities
- Central administration and compliance management

### Agent Knowledge Sources
- **Web content** -- trusted websites for up-to-date info
- **SharePoint content** -- company-approved documents, policies, procedures
- **Copilot connectors** -- link to external apps (Salesforce, ServiceNow, Jira, Asana)

### Tools for Creating Agents
- **Copilot Studio** -- unified platform for both developers (full experience) and everyday users (lite experience)
- **Agent tool in SharePoint** -- built into SharePoint for creating site-specific agents
- Both tools capture similar information; primary difference is Copilot Studio allows features not applicable to SharePoint agents

---

## Unit 3: Compare Microsoft 365 Copilot and Agents

### High-Level Distinction
- **Copilot:** generative AI assistant embedded across M365 apps; reactive, assistive, responds to user input in real time
- **Agents:** intelligent software entities; customizable for specific tasks; can act autonomously

### Comparison

| Criteria | Copilot | Agents |
|----------|---------|--------|
| **Interaction** | Direct, real-time, conversational inside apps | Run automatically on schedule or triggers; can work behind the scenes |
| **Behind the scenes** | Uses AI models plus Graph; tightly integrated, less customizable | Mini applications built in Copilot Studio; connect to multiple systems; more setup but more flexible |
| **Data access** | Only data the individual user has permission to access | Broader data via service accounts or managed identities; requires careful permission management |
| **Customization** | Organization-level configuration; Copilot Tuning tools | Fully customizable; follows software development lifecycle; version control recommended |
| **Security** | User-level permissions; audit logs; data retention | Service accounts; need approval steps, restricted network access, credential management |

### Best Practices for Governance
- Use managed identities or service accounts with least-necessary access
- Test in sandbox or non-production environments with synthetic data
- Send agent activity to central logging (Azure Monitor, Log Analytics, SIEM)
- Set up alerts for unusual behavior

### Operational Limitations
- **Incorrect outputs or hallucinations:** include human approval steps or automated verification
- **Fragile UI automation:** prefer API-based connections; use health checks and fallback strategies
- **Over-permissioned credentials:** scope access narrowly; set expiration dates; require approval for new permissions

---

## Unit 4: Compare Microsoft 365 Copilot Licensing Models

### Copilot Plans (3 categories)
1. **Free Copilot Chat** -- basic conversational AI; web-grounded only; NO organizational data access
2. **Microsoft 365 Copilot (paid)** -- integrates across Word, Excel, PowerPoint, Outlook, Teams; grounded in Microsoft Graph data
3. **Copilot Studio** -- create, customize, manage agents; uses capacity packs or consumption-based credits

### Plan Comparison

| Plan | For | Key Features | Limitations |
|------|-----|-------------|-------------|
| **Copilot Chat (Free)** | Anyone with Microsoft account | Basic AI chat, web-grounded | No M365 data, no Graph, no org context |
| **M365 Personal or Family** | Home users | Copilot in Office apps, 1 TB OneDrive | No Graph work data, no SharePoint or Teams, no admin controls, no agents |
| **M365 Copilot Business** | Up to 300 users (Business Standard or Premium) | Copilot in apps plus Graph grounding plus core security | No advanced enterprise compliance (Purview, Insider Risk); 300-user cap |
| **M365 Copilot Enterprise** | E3 or E5, Office 365 E3 or E5 | Same as Business plus enterprise security, compliance, governance (DLP, eDiscovery, Purview) | Some features need additional licenses; Copilot Studio may incur extra costs |
| **Copilot Studio and Agents** | Business or Enterprise tenants | Build custom agents, integrate connectors and APIs | Usage governed by Copilot Credits; not available for Personal or Family |

### Key Takeaways
- Free = web-grounded only, no org integration
- Consumer vs. Work accounts: Personal and Family use Microsoft accounts; Business and Enterprise require Microsoft Entra ID
- Business vs. Enterprise: same Copilot in apps, but Enterprise unlocks advanced compliance and governance
- Agent creation: only Business and Enterprise tenants with Copilot Studio capacity
- Business plans capped at 300 users

### Two Licensing Models

**Monthly Per-User License:**
- Fixed monthly fee per user regardless of usage
- Predictable budgeting (e.g., 1,000 users x $30 = $30,000 per month)
- Admin simplicity -- integrates with M365 admin center, group-based licensing in Entra ID
- Risk of over-licensing inactive users

**Pay-as-You-Go (Consumption):**
- Charged based on actual usage; metered against Azure subscription
- Good for fluctuating demand, pilot programs, seasonal workers
- Integrated with Azure Cost Management plus Billing dashboards
- Risk of budget volatility and unexpected spikes

### SharePoint-Specific Licensing Implications
- Monthly model: consistent access but may expose more content if governance not enforced
- Pay-as-you-go: document-heavy queries can cause cost surges
- Hybrid approach: monthly for daily SharePoint users (Operations), PAYG for occasional users (Legal)

### Budgeting Tips
- Pilot test with PAYG to collect real usage data before committing
- Quarterly license audits to remove inactive users
- Use Azure budgets, alerts, and tagging
- Consider hybrid models for different departments

---

## Unit 5: Plan and Deploy Microsoft 365 Copilot and Agents

### Feature Controls (Two Levels)
- **Tenant-wide controls:** global enable or disable across all apps; simple but inflexible
- **Granular controls:** per app, per feature, or per group; supports phased rollouts

### Controllable Features
- Document summarization and content generation (Word, PowerPoint, Excel)
- Meeting recaps and transcripts (Teams -- depends on transcription being allowed)
- Email drafting and summarization (Outlook)

### Administrative Control Methods
- Tenant-wide controls (simplest, least flexible)
- Group-based licensing and policies (target specific Entra groups)
- Pilot programs and staged deployment

### Governance Considerations
- **Data access and sensitivity classification:** classify data before Copilot deployment; prevent inadvertent surfacing of sensitive content
- **Monitoring and auditing usage:** track patterns, detect risky behaviors
- **Cross-departmental governance committees:** include IT, Legal, Compliance, and business unit leaders

### Permissions and Roles
- **Role-based delegation:** workload-specific admins (Exchange admins for Outlook Copilot, etc.)
- **Privileged Identity Management (PIM):** just-in-time elevation for high-privilege roles
- **Separation of duties:** different people for tenant settings vs. agent publishing

### Best Practices for Rollout
- Run pilot deployments with representative groups
- Create training and adoption plans (focus on "when and why," not just "how")
- Establish feedback and escalation loops

### Copilot Adoption Site
- Central hub of resources for planning through ongoing adoption
- Helps with: choosing licenses, preparing environment, setting up Copilot, engaging users
- Offers Success Kits, Scenario Libraries, Change Management resources

### Agent 365 (Preview)
- Single place to manage and monitor all AI agents across M365
- Built into Microsoft 365 admin center; works with Entra, Defender, Purview
- Assigns every agent a trusted identity
- Applies access controls
- Shows admins what each agent can do and what data it can reach
- Provides audit trail for security investigations

---

## Unit 6: Real-World Use Cases for Copilot and Agents

### Use Cases for Copilot
- **In-app Copilot:** drafting (Word and Outlook), data exploration (Excel), presentation creation (PowerPoint)
- **Copilot Chat:** cross-app knowledge search, multi-meeting summarization, tenant-wide queries via Microsoft Graph

### Use Cases for Researcher Agent
- Knowledge discovery (semantic search across incident logs, SharePoint, Teams)
- Summarization of long-form content (contracts, reports)
- Contextual insights across apps (consolidated project status)

### Use Cases for Analyst Agent
- Data analysis in Excel (clean data, identify anomalies, generate forecasts via natural language)
- Power BI integration (query datasets, create charts without DAX)
- Automated insight generation (narrative explanations of data trends)

### Other Prebuilt Agents
- Writing Coach, Career Coach, Ideas Coach
- Meeting facilitators, focus assistants, project helpers

### When to Use What

| Scenario | Best Tool |
|----------|-----------|
| Quick one-off tasks (summarize, draft, analyze) | Copilot |
| Repetitive predictable requests (password resets, FAQ) | Prebuilt agent |
| Lightweight department-specific needs (no system integration) | Agent by everyday business user |
| Content governance, site management, information retrieval | SharePoint agent |
| Complex multi-system workflows, organization-specific logic | Custom advanced agent |
