# AB-900 Exam Traps Cheat Sheet
**Review this in the 30 minutes before your exam. Every line earns its place.**

**Aligned to:** AB-900 skills measured as of **July 22, 2026**. Verified 2026-07-26.

---

## 1. Portal Quick-Reference (Where Things Live)

| Task | Portal | Exact Path |
|------|--------|------------|
| Sensitivity labels | purview.microsoft.com | Solutions > Information Protection > Labels |
| DLP policies | purview.microsoft.com | Solutions > Data Loss Prevention > Policies |
| **DSPM (new unified, GA May 2026)** | purview.microsoft.com | Solutions > **DSPM** |
| **DSPM for AI (classic)** -- the wording the objective uses | purview.microsoft.com | Solutions > **DSPM for AI (classic)** |
| Insider Risk Management | purview.microsoft.com | Solutions > Insider Risk Management |
| Communication Compliance | purview.microsoft.com | Solutions > Communication Compliance |
| Compliance Manager | purview.microsoft.com | Solutions > Compliance Manager |
| **Data explorer** (current answer for finding sensitive info) | purview.microsoft.com | Solutions > **Information Protection > Explorers > Data explorer** |
| **Content explorer (classic)** | purview.microsoft.com | Solutions > **Data Lifecycle Management > Explorers > Content explorer** |
| Activity explorer | purview.microsoft.com | Within the solution's **Explorers**, or DSPM > Discover > Activity explorer > AI activities |
| **Content search** | purview.microsoft.com | Solutions > **eDiscovery > Content Search** |
| Audit log search | purview.microsoft.com **or** security.microsoft.com | **Audit** (both portals work; `security.microsoft.com/auditlogsearch` is a deep link) |
| Data Lifecycle Management | purview.microsoft.com | Solutions > Data Lifecycle Management |
| Copilot settings (tenant-wide) | admin.microsoft.com | Copilot > Settings |
| **Agent approval queue** | admin.microsoft.com | **Agents > All agents > Requests** |
| Agent registry / inventory | admin.microsoft.com | **Agents > All agents > Registry** |
| Agent policy configuration | admin.microsoft.com | **Agents > Settings** |
| MCP tool approval | admin.microsoft.com | **Agents > Tools > Requests** |
| Copilot billing / PAYG | admin.microsoft.com | **Copilot > Billing & usage** |
| Copilot usage report | admin.microsoft.com | Reports > Usage > Microsoft 365 Copilot > Copilot > **Usage** tab |
| Copilot Credits report | admin.microsoft.com | Reports > Usage > Microsoft 365 Copilot > **Credits** |
| Agent usage reports | admin.microsoft.com | Reports > Usage > Microsoft 365 Copilot > **Agents** |
| **Copilot Dashboard** | **Viva Insights app** (Teams or web) | Open **Viva Insights** > **Copilot Dashboard**. An **AI Administrator** enables and delegates it from admin.microsoft.com. |
| Baseline security mode | admin.microsoft.com | ... Show all > Settings > Org Settings > Security and Privacy > Baseline Security Mode |
| **PIM** | entra.microsoft.com | **ID Governance > Privileged Identity Management** |
| **Conditional Access** | entra.microsoft.com | **Entra ID > Conditional Access > Policies** |
| **Identity Secure Score** | entra.microsoft.com | **Entra ID > Identity Secure Score** |
| Authentication methods | entra.microsoft.com | **Entra ID > Authentication methods > Policies** |
| App registrations / Enterprise apps | entra.microsoft.com | Entra ID > App registrations / Enterprise applications |
| **SharePoint oversharing reports** | SharePoint admin center | **Reports > Data access governance** |
| Restricted access control (tenant) | SharePoint admin center | **Policies > Access control > Site-level access restriction** |
| Restricted content discovery (per site) | SharePoint admin center | **Sites > Active sites** > site > **Settings** tab > Restrict content discovery |
| Power Platform DLP | admin.powerplatform.microsoft.com | Policies > Data policies |
| Teams app governance | admin.teams.microsoft.com | Teams apps > Manage apps |

> **Portal rename trap:** Microsoft Learn now refers to **"the retired Microsoft Purview compliance portal"**. The correct portal is **purview.microsoft.com**. Caution for a live demo: `compliance.microsoft.com` still returns a redirect to a Microsoft sign-in flow, so do not claim the URL "fails to load" -- claim it is **retired and superseded**.

