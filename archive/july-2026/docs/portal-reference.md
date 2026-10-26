# AB-900 Portal Reference

Every admin portal and in-portal location an AB-900 candidate must know, mapped to the **Skills measured as of July 22, 2026**.

**Verification status.** Every path below was checked against Microsoft Learn on July 27, 2026 by an adversarial pass that defaulted to REFUTED and required a fetched Learn page to confirm. Of 78 claims checked, 51 confirmed clean and 27 required correction. The corrections are folded in. Items Microsoft does not publish a path for are marked **UNPUBLISHED** rather than guessed.

---

## The nine portals, at a glance

| Portal | URI | Primary domain |
|--------|-----|----------------|
| Microsoft 365 admin center | `https://admin.microsoft.com` | 1 and 3 |
| Exchange admin center | `https://admin.exchange.microsoft.com` | 1 |
| SharePoint admin center | `https://admin.microsoft.com/sharepoint` | 1 and 2 |
| Microsoft Teams admin center | `https://admin.teams.microsoft.com` | 1 |
| Microsoft Entra admin center | `https://entra.microsoft.com` | 1 |
| Microsoft Defender portal | `https://security.microsoft.com` | 1 |
| Microsoft Purview portal | `https://purview.microsoft.com` | 2 |
| Microsoft Copilot Studio | `https://copilotstudio.microsoft.com` | 3 |
| Power Platform admin center | `https://admin.powerplatform.microsoft.com` | 3 |

**Retired, never use.** The Microsoft Purview compliance portal is retired; use `purview.microsoft.com`. Say it that way rather than naming the retired host, which also keeps the CI terminology rule clean.

---

## Domain 1: Core features and objects (30-35%)

### Microsoft 365 admin center

**License assignment, product-first**
Billing > Licenses > select a product > **Assign licenses** > type a user or group name > **Turn apps and services on or off** > **Assign**.
Limit is **20 users and/or groups at a time**. Group-based assignments display the **group** name, not member users; see members under Teams and groups > Active teams and groups. Failures appear on the **Errors & Issues** tab, where you select the user and choose **Reprocess**.

**License assignment, user-first (one user)**
Users > Active users > select the user row > **Licenses and Apps** > expand **Licenses** > check boxes > **Save changes**.

**License assignment, bulk**
Users > Active users > select the circles next to names > **Manage product licenses** > **Assign more: Keep the existing licenses and assign more** > **Next** > select licenses > **Save changes**.

**Unassign, bulk**
Users > Active users > select users > **Manage product licenses** > **Unassign all** > **Save changes** > **Done**.

**Per-user admin role assignment** (CORRECTED)
Users > Active users > choose the user > **Manage roles** > select the access > **Save changes**.
There is **NO** intermediate "Roles" navigation node. In the flyout variant, **Roles** is a section *heading*, not something you click. **Save changes** is required and is easy to forget on stage.

**Tenant-wide role assignment**
Roles > Role assignments, with **Microsoft Entra ID**, **Exchange**, **Intune**, and **Billing** tabs > select role > **Assigned** tab > **Add users** or **Add groups**.

**Domain names**
Settings > Domains > **+ Add domain** > enter domain > **Use this domain** > verify ownership (TXT record, MX fallback, or a text file on the website) > **Continue** > **Verify** > choose connection method > **Continue** > add DNS records > **Done**.

**Org settings**
Settings > Org settings, exposing the **Services**, **Security & privacy**, and **Organization profile** tabs.

**Groups and distribution groups**
Teams and groups > Active teams and groups.

> **Terminology trap worth teaching.** The July 22, 2026 objective says **distribution groups**, and the Exchange admin center uses that term, but this page labels the tab **Distribution list**. Teach the objective wording, show the tab label, and name the mismatch out loud. Microsoft's own docs are inconsistent on whether the node renders as "Teams and groups" or "Teams & groups", so say it aloud rather than over-specifying punctuation on a slide.

### Exchange admin center

Mailboxes at `https://admin.exchange.microsoft.com/#/mailboxes`. Recipients > Mailboxes for mailbox objects; Recipients > Groups for distribution groups. Fully confirmed, no corrections.

### SharePoint admin center

Sites > Active sites for site inventory. Scope is the root website of each site collection. Confirmed.

### Microsoft Teams admin center

Teams > Teams policies. Add flow: **Add** > name and description > toggle settings > **Save**. Confirmed verbatim.

### Microsoft Entra admin center

Conditional Access, Identity Secure Score, PIM, app registrations, enterprise apps, sign-in and audit logs.

**Sign-in troubleshooting roles** (CORRECTED)
Least-privileged role for the Sign-in diagnostic from **Diagnose & solve problems** or a support request is **Billing Administrator**. Global Reader is one of several roles that also work. To use the Sign-in diagnostic **from the sign-in logs**, you need **both Reports Reader AND Billing Administrator**.
Do **NOT** state "Least privileged role: Global Reader" -- Microsoft Learn contradicts it.

