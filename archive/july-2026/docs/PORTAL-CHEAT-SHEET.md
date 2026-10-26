# AB-900 Portal Cheat Sheet

One block per portal. Name, URI, and the settings that actually get tested.

**Aligned to:** AB-900 skills measured as of **July 22, 2026**. Paths verified against Microsoft Learn **July 27-28, 2026**.

**Companion docs.** This file is organized **by portal** ("what lives in this console"). For task-first lookup ("where does X live") use `exam-traps-cheatsheet.md`. For domain narrative and verification caveats use `portal-reference.md`.

---

## The nine portals

| # | Portal | URI |
|---|--------|-----|
| 1 | Microsoft 365 admin center | `admin.microsoft.com` |
| 2 | Exchange admin center | `admin.exchange.microsoft.com` |
| 3 | SharePoint admin center | `admin.microsoft.com/sharepoint` |
| 4 | Microsoft Teams admin center | `admin.teams.microsoft.com` |
| 5 | Microsoft Entra admin center | `entra.microsoft.com` |
| 6 | Microsoft Defender portal | `security.microsoft.com` |
| 7 | Microsoft Purview portal | `purview.microsoft.com` |
| 8 | Microsoft Copilot Studio | `copilotstudio.microsoft.com` |
| 9 | Power Platform admin center | `admin.powerplatform.microsoft.com` |

**Retired, never use:** the Microsoft Purview compliance portal. Say "the compliance portal is retired; use purview.microsoft.com."

---

## 1. Microsoft 365 admin center

**`admin.microsoft.com`** | Domains 1 and 3

The tenant front door and the **only** place agents are governed.

**Licensing**
- Product-first: Billing > Licenses > select product > **Assign licenses**. Limit **20 users and/or groups at a time**
- User-first: Users > Active users > select user > **Licenses and Apps** > expand **Licenses** > **Save changes**
- Group-based assignments show the **group** name, not member users
- Failures land on the **Errors & Issues** tab > select user > **Reprocess**
- Group-based licensing needs **Entra ID P1+** OR **Office 365 E3/A3/G3 or newer**. It does **NOT** support nested groups: only first-level members get licensed

**Admin roles**
- Per user: Users > Active users > choose user > **Manage roles** > **Save changes**. There is **NO** intermediate "Roles" node to click, and Save changes is required
- Tenant-wide: Roles > Role assignments (tabs: Microsoft Entra ID, Exchange, Intune, Billing) > select role > **Assigned** > **Add users**

**Org configuration**
- Domains: Settings > Domains > **+ Add domain** > verify by TXT record, MX fallback, or a text file on the site
- Org settings: Settings > Org settings, with **Services**, **Security & privacy**, and **Organization profile** tabs
- Groups: Teams and groups > Active teams and groups

**Agents (top-level node, NOT under Copilot)**
- Approval queue: **Agents > All agents > Requests**
- States: **Pending review**, **Pending update**, **Pending activate**
- Actions: **Publish to store**, **Reject submission**. For Pending update the button reads **Update in store**
- Inventory: **Agents > All agents > Registry** (default tab). Types: Microsoft agents, External partner-built, Published by your org, Shared by creator
- Policy: **Agents > Settings** with five areas: Agent management rules, Allowed agent types, Templates, Sharing, User access
- MCP tools: **Agents > Tools > Requests**
- Governance cards: **Agents > Overview** > "Top actions for you"
- Only **AI Administrator** and **Global Administrator** can approve. Global Reader views but cannot act

**Copilot**
- Billing and PAYG: **Copilot > Billing & usage**. Billing policies tab holds policies; Pay-as-you-go services tab connects them
- Settings: Copilot > Settings
- Usage: Reports > Usage > **Microsoft 365 Copilot** > then Copilot, Copilot Chat, Credits, Agents, or Copilot Search. **Readiness is a TAB**, not a node

**Traps**
- The objective says **distribution groups**; this portal labels the tab **Distribution list**. Say both aloud
- "Billing > Billing policies" is **deprecated** for Copilot. That node covers Microsoft 365 Backup, SharePoint storage, and High Volume Email only
- Org settings > Pay-as-you-go services is **LEGACY**. Select **Disconnect previous billing** before linking a new Copilot-node policy
- Microsoft's docs are inconsistent on "Teams and groups" versus "Teams & groups". Say it, do not over-specify punctuation on a slide

---

## 2. Exchange admin center

**`admin.exchange.microsoft.com`** | Domain 1

- Mailboxes: Recipients > **Mailboxes** (deep link `#/mailboxes`)
- Distribution groups: Recipients > **Groups**
- Bulk select: round check box beside the Display name column, Shift-click for ranges

