# Module 4: Explore Microsoft 365 Copilot and Agents

**Learning Path:** Explore Microsoft 365 Copilot and Agent Administration
**Source:** https://learn.microsoft.com/en-us/training/modules/explore-microsoft-365-copilot-agents/
**AB-900 Domain:** 3 -- Perform basic administrative tasks for Copilot and agents (25-30%)
**Verified:** 2026-07-26 (against the AB-900 skills measured as of July 22, 2026)

> **Objective mapping.** This module supports the Domain 3 subsection "Understand features and capabilities of Copilot and agents". Domain 3 has **no rows in the July 22, 2026 change log**, so under Microsoft's change log convention it was unchanged in that refresh. The domain weighting stays at 25-30%.

---

## Unit 1: Introduction to Microsoft 365 Copilot

### Architecture

> **Corrected since earlier course materials.** Work IQ is **NOT** a peer component sitting alongside Microsoft Graph. Microsoft Learn defines **Work IQ** as "the intelligence layer that personalizes Microsoft 365 Copilot for users and organizations" -- an **umbrella** whose data layer **contains** Microsoft Graph and Copilot connectors, and whose context layer **contains** the semantic index. Work IQ is also built on foundation models from multiple providers including OpenAI **and Anthropic**, not Azure OpenAI alone.

- Microsoft 365 Copilot is NOT a standalone app -- it is a collection of intelligent capabilities built into Microsoft 365 apps (Word, Excel, PowerPoint, Outlook, Teams)
- **Work IQ** is composed of three integrated layers:
  - **Data layer** -- Microsoft Graph tenant data plus **Microsoft 365 Copilot connectors** (formerly Microsoft Graph connectors)
  - **Context layer** -- contains the **semantic index**
  - **Skills and tools layer**
- **Large Language Models (LLMs)** -- foundation models from providers including OpenAI and Anthropic, operating within the Microsoft 365 service boundary
- **Orchestration Service** -- manages how prompts, retrieved data, and models interact

**Work IQ API and Work IQ MCP.** The Work IQ API is documented with endpoints for **A2A (agent-to-agent)**, a **remote MCP server**, and a **REST API**. Its usage is independent of Microsoft 365 Copilot licensing and is available through usage-based billing, with governance and cost management controls in the Microsoft 365 admin center. **Work IQ MCP is a PREVIEW feature** that collapses hundreds of operations into 10 generic tools (verbs such as fetch, create, update) across Microsoft 365 mail, calendar, files, people, chat, and sites, and it requires a Microsoft 365 Copilot license.

**The semantic index remains current and is still named "semantic index".** Microsoft describes it as a superset of content within Microsoft Graph plus ingested content from Copilot connectors, mapping organizational data into an advanced lexical and semantic index while respecting permission structures.

**Copilot connectors now come in two models:**

| Model | Behavior |
|-------|----------|
| **Synced connectors** | Ingest and index content into Microsoft Graph; **support semantic indexing** |
| **Federated connectors** | Retrieve content in real time using Model Context Protocol with **no data movement** and **NO semantic indexing**. Read-only, labeled **early access preview**. |

### Microsoft Graph and Work IQ
- Graph acts as the data-layer backbone -- aggregates data across Exchange Online, SharePoint, OneDrive, Teams
- **Data aggregation:** single API layer across all Microsoft 365 services
- **Relationship mapping:** models relationships between people, files, and activities (not just data storage)
- **Dynamic context:** filters information based on current activity and permissions
- **Security and compliance:** enforces RBAC, sensitivity labels, encryption, conditional access
- Advanced indexing understands meaning and intent, not just keywords (semantic search)
- Work IQ continuously analyzes work signals to anticipate needs and deliver proactive insights