### Microsoft Defender portal

**Microsoft Secure Score**: sign in, then go to `https://security.microsoft.com/securescore`. Recommended actions group as **Identity**, **Device**, **Apps**, and **Data**.

> Keep **Microsoft Secure Score** (Defender portal, tenant-wide) distinct from **Identity Secure Score** (Entra admin center, identity-only). The exam probes this boundary.

---

## Domain 2: Data protection and governance (35-40%, HEAVIEST)

### The DSPM three-entry problem

A learner opening Solutions today sees **three** entries: **DSPM**, **Data Security Posture Management (classic)**, and **DSPM for AI (classic)**.

Microsoft's own wording: *"Don't confuse this with the previous versions, that are now named Data Security Posture Management (classic) and DSPM for AI (classic)."*

**Teaching rule.** Teach **DSPM for AI (classic)** as the exam answer -- it is the wording the July 22, 2026 objectives use. Show the new unified **DSPM** in the live portal so the tenant matches the slide. Microsoft has published **no** retirement date for the classic experience, so do not invent one.

- Exam answer: purview.microsoft.com > **Solutions** > **DSPM for AI (classic)**
- Current unified: purview.microsoft.com > **Solutions** > **DSPM**

### Navigation depth varies by solution -- this trips people up

Not every Purview solution sits under **Solutions**. Getting this wrong live means clicking into a node that does not exist.

| Solution | Correct path |
|----------|--------------|
| Compliance Manager | **Top-level left nav**, NOT under Solutions |
| Communication Compliance | Sign in, then go to the Communication Compliance solution. Microsoft never writes a literal "Solutions >" path for this one |
| DSPM for AI (classic) | **Solutions** > DSPM for AI (classic) -- Solutions IS documented here |
| Information Protection | **Solutions** > Information Protection |
| eDiscovery | **Solutions** > eDiscovery > **Content Search** |

To reach anything without a card on the home page, select **View all solutions**, which groups into **Core**, **Risk & Compliance**, **Data Governance**, and **Data Security**.

### Data explorer versus Content Explorer (classic)

- **Data explorer**: purview.microsoft.com > Solutions > Information Protection > **Explorers** > **Data explorer**
- **Content Explorer (classic)**: Data Lifecycle Management > Explorers
- **Activity explorer**: Solutions > Information Protection > Explorers > Activity explorer

> **UNPUBLISHED.** Microsoft publishes no standalone page for the Activity explorer path. It is inferred from the verified sibling Data explorer path. Say it with that caveat, or navigate live rather than putting it on a slide as authoritative.

### Sensitivity labels

Create: Solutions > Information Protection > **Sensitivity labels**. Two label schemes exist -- the **modern** scheme applies to tenants created on or after **October 1, 2025** or manually migrated tenants; older tenants use the **classic** scheme with **+ Create a label**.
Publish: Solutions > Information Protection > **Publishing policies** > on the Label policies page select **Publish label**.
Auto-labeling: Solutions > Information Protection > **Policies** > Auto-labeling.

**Check your own tenant's scheme before the session.** The button label differs between schemes.

### SharePoint oversharing controls

**Data access governance reports**
SharePoint admin center > expand **Reports** > **Data access governance**.
Requires SharePoint administrator credentials and SharePoint Advanced Management. E5-only tenants get activity reports capped at **10,000 sites**, with no snapshot reports and no remedial actions.
Landing page shows **Snapshot reports** (Site permissions across your organization, Sensitivity label applied to files) and **Activity reports, last 28 days** (Sharing links, and others).

**Site access review**
Reports > Data access governance > **View reports** > select sites > **Initiate site access review** > **Customize and preview email** > **Send**. Track on the **My review requests** tab. Status stays *pending* until the site owner completes it.

**Restricted access control (RAC)** -- controls ACCESS
Tenant: SharePoint admin center > Policies > Access control > **Site-level access restriction**.
Per site: Sites > Active sites > select site > Settings > **Restricted site access**.

**Restricted content discovery (RCD)** -- controls DISCOVERABILITY without changing permissions
SharePoint admin center > Sites > Active sites > select the site > **Settings** tab, then turn on the restricted content discovery setting.

> **Label conflict, do NOT assert one label.** Microsoft Learn shows this control under two different names: *"Restrict content from Microsoft 365 Copilot"* on the RCD article, and *"Restrict content discovery"* elsewhere. Navigate to it live rather than committing to one label on a slide.

**Restricted SharePoint Search is retiring.** Microsoft blocks new enablement starting **July 31, 2026** (four days after this session) and directs customers to restricted content discovery. Do **NOT** present it as a current recommendation.