**Trap**
- It is the **Exchange admin center**, not "Exchange Online admin center", and **distribution groups**, not "distribution lists"

---

## 3. SharePoint admin center

**`admin.microsoft.com/sharepoint`** | Domains 1 and 2

Carries the entire **oversharing** objective, which is prime Domain 2 territory.

**Sites**
- Sites > **Active sites**. Scope is the root website of each site collection

**Data access governance**
- **Reports > Data access governance**
- Requires SharePoint administrator plus **SharePoint Advanced Management**
- E5-only tenants: activity reports capped at **10,000 sites**, no snapshot reports, no remedial actions
- **Snapshot reports**: Site permissions across your organization, Sensitivity label applied to files
- **Activity reports, last 28 days**: Sharing links and others

**Site access review**
- Reports > Data access governance > **View reports** > select sites > **Initiate site access review** > **Customize and preview email** > **Send**
- Track on the **My review requests** tab. Status stays *pending* until the site owner completes it

**Restricted access control (RAC)** -- controls **ACCESS**
- Tenant: Policies > Access control > **Site-level access restriction**
- Per site: Sites > Active sites > select site > Settings > **Restricted site access**

**Restricted content discovery (RCD)** -- controls **DISCOVERABILITY**, permissions unchanged
- Sites > Active sites > select site > **Settings** tab, then turn on restricted content discovery

**Traps**
- **RAC versus RCD is a favorite distinction.** RAC blocks who can get in. RCD hides content from Copilot and search **without** changing permissions
- **Restricted SharePoint Search is retiring.** Microsoft blocks new enablement starting **July 31, 2026** and points to RCD. Do **NOT** recommend it
- Learn shows the RCD toggle under **two** labels: "Restrict content from Microsoft 365 Copilot" and "Restrict content discovery". Navigate to it live rather than committing to one on a slide

---

## 4. Microsoft Teams admin center

**`admin.teams.microsoft.com`** | Domain 1

- Teams and channels: Teams > **Manage teams**
- Policies: Teams > **Teams policies**. Add flow: **Add** > name and description > toggle settings > **Save**

---

## 5. Microsoft Entra admin center

**`entra.microsoft.com`** | Domain 1

Identity, access, and the audit trail.

- Conditional Access: **Entra ID > Conditional Access > Policies**. Create in **Report-only** mode first
- Identity Secure Score: **Entra ID > Identity Secure Score**
- Authentication methods: **Entra ID > Authentication methods > Policies**
- PIM: **ID Governance > Privileged Identity Management**
- Apps: Entra ID > **App registrations** and **Enterprise applications**
- Sign-in logs and audit logs: under Monitoring

**Traps**
- **Identity Secure Score** (Entra, identity only) is NOT **Microsoft Secure Score** (Defender, tenant-wide). The exam probes this boundary
- **Sign-in diagnostic roles.** Least privileged from **Diagnose & solve problems** or a support request is **Billing Administrator**. From the **sign-in logs** you need **BOTH Reports Reader AND Billing Administrator**. It is **not** Global Reader
- It is **Microsoft Entra ID**, never Azure AD or AAD

---

## 6. Microsoft Defender portal

**`security.microsoft.com`** | Domain 1

- **Microsoft Secure Score**: `security.microsoft.com/securescore`
- Recommended action groups: **Identity**, **Device**, **Apps**, **Data**
- Audit log search also works here (`security.microsoft.com/auditlogsearch`), same data as Purview

**Trap**
- The product is **Microsoft Defender XDR**, never "Microsoft 365 Defender"

---

## 7. Microsoft Purview portal

**`purview.microsoft.com`** | Domain 2 -- **HEAVIEST at 35-40%**

Spend your study time here.

**Navigation depth is inconsistent. This is the #1 way to look lost on stage.**

| Solution | Path |
|----------|------|
| Compliance Manager | **Top-level left nav**, NOT under Solutions |
| Communication Compliance | Go to the solution directly. Learn never writes a literal "Solutions >" path |
| Information Protection | **Solutions** > Information Protection |
| Data Loss Prevention | **Solutions** > Data Loss Prevention > Policies |
| DSPM for AI (classic) | **Solutions** > DSPM for AI (classic) |
| eDiscovery | **Solutions** > eDiscovery > **Content Search** |
| Data Lifecycle Management | **Solutions** > Data Lifecycle Management |

Not on the home page? Select **View all solutions**, grouped into **Core**, **Risk & Compliance**, **Data Governance**, **Data Security**.