> **Two paths that both work:** `admin.microsoft.com` and `admin.cloud.microsoft` are both current for the Microsoft 365 admin center.

---

## 2. The Most Common Wrong Answers

| If the question says... | Do NOT pick this... | Pick this instead |
|-------------------------|--------------------|-------------------|
| Configure compliance or data protection | compliance.microsoft.com | **purview.microsoft.com** |
| Identify sensitive information across the tenant | Content explorer | **Data explorer** (the July 2026 objective wording) |
| Investigate AI-specific oversharing risk | Content explorer | **DSPM for AI** |
| Search for files and emails for a legal matter | Standalone Content Search solution | **Content search inside Microsoft Purview eDiscovery** |
| Who should manage Copilot compliance policies? | Global Administrator | **Compliance Administrator** (least privilege) |
| Who can approve an agent request? | Global Reader or Security Administrator | **AI Administrator** or Global Administrator |
| Who manages Copilot reports and the Copilot Dashboard? | Compliance Administrator | **AI Administrator** |
| Disable Researcher and Analyst | Toggle off the agents setting | **Block each agent tenant-wide.** They do NOT fall under **any** agent-related settings. |
| Assign Researcher to a pilot group | Use Edit users | **Not possible.** Edit users is disabled; it is tenant-wide available or blocked. |
| Find Copilot pay-as-you-go billing | Billing > Pay-as-you-go | **admin.microsoft.com > Copilot > Billing & usage** |
| Primary queue for agent approval requests | Teams admin center, or Copilot > Agents > Requested agents | **admin.microsoft.com > Agents > All agents > Requests** |
| Prevent Copilot from surfacing a site while permissions are audited | Remove permissions, or Restricted SharePoint Search | **Restricted content discovery (RCD)** |
| Restrict who can open a sensitive site at all | Restricted content discovery | **Restricted access control (RAC)** |
| Recommended control for SharePoint oversharing in Copilot | Restricted SharePoint Search | **RCD.** RSS blocks new enablement **starting July 31, 2026**. |
| User assigned a Copilot license, are they ready? | Yes, immediately | **Up to 24 hours** for Copilot to appear in some apps; an app restart or refresh may be needed |
| Report Copilot usage to leadership | Purview audit logs | **Copilot usage report or Copilot Dashboard.** Microsoft explicitly warns audit logs are not intended for usage reporting. |
| Researcher and Analyst are the same | True | **False.** Researcher = multi-source research and synthesis. Analyst = analysis and computation, better for Excel. |
| Block a specific third-party agent in Teams | Microsoft 365 admin center only | **Teams admin center > Teams apps > Manage apps** for the Teams app surface |
| Copilot Studio billing unit | Tokens or messages | **Copilot Credits** ($0.01 per credit) |
| Minimum seats to buy Microsoft 365 Copilot | 300 | **No minimum.** 300 is a **maximum** on Copilot Business and Business-with-Copilot SKUs. |
| Top enterprise SKU for Copilot | Microsoft 365 E5 | **Microsoft 365 E7** (GA May 1, 2026) includes Copilot in the base SKU |
| Agent 365 status | Preview | **Generally available** for Commercial since May 1, 2026 |
| Does AB-900 need renewal? | Yes, annually | **No. Fundamentals certifications do not expire.** |
| Can you use Microsoft Learn during the exam? | Yes | **No.** In-exam Learn is role-based exams only. |

---

## 3. Domain 2 Purview Tools -- What Each One Does