### Large Language Models (LLMs)
- **Grounded prompting:** user prompts are enriched with Graph data plus system instructions before reaching the model
- **Isolation and security:** tenant data is not used to train the foundation models; tenant-isolated processing
- **Multiple providers:** Copilot and Copilot Studio surface models from more than one provider. Copilot Studio made **Claude Sonnet 5** and **GPT-5.5 Chat** generally available as primary agent models in June 2026. Copilot Chat added **GPT-5.2** to the model selector per the January 27, 2026 release notes.
- **Word, Excel, and PowerPoint Agents exclusively use Anthropic's AI models**, so the Anthropic provider must be enabled for the tenant. If an admin disables Anthropic models, users cannot see or use those agents.
- **Model currency warning:** GPT-4o was retired for generative orchestration between October 27-31, 2025 and fully unavailable after November 26, 2025. Any slide naming GPT-4o as the current default is stale.

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

### The Canonical Two-Way Build Taxonomy

Microsoft documents **two primary approaches** to building agents for Microsoft 365 Copilot. This split is the canonical taxonomy in the extensibility documentation and is the one to teach first.

| | **Declarative agents** | **Custom engine agents** |
|---|---|---|
| Hosting | Hosted in Microsoft 365, no additional hosting required | Require hosting **outside** Microsoft 365 |
| Model and orchestration | Use Copilot's orchestrator and foundation models | Fully customizable, including choice of AI models and orchestration |
| Designed for | Individual use | Individual use **and** group collaboration |
| Proactive interactions | **NOT** supported; rely on user-initiated interactions | **Supported**; can trigger actions automatically without direct user input |
| Where they run | Microsoft 365 Copilot and Microsoft 365 apps such as Teams, Word, Excel, Outlook | Microsoft 365 **and** external apps |
| Compliance posture | Inherit Microsoft 365 compliance | Builder must ensure their own compliance, Responsible AI practices, and security measures |

### Admin center agent type labels

For management purposes the Microsoft 365 admin center classifies agents with these documented type labels: **MCS DA** (Copilot Studio declarative agent), **MCS CEA** (Copilot Studio custom engine agent), **MCS BP** (business process agent), **Foundry LOB**, **Foundry non-LOB**, **Foundry hosted**, **Agent Builder**, **SharePoint**, **Agent Toolkit**, and **Agent instance** (an agent extended with the Microsoft Agent 365 SDK).

The **Agent Registry** separately divides agents into four **publisher-based** types: **Microsoft agents**, **External partner-built agents**, **Published by your org** (also called LOB agents), and **Shared by creator** (also called Shared agents).

### Four creator personas

| Persona | Tool | Requirement |
|---------|------|-------------|
| **Users** | **Agent Builder in Microsoft 365 Copilot**, or SharePoint | A Copilot license or subscription, and tenant settings must permit it |
| **Makers** | Copilot Studio (lite or full) for low-code agents | Can add actions, connectors, and advanced logic |
| **Developers** | **Microsoft 365 Agents SDK** or **Microsoft 365 Agents Toolkit** for pro-code agents | Can add actions, connectors, and advanced logic |

> **Naming rule.** Microsoft's current name for the low-code, in-Copilot authoring surface is **Agent Builder in Microsoft 365 Copilot**, reached via the **New agent** option in the Microsoft 365 Copilot app. "Copilot Studio lite" survives only in Learn URL slugs and one FAQ phrase. Use **Agent Builder**. Likewise, "Teams Toolkit" is now **Microsoft 365 Agents Toolkit**.

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
- Created in **Agent Builder in Microsoft 365 Copilot** or in SharePoint
- Simpler than Copilot Studio, but **NOT** without generative capability. Agent Builder agents run on Copilot's models, and both **code interpreter** and **image generator** are **enabled by default** there.
- Key features: ease of use, personalized assistance, permission compliance
- Can use templates or custom options and rules

**4. Advanced Agents (require programming or maker skills)**
- Built using Copilot Studio, the **Microsoft 365 Agents SDK**, or the Microsoft 365 Agents Toolkit
- Large connector catalog, custom actions, and advanced orchestration
- Central administration and compliance management, primarily through the **Power Platform admin center** for Copilot Studio agents