**Sensitivity labels**
- Create: Solutions > Information Protection > **Sensitivity labels**
- **Classic** scheme: **+ Create a label**. **Modern** scheme: **+ Create** then **Label**
- Modern applies to tenants created on or after **October 1, 2025** or manually migrated
- Publish: Solutions > Information Protection > **Publishing policies** > **Publish label**
- Auto-labeling: Solutions > Information Protection > **Policies** > Auto-labeling
- A label with no policy is **invisible to users**. Publishing is what makes it real

**Explorers**
- **Data explorer** (current): Solutions > Information Protection > **Explorers** > Data explorer
- **Content Explorer (classic)**: Data Lifecycle Management > Explorers
- **Activity explorer**: Solutions > Information Protection > Explorers > Activity explorer

**DSPM -- the three-entry problem**
- Learners see **three** entries today: **DSPM**, **Data Security Posture Management (classic)**, **DSPM for AI (classic)**
- Microsoft: *"Don't confuse this with the previous versions, that are now named Data Security Posture Management (classic) and DSPM for AI (classic)."*
- **Exam answer: DSPM for AI (classic)** -- the wording the objectives use
- Show unified **DSPM** in a live demo so the tenant matches the slide
- Microsoft has published **NO** retirement date for classic. Do not invent one

**Also here**
- Insider Risk Management, Compliance Manager, Data Lifecycle Management, Audit, Content search in eDiscovery

**Traps**
- Classic standalone Content Search retired **August 31, 2025**. It now lives inside eDiscovery
- Say "the compliance portal is retired; use purview.microsoft.com" rather than naming the retired host

---

## 8. Microsoft Copilot Studio

**`copilotstudio.microsoft.com`** | Domain 3

- Where **makers build** custom agents
- Publishing to the Microsoft 365 Copilot and Teams channel pushes the agent into the admin center **Requests** queue
- Makers build here; **admins approve in `admin.microsoft.com`**. Know which side of the line each action falls on

---

## 9. Power Platform admin center

**`admin.powerplatform.microsoft.com`** | Domain 3

- Environment-level agent governance, DLP connector policies, and Copilot Studio tenant settings
- Named directly in the objective: monitor agents "by working with the Microsoft 365 admin center **and** the Microsoft Power Platform admin center"

---

## Outside the nine: Copilot Dashboard

**Viva Insights app in Microsoft Teams, or the Viva Insights web app** > select **Copilot Dashboard**

- It is **NOT** opened from the Microsoft 365 admin center
- Admin setup (AI Administrator): admin.microsoft.com > Settings > Microsoft Viva > Viva Insights > **Set up and management** tab
- There is **no longer** a separate admin-center control to enable the dashboard. Microsoft removed it

---

## Researcher and Analyst

Microsoft's wording: they *"are part of the core Copilot chat experience and will not fall under any agent-related settings."*

- Found in Microsoft 365 Copilot Chat under **Tools**
- Remain accessible **even when Copilot agents are disabled**
- Do **NOT** say they "require a separate block." Say **agent settings do not govern them**
- Disable one: Agents > All agents > select the agent > **Block**. The **Edit users** panel is **DISABLED**, so per-user assignment is **NOT** possible. Blocking is tenant-wide only
- Both GA **June 2, 2025**, both need a Microsoft 365 Copilot license, no add-on. Pre-pinned; users cannot unpin Researcher

---

## Copilot billing

Unit is the **Copilot Credit** at **$0.01** each. Consumption is **per-feature**:

| Action | Credits |
|--------|---------|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding | 10 |

Do **NOT** say one message equals one credit.

**Live documentation conflict worth teaching:** the Azure meter is still named "Copilot Studio" and some Learn pages still say "per message." Both vocabularies are live in current Microsoft documentation. Name the conflict rather than papering over it.

---

## Verify in your own tenant before you teach

Three labels vary by tenant or are ambiguous in Microsoft's own docs:

1. **Sensitivity label scheme** -- classic (`+ Create a label`) versus modern (`+ Create` > `Label`)
2. **Number of DSPM entries** in your Solutions list -- one or three
3. **RCD toggle label** -- Learn shows two different names

Also note: **Restricted SharePoint Search closes to new enablement July 31, 2026.**

---

## Sensitivity labels path, for the record

The current documented path is **Solutions > Information Protection > Sensitivity labels**, confirmed against Microsoft Learn on July 28, 2026. Every file in this repo now uses this wording.

Where the older "Labels" wording came from: Microsoft's own article says "On this **Labels** tab, do not select the **Publish labels** tab." That is a reference to a tab *within* the Sensitivity labels page, not the left-navigation node name.