| Tool | What it does | When the exam uses it |
|------|--------------|-----------------------|
| **Sensitivity labels** | Tag and protect content (encrypt, restrict sharing, content markings) | Protecting documents and emails at rest and in transit |
| **DLP policies** | Detect and block sharing of sensitive data types | Preventing accidental leaks via email, Teams, SharePoint, **and Copilot** |
| **Insider Risk Management** | Correlate signals to detect risky user behavior; **"Risky AI usage"** template for AI | Departing employee data theft, prompt injection, policy violations |
| **Communication Compliance** | Monitor messages for regulatory or policy violations; **"Detect Microsoft Copilot interactions"** template | Reviewing Teams, email, and Copilot prompts for harassment or compliance |
| **DSPM for AI** | AI-specific risk: oversharing, sensitive prompts, risky users, weekly SharePoint risk assessment | Auditing what users are sending to Copilot and other AI apps |
| **Compliance Manager** | Score and track compliance posture against frameworks, including **AI regulation templates** | GDPR/ISO readiness, improvement actions |
| **Data explorer** | Find where sensitive information lives (**the July 2026 objective's named tool**) | "Identify sensitive information by using Microsoft Purview Data Explorer" |
| **Content explorer (classic)** | The older browse-labeled-content tool | Legacy wording; not the current objective answer |
| **Activity explorer** | Audit label and DLP activity over time; ~50 filters | Investigating when and how a label was applied or removed |
| **Data Lifecycle Management** | Retention policies, including retention of Copilot prompts and responses | Auto-deleting or retaining content per policy |
| **eDiscovery** | Unified solution; contains **Content search**; premium features toggled per case | Legal search across mailboxes, sites, and **Copilot prompts in the user mailbox** |
| **Audit** | Unified audit log; `CopilotInteraction` operation; `XPIADetected` prompt-injection flag | Proving what Copilot touched and when |

---

## 4. Licensing Model Comparison

| Model | Who needs it | Billed how | Configured where |
|-------|-------------|------------|-----------------|
| **Microsoft 365 Copilot** (enterprise add-on) | Users who need full Copilot in the apps | **$30.00** per user per month (annual billing) | admin.microsoft.com > Billing > Licenses |
| **Microsoft 365 Copilot Business** | Organizations of **300 or fewer** users on Business plans | List **21.00 USD**; **18 USD** under a promotion through December 2026. Annual commitment only. | admin.microsoft.com > Billing |
| **Microsoft 365 E7** | Enterprises wanting one SKU | Reported **$99** per user per month | E5 + Copilot + Entra Suite + Agent 365; no separate Copilot add-on needed |
| **Microsoft Agent 365** | Agent governance at scale | Reported **$15** per user per month standalone; included in E7 | Per **user** at GA; per **agent instance** in Frontier |
| **Copilot pay-as-you-go** | Orgs wanting metered usage without assigned seats | **$0.01 per Copilot Credit** | **admin.microsoft.com > Copilot > Billing & usage** (up to **50** policies) |
| **Copilot credit policy** | Prepaid credits without an Azure subscription | Prepaid packs only | Up to **10** per tenant; **Copilot Chat only** |
| **Copilot Studio capacity pack** | Predictable prepaid agent capacity | **$200.00 per pack per month for 25,000 credits** | Consumed **first**, before pay-as-you-go |
| **Copilot Credit Pre-Purchase Plan** | Committed annual spend at a discount | Copilot Credit Commit Units (CCCUs), one-year term | Azure portal > **Reservations**. **No cancellations or exchanges.** |
| **SharePoint agents** | Users on a Copilot license, **or** PAYG | Included with a Copilot license; **12 credits** per complex prompt for unlicensed users | SharePoint site, plus a billing policy (up to **10**, one security group each) |
| **Microsoft 365 Copilot Chat** | Anyone with an eligible subscription and a work account | Free web-grounded chat with enterprise data protection | **Work-grounded** chat requires a Copilot license |

**Three limits, three different things:** **50** pay-as-you-go billing policies per tenant. **10** Copilot credit policies per tenant. **10** SharePoint agent billing policies.

---

## 5. Agent Taxonomy -- Know the Difference

**The canonical build split is two-way:**

| | **Declarative agents** | **Custom engine agents** |
|---|---|---|
| Hosting | In Microsoft 365, no extra hosting | **Outside** Microsoft 365 |
| Model and orchestration | Copilot's orchestrator and models | Fully customizable |
| Proactive interactions | **Not supported** | **Supported** |
| Compliance | Inherit Microsoft 365 compliance | Builder must ensure their own |
| Designed for | Individual use | Individual **and** group collaboration |

**Management view:**

| Type | Built with | Admin approval? | Governed by agent settings? | Blocking scope |
|------|-----------|-----------------|----------------------------|----------------|
| **Agent Builder agent** | Agent Builder in Microsoft 365 Copilot | Yes (Agents > All agents > Requests) | Yes | Copilot **and** Outlook, Teams |
| **Copilot Studio agent** | Copilot Studio | Yes, plus Power Platform admin center policies | Yes | Copilot **and** Outlook, Teams |
| **SharePoint agent** | SharePoint (site-scoped) | Inherits .agent file permissions | Yes | **Copilot Chat only** |
| **Foundry agent** | Microsoft Foundry | Yes | Yes | **Copilot Chat only** |
| **Researcher** | Microsoft built-in | No | **No -- outside all agent settings** | Tenant-wide **Block** only |
| **Analyst** | Microsoft built-in | No | **No -- outside all agent settings** | Tenant-wide **Block** only |

**Researcher versus Analyst:**
- **Researcher** = deep multi-step research across **Microsoft Graph work data + Copilot connectors + the Bing index**. Limit: **25 queries per user per month**. Web use is governed by the tenant **Allow web search in Copilot** toggle; there is no per-site allowlist.
- **Analyst** = advanced data analysis with chain-of-thought reasoning. Microsoft states it is **better suited than Researcher for Microsoft Excel tasks**.

**Both:** GA since June 2, 2025. Both require a **Microsoft 365 Copilot license**. Both are preinstalled and pre-pinned. Neither can be assigned to a subset of users.

**Creation limits -- do not mix these up:**

| Tool | Knowledge limit |
|------|-----------------|
| **Agent Builder** | **20 total**; 4 public URLs, 100 SharePoint items, 1 SharePoint list, 50 OneDrive files, 5 Teams chat URLs, 20 embedded files. Instructions 8,000 chars, Description 1,000 chars. **No documented starter-prompt maximum.** |
| **SharePoint agent** | **20 source items** total, in any combination. **Maximum 3 starter prompts.** |
| **Copilot Studio** | **500** knowledge sources, 8,000 chars instructions, 500 files, 512 MB file size, 100 skills, 1,000 topics, 200 trigger phrases per topic, 25 SharePoint site URLs with generative orchestration. |

**Capability defaults in Agent Builder:** **code interpreter** ("Create documents, charts, and code") and **image generator** ("Create images") are **BOTH ENABLED BY DEFAULT**. Neither requires a Copilot license or metered usage.

---

## 6. Zero Trust and Entra ID -- Key Exam Concepts

- **PIM eligible versus active:** Eligible = the user can activate a role when needed; Active = the role is always on. Eligible is the Zero Trust default because it minimizes standing access. PIM is at **ID Governance > Privileged Identity Management**, and its audit data covers **30 days**.
- **Conditional Access IF/THEN logic:** IF (user + resource + condition) THEN (grant, block, or require MFA). Policies are evaluated at sign-in, not at license assignment. The target selector is now **Resources (formerly cloud apps)**.
- **Identity Secure Score:** measures how well the tenant follows identity best practices. Found at **Entra ID > Identity Secure Score**. **Recalculates every 24 hours.** It is the **Identity** category of the broader **Microsoft Secure Score** viewed at security.microsoft.com.
- **MFA methods:** TOTP (authenticator app codes), **FIDO2 / passkeys** (phishing-resistant), Windows Hello, certificate-based auth. **Passkeys are the direction of travel** -- Microsoft-provided SMS and voice retire **February 1, 2027**, with passkey auto-enablement starting **September 1, 2026**.
- **Mandatory MFA:** Phase 1 and Phase 2 are both **in force** as of July 2026. No opt-out, including break-glass accounts. Enforced at Azure Resource Manager for Phase 2; **Microsoft Graph APIs are generally NOT in scope**, and Read operations do not require MFA.
- **App registrations versus Enterprise applications:** an app registration holds the **application object** and defines what the app **IS**. An enterprise application holds the **service principal** and defines how the app is **USED and GOVERNED** in your tenant.
- **Zero Trust three principles:** Verify explicitly, Use least privilege access, Assume breach.
- **Microsoft Defender XDR** is the service; the **Microsoft Defender portal** (security.microsoft.com) is the place. "Microsoft 365 Defender" is retired.

---

## 7. Numbers to Know

| Fact | Value | Notes |
|------|-------|-------|
| **Passing score** | **700 or greater** | Scaled score out of 1000; not 70% of raw questions |
| **Exam duration** | **45 minutes** | **65 minutes** seat duration for a Fundamentals exam |
| **Question count** | **40-60** | This is Microsoft's **generic** range for most exams, **not** a published AB-900 figure |
| **Retake wait** | **24 hours** after the first attempt | Wait times increase for subsequent retakes |
| **Renewal** | **None** | Fundamentals certifications **do not expire** |
| **Languages** | **English only** | As of July 22, 2026 |
| **Copilot license activation delay** | **Up to 24 hours** | Users may need to restart or refresh the app |
| **Copilot usage report latency** | Within **48 hours** of end of day UTC | Readiness report available within 72 hours, with up to 72 hours latency |
| **Copilot Credits report history** | **30 days** max in preview | No data before May 3, 2025; filter to 7 or 30 days only |
| **Credits alert threshold** | **2,000 credits** per user | The report alerts admins above this |
| **Pay-as-you-go rate** | **$0.01 per Copilot Credit** | Meter on the Azure invoice is still named **Copilot Studio** |
| **SharePoint agent prompt cost** | **12 credits** | Generative answer (2) + tenant graph grounding (10), for **unlicensed** users |
| **Capacity pack** | **$200 / 25,000 credits / month** | Consumed **before** pay-as-you-go |
| **Overage enforcement** | **125%** of prepaid capacity | Custom agents are disabled until capacity is increased or reset |
| **PAYG billing policies** | **50** per tenant | Copilot credit policies: **10**. SharePoint agent policies: **10**. |
| **Budget behavior** | **Notification only** | Default alert threshold 100%; alerts can take **24 hours** |
| **Researcher query limit** | **25 per user per month** | |
| **Admin agent pins** | **3** | Up to **6 hours** for a pin to appear to end users |
| **Connected agents** | **10** per agent | Excludes agents added by the maker |
| **RAC groups per site** | **10** | |
| **Agent session timeout** | **30 minutes** of inactivity starts a new session | On the per-agent Activity tab |
| **Audit (Standard) retention** | **180 days** | **One year** with E5, Purview Suite, or the eDiscovery and Audit add-on |
| **Audit search jobs** | **10** concurrent, **1** unfiltered | Completed jobs retained **30 days** |
| **DAG activity report window** | **28 days** | E5 without SAM returns up to **10,000 sites** |
| **DSPM default risk assessment** | **Top 100 SharePoint sites**, weekly, automatic | Allow **24 hours** for one-click policy data |
| **Copilot Business seat cap** | **300 maximum** | **There is no seat minimum.** The minimum was removed January 2024. |
| **Microsoft 365 dev sandbox** | **25 user licenses**, up to **90 days** | Renews on qualified development activity; renewal window is 60-90 days |

---

## Quick-Fire Rules (Read Twice)

- **Oversharing plus AI risk = DSPM for AI.** Not Content explorer, not DLP alone.
- **Finding sensitive information = Data explorer.** That is the July 2026 objective wording.
- **Content search lives inside eDiscovery.** It is not a standalone solution.
- **Least privilege beats Global Administrator** on every question about who should perform a task. For Copilot and agents, the answer is usually **AI Administrator**.
- **Researcher and Analyst are outside agent settings entirely.** Block each one tenant-wide; you cannot scope them to a group.
- **Billing questions = admin.microsoft.com > Copilot > Billing & usage.** Never the Billing node.
- **The billing unit is the Copilot Credit**, at $0.01 per credit, even though the Azure meter is still named Copilot Studio.
- **Agent approval requests live at admin.microsoft.com > Agents > All agents > Requests.** Not under Copilot, not "Requested agents".
- **purview.microsoft.com is the answer** any time compliance.microsoft.com is an option.
- **Conditional Access and Identity Secure Score are Entra ID. PIM is ID Governance.**
- **SharePoint oversharing = SharePoint admin center > Reports > Data access governance.**
- **RAC changes access. RCD changes discoverability.** Enforcement versus concealment.
- **RSS is retiring July 31, 2026.** Answer RCD.
- **No 300-seat minimum.** 300 is a maximum on the SMB SKUs.
- **E7 includes Copilot.** E5 does not.
- **Budgets notify; they do not cap.**

---

*AB-900 | Microsoft 365 Copilot and Agent Administration Fundamentals | Cheat sheet updated 2026-07*