### Agent Knowledge Sources
- **Web content** -- trusted public websites for up-to-date information
- **SharePoint and OneDrive content** -- company-approved documents, policies, procedures
- **Microsoft 365 Copilot connectors** (formerly Microsoft Graph connectors) -- link to external systems
- **Embedded (uploaded) file content**, **Teams chat URLs**, **SharePoint lists**, and **Dataverse**

### Knowledge source limits by tool -- do not mix these up

| Tool | Documented limits |
|------|-------------------|
| **Agent Builder** | Up to **20 knowledge sources total**; up to **4 public website URLs**; up to **100 SharePoint files, folders, or sites**; up to **1 SharePoint list**; up to **50 OneDrive files**; up to **5 Teams chat URLs**; up to **20 embedded (uploaded) files**. Description limit **1,000 characters**; Instructions limit **8,000 characters**. |
| **SharePoint agents** | Up to **20 source items** as knowledge -- sites, document libraries, folders, and files in any combination. If more than 20 are needed, nest the data at a higher level and source the agent to that level. |
| **Copilot Studio** | **500 knowledge sources** per agent across all types; **8,000 characters** of instructions; **500 files** uploaded; **512 MB** file upload size; **100 skills** per agent; **1,000 topics** per agent in Dataverse environments; **200 trigger phrases** per topic; a maximum of **25 SharePoint site URLs** when using generative orchestration. |

**Public website rules in Agent Builder:** maximum **4 URLs**, URLs must be only **two levels deep** (`https://example.org/a/b/c` is invalid), and URLs **cannot contain query parameters** (`https://example.org?test=1` is invalid).

**Starter prompts:** Microsoft documents **no maximum** number of starter prompts for an Agent Builder agent. The documentation states only that there is no minimum number of starter prompts. Do **NOT** assert a starter-prompt maximum for Agent Builder.

### Knowledge source licensing (a frequently missed distinction)

| Knowledge source or capability | Requirement |
|---|---|
| Code interpreter, image generator, web search, scoped web search | **No** Copilot license and **no** metered usage required |
| Copilot connectors, SharePoint, OneDrive, embedded file content, Dataverse | Copilot **license OR metered usage** |
| Email, People, Teams messages, Teams meetings | Copilot **LICENSE specifically** (metered usage is not sufficient) |

### Governance limits on knowledge sources

- **Microsoft Purview Information Barriers (IB) is NOT supported on embedded files.** Any user who can access the agent can see responses grounded in embedded file content.
- If **Restricted SharePoint Search** is enabled in the tenant, SharePoint **cannot** be used as a knowledge source for a declarative agent.
- Agent Builder's **"Only use specified sources"** toggle **prioritizes** the designated knowledge sources rather than fully blocking general AI knowledge. Microsoft explicitly states Agent Builder cannot fully block general AI knowledge; for stricter control, use Copilot Studio.
- Embedded files uploaded to an Agent Builder agent are stored in tenant-owned **SharePoint Embedded containers**, which appear in the SharePoint admin center and in PowerShell under the application name **Declarative Agent**. Microsoft warns not to delete these containers because doing so might break dependent agents.

### Tools for Creating Agents
- **Agent Builder in Microsoft 365 Copilot** -- low-code authoring inside the Copilot app for everyday users. Available to users with a Microsoft 365 Copilot license **OR** in tenants with pay-as-you-go enabled for Copilot Studio. Usable from microsoft365.com/chat, office.com/chat, and the Microsoft Teams desktop and web clients, on both the Work and Web toolbar options. **NOT** available on mobile versions of those apps.
- **Copilot Studio** -- full maker and developer platform for advanced agents
- **Agent tool in SharePoint** -- built into SharePoint for creating site-scoped agents
- **Microsoft 365 Agents Toolkit** -- pro-code path

**Agent Builder known limitations worth naming:** Lockbox and Customer Managed Keys are not supported for agents created with Microsoft 365 Copilot; agents created with Microsoft 365 Copilot cannot be used in Teams Chat; and the tenant-level "Allow web search in Copilot" policy takes precedence over the Web content toggle in the Knowledge pane (a UI limitation where the toggle is not disabled even though web content is blocked).

