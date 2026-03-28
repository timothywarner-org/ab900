# AB-900 New Features Deep Dive: Topics Experienced M365 Admins Are Most Likely to Miss

**Audience:** IT professionals with existing M365 administration experience preparing to teach or sit the AB-900 (Microsoft 365 Copilot for Administrators) exam.

**Purpose:** This document covers topics that are genuinely new to the AB-900 exam objective domain — features introduced or heavily expanded alongside the Microsoft 365 Copilot product line that do not appear in legacy M365 certification tracks (MS-102, MS-700, SC-400, etc.). Familiarity with Exchange, Teams, Intune, or Purview DLP does not substitute for understanding these areas.

**Last updated:** March 2026 — aligned to current Microsoft Learn documentation.

---

## Table of Contents

1. [DSPM for AI (Microsoft Purview)](#1-dspm-for-ai-microsoft-purview)
2. [Microsoft 365 Copilot Researcher Agent](#2-microsoft-365-copilot-researcher-agent)
3. [Microsoft 365 Copilot Analyst Agent](#3-microsoft-365-copilot-analyst-agent)
4. [Microsoft 365 Copilot Pay-as-You-Go Billing](#4-microsoft-365-copilot-pay-as-you-go-billing)
5. [SharePoint Advanced Management for Copilot AI Governance](#5-sharepoint-advanced-management-for-copilot-ai-governance)

---

## 1. DSPM for AI (Microsoft Purview)

### What it is

**Data Security Posture Management (DSPM) for AI** is a dedicated dashboard inside Microsoft Purview that gives compliance and security administrators a single, centralized view of how AI applications — Microsoft 365 Copilot, Copilot Chat, agents, and supported third-party tools such as ChatGPT Enterprise and Google Gemini — interact with sensitive organizational data. It is not a policy engine in isolation; rather, it aggregates signals from across Purview (Audit, DLP, Insider Risk Management, Communication Compliance, Information Protection) and surfaces them as unified insights, ready-to-deploy one-click policies, data risk assessments, and remediation recommendations.

The version tested on AB-900 is the **classic** version accessed at `purview.microsoft.com > Solutions > DSPM for AI (classic)`. A newer preview version (simply named "Data Security Posture Management") is rolling out but is not yet the exam target.

### Why it matters for AB-900

DSPM for AI represents a category of administrative responsibility that does not exist in any legacy Purview or compliance certification. The exam tests whether candidates understand:

- Where in the portal to find it (exact navigation path)
- What it automatically does without configuration (the weekly default risk assessment)
- What requires admin action (one-click policies, custom assessments)
- Which prerequisites gate its functionality (Purview Audit, device onboarding, licenses)
- How it relates to but differs from standalone DLP, Insider Risk, and Communication Compliance policies

### How it works

DSPM for AI operates through four integrated capability areas:

**1. Insights and Analytics**
The Reports section shows AI activity across three workload categories: *Copilot experiences and agents*, *Enterprise AI apps* (e.g., ChatGPT Enterprise), and *Other AI apps* (third-party generative AI sites). Activity Explorer provides event-level drill-down including activity type, user, timestamp, AI app, sensitive information types detected, and files referenced. Prompts and responses appear in Activity Explorer events (labeled "AI interaction") when the appropriate collection policy is active and the admin has the required permissions.

**2. Ready-to-Use One-Click Policies**
DSPM for AI surfaces pre-configured policies that can be activated without building policies from scratch. Examples include:
- *DSPM for AI – Detect risky AI usage* (uses Insider Risk Management)
- *DSPM for AI – Control unethical behavior in AI* (uses Communication Compliance)
- *Extend your insights* (activates collection from third-party generative AI sites)
- *Secure interactions from enterprise apps* (captures prompts/responses from Entra-registered AI apps)

Each one-click policy, once activated, appears on the **Policies** page and can be edited from its native Purview solution.

**3. Data Risk Assessments**
This is the most distinctive DSPM for AI capability. A **default data risk assessment** runs automatically every week against the top 100 SharePoint sites by usage — no admin configuration required. The assessment identifies potentially overshared items: content accessible via "Anyone" links, "People in your organization" links, and content shared with "Everyone Except External Users."

Admins can also create **custom assessments** targeting specific users, sites, or date ranges. Custom assessments support **item-level scanning** (currently limited to up to 10 SharePoint sites per assessment, maximum 200,000 items per location) which identifies individual files that are overshared, shows their sensitivity labels, and enables direct remediation actions: apply sensitivity label, remove sharing link, notify site owner, or resolve.

Fabric workspaces can also be assessed, but this requires a one-time setup involving a registered Entra application and configuration of Admin API settings in the Fabric admin portal.

**4. Compliance Controls and Recommendations**
The Recommendations section presents tenant-specific, prioritized action items. Examples include creating default sensitivity labels, protecting labeled items from Copilot processing via DLP, enabling regulatory compliance controls via Compliance Manager templates, and configuring retention policies for stale content.

### Admin controls

**Required permissions:**
- Microsoft Entra Compliance Administrator role (or equivalent)
- For viewing prompts and responses in Activity Explorer: additional specific permissions documented at `learn.microsoft.com/purview/ai-microsoft-purview-permissions`

**Prerequisites:**
| Scenario | Prerequisite |
|---|---|
| Monitoring Copilot and agents | Microsoft Purview Audit enabled (on by default for new tenants); users assigned M365 Copilot licenses |
| Monitoring Copilot in Fabric / Security Copilot | Enterprise version of Purview data governance; collection policy active |
| Monitoring third-party AI sites (ChatGPT, Gemini) | Devices onboarded to Microsoft Purview; Microsoft Purview browser extension; Edge DLP configuration |
| Applying DLP to third-party AI apps | Endpoint DLP via onboarded devices |

**Portal navigation:**
```
purview.microsoft.com
  └── Solutions
        └── DSPM for AI (classic)
              ├── Overview        (Get started checklist, top recommendations)
              ├── Reports         (AI activity analytics by app category)
              ├── Policies        (Status of DSPM-created and AI-related policies)
              ├── Recommendations (Prioritized action items for the tenant)
              ├── Apps and agents (Dashboard of AI apps/agents and their data access)
              ├── Activity explorer (Event-level detail with filters)
              └── Data risk assessments (Default weekly + custom assessments)
```

**Allow 24 hours** after activating new policies before data populates in Reports. Custom assessment results take **at least 48 hours** to appear after the assessment completes.

### Key distinctions

- **DSPM for AI is not a DLP policy.** It surfaces risk insights and can create DLP policies via one-click recommendations, but the resulting policies live in the DLP solution, not in DSPM for AI itself.
- **The weekly default assessment runs automatically.** Admins do not need to configure or schedule it. It assesses the top 100 SharePoint sites by usage.
- **DSPM for AI (classic) vs. the new DSPM (preview).** The classic version is the current exam target. The new preview version introduces guided workflows and is being positioned as the successor, but new features are only being added to the preview, not to the classic version.
- **Third-party AI site monitoring requires device onboarding.** Simply having Purview licenses is not enough — devices must be onboarded (shared with Defender for Endpoint onboarding) to monitor what users paste or type into ChatGPT or Gemini.
- **DSPM for AI is not the same as the Microsoft Purview AI Hub.** The AI Hub is a broader concept; DSPM for AI is the specific administrative solution within the Purview portal.

### Exam scenario examples

**Scenario A:** A Contoso security admin opens DSPM for AI and sees that the Reports section shows no data despite having M365 Copilot licenses assigned. What is the most likely cause?

*Answer:* Microsoft Purview Audit is not enabled. Auditing is a prerequisite for DSPM for AI to collect and display Copilot interaction data. Although auditing is on by default for new tenants, it may have been disabled in older tenants. The admin should verify audit status and, once enabled, wait at least 24 hours for data to populate.

**Scenario B:** An admin wants to understand whether specific SharePoint files have been overshared before enabling Copilot for all users. Which DSPM for AI capability best addresses this?

*Answer:* A custom data risk assessment with item-level scanning enabled. This produces a list of individual files that are potentially overshared (via external or anonymous sharing links), shows their sensitivity labels, and allows direct remediation — including removing sharing links, applying sensitivity labels, or notifying site owners — without leaving the Purview portal.

**Scenario C:** A compliance officer asks why they can see that users visited ChatGPT but cannot see the actual content they typed. What must the admin configure?

*Answer:* Two things: (1) Devices must be onboarded to Microsoft Purview (via Defender for Endpoint onboarding) to capture what users type into browser-based AI sites. (2) A "Secure interactions" collection policy must be active. Without both, only the visit event (site accessed) is captured, not the prompt content.

### Quick-reference summary

- **Portal path:** `purview.microsoft.com > Solutions > DSPM for AI (classic)`
- **Default weekly risk assessment** runs automatically on top 100 SharePoint sites — no admin setup required
- **One-click policies** activate pre-built Purview policies (DLP, IRM, Communication Compliance) from a single interface
- **Item-level scanning** in custom assessments allows per-file remediation; limited to 10 SharePoint sites per assessment
- **Third-party AI monitoring** (ChatGPT, Gemini) requires device onboarding AND the Purview browser extension — licenses alone are insufficient

> **Exam Traps**
>
> - Do not confuse "DSPM for AI (classic)" with the newer "Data Security Posture Management (preview)" — they are different versions in the portal and the classic version is the current exam target.
> - The default assessment is automatic and weekly — exam questions may try to make you think an admin must manually run or schedule it.
> - DSPM for AI requires **Compliance Administrator** permissions, not Global Administrator. An admin with only the SharePoint Admin role cannot access it.
> - Budget alerts in the portal: allow **24 hours** for new policy data, **48 hours** for custom assessment results.
> - Monitoring prompts sent to third-party AI sites requires **device onboarding** — this is frequently tested and commonly missed by candidates who assume Purview licensing alone is sufficient.

---

## 2. Microsoft 365 Copilot Researcher Agent

### What it is

**Researcher** is a first-party Microsoft agent built into Microsoft 365 Copilot that handles **complex, multi-step research tasks**. Unlike standard Copilot chat — which is optimized for speed and handles quick tasks like summarizing an email or drafting a short reply — Researcher deliberately takes more time (typically under 5 minutes for simple queries; 10 to 45 minutes for highly complex ones) to retrieve, reason across, and synthesize information from two distinct sources simultaneously: **your Microsoft 365 work content** (files, emails, meetings, chats you have permission to access via Microsoft Graph) and **the web** (via Bing index). The output is a structured, source-cited report with headings, bullets, charts, and visual elements.

Researcher is **preinstalled and pre-pinned** for all users with Microsoft 365 Copilot licenses. Users cannot remove or unpin it. It appears under **Agents** in the Microsoft 365 Copilot Chat interface.

### Why it matters for AB-900

Researcher introduces a new category of admin governance challenge: a Microsoft-built agent that is immune to the standard "disable all Copilot agents" toggle. The exam tests whether candidates understand how Researcher is governed, what admin controls actually work, and how Researcher differs from both standard Copilot chat and the Analyst agent.

### How it works

Researcher uses a two-source retrieval model:

| Source | What it accesses | Governance control |
|---|---|---|
| Microsoft Graph | Files, emails, meetings, chats the signed-in user has permission to access | Existing M365 permissions and compliance; honors sensitivity labels and DLP |
| Bing web index | Public web content for recent or external information | Tenant-level web search toggle |

The agent follows a structured workflow:
1. User submits a research query
2. Researcher may ask clarifying questions to refine scope
3. Agent retrieves from Graph and/or Bing (depending on scope selection and tenant settings)
4. Agent synthesizes, reasons across sources, and generates a structured report with citations
5. Output includes organized sections, source references, and optional visuals/charts

**Usage limit:** 25 queries per user per month (as documented; subject to change).

**Graph Connectors:** Researcher can fetch data from Microsoft Graph Connectors, enabling it to search indexed third-party data sources alongside native M365 content.

**Computer Use (advanced feature):** A "Researcher with Computer Use" capability exists that allows Researcher to interact with web content in a sandboxed virtual machine. This is an admin-controlled opt-in feature.

### Admin controls

**Critical governance fact for AB-900:** Researcher is explicitly excluded from the standard Copilot agent toggle. The documentation states:

> "This tool will remain accessible in Microsoft 365 Copilot Chat under Tools, even when Copilot agents are disabled for some or all users in Microsoft 365 admin center."

**How to actually block Researcher:**

Navigate to:
```
admin.microsoft.com
  └── Agents (left navigation)
        └── All Agents
              └── Select "Researcher"
                    └── Block (in the agent details pane)
```

The **Edit users** panel is disabled for Researcher and Analyst — you cannot assign them to a subset of users. The only choices are: available to everyone (default) or blocked for the entire tenant.

**Web search control:**
- If the tenant-level web search toggle is disabled, Researcher will not use Bing data
- There is **no granular website allowlist/blocklist** — the only control is the global web search on/off toggle
- If web search is disabled, Researcher still functions but draws only from Microsoft Graph (work content)

**Computer Use admin controls:**
```
admin.microsoft.com > Copilot > Settings > Researcher with Computer Use
```
Admins can enable/disable Computer Use, restrict it to specific users or groups, and configure allowed/blocked domains for the sandbox environment.

**Monitoring:**
There is currently no admin reporting dashboard for Researcher usage metrics (query volume, user adoption). Admins can see that the feature is being used but cannot access the content of Researcher sessions through standard admin tools. The content of Researcher sessions is not accessible via eDiscovery by default.

### Key distinctions

- **Researcher is NOT disabled by the "Copilot agents" toggle.** This is the single most important governance fact about Researcher and is the most common exam trap.
- **Researcher vs. standard Copilot chat:** Standard Copilot is fast and handles everyday tasks. Researcher is slower (by design), handles multi-step complex research, produces structured reports with citations, and spans both work data and the web simultaneously.
- **Researcher vs. Analyst:** Researcher is optimized for research and synthesis across mixed sources (web + work). Analyst is optimized for data analysis and computation on structured data (particularly Excel). "Is Researcher agent suited for spreadsheet creation?" — No, that is what Analyst is for.
- **Researcher is not trained on tenant data.** It can access tenant data at query time but is not fine-tuned on it. All data remains within the Microsoft 365 data processing boundary.
- **Users cannot disable Researcher.** Individual users have no option to remove or disable it, though they can unpin it from the rail.

### Exam scenario examples

**Scenario A:** A Contoso IT admin has disabled the Copilot agents toggle in the Microsoft 365 admin center to prevent all agents from running. A user reports that the Researcher agent is still accessible. The admin asks why. What is the correct explanation?

*Answer:* Researcher and Analyst are first-party Microsoft experiences that are part of the core Copilot chat experience, not governed by the agent toggle. The agent toggle applies to third-party and custom agents. To block Researcher, the admin must explicitly block it in `admin.microsoft.com > Agents > All Agents > Researcher > Block`.

**Scenario B:** A financial services firm needs to prevent Researcher from using any publicly available web content due to data residency policies. What is the correct admin action?

*Answer:* Disable the tenant-level web search toggle for Microsoft 365 Copilot. This prevents Researcher from using the Bing index. Note that this applies globally to the tenant — there is no per-agent or per-user web search control for Researcher specifically.

**Scenario C:** An admin wants to assign Researcher only to a pilot group of 50 users before rolling it out broadly. How should they configure this?

*Answer:* This is not possible. Researcher does not support granular user/group assignment — the Edit users panel is disabled. The only options are: available to all licensed users (default) or blocked for the entire tenant. To limit access, the admin would need to block Researcher tenant-wide and communicate to the pilot group that they should not use it, or restrict M365 Copilot licensing itself to the pilot group.

### Quick-reference summary

- Researcher is **preinstalled and pre-pinned** for all M365 Copilot licensed users; users cannot remove it
- Uses **both Microsoft Graph (work data) AND Bing (web)** — dual-source retrieval distinguishes it from standard Copilot
- The **agent toggle does NOT block Researcher** — admin must explicitly block it via `Agents > All Agents > Researcher > Block`
- No granular user/group assignment for Researcher — it is all-or-nothing at the tenant level
- **25 queries per user per month** usage limit; response time ranges from under 5 minutes to up to 45 minutes

> **Exam Traps**
>
> - "Disabling Copilot agents blocks Researcher" — FALSE. This is the most heavily tested misconception. The agent toggle explicitly does not apply to Researcher or Analyst.
> - "Admins can assign Researcher to specific users" — FALSE. The Edit users panel is disabled; it is tenant-wide available or tenant-wide blocked.
> - Do not confuse Researcher's web source (Bing) with an internet browsing capability. Researcher uses the Bing *index* (cached/crawled web data), not a real-time browser — unless Computer Use is specifically enabled.
> - Researcher respects existing M365 permissions: it cannot surface data a user does not already have access to. This is a common data security concern that is actually not a risk.

---

## 3. Microsoft 365 Copilot Analyst Agent

### What it is

**Analyst** is the second first-party Microsoft agent preinstalled and pre-pinned for all Microsoft 365 Copilot licensed users alongside Researcher. Where Researcher is built for multi-source research and synthesis, Analyst is purpose-built for **structured data analysis and computation** — particularly tasks involving Excel, tabular data, CSV files, and quantitative reasoning. Analyst can run Python code in a sandboxed environment, generate charts and visualizations, and work through complex multi-step analytical workflows.

Analyst appears under **Agents** in the Microsoft 365 Copilot Chat interface. Like Researcher, it was deployed by Microsoft to existing M365 Copilot licensed users without requiring admin activation.

### Why it matters for AB-900

Analyst and Researcher are the two agents that are most likely to appear as a paired comparison question on AB-900. The exam tests whether candidates can differentiate the two agents' purposes, understand that both share identical governance behavior (both are immune to the agent toggle, both require explicit blocking), and correctly identify which agent is appropriate for a given scenario. Analyst's Python code execution capability is a distinctive technical detail frequently tested.

### How it works

Analyst operates on a **structured data + code execution** model rather than Researcher's retrieval-and-synthesis model.

**Primary data focus:**
- Excel workbooks and tabular/structured data
- CSV files and datasets the user uploads or has access to in M365
- Quantitative and analytical tasks requiring computation

**Code execution:**
Analyst can generate and execute **Python code** in a sandboxed environment. This is a capability Microsoft refers to as "Code Interpreter" functionality. The Python execution is isolated — it does not have access to the internet or to other tenant systems. Analyst uses this to:
- Perform statistical analysis
- Generate charts, graphs, and visualizations
- Build and modify PivotTables and formulas
- Conduct variance analysis and forecasting
- Run calculations too complex for standard Copilot chat

**Data sources:**
Unlike Researcher, Analyst is primarily focused on data the user provides or has in their Microsoft 365 environment. It does not use Bing web search by default for its core analytical tasks.

**Output:**
Analyst produces structured outputs including Python-generated visualizations, data tables, narrative summaries of findings, and analytical reports. The "Think Deeper" mode, available for Copilot in Excel with Python, uses reasoning models for more elaborate multi-step analysis.

### Admin controls

Analyst shares **identical governance behavior** to Researcher:

- **Preinstalled and pre-pinned** for all M365 Copilot licensed users
- **NOT governed by the Copilot agents toggle** — the toggle does not apply
- **No granular user/group assignment** — the Edit users panel is disabled
- **Block/unblock applies tenant-wide only**

**How to block Analyst:**
```
admin.microsoft.com
  └── Agents (left navigation)
        └── All Agents
              └── Select "Analyst"
                    └── Block (in the agent details pane)
```

**Key governance documentation quote:**
> "For the Researcher and Analyst agents, the Edit users panel is disabled. To manage their availability, block the agent for the entire tenant by using the Block action in the Microsoft 365 admin center."

**Monitoring:**
Like Researcher, there is no existing reporting dashboard for Analyst usage metrics. Admins cannot access the content of Analyst sessions through standard compliance tooling.

### Key distinctions

| Attribute | Researcher | Analyst |
|---|---|---|
| **Primary use** | Multi-step research, synthesis, reports | Structured data analysis, computation |
| **Best for** | "Research market trends using our emails and the web" | "Analyze this Excel file and identify variance patterns" |
| **Data sources** | Microsoft Graph (work data) + Bing (web) | Primarily user-provided structured data |
| **Code execution** | No | Yes — Python in sandboxed environment |
| **Web access** | Yes (Bing index, unless disabled) | Primarily no (analytical sandbox is isolated) |
| **Output type** | Structured research report with web + work citations | Charts, tables, visualizations, code output |
| **Agent toggle** | Not governed by it | Not governed by it |
| **User assignment** | Tenant-wide only | Tenant-wide only |

**Analyst vs. standard "Copilot in Excel":** Standard Copilot in Excel performs in-context operations within a workbook (formula suggestions, data highlights, chart creation). Analyst is a standalone agent in Copilot Chat that performs deeper multi-step analysis and can run Python. They are complementary but distinct.

**Analyst vs. Finance agents:** Microsoft offers specialized Finance agents (separate licensing) for finance-specific workflows like variance analysis in Excel integrated with ERP systems. Analyst is the general-purpose data analysis agent included with M365 Copilot licenses.

### Exam scenario examples

**Scenario A:** A user asks: "I need to analyze a 50,000-row dataset and identify quarterly sales variance trends with visualizations. Should I use standard Copilot chat, Researcher, or Analyst?"

*Answer:* Analyst. It is purpose-built for structured data analysis, supports Python code execution in a sandboxed environment for statistical computation, and produces charts and visualizations. Researcher is built for research synthesis, not computation. Standard Copilot chat can handle basic data questions but lacks deep analytical and code execution capabilities.

**Scenario B:** An admin has turned off the Copilot agents toggle in the admin center. A user reports that both Researcher and Analyst are still showing as available. Is this expected behavior?

*Answer:* Yes, this is expected and by design. The Copilot agents toggle does not apply to Researcher or Analyst because they are first-party Microsoft experiences considered part of the core Copilot chat experience, not governed by agent policies. To block either or both agents, the admin must navigate to `admin.microsoft.com > Agents > All Agents`, select each agent individually, and choose Block.

**Scenario C:** A user wants to use Analyst to research competitor products on the web and then run calculations on the findings. Which part of this request is outside Analyst's design?

*Answer:* The web research component. Analyst's core purpose is structured data analysis and computation on data the user has access to or provides. Researcher is the appropriate agent for multi-source research that combines web data with work content. The user would be better served by using Researcher to gather and synthesize the web-based competitive data, and then using Analyst or Copilot in Excel to run calculations on the resulting dataset.

### Quick-reference summary

- Analyst is **preinstalled and pre-pinned** for all M365 Copilot licensed users — identical deployment model to Researcher
- Purpose-built for **structured data analysis, computation, and Python code execution** in a sandboxed environment
- The **agent toggle does NOT block Analyst** — must explicitly block via `Agents > All Agents > Analyst > Block`
- No user/group assignment — all-or-nothing blocking at tenant level
- Analyst does NOT use Bing web search as a primary data source; it is focused on user-provided and M365 structured data

> **Exam Traps**
>
> - "Researcher and Analyst can both be blocked by the agent toggle" — FALSE for both. This is the same trap as for Researcher but now applied to the pair. Exam questions may describe blocking one without the other, or assume the toggle covers both.
> - "Analyst can access the web" — Generally false for its analytical core. Unlike Researcher, Analyst's sandboxed Python environment is isolated from the internet.
> - Do not confuse Analyst with "Copilot in Excel" — they are different experiences. Analyst is a standalone agent in Copilot Chat. Copilot in Excel is an in-app Copilot experience within the Excel application.
> - "Analyst is better for spreadsheet creation" — this is directly stated in Microsoft's Researcher FAQ as a way to differentiate the two agents, and is a likely distinction question.

---

## 4. Microsoft 365 Copilot Pay-as-You-Go Billing

### What it is

**Microsoft 365 Copilot pay-as-you-go (PAYG)** is a consumption-based billing model that allows organizations to provide access to specific Copilot capabilities — primarily Microsoft 365 Copilot Chat agents and SharePoint agents — without requiring per-user prepaid Copilot licenses. Instead of paying a fixed monthly or annual fee per user, the organization pays only for actual usage, billed through an **Azure subscription** using Azure meters. This model is designed for organizations that want to:

- Establish usage patterns before committing to prepaid licenses
- Provide access to Copilot agents for users who do not have dedicated M365 Copilot licenses
- Scale access dynamically based on demand

PAYG is **disabled by default**. A Global administrator, Billing administrator, or AI administrator must explicitly configure it.

### Why it matters for AB-900

Pay-as-you-go billing represents a fundamentally different commercial model from standard M365 subscription management. The exam tests whether candidates understand the two-step configuration process, the Azure subscription dependency, where the controls live in the admin center, what gets billed and at what rate, and the critical distinction between what PAYG provides versus what a full M365 Copilot license provides. This is an area where experienced M365 admins frequently assume billing is managed entirely within the Microsoft 365 admin center and miss the Azure subscription dependency.

### How it works

**What PAYG covers:**
- Microsoft 365 Copilot Chat (declarative agents, including SharePoint agents)
- SharePoint agents specifically
- Microsoft Copilot Retrieval API (preview)

**What PAYG does NOT cover:**
- Full Microsoft 365 Copilot features (Word Copilot, Teams meeting summarization, Outlook draft, Researcher, Analyst, etc.) — those require a paid per-user M365 Copilot license
- PAYG provides access to *agents* running in Copilot Chat, not the full Copilot suite

**Billing mechanism:**
Usage is billed through the **Copilot Studio message meter** at **$0.01 per message** (a "message" is a request or response that triggers an agent action). Charges flow to the linked Azure subscription and appear in **Azure Cost Management**.

**The two-step configuration process:**

Step 1 — Add a billing policy:
```
admin.microsoft.com
  └── Copilot
        └── Billing & usage
              └── Billing policies tab
                    └── Add a billing policy
```
A billing policy defines: (a) the Azure subscription to charge, (b) the Azure resource group, (c) the Azure region (determines where tenant ID and usage data are stored), and (d) the user scope (all users or a specific security group). A budget limit with email alerting can optionally be configured. Up to 50 billing policies can be created per tenant.

Step 2 — Connect the billing policy to a Copilot service:
```
admin.microsoft.com
  └── Copilot
        └── Billing & usage
              └── Pay-as-you-go services tab
                    └── Select "Microsoft 365 Copilot Chat" or "SharePoint agents"
                          └── Connect billing policy
```

Creating a billing policy alone does not activate PAYG. Both steps are required.

**Azure subscription prerequisites:**
- Admin must have **Owner or Contributor** role on the Azure subscription
- Admin must have **Owner or Contributor** role on the Azure resource group
- Azure subscriptions and resource groups can be created from within the M365 admin center billing policy wizard — no need to navigate to the Azure portal separately
- The billing account must be connected to a **Microsoft Customer Agreement (MCA)** to create new subscriptions from the M365 admin center

**Monitoring and cost visibility:**
- Usage monitoring: `admin.microsoft.com > Copilot > Billing & usage > Billing policies > [policy] > Budget tab > Spending`
- Cost analysis: **Microsoft Cost Management** in the Azure portal (filter by the Power Platform account resource corresponding to the billing policy)
- Detailed usage breakdown (by environment, app/agent, and user): downloadable report from the Power Platform admin center Billing plan page

**Budget behavior (critical nuance):**
Budget limits **trigger email notifications** when spending milestones are reached. They do **not enforce spending caps** — the service continues running even after the budget is exceeded. This is explicitly documented.

**Disabling PAYG:**
To disable: `Copilot > Billing & usage > Pay-as-you-go services tab > [service] > clear billing policy checkbox`. Note: after disconnection, it can take **up to two hours** for users to lose access.

### Admin controls

| Control | Where | Notes |
|---|---|---|
| Create billing policy | `admin.microsoft.com > Copilot > Billing & usage > Billing policies` | Requires Azure Owner/Contributor role |
| Connect policy to service | `admin.microsoft.com > Copilot > Billing & usage > Pay-as-you-go services` | Must be done separately from policy creation |
| Set budget / alerts | Within billing policy > Budget tab | Notifications only; does NOT enforce spending cap |
| View spending | Within billing policy > Budget tab > Spending | |
| View cost breakdown | Azure portal > Azure Cost Management | Filter by Power Platform account resource |
| Detailed usage per user | Power Platform admin center > Billing plan > Download reports | |
| Disable PAYG | `Copilot > Billing & usage > Pay-as-you-go services` | Takes up to 2 hours to take effect |

**Roles that can manage PAYG:**
- Global administrator
- Billing administrator
- AI administrator
- Global reader (view only)

### Key distinctions

- **PAYG is not the same as a full M365 Copilot license.** A PAYG user can access Copilot Chat agents; they cannot use the full Copilot in-app experiences (Word Copilot, Teams meeting recap, Outlook drafting, Researcher, Analyst).
- **The Azure subscription is non-negotiable.** PAYG cannot be configured without linking to an Azure subscription. Organizations with no Azure footprint must create one.
- **Two steps are required.** Creating a billing policy does not activate PAYG — the policy must also be connected to a Copilot service. This two-step requirement is a frequent exam question.
- **Budget limits are soft caps.** They notify; they do not block usage. This is a commonly missed distinction.
- **The meter is the Copilot Studio message meter at $0.01/message.** This applies to declarative agent usage regardless of whether the agent was built in SharePoint, Copilot Studio, or provided by Microsoft.
- **PAYG can coexist with Power Platform admin center billing policies.** If PAYG was already configured in the Power Platform admin center, a new policy in the M365 admin center can be added simultaneously; the billing system ensures no double-charging.

### Exam scenario examples

**Scenario A:** A Contoso admin wants to enable PAYG for Microsoft 365 Copilot Chat agents for a pilot group of 200 users. They navigate to `admin.microsoft.com > Copilot > Billing & usage`, create a billing policy linked to an Azure subscription, and scope it to the pilot security group. Users in the group still cannot access PAYG agents. What step was missed?

*Answer:* The billing policy was created but not connected to a Copilot service. The admin must navigate to the **Pay-as-you-go services tab**, select Microsoft 365 Copilot Chat, and connect the newly created billing policy to the service. Creating the policy defines the billing infrastructure; connecting it activates access.

**Scenario B:** A Contoso finance team has exceeded the $500 monthly budget set on their PAYG billing policy, but Copilot agents are still running and charges are still accruing. Is this expected? What can the admin do?

*Answer:* Yes, this is expected behavior. Budget limits in PAYG are notification thresholds only — they generate email alerts but do not enforce spending caps or stop service. To stop charges, the admin must manually disconnect the billing policy from the Copilot service in the Pay-as-you-go services tab. Note that disconnection takes up to two hours to take effect.

**Scenario C:** An admin is asked whether a user with PAYG access enabled can use the Researcher agent to do competitive research. How should the admin respond?

*Answer:* No. Researcher is a feature of the **full Microsoft 365 Copilot license** — it is not accessible via PAYG. PAYG provides access to declarative agents running in Copilot Chat (such as SharePoint agents and other agents billed through the Copilot Studio meter). Full Copilot capabilities (Researcher, Analyst, in-app Copilot in Word/Excel/Teams/Outlook) require a paid per-user M365 Copilot license.

### Quick-reference summary

- PAYG covers **Copilot Chat agents and SharePoint agents** — NOT the full M365 Copilot suite
- **Two-step process:** (1) create billing policy → (2) connect to Copilot service; either step alone does not activate access
- Requires an **Azure subscription** (Owner/Contributor role required); billing flows through Azure Cost Management
- **$0.01 per message** via the Copilot Studio message meter
- Budget limits **send alerts only** — they do not block or cap usage; service continues after budget is exceeded
- Primary admin portal: `admin.microsoft.com > Copilot > Billing & usage`

> **Exam Traps**
>
> - "Creating a billing policy enables PAYG" — FALSE. The policy must also be connected to a Copilot service. A very common two-step confusion.
> - "Budget limits prevent overspending" — FALSE. They trigger email notifications only. Usage continues uninterrupted.
> - "PAYG provides access to full M365 Copilot" — FALSE. PAYG provides access to agents in Copilot Chat only, not the full Copilot in-app experiences.
> - "PAYG is configured in the Azure portal" — PARTIALLY FALSE. The billing policy is created in the Microsoft 365 admin center. Azure Cost Management is used to *monitor* charges, but configuration is done in the M365 admin center.
> - Do not confuse the AI administrator role (which can manage PAYG) with the Compliance Administrator role (which manages DSPM for AI). They are different roles for different products.

---

## 5. SharePoint Advanced Management for Copilot AI Governance

### What it is

**SharePoint Advanced Management (SAM)** is a governance add-on for SharePoint and OneDrive that provides a suite of capabilities specifically designed to control content sprawl, prevent oversharing, manage site lifecycle, and enforce access policies. In the context of Microsoft 365 Copilot, SAM takes on critical importance because **Copilot grounds its responses in content the signed-in user can access** — meaning overshared SharePoint content becomes a Copilot data exposure risk, not just a traditional file-sharing concern.

SAM is either:
- A **standalone paid add-on** (SharePoint Advanced Management Plan 1, per-user) for organizations without M365 Copilot licenses
- **Included with Microsoft 365 Copilot licenses** — any tenant where at least one user is assigned an M365 Copilot license automatically gains access to SAM features required for Copilot deployment (with the exception of the Restricted Site Creation feature)

### Why it matters for AB-900

SAM represents a new administrative layer between SharePoint administration and Copilot governance. The exam tests whether candidates understand the specific SAM capabilities relevant to Copilot AI governance (not general SharePoint administration), the licensing model (included vs. paid add-on), and how SAM features map to Copilot-specific risks. This is an area where SharePoint admins may know SAM features exist but not understand their Copilot-specific implications.

### How it works

SAM provides capabilities across three governance domains:

**Domain 1: Oversharing Controls**

These are the capabilities most directly relevant to Copilot AI governance:

| SAM Feature | What it does | Copilot relevance |
|---|---|---|
| **Data Access Governance Reports** | Identify sites with overshared or sensitive content: EEEU usage, "People in org" links, "Anyone" links, sensitivity labels, site permissions org-wide | Reveals sites whose content Copilot could surface to unauthorized users |
| **Restricted Content Discovery (RCD)** | Prevents specific SharePoint sites from appearing in Copilot results and org-wide search; **does not change underlying permissions** | Key interim control — block Copilot access to a site without modifying who formally has permission |
| **Restricted Access Control (RAC)** | Limits site access to users in a specific security group; **does change underlying permissions** | More restrictive than RCD; prevents access entirely, not just Copilot discovery |
| **Site Access Reviews** | Delegates review of overshared sites to site owners via email; owners attest whether access is appropriate | Scales governance to site owners rather than requiring central admin action |
| **Content Management Assessment** | Aggregates reporting and governance tools in one place; provides AI-powered insights on governance status | Starting point for Copilot readiness assessment |
| **Block Download Policy** | Prevents file downloads from specified sites (browser-only access) | Limits data exfiltration risk for highly sensitive sites |
| **Conditional Access Policies** | Links Microsoft Entra Conditional Access policies to specific SharePoint sites using authentication contexts | Enables site-level step-up authentication requirements |

**Domain 2: Content Sprawl Controls**

| SAM Feature | What it does |
|---|---|
| **Site Ownership Policy** | Identifies ownerless sites; automates notifications to ownership candidates; run in simulation mode before going active |
| **Inactive Sites Policy** | Detects sites with no activity over a configurable period; notifies owners for attestation; optionally archives or triggers deletion |
| **Site Attestation Policy** | Prompts site owners and admins periodically to confirm a site is still needed and correctly governed |
| **AI Insights** | AI-generated pattern analysis of report results; appears as "Get AI insights" button next to reports in SharePoint admin center |

**Domain 3: Content Lifecycle**

| SAM Feature | What it does |
|---|---|
| **Site Change History Reports** | Track property changes to SharePoint sites over the last 180 days |
| **Recent Admin Actions** | View the last 30 changes you personally made to site properties within 30 days |
| **Catalog Management** | Organize sites into logical categories (by region, department, etc.) for targeted governance |
| **Agent Insights** | Visibility into agents created in SharePoint and their activities |
| **Insights on Agents Accessing Content** | Reports on how agents access content across SharePoint and OneDrive sites |

**The Copilot readiness workflow using SAM:**

Microsoft recommends a six-step approach to using SAM before and after enabling Copilot:

1. Reduce accidental oversharing with SharePoint sharing settings (built-in, no SAM required)
2. Ensure all sites have valid owners — use Site Ownership Policy
3. Clean up unused sites — use Inactive Sites Policy
4. Identify sites with potentially overshared content — use Data Access Governance Reports
5. Control access to content — use RAC (changes permissions) or RCD (blocks Copilot discovery without changing permissions)
6. Take proactive measures on business-critical sites — apply RAC proactively at site creation

**RCD vs. RAC — the most important distinction for AB-900:**

| | Restricted Content Discovery (RCD) | Restricted Access Control (RAC) |
|---|---|---|
| Changes file permissions? | **No** | **Yes** |
| Blocks Copilot from surfacing content? | **Yes** | **Yes** (because users lose access) |
| Blocks org-wide search? | Yes | Yes (because users lose access) |
| Users who already have permissions can still access directly? | **Yes** | **No** |
| Best used when | Permissions are correct but you want to exclude from Copilot/search temporarily | Access itself is too broad and needs restriction |

### Admin controls

**Prerequisites:**
- SharePoint Administrator role to access SharePoint admin center
- At least one M365 Copilot license assigned in the tenant (to access SAM features included with Copilot), OR a standalone SAM Plan 1 license purchased

**Portal navigation:**
```
SharePoint admin center (admin.sharepoint.com)
  └── Reports
        └── Data access governance        (Oversharing reports: EEEU, sharing links, site permissions)
  └── Policies
        └── Site lifecycle management     (Inactive sites policy)
        └── Site ownership policy
        └── Restricted access control     (RAC policies)
        └── Restricted content discovery  (RCD policies)
  └── Content services
        └── Content management assessment (Copilot readiness hub)
```

**Licensing detail for AB-900:**
- SAM is included with **Microsoft 365 Copilot** license (WW, GCC, GCC-H, DoD variants)
- The one SAM feature **not** included with M365 Copilot licenses: **Restricted Site Creation**
- Organizations without any Copilot licenses can purchase **SharePoint Advanced Management Plan 1** as a standalone per-user add-on
- The licensing model is per-user for the standalone add-on; external users do not require a license

### Key distinctions

- **SAM is not the same as the standard SharePoint admin center.** Many SharePoint admins are familiar with basic sharing settings and site management. SAM adds a governance layer with automated policies, AI insights, delegation workflows, and Copilot-specific controls that are not available in base SharePoint administration.
- **RCD does not change permissions; RAC does.** This is the most tested SAM distinction on AB-900. RCD is the "soft" Copilot exclusion; RAC is the "hard" access restriction.
- **SAM is included with M365 Copilot — it is not a separate purchase for Copilot customers.** A common mistake is to treat SAM as always requiring an add-on purchase. If the tenant has M365 Copilot licenses, SAM features for Copilot deployment are already available to SharePoint admins.
- **SAM does not replace DSPM for AI.** They serve complementary roles: SAM handles SharePoint-level access governance (permissions, sharing, site lifecycle). DSPM for AI handles cross-platform AI activity monitoring, sensitive data detection in prompts, and policy creation across Purview solutions.
- **Restricted SharePoint Search** (a separate feature allowing admins to temporarily limit Copilot search to a specific list of approved sites) is a related but distinct control from RCD — it limits what sites Copilot can search across the entire tenant, whereas RCD excludes specific individual sites.

### Exam scenario examples

**Scenario A:** Before enabling Microsoft 365 Copilot for all users, a Contoso SharePoint admin wants to prevent Copilot from surfacing content from the company's HR and Legal SharePoint sites while the permissions audit is being completed — but does not want to remove current user access during the audit. Which SAM feature should they use?

*Answer:* Restricted Content Discovery (RCD). RCD prevents the HR and Legal sites from appearing in Copilot results and org-wide search, without changing who has file-level access to those sites. Users who currently have permissions can still navigate directly to the sites. Once the permissions audit is complete and access is corrected, RCD can be removed.

**Scenario B:** A Contoso admin reviews the Data Access Governance report and finds 15 sites that are sharing content with "Everyone Except External Users." The admin wants site owners to review and remediate this. What is the correct SAM-based action?

*Answer:* Use the **Site Access Review** feature to delegate the review to site owners. The admin initiates a site access review from the Data Access Governance report, which sends email notifications to the identified site owners, prompting them to review the sharing configuration and confirm whether the access is appropriate or take corrective action.

**Scenario C:** A company is evaluating whether to purchase SharePoint Advanced Management. They already have Microsoft 365 Copilot licenses assigned to 500 of their 1,000 employees. Do they need to purchase SAM separately?

*Answer:* No, for the Copilot-licensed users. Because the tenant has at least one user with an M365 Copilot license, SharePoint administrators automatically gain access to the SAM features required for Copilot deployment — at no additional cost. If the company also wants SAM features for the 500 non-Copilot users, or if they want the Restricted Site Creation feature (not included with Copilot), they would need to purchase standalone SAM Plan 1 licenses for those users.

### Quick-reference summary

- SAM is **included with M365 Copilot licenses** (at least one assigned user unlocks SAM for SharePoint admins); standalone SAM Plan 1 is available for organizations without Copilot
- **RCD** blocks Copilot from surfacing a site's content without changing permissions — the "soft" interim control
- **RAC** restricts actual site access to a security group — the "hard" permission change
- **Data Access Governance Reports** identify overshared sites by type: EEEU, sharing links, site permissions — the starting point for Copilot readiness
- Copilot grounds responses in content the user can access — **oversharing is a direct AI data exposure risk**, not just a file management concern

> **Exam Traps**
>
> - "SAM must always be purchased as an add-on" — FALSE. It is included with M365 Copilot licenses. Only organizations without any Copilot licenses need the standalone purchase.
> - "RCD removes user access to a site" — FALSE. RCD only prevents the site from appearing in Copilot and org-wide search. Users with existing permissions can still access the site directly.
> - "SAM features are available to all admin roles" — FALSE. SAM features are accessible to the **SharePoint Administrator** role. Compliance administrators access oversharing insights through DSPM for AI, not the SharePoint admin center directly.
> - "SAM replaces DSPM for AI" — FALSE. They are complementary: SAM handles SharePoint-level access governance; DSPM for AI handles Purview-level AI activity monitoring and policy creation.
> - "Restricted Site Creation is included with M365 Copilot licenses" — FALSE. This is the one SAM feature explicitly excluded from the M365 Copilot license bundle.

---

## Cross-Topic Exam Traps Summary

These are the most common cross-topic confusions that experienced M365 admins make on AB-900:

| Misconception | Correct understanding |
|---|---|
| The Copilot agents toggle blocks Researcher and Analyst | It does NOT. Both must be explicitly blocked via `Agents > All Agents > [Agent] > Block` |
| PAYG activates when you create a billing policy | You must also connect the billing policy to a Copilot service — two steps required |
| Budget limits in PAYG prevent overspending | They send email alerts only; service continues after budget is exceeded |
| DSPM for AI requires admin setup to run risk assessments | The default weekly assessment for top 100 SharePoint sites runs automatically — no setup required |
| SAM always requires a paid add-on purchase | It is included with M365 Copilot licenses (one exception: Restricted Site Creation) |
| RCD removes user access to SharePoint sites | RCD blocks Copilot/search discovery only; permissions are unchanged |
| Monitoring third-party AI (ChatGPT) in DSPM for AI only requires Purview licenses | Device onboarding is also required |
| PAYG provides full M365 Copilot functionality | PAYG provides access to Copilot Chat agents only, not the full Copilot suite |
| Researcher only uses Microsoft Graph (work data) | Researcher uses BOTH Microsoft Graph AND Bing (web) |
| Analyst can search the web like Researcher | Analyst's code execution sandbox is isolated; it does not use web search for its analytical tasks |

---

*Document compiled from Microsoft Learn documentation as of March 2026. Always verify current portal navigation and feature availability against official Microsoft documentation before delivering content in a training context.*