---

## Domain 3: Copilot and agent administration (25-30%)

**Agents is a TOP-LEVEL node.** It is NOT nested under Copilot. The stale path "Copilot > Agents > Requested agents tab" is wrong on both counts.

### Agent approval queue

admin.microsoft.com > **Agents** > **All agents** > **Requests**

Three request states: **Pending review**, **Pending update**, **Pending activate**.
Primary actions: **Publish to store** and **Reject submission**. For a Pending update, the button reads **Update in store**.
Only **AI Administrator** and **Global Administrator** can approve requests or assign ownership. Global Reader and other reader roles can view but not act.

### Agent registry

admin.microsoft.com > Agents > All agents > **Registry** (selected by default).
Four agent types: **Microsoft agents**, **External partner-built agents**, **Published by your org** (LOB agents), **Shared by creator** (Shared agents).
Toolbar: Refresh, **Export** (CSV, scoped All agents or Filtered agents), **Add agent** (uploads a manifest ZIP), Manage pinned agents, Customize view, Search.

### Agent settings and tools

Agents > **Settings** has five areas: **Agent management rules**, **Allowed agent types**, **Templates**, **Sharing**, **User access**.

> Microsoft Learn is internally inconsistent here: the overview bullet reads "Security templates" while the section heading on the same page reads "Policy templates". Expect either.

MCP tool approval: Agents > **Tools** > **Requests**.

### Agent overview

Agents > **Overview** (pane titled "Agent overview"). Under **Top actions for you**, governance cards surface pending work, including **Pending Requests for Agents** with a **Manage requests** link into All agents > Requests.

### Copilot pay-as-you-go billing

admin.microsoft.com > **Copilot** > **Billing & usage**.
The **Billing policies** tab holds policies; the **Pay-as-you-go services** tab connects them to services. Alternate entry: Copilot > Settings > User access > Copilot pay-as-you-go billing.

Never use "Billing > Billing policies" for Copilot -- deprecated for this purpose. The Billing node covers Microsoft 365 Backup, SharePoint storage, and High Volume Email, and only surfaces a redirect link for Copilot.
The path Org settings > Pay-as-you-go services is **LEGACY**. An admin with a policy there must select **Disconnect previous billing** before linking a new Copilot-node policy.

### Copilot usage reporting

admin.microsoft.com > **Reports** > **Usage** > under Reports select **Microsoft 365 Copilot** > then one of **Copilot**, **Copilot Chat**, **Credits**, **Agents**, or **Copilot Search**.

**Readiness is a TAB, not a node.** Select Microsoft 365 Copilot first, then the readiness tab. If you do not see Reports in the nav, select **Show all**.

### Copilot Dashboard

Opened from the **Viva Insights** app in Microsoft Teams, or the Viva Insights web app (select **Copilot Dashboard** on the left). It is **NOT** opened from the Microsoft 365 admin center.

Admin setup (AI Administrator): Settings > Microsoft Viva > Viva Insights > **Set up and management** tab.

> **Corrected.** There is no longer a separate admin-center control to "enable the Copilot Dashboard." Microsoft removed it. Do not teach a toggle that is gone.

### Researcher and Analyst

Microsoft's current wording: they *"are part of the core Copilot chat experience and will not fall under any agent-related settings."* They live in Microsoft 365 Copilot Chat under **Tools** and stay accessible even when Copilot agents are disabled.

Do **NOT** say they "require a separate block." Say they are **core chat Tools that agent settings do not govern**.

To disable one: Microsoft 365 admin center > Agents > All agents > select the agent > **Block**. The **Edit users** panel is **DISABLED** for them, so per-user or per-group assignment is **NOT** possible. Blocking is tenant-wide only.

Both are GA (June 2, 2025), both require a Microsoft 365 Copilot license, no separate add-on. Preinstalled and pre-pinned; end users cannot unpin Researcher.

### Copilot billing unit

The unit is the **Copilot Credit** at **$0.01 per credit**. Consumption is per-feature:

| Action | Credits |
|--------|---------|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding | 10 |

Do **NOT** assert that one message equals one credit.

> **Live documentation conflict, worth teaching.** The Azure meter is still named "Copilot Studio," and some Microsoft Learn pages still say "per message." Both vocabularies are live in current Microsoft documentation. Name the conflict rather than papering over it.

---

## Pre-session checklist

1. Confirm which **sensitivity label scheme** your tenant uses -- the create button differs.
2. Confirm whether your Solutions list shows **one or three** DSPM entries.
3. Confirm the **RCD toggle label** in your tenant, since Learn shows two.
4. Confirm **Agents** appears as a top-level node (requires appropriate licensing).
5. Note that **Restricted SharePoint Search** closes to new enablement on **July 31, 2026**.