**Agent Builder response modes** are set in the **Model** section of the Configure tab: **Auto** (default), **Quick response**, and **Think deeper**. Users can override with the model selector. Known issue: the default response mode is not applied when the agent is invoked via @mention from the main Copilot experience.

**People data** ("Reference people in organization" toggle on the Configure tab) is **enabled by default** for agents created by users who have a Microsoft 365 Copilot license, and is available only to users with a Microsoft 365 Copilot add-on license.

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

> **The Domain 3 objective bullet reads "Compare Copilot monthly license model to pay-as-you-go, including SharePoint."** The "including SharePoint" qualifier is explicit, so cover **SharePoint agent pay-as-you-go specifically**, not just generic Copilot PAYG.

### Prices and SKUs (verified 2026-07-26)

| SKU | Price | Notes |
|-----|-------|-------|
| **Microsoft 365 Copilot** (enterprise add-on) | **$30.00** per user per month (annual billing) | Requires a qualifying Microsoft 365 subscription |
| **Microsoft 365 Copilot Business** (SMB add-on) | List **21.00 USD** per user per month; available at **18 USD** under a 15% promotion extended through December 2026, with no license minimum (1-300 licenses) | **300-seat MAXIMUM**; annual subscription with annual billing |
| **Microsoft 365 Business Standard with Copilot** | **23.50 USD** per user per month | GA July 1, 2026; 300-license maximum; annual subscription, annual billing |
| **Microsoft 365 Business Premium with Copilot** | **32 USD** per user per month | GA July 1, 2026; 300-license maximum; annual subscription, annual billing |
| **Microsoft 365 E7** ("Frontier Suite") | Reported list **$99** per user per month | GA **May 1, 2026**. E7 = E5 + Microsoft 365 Copilot + Microsoft Entra Suite + Agent 365. A strict superset of E5. |
| **Microsoft Agent 365** (standalone) | Reported list **$15** per user per month | GA for Commercial **May 1, 2026**; also included in E7 |
| **Copilot Studio prepaid capacity pack** | **$200.00** per pack per month for **25,000 Copilot Credits** | Credits replenish at the start of each monthly billing period and are consumed **first**, before pay-as-you-go billing applies |
| **Pay-as-you-go** | **$0.01 per Copilot Credit** | See the Copilot Credits section below |

<!-- VERIFY: Monthly-billing variants of the Business-with-Copilot SKUs (Business Premium with Copilot $38.40/user/month, Business Standard with Copilot $28.20/user/month, plus no-Teams variants) are sourced from the Microsoft product pricing page rather than Microsoft Learn. Confirm before quoting on stage. -->

> **THE 300-SEAT NUMBER REVERSED DIRECTION.** Microsoft removed the original **300-seat MINIMUM** purchase requirement for Copilot commercial plans in **January 2024**, and also removed the Microsoft 365 prerequisite so Office 365 E3 and E5 customers became eligible. **There is no seat minimum today.** The only surviving 300 is a **MAXIMUM** on Copilot Business and the Business-with-Copilot SKUs. Teaching "300-seat minimum" in 2026 is flatly wrong.

### Copilot Business versus the enterprise SKU

- Microsoft states the Copilot Business add-on **"delivers the same capabilities as the Microsoft 365 Copilot offering."** The difference is price point and eligibility, **NOT** feature set.
- Copilot Business requires a Microsoft 365 Business Basic, Business Standard, Business Premium, or Microsoft 365 Apps for Business plan, and Microsoft defines the SMB customer for this SKU as an organization with **300 or fewer users**.
- Copilot Business plans are sold **only** as an annual commitment with either monthly or annual billing. There is **NO** month-to-month purchasing agreement for Copilot Business.
- Existing Microsoft 365 Copilot add-on customers **cannot** switch those licenses to Copilot Business until their annual purchase commitment ends, and licenses do **NOT** auto-convert at renewal.

### Qualifying prerequisites for the enterprise Microsoft 365 Copilot add-on

Microsoft 365 E7, E5, E3, F1, F3; Business Basic, Standard, Premium; Microsoft 365 Apps for business and enterprise; Office 365 E5, E3, E1, F3; Microsoft Teams Essentials, Enterprise, EEA; Exchange Kiosk, Plan 1, Plan 2; SharePoint Kiosk, Plan 1, Plan 2; OneDrive for work and school Plan 1 and Plan 2; Microsoft Planner Plan 1; Project Plan 3 and Plan 5; Project Online Essentials; Visio Plan 1 and Plan 2; and Microsoft Clipchamp.

### Copilot Chat -- the free tier

- **Microsoft 365 Copilot Chat is automatically included at no additional cost** for organizations with an eligible Microsoft 365 subscription, and requires sign-in with a Microsoft Entra work or school account to get **enterprise data protection**.
- Copilot Chat has **two modes with different entitlements**: **web-based chat** (internet results) is included free with an eligible Microsoft 365 subscription, while **work-based chat** (results the Entra account can access) **requires a Microsoft 365 Copilot license**.
- Microsoft 365 **E7** is now listed alongside E3 and E5 in the Copilot Chat license eligibility list.

> **Naming rule.** Use **"Microsoft 365 Copilot Chat (with enterprise data protection)"**. The older phrasing "Copilot with commercial data protection" survives only in pre-2025 community answers. Likewise, the SKU is **Microsoft 365 Copilot**, not "Copilot for Microsoft 365" -- that word order is retired.

### Plan Comparison

| Plan | For | Key Features | Limitations |
|------|-----|-------------|-------------|
| **Microsoft 365 Copilot Chat** | Any user with an eligible Microsoft 365 subscription and a work or school account | Free web-grounded chat with enterprise data protection; can use no-cost Agent Store agents if the admin enables them | Work-based chat (org data grounding) requires a Copilot license; agents that use organizational data are billed via metered consumption |
| **M365 Personal or Family** | Home users | Copilot in Office apps, 1 TB OneDrive | No Graph work data, no SharePoint or Teams, no admin controls, no agents |
| **Microsoft 365 Copilot Business** | Organizations of 300 or fewer users on Business Basic, Standard, Premium, or Apps for Business | **Same capabilities as the enterprise SKU** | **300-seat maximum**; annual commitment with annual or monthly billing |
| **Microsoft 365 Copilot** (enterprise add-on) | Tenants on a qualifying Microsoft 365 or Office 365 plan | Copilot across the apps plus Graph grounding | Some features need additional licenses; agent usage may incur Copilot Credits |
| **Microsoft 365 E7** | Enterprises wanting one SKU | E5 + Microsoft 365 Copilot + Microsoft Entra Suite + Agent 365 | E7 customers do **NOT** buy the Copilot add-on separately |
| **Copilot Studio and agents** | Tenants building custom agents | Build custom agents, integrate connectors and APIs | Usage governed by Copilot Credits |

### Key Takeaways
- Copilot Chat is free with an eligible subscription, but **work-grounded** chat needs a Copilot license
- Consumer versus work accounts: Personal and Family use Microsoft accounts; Business and Enterprise require Microsoft Entra ID
- Business and enterprise Copilot deliver the **same capabilities**; price and eligibility differ
- **No seat minimum.** The 300 figure is a **maximum** on the SMB SKUs.
- Any licensing slide that stops at E5 is now incomplete -- **E7 includes Microsoft 365 Copilot in the base SKU**

### Two Licensing Models

**Monthly Per-User License:**
- Fixed monthly fee per user regardless of usage
- Predictable budgeting (for example, 1,000 users at $30 = $30,000 per month)
- Admin simplicity -- integrates with the Microsoft 365 admin center and group-based licensing in Microsoft Entra ID
- Risk of over-licensing inactive users

**Pay-as-You-Go (Consumption):**
- Charged based on actual usage; metered against an Azure subscription
- Good for fluctuating demand, pilot programs, seasonal workers
- Integrated with Microsoft Cost Management
- Risk of budget volatility and unexpected spikes

### Copilot Credits -- the current unit of consumption

**The billing unit changed from the message to the Copilot Credit.** Microsoft Learn states plainly: "Copilot Credits are the unit that measures agent usage" and "Copilot Credits are the unit of consumption in Microsoft 365 Copilot Chat and SharePoint agents for AI interactions." The pay-as-you-go rate is **$0.01 per Copilot Credit**.

> **Documentation conflict to handle carefully on stage.** The Microsoft 365 Copilot pay-as-you-go **Meters** page has **NOT** been updated to credits language. It still shows the meter as "Copilot Studio", describes "a billable Copilot Studio message", and bills "$0.01 per message". The dollar figure matches, but the unit noun is stale relative to the Copilot Studio billing-rates page. **Safe phrasing:** the unit is the Copilot Credit at $0.01 per credit; the Azure meter is still named **Copilot Studio**; and some Learn pages still say "per message". Do **NOT** assert that 1 message equals 1 credit as a universal rule -- consumption is per-feature and ranges from 1 to 100 credits.

**Current Copilot Credit consumption rates:**

| Action | Credits |
|--------|---------|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding for messages | 10 |
| Agent flow actions | 13 per 100 actions |
| Content processing tools | 8 per page |
| Text and generative AI tools, basic | 1 per 10 responses (0.1 per 1K tokens) |
| Text and generative AI tools, standard | 15 per 10 responses (1.5 per 1K tokens) |
| Text and generative AI tools, premium | 100 per 10 responses (10 per 1K tokens) |
| Classic Voice | 10 per minute |
| GenAI Voice | 35 per minute |
| Premium GenAI Voice | 75 per minute |

**Users who ARE licensed with Microsoft 365 Copilot incur "No charge"** for classic answers, generative answers, agent actions, tenant graph grounding, agent flow actions, and AI tools in employee-facing (B2E) scenarios, subject to fair usage limits. **Pay-as-you-go credits are consumed by UNLICENSED users.**

**Overage enforcement:** Copilot Studio prepaid capacity triggers overage enforcement at **125% of prepaid capacity**, at which point custom agents are disabled until capacity is increased or reset. Users then see "There is a billing issue" or "This agent is currently unavailable. It has reached its usage limit."

**Three purchase models exist:** pay-as-you-go per credit billed to Azure, **prepaid capacity packs** ($200 per pack per month for 25,000 credits), and the **Copilot Credit Pre-Purchase Plan** bought in the Azure portal under **Reservations**, which uses Copilot Credit Commit Units (CCCUs) over a one-year term at tiered discounts. **Cancellations and exchanges are NOT supported** on the pre-purchase plan.

**Three billing constructs for Copilot Chat:** a **Copilot credit policy** (prepaid packs only, no Azure subscription required, up to **10** per tenant), a **pay-as-you-go billing policy** (per-credit billing to Azure, up to **50** per tenant), or the two paired for automatic overage handling. **Copilot credit policies are currently available ONLY for Microsoft 365 Copilot Chat.** For SharePoint agents, administrators must continue using pay-as-you-go billing.

> **Naming rule.** "Message packs" is retired. Microsoft calls them **Copilot Studio capacity packs**. Price and quantity are unchanged ($200 per pack per month, 25,000 units); the unit is now credits.

### SharePoint agent pay-as-you-go (the objective's explicit qualifier)

- SharePoint agent usage **by unlicensed users** is billed as **Generative answer = 2** plus **Tenant graph grounding = 10**. Because SharePoint agents are always grounded in the tenant graph, Microsoft states each interaction with a SharePoint agent uses **12 messages (10 + 2)** to respond to a single complex prompt.
- **Billing applies only when a user WITHOUT a Microsoft 365 Copilot license uses a SharePoint agent.** Interactive use of generative answers, tenant graph grounding, and agent actions by authenticated Copilot-licensed users is included at no extra cost.
- **Setup roles:** SharePoint administrator plus **Owner or Contributor** Azure roles on the subscription and resource group.
- **Policy limit:** for SharePoint agents you can create up to **10 billing policies**, each assigned **one** security group. Only users in the assigned security group have access to SharePoint agents. Support for multiple security groups per policy is not yet available.
- **Migration trap:** SharePoint agent PAYG policies previously configured under **Microsoft 365 admin center > Org settings > Pay-as-you-go services** must be disconnected there (select SharePoint agents, then **Disconnect previous billing**) before a new Copilot-node billing policy can be linked.
- **SharePoint agent access requirement:** "If you are assigned a Microsoft 365 Copilot license, or your organization has the Pay-As-You-Go billing set up, you can use agents in SharePoint."

### SharePoint-Specific Licensing Implications
- Monthly model: consistent access but may expose more content if governance is not enforced
- Pay-as-you-go: document-heavy queries can cause cost surges, and a single SharePoint agent prompt can consume **12 credits ($0.12)**, not 1 credit
- Hybrid approach: monthly licenses for daily SharePoint users, PAYG for occasional users

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

### Microsoft Agent 365 (generally available, NOT preview)

**Microsoft Agent 365 reached general availability for the Commercial segment on May 1, 2026**, licensed on a **per-user** basis. Older materials describing it as preview are stale.

- Documented as **the control plane for AI agents**, letting organizations deploy, govern, and manage all agents at scale regardless of where they were built or acquired
- Built into the Microsoft 365 admin center; works with Microsoft Entra, Microsoft Defender, and Microsoft Purview
- Assigns every agent a trusted identity, applies access controls, shows admins what each agent can do and what data it can reach, and provides an audit trail for security investigations
- **Agents themselves do not require their own Agent 365 license.** All agents managed or owned by a licensed user are covered under that user's Agent 365 or Microsoft 365 E7 license.
- **Licensing options that enable agent management in the Microsoft 365 admin center:** Microsoft 365 plans, Microsoft 365 Copilot, and Microsoft Agent 365. Microsoft 365 E7 includes E5, Microsoft 365 Copilot, Microsoft Agent 365, and the Microsoft Entra Suite.
- **Frontier licensing differs from GA:** in the Frontier program, Agent 365 licenses are assigned **per agent instance** and are required before an agent instance can be created. At general availability, Agent 365 is licensed **per user**. There is **NO** Service Level Agreement associated with Agent 365 Frontier, and Microsoft states Frontier should not be used for product evaluations.

**Extending Microsoft Entra security features to agents** requires Microsoft 365 E7, or Microsoft 365 E5 paired with a Microsoft Agent 365 license. Standalone paths for customers without E5 or E7, all still requiring an Agent 365 license: Conditional Access for agents needs Entra ID P1, ID Protection for agents needs Entra ID P2, and ID Governance for agents needs Entra ID P1.

### The Microsoft Frontier program (release channel, not a product)

**Frontier** is the current opt-in early-access channel for pre-GA Copilot and agent features. Configure it at **Microsoft 365 admin center > Copilot > Settings > View all > Copilot Frontier**, with three options: **No access** (the default), **All users**, and **Specific users**. Joining requires a Microsoft 365 Copilot license.

Microsoft documents a **three-tier audience-based release model**: **Frontier** (opt-in early access), **Standard release** (the default), and **Deferred release** (delays deferred-capable GA features up to 30 days). Modern standard and deferred release channels are **not** available for GCC, GCC High, and DoD.

Frontier agents appear in the Agent Store tagged with **"(Frontier)"** at the end of the agent name under **Built by Microsoft**. It can take up to **three hours** for Frontier features and agents to become available to users. The Frontier admin control does **NOT** override the Agents section settings -- an agent turned off in the Agents view stays unavailable regardless of Frontier enrollment.

### Copilot Tuning status (do NOT present as GA)

**Microsoft 365 Copilot Tuning is NOT generally available.** It is an early access preview available to a limited set of customers. Fine-tuned agents appear as "tuned agents" in the Agent 365 portal, and the Agent Registry exposes a **Data source** filter with a **Fine-tuned models** value indicating the agent was created using Copilot Tuning.

---

## Unit 6: Real-World Use Cases for Copilot and Agents

### Use Cases for Copilot
- **In-app Copilot:** drafting (Word and Outlook), data exploration (Excel), presentation creation (PowerPoint)
- **Copilot Chat:** cross-app knowledge search, multi-meeting summarization, tenant-wide queries via Microsoft Graph

### Researcher and Analyst -- status and licensing

**Both reached general availability on June 2, 2025.** They are GA, not preview, as of July 2026. Both **require a Microsoft 365 Copilot license**; Microsoft deployed them to existing licensed users and there is **NO** separate add-on license for either. They are listed as "Advanced Agents" that a Copilot license unlocks beyond Copilot Chat.

They are the **only** agents Microsoft currently deploys via the "Microsoft-installed agents and features" method: preinstalled and pre-pinned in Microsoft 365 Copilot for all licensed users. End users cannot remove or unpin Researcher.

> **Governance headline, restated precisely.** Microsoft's current wording is: **"Researcher and Analyst are part of the core Copilot chat experience and will not fall under any agent-related settings."** They remain accessible in Microsoft 365 Copilot Chat under **Tools** even when Copilot agents are disabled for some or all users. Do **NOT** describe them as merely needing "a separate block" -- the mechanism is that they are **core chat Tools**, outside agent settings entirely. To disable one, use the tenant-wide **Block** action on the individual agent (Microsoft 365 admin center > Agents > All agents > select the agent > Block). The **Edit users** panel is **disabled** for Researcher and Analyst, so per-user or per-group assignment is not possible.

### Use Cases for Researcher Agent
- Deep, multi-step research combining Microsoft Graph work data, **Microsoft 365 Copilot connectors**, and the **Bing index** for web data
- Knowledge discovery across incident logs, SharePoint, and Teams
- Summarization of long-form content (contracts, reports)
- Contextual insights across apps (consolidated project status)

**Documented usage limit:** a maximum of **25 queries per user per month**.

**Web access control:** Researcher adheres to the tenant-level **Allow web search in Copilot** toggle. If web search is disabled at the tenant level, Researcher will not use any web data. There is **NO** granular setting to allow or block specific websites for standard Researcher; the global web search toggle is the only admin control over its web content.

**Researcher with Computer Use** is a separately governed extension that lets Researcher interact with public, gated, and interactive web content through a **Windows 365**-backed virtual computer. Admins configure it on a dedicated **Computer use** tab at Microsoft 365 admin center > **Agents** > select **Researcher** > **Computer use**. The tab exposes exactly three policies:
1. Allow Researcher with Computer Use to perform actions on behalf of users (all users, specific users or groups only, or no users)
2. Allow Researcher to access work data
3. Choose which websites are allowed for Computer Use (All websites, Allow specific URLs or domains only, or Exclude specific URLs or domains)

Web search is required for Computer use. Admins can also connect up to **10 additional agents** to Researcher via the **Connected Agents** tab; agents added by the maker cannot be removed by admins.

### Use Cases for Analyst Agent
- Advanced data analysis using chain-of-thought reasoning; **better suited than Researcher for Microsoft Excel tasks**
- Data analysis in Excel (clean data, identify anomalies, generate forecasts via natural language)
- Automated insight generation (narrative explanations of data trends)

> **Monitoring trap.** The Researcher FAQ states there is **NO** existing reporting tool for Copilot agents like Researcher and Analyst, and that by default the **content** of Researcher sessions is **not** accessible to admins or compliance tools. Admins can see usage metrics but not conversation content. The only exception is when a user explicitly submits feedback including session data.

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
