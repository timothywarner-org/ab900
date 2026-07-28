# AB-900 Demo Scripts -- Instructor Delivery Guide

**Instructor:** Tim Warner
**Session:** O'Reilly Live Learning -- AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
**Delivery date:** July 28, 2026
**Skills measured version in force:** July 22, 2026
**Total demos:** 14 labeled demos (1A, 1B, 2A, 2B, 2C, 2D, 3A, 3B, 3C, 3D, 4A, 4B, 4C, 4D)

This document provides click-by-click scripts for every demo moment in the session. These are instructor-facing. Narration is written in quotes as shown. Adapt language in the moment; do not read verbatim.

---

## How to Read the VERIFY Markers

Portal navigation shifts faster than course material. Anywhere a path could not be confirmed against current Microsoft documentation, or where tenant configuration genuinely changes what you see, there is an inline marker:

```
<!-- VERIFY: what to confirm in the live tenant before going on camera -->
```

Walk every VERIFY marker in the demo tenant during setup. A wrong click path spoken with confidence on camera is worse than saying "let me show you where this lives" and navigating deliberately.

---

## July 2026 Navigation Changes That Break Older Demo Scripts

Read this list once before rehearsal. Each of these was a working path in an earlier version of this document and is now wrong or incomplete.

| Old path in prior scripts | Current path |
|---------------------------|--------------|
| admin.microsoft.com > Copilot > Agents > Requested agents | **admin.microsoft.com > Agents > All agents > Requests** |
| purview.microsoft.com > Information protection > Labels | **purview.microsoft.com > Solutions > Information Protection > Sensitivity labels** |
| purview.microsoft.com > Data classification > Content explorer | **Solutions > Information Protection > Explorers > Data explorer** (the old tool is now Content Explorer (classic) under Data Lifecycle Management) |
| DLP "Test mode" | **"Run the policy in simulation mode"** |
| Solutions > DSPM for AI (classic) as the only entry | **Solutions > DSPM** is the new unified front door; the classic entries still exist alongside it |
| SharePoint admin center > "Sites shared with Everyone" report | **Reports > Data access governance > Shared with 'Everyone except external users'** |
| Restricted SharePoint Search as the oversharing mitigation | **Restricted content discovery (RCD)**; RSS blocks new enablement July 31, 2026 |
| Copilot settings web search toggle in the admin center | The admin center **links out** to the Microsoft 365 Apps admin center, where the **Allow web search in Copilot** cloud policy is created |
| entra.microsoft.com > Protection > Conditional access | **entra.microsoft.com > Entra ID > Conditional Access** |
| entra.microsoft.com > Identity governance > PIM | **entra.microsoft.com > ID Governance > Privileged Identity Management** |
| Teams admin center > App permission policies | **App centric management** replaced permission policies for migrated tenants; scope per app on its **Users and groups** tab |

---

## Pre-Demo Checklist (complete before session start)

Open and pin these tabs in this order before learners join:

1. `admin.microsoft.com` -- signed in as demo tenant Global Administrator
2. `purview.microsoft.com` -- Solutions menu expanded
3. `admin.microsoft.com/sharepoint` -- SharePoint admin center
4. `entra.microsoft.com` -- Entra ID and ID Governance both reachable
5. `admin.exchange.microsoft.com` -- Exchange admin center (Recipients > Groups)
6. `admin.teams.microsoft.com` -- Teams apps > Manage apps
7. `admin.powerplatform.microsoft.com` -- Environments list visible
8. `copilotstudio.microsoft.com` -- Home screen
9. Microsoft 365 Copilot app -- for Agent Builder and the Tools menu
10. Viva Insights (Teams app or web) -- Copilot Dashboard

Setup verification pass, done once during rehearsal:

- [ ] Confirm which DSPM entries appear under Purview > Solutions in this tenant
- [ ] Confirm whether this tenant uses app centric management or the older app permission policies in the Teams admin center
- [ ] Confirm the sensitivity label scheme in this tenant (classic parent/sublabel, or the modern label groups scheme that is default for tenants created on or after October 1, 2025)
- [ ] Confirm the Copilot > Settings tabs present in this tenant. Microsoft states the page shows only licensed services and changes frequently.
- [ ] Confirm whether the Agents node appears at the top level of the Microsoft 365 admin center left navigation

Pre-navigate each portal to its first demo landing page during the break before each segment. Portal load times, especially Purview and Power Platform, average 10 to 20 seconds. Do not navigate cold in front of learners.

---

## Segment 1: Core Features and Objects of Microsoft 365 Services

### Demo 1A: admin.microsoft.com Navigation

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com`
**Timing in segment:** 0:30-0:34

#### Pre-Demo Setup

- Tab should already be open and signed in
- Pre-navigate to Users > Active users before the segment begins
- Have at least one test user in the tenant (any user works)
- Confirm the tenant has at least one Copilot-eligible license visible under Billing > Licenses

#### Steps

1. Switch to the `admin.microsoft.com` tab. The Active users list should be visible.
2. Click the display name of any test user to open the user properties pane on the right side of the screen.

   > "This right-side pane is the quick view. Notice the tabs across the top. For the exam, know that license assignment happens on the Licenses and apps tab, not under a separate Billing section for individual users."

   <!-- VERIFY: the exact tab set in the user properties pane varies by tenant licensing. Confirm which tabs render before narrating them by name. -->

3. Click the **X** to close the user pane. Return to the Active users list.
4. In the left navigation, click **Billing**, then click **Licenses**.

   > "This is the tenant-level view of every license you own. Find the Microsoft 365 Copilot entry. If it is here, the tenant has purchased Copilot capacity. The number shown is how many seats you own, not how many are assigned. The exam distinguishes between license quantity and license assignment."

5. Scroll the license list and call out any of these base SKUs if visible: Microsoft 365 E3, Microsoft 365 E5, Microsoft 365 E7, Microsoft 365 Business Standard, Microsoft 365 Business Premium, and the Office 365 plans.

   > "Copilot is an add-on. The user needs an eligible base license first. Microsoft's eligible list is broad -- it includes E3, E5, F1, F3, the Business plans, Microsoft 365 Apps, and the Office 365 E5, E3, E1, and F3 plans. And there is one important exception to the add-on model: Microsoft 365 E7, which went generally available on May 1 of this year, includes Microsoft 365 Copilot in the base SKU. An E7 customer does not buy the add-on separately."

   > "One myth to kill right now, because it is still all over the internet. There is no 300-seat minimum for Microsoft 365 Copilot. Microsoft removed that requirement in January 2024. The only 300 that survives is a **maximum** on Copilot Business and the Business-with-Copilot SKUs. If an exam answer says minimum, that is your distractor."

6. In the left navigation, click **Health**, then click **Service health**.

   > "The service health dashboard is where you confirm whether Microsoft 365 services are having problems. Notice the categories. Advisory means a degraded service. Incident means a service is down or significantly impaired. This dashboard is the first place an admin looks when users report trouble."

7. In the left navigation, click **Settings**, then click **Org settings**.

   > "Org settings is where tenant-wide defaults are configured -- whether users can install apps, external sharing defaults, and similar organization-level behavior. When an exam question asks where you configure something that affects all users by default, Org settings is usually the answer."

   > "One caution for later: Copilot settings are **NOT** here. They are under the Copilot node in the left navigation, and we will get to that in Segment 3. Do not go hunting for Copilot pay-as-you-go under Org settings, because the SharePoint agent path that used to be there is now legacy."

#### What Learners Should See

- After step 2: A right-side pane showing user properties with tabs across the top
- After step 4: A list of purchased licenses with columns for License name, Licenses purchased, and Licenses assigned
- After step 6: The service health dashboard with a service list and any active advisories or incidents
- After step 7: A scrollable list of org-wide settings grouped by category

#### If Something Breaks

- **Portal loads a blank screen or spins:** "While the portal loads, let me describe the structure. admin.microsoft.com is the hub for Microsoft 365 administration. The spoke admin centers -- Exchange, SharePoint, Teams, Entra, Purview -- are reachable from here through the Admin centers link in the left navigation. Which admin centers appear depends on the tenant's plan and region." Switch to the pre-loaded screenshot backup if available.
- **Licensing page shows no Copilot SKU:** "If Copilot is not listed here, the tenant has not purchased Copilot licenses. In a production deployment you would see Microsoft 365 Copilot as a separate add-on entry." Proceed. The navigation path is the exam-relevant point, not the specific SKU.
- **Settings > Org settings is missing:** Some trial tenants have a reduced navigation menu. Navigate through the search bar at the top of the admin center: type "Org settings" and select the result.
- **The portal is at admin.cloud.microsoft instead:** That is expected and current. Microsoft has been consolidating admin centers onto the cloud.microsoft domain, and admin.cloud.microsoft resolves to the same app. Say so and keep going.

> **Exam callout:** The Microsoft 365 admin center service health dashboard is explicitly tested. Advisory indicates degraded service, Incident indicates a down or severely impaired service, and this dashboard is the first place an admin checks when users report Microsoft 365 issues.

---

### Demo 1B: License Assignment

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com` > Users > Active users
**Timing in segment:** 0:34-0:38

#### Pre-Demo Setup

- Remain on admin.microsoft.com from Demo 1A, or pre-navigate back to Users > Active users
- Identify a test user who does **NOT** currently have a Copilot license assigned, which makes the toggle action visible and meaningful
- Do **NOT** pre-assign the license. The demo value is showing the assignment action live.

#### Steps

1. From the Active users list, click the display name of your designated test user.
2. In the user properties pane, click the **Licenses and apps** tab.

   > "This tab shows every license currently assigned to this user. The base license is already on. Microsoft 365 Copilot is listed here as a separate entry, currently off."

3. Scroll down to find the **Microsoft 365 Copilot** entry in the license list. Turn it **on**.

   > "I am turning on the Copilot license. Notice there is no dramatic confirmation. It queues the assignment. Here is the fact the exam likes: users might wait up to 24 hours for Copilot to show up in some apps, and they might need to restart or refresh the app. So when a user calls the help desk on day one saying Copilot is missing, your first question is when the license was assigned. If it was in the last 24 hours, the answer is patience."

4. Click **Save changes**.
5. Close the user pane with the **X**.
6. In the left navigation, click **Teams and groups**, then click **Active teams and groups**.

   <!-- VERIFY: the Groups navigation label varies. Current Microsoft documentation uses "Teams and groups > Active teams and groups"; some tenants still render "Groups > Active groups". Confirm which one this tenant shows. -->

   > "Now the approach that scales. Instead of assigning Copilot one user at a time, you assign it to a group. Microsoft 365 then assigns the license to every member of that group automatically, and removes it when somebody leaves the group. That is group-based licensing, and it is how real organizations do this."

7. Click any group name to open the group properties, then find the **Licenses** area within the group.

   > "For the exam, know that both individual assignment and group-based assignment are valid, and that group-based assignment is the answer when a question describes scale or describes licenses that should follow department membership."

8. Close the group pane.

#### What Learners Should See

- After step 2: The Licenses and apps tab showing license entries with toggles, with the Copilot entry visible and currently off
- After step 4: A brief success notification, or the pane refreshing with the Copilot entry now on
- After step 7: The group properties pane showing the licenses assigned to that group

#### If Something Breaks

- **Copilot license is not visible in the user's Licenses and apps tab:** The tenant may not have a Copilot license purchased. Say: "In a production tenant, Microsoft 365 Copilot appears here as a separate add-on entry below the base license. The point is the assignment method -- individual toggle here, or group-based at scale." Then navigate to Billing > Licenses to show what is available.
- **Save changes is unavailable:** Some trial tenants restrict license modifications. Do not force it. Describe the action and move to the group-based licensing discussion.
- **Groups navigation is absent or differently named:** Use the search bar at the top of admin.microsoft.com and type "groups."
- **A learner asks about assigning Copilot to a guest:** Microsoft states it is not supported to assign Copilot licenses to cross-tenant users, including guests. Good question, quick answer, move on.

> **Exam callout:** The activation delay after Copilot license assignment is a direct exam fact. Microsoft documents that for some apps users might need to wait up to 24 hours for Copilot to appear, and might need to restart or refresh the app. This shows up in troubleshooting scenario questions.

---

## Segment 2: Data Protection and Governance for Microsoft 365 and Copilot

### Demo 2A: Purview Sensitivity Labels

**Duration:** 3 minutes
**Portal URL:** `https://purview.microsoft.com`
**Timing in segment:** 0:24-0:27

#### Pre-Demo Setup

- Tab should already be open and signed in to purview.microsoft.com
- Pre-navigate to: **Solutions > Information Protection > Sensitivity labels**
- Confirm the tenant has at least one label configured. Trial tenants often include default labels; if not, use the fallback below.
- <!-- VERIFY: confirm which label scheme this tenant uses. The classic scheme shows parent labels with sublabels. The modern label scheme, default for tenants created on or after October 1, 2025, uses standalone labels and label groups instead, and shows a green confirmation banner on the Sensitivity labels page. The narration below covers both. -->

#### Steps

1. Switch to the purview.microsoft.com tab. The Sensitivity labels page should be visible.

   > "We are in the Microsoft Purview portal, purview.microsoft.com. One URL for every Purview solution, and you get to each one through Solutions in the left navigation. If you find Microsoft documentation or a course deck pointing at the old compliance portal, that portal is retired. Everything lives here now."

2. Look at the label list and describe the structure you actually see.

   > If the tenant uses the classic scheme: "This is the label hierarchy. A parent label such as Confidential can have sublabels beneath it, like Confidential - All Employees or Confidential - Finance Only. Users pick the sublabel when they apply a label in Office apps, and the parent organizes them."

   > If the tenant uses the modern scheme: "Newer tenants use the modern label scheme, where labels are standalone and you group them into label groups for display. The mental model is the same -- a taxonomy your users can pick from -- but the plumbing changed, so do not be thrown if your tenant looks different from a screenshot in a study guide."

3. Click a label name to open its configuration.
4. Show the scope page, **Define the scope for this label**.

   > "Scope determines where the label can be applied. Files and other data assets, Emails, Meetings, and Groups and sites. That last one matters for Copilot governance: a label scoped to Groups and sites classifies an entire SharePoint site, and that classification carries across the content in it."

5. Navigate to the protection settings and show whether encryption is configured.

   > "Here is where the exam gets specific, and this one shows up more than people expect. A label and its protection are two different things. You can classify without encrypting. But when a label **does** apply encryption, Copilot needs the user to have the **EXTRACT** usage right on top of VIEW before it will return that content. If the user has VIEW but not EXTRACT, Copilot will not summarize the document. It can still hand back a link so the person opens it the normal way. View and extract. Remember that pair."

6. Close the panel without saving changes.

#### What Learners Should See

- After step 2: The Sensitivity labels list, showing either parent labels with sublabels or standalone labels and label groups depending on the tenant's scheme
- After step 4: The scope page showing the scope options
- After step 5: The protection settings with the encryption configuration visible

#### If Something Breaks

- **No labels exist in the tenant:** "In a fresh tenant this list is empty until labels are created. Microsoft creates default labels and a default label policy for many new customers. For this demo the structure is the point: labels, their scope, and their optional protection actions." Open the **+ Create** label wizard, show the first two pages, and cancel without saving.
- **The portal will not load:** "Purview is one of the slower portals. While it loads, here is the structure. Sensitivity labels are at Solutions, Information Protection, Sensitivity labels. Labels have a scope that decides where they apply, including whole SharePoint sites. Encryption is optional and configured per label, and an encrypting label brings the extract usage right into play for Copilot."
- **The Information Protection card is not on the Solutions page:** Select **View all solutions**, then choose **Information Protection** from the Data Security section.

> **Exam callout:** Sensitivity labels can be scoped to Groups and sites, so a single label applied to a SharePoint site classifies that site. And when a label applies encryption, Copilot requires the **EXTRACT** usage right in addition to VIEW before it will summarize the content, though it can still return a link.

---

### Demo 2B: DLP Policy Overview

**Duration:** 3 minutes
**Portal URL:** `https://purview.microsoft.com` > Data loss prevention > Policies
**Timing in segment:** 0:27-0:30

#### Pre-Demo Setup

- Remain on purview.microsoft.com from Demo 2A
- Pre-navigate to: **Data Loss Prevention > Policies**
- If at least one DLP policy exists, open it in read-only view before the segment begins
- If no policies exist, the policy creation wizard works as a fallback

#### Steps

1. In the left navigation of purview.microsoft.com, select **Data Loss Prevention**, then **Policies**.

   > "DLP policies live here. The structure is worth saying plainly because the exam leans on it. The policy is the container: it defines which locations are monitored. The rule sits inside the policy and holds the conditions that trigger it and the actions that result. Policy, then rule. Conditions, then actions."

2. Click an existing policy to open it and show the locations it covers.

   > "Look at the locations. Exchange, SharePoint, OneDrive, Teams, Devices, and, relevant to us, **Microsoft 365 Copilot and Copilot Chat**. A single DLP policy can span multiple locations at once. You do not need one policy per service."

3. Show a rule's conditions and actions.

   > "Here is the rule logic. The condition is what trips it, such as content containing a specific sensitive information type. The action is what happens: audit only, block with override, or block outright."

4. Focus on the Copilot-specific angle, which is what AB-900 actually tests.

   > "For Copilot, the DLP location is literally named Microsoft 365 Copilot and Copilot Chat, and there are four condition-and-action pairs Microsoft supports. One: content contains a sensitivity label, and you prevent Copilot from processing that content -- the item drops out of the summary, though it can still appear in citations. Two: content contains a sensitive information type, and you prevent Copilot from processing prompts, so Copilot does not respond at all. Three: same condition, but you block web searches as a grounding source. Four, and this one is in preview: email received from external users, which keeps external mail out of Copilot's grounding to reduce prompt injection risk."

   > "And here is the gotcha that makes a great distractor. You **cannot** put the sensitive information types condition and the sensitivity labels condition in the same rule. Two rules inside one policy, absolutely. One rule doing both, no."

5. Move to the last page of the policy configuration and show the policy mode selection.

   > "This is where safe rollout happens, and the name changed, so update your notes. It is **simulation mode** now. The old Test and Test with policy tips states were replaced. Select Run the policy in simulation mode, and the policy runs as if it were enforced without actually enforcing anything, and it reports every match on its own separate dashboard so simulation results never muddy your live policy results. There is a checkbox to show policy tips during simulation, and an option to turn the policy on automatically if you do not edit it within fifteen days."

   > "Exam framing: which mode do you use to pilot a DLP policy without disrupting users? Simulation mode."

6. Close the panel without saving.

#### What Learners Should See

- After step 2: The policy details showing the locations the policy monitors
- After step 3: The rule showing a Conditions section and an Actions section
- After step 5: The policy mode page with **Run the policy in simulation mode**, **Turn it on right away**, and **Keep it off**

#### If Something Breaks

- **No DLP policies exist:** Open the creation wizard. Select **+ Create policy**, choose the **Custom** category and **Custom policy** template, then walk the flow: name the policy, choose locations, add a rule to show the conditions and actions panels, and land on the policy mode page. Cancel without saving. "This wizard is the same flow for every DLP policy regardless of which locations you select."
- **The rules section is inaccessible in a view-only tenant:** Use the creation wizard as described above. The structure is identical.
- **The Microsoft 365 Copilot location is not listed:** That location is documented as preview and depends on tenant licensing. Describe it rather than hunting for it: "In a tenant with this enabled, you would see Microsoft 365 Copilot and Copilot Chat in this location list, and turning it on is what brings Copilot interactions under DLP."

> **Exam callout:** DLP **simulation mode** runs a policy as if enforced without acting on users and reports matches on a separate dashboard. It replaced the older Test and Test with policy tips states, and it is the answer when a question asks how to pilot a DLP policy safely.

> **Exam callout:** In a DLP policy for Copilot, you cannot combine the **sensitive information types** condition and the **sensitivity labels** condition in the same rule. Separate rules within the same policy are supported.

---

### Demo 2C: DSPM (and DSPM for AI)

**Duration:** 4 minutes
**Portal URL:** `https://purview.microsoft.com` > Solutions > DSPM
**Timing in segment:** 0:30-0:34

> **This demo changed materially since April 2026. Read the setup notes before rehearsing.**

A new unified **Data Security Posture Management (DSPM)** reached general availability in May 2026. Microsoft renamed the previous experiences to **DSPM for AI (classic)** and **Data Security Posture Management (classic)**, and states that most new features are going into the new version only. Microsoft Learn says it directly: sign in to the Purview portal, go to Solutions, DSPM, and do not confuse it with the previous versions that are now named classic.

Microsoft has **NOT** published a retirement date for the classic experience. Do not state one on stage.

**What to teach versus what to show:** the AB-900 objective wording still says "Microsoft Purview Data Security Posture Management (DSPM) for AI," so the classic label is the exam-aligned answer. Show learners the new unified DSPM so they are not disoriented in a current tenant.

#### Pre-Demo Setup

- Remain on purview.microsoft.com
- Pre-navigate to **Solutions** in the left navigation
- <!-- VERIFY: confirm which DSPM entries this tenant shows. A current tenant can display three: DSPM (new unified), Data Security Posture Management (classic), and DSPM for AI (classic). Decide which one you are demoing before you go live. -->
- This demo works fine with an empty dashboard. The navigation and the concept are the exam objective, not the data.

#### Steps

1. In the left navigation of purview.microsoft.com, select **Solutions**.

   > "Solutions is the front door to every Purview capability. Before I click anything, look at the DSPM entries in this list, because this is the single biggest thing that moved in Purview since the spring. You may see up to three: plain **DSPM**, which is the new unified experience that went generally available in May; **Data Security Posture Management (classic)**; and **DSPM for AI (classic)**. Microsoft renamed the old ones and is putting most new features into the new one."

   > "Now, exam alignment. The AB-900 objective still uses the phrase DSPM for AI. So on exam day, DSPM for AI is the phrase you are matching. In your tenant on Monday morning, DSPM is where the product is going. I am showing you both so neither one surprises you."

2. Select **DSPM**.

   > "DSPM is Data Security Posture Management, and the AI part of it exists for one reason. Copilot did not create new data and it did not break permissions. It made your existing permission problems reachable by anybody who knows how to phrase a question. DSPM is where you see that exposure."

3. Show the **Posture** page, then the **AI observability** page.

   > "The new DSPM organizes around a handful of pages. Posture is the dashboard with trending. Objectives holds data security objectives, and there is one named exactly what we care about: prevent data exposure in Microsoft 365 Copilot and Copilot interactions. AI observability is the inventory of every AI app and agent with activity in the last thirty days, including agents from Microsoft Agent 365, showing how many are high risk and how many have sensitive interactions."

4. If your tenant shows DSPM for AI (classic) and you want the exam-aligned view, open it and show its overview and the Recommendations page.

   > "In the classic experience, the recommendations page is where the one-click policies live. And there is a nice automatic behavior worth knowing: DSPM for AI runs a weekly data risk assessment against your top one hundred SharePoint sites by usage, with no setup at all. Give any of these one-click policies at least twenty-four hours to collect data before you judge the results."

5. Give learners the old-to-new mapping so a study guide screenshot does not throw them.

   > "If your notes say Apps and agents, that page is now DSPM, Discover, Apps and agents. Recommendations for AI apps is now Actions, Remediation actions. The Microsoft 365 Copilot overview page is now Reports, Microsoft 365 Copilot. And Activity explorer is now Discover, Activity explorer, on the AI activities tab. Same capabilities, new addresses."

6. Land the exam framing.

   > "So when a question describes an admin who needs to discover and manage AI activity, or figure out what sensitive data Copilot is reaching, DSPM is your answer. Not Data explorer, which finds where sensitive data lives. Not the usage reports, which count who is using Copilot. DSPM is the one that connects sensitive data to AI activity."

#### What Learners Should See

- After step 2: The DSPM landing experience, with values possibly at zero in a demo tenant
- After step 3: The Posture dashboard, and the AI observability inventory of AI apps and agents
- After step 4: The DSPM for AI (classic) overview and its Recommendations page

#### If Something Breaks

- **No DSPM entry appears in Solutions:** "In some tenants, especially trials without the right Purview licensing, DSPM may not be visible. Access requires the Compliance Administrator or Global Administrator Entra role, or the Purview Compliance Administrator role group, and the classic DSPM additionally needs Microsoft 365 E5 or the Microsoft Purview Suite." Switch to a prepared screenshot, or describe the path. "The fact that matters for the exam is that DSPM is a **Purview** solution. Not the Microsoft 365 admin center, not Entra, not Teams."
- **Only the classic entries appear:** That is fine. Demo DSPM for AI (classic), and tell learners the new unified DSPM exists and is where Microsoft is adding new features.
- **Only the new DSPM appears:** Also fine. Demo it, and tell learners the exam objective still uses the DSPM for AI wording.
- **The dashboard shows a licensing error:** "This is a licensing gate. For the exam, know what the feature does and where it lives. The specific licensing tier is far less likely to be tested than the purpose and the location."
- **The portal is slow:** Talk through it while it loads. "DSPM answers three questions. Which AI apps and agents are active in my tenant. What sensitive data are those AI interactions touching. And where is my oversharing, which is the SharePoint problem we are about to look at."

> **Exam callout:** DSPM is a uniquely AB-900 topic. It is the Microsoft Purview solution for discovering and managing AI activity and the data risk Copilot creates, and it is distinct from **Data explorer** (which identifies where sensitive information lives) and **activity explorer** (which reports activities on labeled and sensitive content).

> **Instructor note on terminology:** the AB-900 objective bullets read "Understand features and capabilities of ... Microsoft Purview Data Security Posture Management (DSPM) for AI" and "Discover and manage AI activity by using DSPM for AI." Establish the full name on first use, then abbreviate.

---

### Demo 2D: SharePoint Data Access Governance -- Oversharing Reports

**Duration:** 6 minutes
**Portal URL:** `https://admin.microsoft.com/sharepoint` (SharePoint admin center)
**Timing in segment:** 0:38-0:44

> **Report names changed since April 2026.** The old script referenced "Sites with most sharing links" and "Sites shared with Everyone." The current Data access governance landing page groups reports into **Snapshot reports** and **Activity reports** with different names. The corrected list is in step 3.

#### Pre-Demo Setup

- Open the SharePoint admin center tab (admin.microsoft.com/sharepoint)
- Pre-navigate to: **Reports > Data access governance**
- If the tenant has SharePoint Advanced Management, this section is fully populated
- If the tenant is a basic trial, navigate to the section and show the empty state or the feature description. The navigation path and the report names are what matter.
- Note that for organizations **without** SAM, data collection must be explicitly enabled before activity reports generate, and reports become available 24 hours after enabling

#### Steps

1. Switch to the SharePoint admin center tab at `admin.microsoft.com/sharepoint`.

   > "We are in the SharePoint admin center, a separate admin center from the main Microsoft 365 hub. You can also reach it from admin.microsoft.com through Admin centers, SharePoint. And note the name: it is the **SharePoint admin center**. The July 22 refresh tightened that wording. The service is SharePoint in Microsoft 365; the admin center is just the SharePoint admin center."

2. In the left pane, expand **Reports**, then select **Data access governance**.

   > "Data access governance is where SharePoint oversharing reports live. Some of this is unlocked by SharePoint Advanced Management, and some of it comes along with E5 or with a Copilot license, and I will untangle that in a second. For the exam, know this path and know what is on this page."

3. Show the two report groups on the landing page.

   > "Two groups. **Snapshot reports** give you your current state: Site permissions across your organization, which Microsoft flags as Recommended; Sensitivity label applied to files; and a Site permissions for users report that lists every site a specific person can reach. **Activity reports** cover the last twenty-eight days: Sharing links, and Shared with Everyone except external users."

   > "That last one is the report that matters most for us. Everyone except external users is a built-in SharePoint group that includes every internal person and excludes guests. If a site is shared that way, every employee can reach it. Give those employees Copilot, and now every employee can ask Copilot a question and get that content back. This report is how you find every site with that pattern."

4. Open the **Shared with 'Everyone except external users'** report.

   > "Sort and prioritize. You are looking for the sites with the most content and the most recent activity, because that is where the exposure is real rather than theoretical. When an exam question asks which tool an admin uses to identify SharePoint oversharing, this page is the answer."

5. Show the remediation options available from the reports.

   > "Three remediation moves come straight off these reports. **Restricted access control** locks the site down to specific groups. The **Change history** report shows you which recent permission changes caused the problem. And **Site access review** hands the review to the site owner, which is usually the right call, because the site owner knows the business context and you do not."

6. Cover the two SharePoint Advanced Management controls the exam names, and get the distinction crisp.

   > "Two controls, similar names, completely different jobs, and the exam absolutely knows the difference."

   > "**Restricted access control**, RAC, controls **access**. You restrict a site to members of specified Microsoft 365 groups or Entra security groups, up to ten groups per site. Anyone outside those groups cannot get in, even if they had permission before, even if they are holding a shared link. And group membership alone is not enough either -- a user needs both the site permission and the group membership. You turn it on at the tenant level under Policies, Access control, Site-level access restriction, and then apply it per site from Sites, Active sites, the site's Settings tab, Restricted site access."

   > "**Restricted content discovery**, RCD, controls **discoverability**. It keeps a site's content out of organization-wide search and out of Copilot, and it does **NOT** change permissions at all. Somebody who already has access can still open the file directly. It is set per site under Sites, Active sites, the site's Settings tab, Restrict content discovery. Sites covered by it get a Restricted tag."

   > "One line to remember: RAC is enforcement, RCD is concealment."

7. Deliver the retirement callout.

   > "If you have studied for this exam before, or you are working from anything written before this summer, you learned Restricted SharePoint Search as the containment answer. Update that. **Starting July 31, 2026 -- three days from today -- Microsoft blocks new enablement of Restricted SharePoint Search**, and points customers to restricted content discovery instead. If Restricted SharePoint Search shows up as an answer choice, treat it as the legacy option."

   > "And note one dependency while we are here: if Restricted SharePoint Search is already enabled in a tenant, SharePoint cannot be used as a knowledge source for a declarative agent. That trips people up when they build an agent and cannot figure out why SharePoint will not attach."

#### What Learners Should See

- After step 2: The Data access governance landing page with Snapshot reports and Activity reports groups
- After step 4: A report table listing SharePoint sites
- After step 6: The site Settings tab showing the Restricted site access section and the Restrict content discovery setting

#### If Something Breaks

- **Data access governance is empty or reports will not generate:** "For organizations without SharePoint Advanced Management, you have to enable data collection first, and reports show up twenty-four hours later. Data is kept for twenty-eight days, and if nobody runs a report for three months, collection pauses and has to be turned back on." Then give the path verbally: "SharePoint admin center, Reports, Data access governance. Snapshot reports are Site permissions across your organization, Sensitivity label applied to files, and Site permissions for users. Activity reports are Sharing links and Shared with Everyone except external users."
- **Reports section is not visible in the left pane:** The navigation varies. Search for "Data access governance" in the admin center search, or expand Reports and scroll.
- **The reports return no data at all:** Microsoft documents one specific cause worth knowing. The reports do not work if the tenant uses nonpseudonymized report data. A Global Administrator fixes it in the Microsoft 365 admin center Reports setting by clearing **Display concealed user, group, and site names in all reports**. Reports are also unavailable for Microsoft 365 operated by 21Vianet regardless of licensing.
- **A learner asks whether SharePoint Advanced Management is a paid add-on:** The honest answer is both, and it is worth the thirty seconds. The **Copilot-readiness subset** of SAM unlocks when at least one user in the organization holds a Microsoft 365 Copilot license, and that user does not have to be a SharePoint administrator. The **full** SAM feature set, restricted site creation for example, still needs the SharePoint Advanced Management Plan 1 add-on. Microsoft 365 E7 includes it. Separately, an E5 admin can reach data access governance reporting without SAM, but gets no snapshot reports, no remedial actions, and activity reports capped at 10,000 sites.

> **Exam callout:** The **Data access governance** reports in the SharePoint admin center are the primary tool for identifying oversharing that creates Copilot exposure. The current landing page splits into Snapshot reports (Site permissions across your organization, Sensitivity label applied to files, Site permissions for users) and Activity reports (Sharing links, Shared with 'Everyone except external users').

> **Exam callout:** **Restricted access control** limits who can access a site and blocks even prior link holders. **Restricted content discovery** keeps content out of org-wide search and Copilot without changing permissions. The July 22, 2026 objective uses the wording "including restricted access control," and this subsection is one of the three flagged Minor in the change log, so this wording is high-probability exam material.

---

## Segment 3: Copilot Features and Administration

### Demo 3A: License Assignment and Billing Policy

**Duration:** 10 minutes
**Portal URL:** `https://admin.microsoft.com`
**Timing in segment:** 0:18-0:28

#### Pre-Demo Setup

- Pre-navigate to admin.microsoft.com > Billing > Licenses before the segment begins
- Also pre-navigate to admin.microsoft.com > **Copilot > Billing & usage** in a second tab or bookmark it
- Confirm the tenant has an Azure subscription linked if you plan to show the pay-as-you-go configuration. If not, use the fallback.
- Have a test user selected in Users > Active users for the license assignment portion
- Setup prerequisites worth knowing if a learner asks: Billing Administrator, AI Administrator, or Global Administrator; an Azure subscription and resource group in the same tenant with Owner or Contributor rights on both; and at least one SharePoint license in the tenant

#### Steps

1. Navigate to `admin.microsoft.com` > **Billing** > **Licenses**.

   > "Starting with the monthly license model, the fixed per-user per-month one. Under Billing, Licenses, you see every SKU the tenant purchased. Find Microsoft 365 Copilot. Licenses purchased is your capacity. Licenses assigned is what is actually in use. The gap between those two numbers is money you are spending on nothing, which is exactly the kind of thing that gets an admin invited to a budget meeting."

2. Click the **Microsoft 365 Copilot** entry to open the license details.

   > "From here you see every user who holds this license, and you can add or remove users. The monthly model is straightforward: thirty dollars per user per month paid yearly, thirty-one fifty if you pay monthly, and the user gets Copilot across Word, Excel, PowerPoint, Outlook, Teams, and Microsoft 365 Copilot Chat."

   > "Two variations worth naming. **Microsoft 365 Copilot Business** is the small and midsize SKU. List price twenty-one dollars, currently eighteen under a promotion Microsoft extended through December of this year, capped at three hundred seats, sold on an annual commitment with either annual or monthly billing. Microsoft says flatly that it delivers the same capabilities as the enterprise offering, so the difference is price and eligibility, not features. And **Microsoft 365 E7**, which went GA on May 1, includes Copilot in the base SKU, so an E7 customer never buys the add-on."

3. Navigate to Users > Active users, select a test user, and open the **Licenses and apps** tab.

   > "Individual assignment. Find the user, Licenses and apps, turn Copilot on, save. The group-based path from Segment 1 is how you do it at scale."

4. Close the panel and return to the left navigation.
5. In the left navigation, select **Copilot**, then **Billing & usage**.

   > "Now the pay-as-you-go model, and here is the navigation fact the exam likes. This is **NOT** under Billing. It is under the Copilot node. Copilot, Billing and usage. If a question asks where you configure Copilot pay-as-you-go, that is the answer."

   > "And to be clear about why Billing is wrong: the Billing node handles Microsoft 365 Backup, SharePoint storage, and High Volume Email. For Copilot it just shows you a link that says go to Copilot Billing and usage. Microsoft literally put a signpost there because so many admins went to the wrong place."

6. Select the **Billing policies** tab.

   > "A billing policy connects this Microsoft 365 tenant to an Azure subscription and a resource group, and that is what makes consumption billing possible. Setup is four steps: create the policy with its billing details, which is the name, the Azure subscription, the resource group, the region, and accepting the terms of service. Then choose users, either all users or a specific group. Then set an optional budget. Then review and select Create policy."

   > "A tenant can have up to fifty of these."

7. Point out the budget field, and correct the common misconception about it.

   > "Now, the budget field. This is a trap and it is a good one, because the intuitive answer is wrong. Setting a budget does not cap anything. Microsoft's own words: the system does not enforce the budget or prevent your organization from exceeding it, and usage can continue uninterrupted after the budget is surpassed. What it does is send email. Default threshold is one hundred percent, and the alert can take up to twenty-four hours to reach you. So a budget is a smoke detector, not a circuit breaker."

8. Switch to the **Pay-as-you-go services** tab.

   > "This tab is where you connect a policy to an actual service. Three services are available: Microsoft 365 Copilot Chat, SharePoint agents, and the Microsoft Copilot Retrieval API, which is in preview."

   > "And a migration trap for anybody who set this up earlier: if you previously configured SharePoint agent billing under Org settings, Pay-as-you-go services, you have to go back there, select SharePoint agents, and choose Disconnect previous billing before a new Copilot-node policy will attach. Two places, one of them legacy, and the old one silently wins until you disconnect it."

9. Land the billing unit clearly.

   > "The consumption unit is the **Copilot Credit**, at one cent per credit. Not a message, not a token. Credits. And the rates are per feature: a classic answer is one credit, a generative answer is two, an agent action is five, tenant graph grounding is ten, agent flow actions are thirteen per hundred."

   > "Do that math on a SharePoint agent. SharePoint agents are always grounded in the tenant graph, so a single prompt costs ten for the grounding plus two for the generative answer. Twelve credits. Twelve cents, not one cent. That is the number people get wrong."

   > "And who pays? Users **without** a Copilot license. If the user is licensed, Microsoft charges nothing for classic answers, generative answers, agent actions, tenant graph grounding, or agent flows in employee-facing scenarios, subject to fair use. Pay-as-you-go exists for the unlicensed population."

   > "One more purchase model to know: prepaid **capacity packs** at two hundred dollars per pack per month for twenty-five thousand credits. They refill at the start of each billing period and they are consumed **before** pay-as-you-go kicks in."

   > "Last thing, and say this before somebody in chat catches it: if you go read the Microsoft 365 Copilot pay-as-you-go Meters page, it still says a penny per **message**, and the Azure meter is still named Copilot Studio. The dollar figure is right. The unit noun is what moved. Both vocabularies are live in Microsoft's own documentation right now, so do not let a stale page shake your confidence."

#### What Learners Should See

- After step 2: The Microsoft 365 Copilot license detail page showing assigned users
- After step 5: The Copilot > Billing & usage section with the Billing policies and Pay-as-you-go services tabs
- After step 6: The billing policy configuration showing the Azure subscription, resource group, region, and terms of service
- After step 8: The Pay-as-you-go services tab listing Microsoft 365 Copilot Chat, SharePoint agents, and the Copilot Retrieval API

#### If Something Breaks

- **Copilot is not in the left navigation:** Search "billing policy" in the admin center search bar. There is also a second route to the same destination: **Copilot > Settings > User access > Copilot pay-as-you-go billing**, which opens the Copilot Billing & usage page where you switch to the Pay-as-you-go services tab. Describe the canonical path either way: "Copilot > Billing & usage > Billing policies."
- **Billing policies shows an empty state or prompts to link a subscription:** "In a trial tenant with no Azure subscription linked, this is what you get. The exam is not going to ask you for an Azure subscription ID. It is going to ask where this configuration lives, and the answer is the Copilot node, not the Billing node."
- **The budget field is not visible:** Show what is there and narrate the rest: "You would see the Azure subscription, the resource group, the region, and an optional budget with an alert threshold."
- **A learner asks about Copilot credit policies:** Worth thirty seconds. Copilot credit policies are newer and connect prepaid capacity pack credits to a set of users **without** requiring an Azure subscription, up to ten per tenant. They currently apply to Microsoft 365 Copilot Chat only; SharePoint agents still use pay-as-you-go billing.

> **Exam callout:** Copilot pay-as-you-go billing policy configuration lives at **admin.microsoft.com > Copilot > Billing & usage > Billing policies**, not under the Billing navigation node. The consumption unit is the **Copilot Credit** at $0.01 per credit.

> **Exam callout:** A budget on a pay-as-you-go billing policy sends **email notifications only**. Microsoft states the system does not enforce it and usage continues after the budget is exceeded.

---

### Demo 3B: Copilot Settings in the Admin Center

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com` > Copilot > Settings
**Timing in segment:** 0:28-0:32 (compressed within the combined lecture and demo block)

> **Correction from the April script:** the web search control is **NOT** an in-admin-center toggle. The Copilot Settings page links out to the Microsoft 365 Apps admin center, where the **Allow web search in Copilot** policy is created in the Cloud Policy service for Microsoft 365. Narrate it as a shortcut, not a switch.

#### Pre-Demo Setup

- Remain on admin.microsoft.com from Demo 3A
- Navigate to **Copilot > Settings**
- <!-- VERIFY: confirm which tabs and which scenarios this tenant renders. Microsoft states the admin center shows only the services licensed in the tenant and that this page changes frequently, so the scenario list will differ from tenant to tenant. -->

#### Steps

1. In the left navigation of admin.microsoft.com, expand **Copilot** and select **Settings**.

   > "This is the tenant-level control panel for Copilot behavior. You are not managing licenses here. You are managing what Copilot is allowed to do."

2. Show the tabs across the top.

   > "Four tabs. **User access** governs how users get to Copilot across products. **Data access** governs how Copilot gets and handles information. **Copilot actions** governs how Copilot responds relative to your policies. And **Other settings** is the catch-all."

   > "Fair warning about this page in your own tenant: Microsoft only shows scenarios for services you are licensed for, and they say outright that this page changes frequently. So if your admin center has more or fewer entries than mine, that is expected, not broken."

3. On the **Data access** tab, show the **Agents** scenario.

   > "Agents is configured right here: who can access agents, and which types of agents they can install. And notice the Manage all agents link, which jumps you over to the full Agents, All agents page. We will spend real time there in Segment 4, because that is where approval happens."

4. Also on **Data access**, show **AI providers for other large language models** if present.

   > "This one is newer and worth knowing exists. It controls whether users can use other large language models inside Copilot Chat and Copilot Studio, for example Anthropic's Claude models. That is a governance decision an organization makes deliberately."

5. Find the web search scenario and correct the common misconception out loud.

   > "Here is where a lot of course material gets it wrong, mine included until recently. Web search for Copilot is **NOT** configured on this page. What you get here is a link out to the Microsoft 365 Apps admin center, where you create a cloud policy called **Allow web search in Copilot**. The Cloud Policy service is where the setting actually lives. This page is a signpost."

   > "And the policy is not a simple on-off. Three options: enabled in both Microsoft 365 Copilot and Copilot Chat, disabled in both, or disabled in Copilot Work mode while still enabled in Web mode and Copilot Chat. That third option has a side effect worth remembering, because it is exactly the kind of detail an exam question hangs on: picking it also disables web search in Researcher and Analyst."

   > "There is also a user-side control. If the admin allows web search, each user gets a **Web content** toggle they can turn off for themselves. If the admin turns web search off, that toggle goes away and the user cannot turn it back on."

#### What Learners Should See

- After step 2: The Copilot Settings page with User access, Data access, Copilot actions, and Other settings tabs
- After step 3: The Agents scenario with its access configuration and the Manage all agents link
- After step 5: The web search scenario showing a link to the Microsoft 365 Apps admin center rather than an in-place toggle

#### If Something Breaks

- **Copilot > Settings is missing:** Search "Copilot" in the admin center search bar. If it is still absent, the signed-in account may lack the required role, or the tenant may not have Copilot licensed. Describe the four tabs and move on.
- **Settings appear unavailable to change:** The signed-in account may lack sufficient privilege. Describe what a properly permissioned admin sees. The relevant role for Copilot administration in current Microsoft documentation is the **AI Administrator**, and Global Administrator can also do it. Do not say "Copilot Admin," which is not the current role name.
- **A learner asks where agent settings live versus Copilot settings:** Both exist and both are current. **Copilot > Settings > Data access > Agents** is the narrower page. **Agents > Settings** is the fuller surface with five areas: Agent management rules, Allowed agent types, Security templates, Sharing, and User access. The Agents node is where you want to be for governance work.

> **Exam callout:** The **AI Administrator** role is the least-privilege role for Copilot administration tasks including Copilot reports and agent governance. Global Administrator also works but is not the minimum-privilege answer.

> **Exam callout:** Web search for Copilot is governed by the **Allow web search in Copilot** policy in the **Cloud Policy service for Microsoft 365**, reached through a link on the Copilot Settings page. It is not configured in the Microsoft 365 admin center itself.

---

### Demo 3C: Researcher and Analyst in Copilot

**Duration:** 3 minutes
**Portal URL:** Microsoft 365 Copilot app or Microsoft Teams, plus `https://admin.microsoft.com` > Agents > All agents
**Timing in segment:** 0:32-0:35 (compressed within the combined lecture and demo block)

> **Correction from the April script:** the admin control for Researcher and Analyst is **NOT** in Copilot settings as a pair of toggles. Researcher and Analyst appear as individual agents at **Agents > All agents**, and the disable mechanism is the **Block** action on the agent. The **Edit users** panel is disabled for them, so there is no per-user assignment.

#### Pre-Demo Setup

- If Copilot is licensed in the demo tenant, open the Microsoft 365 Copilot app or Teams and find the **Tools** menu in Copilot Chat
- If Copilot is not fully licensed, use the admin view at Agents > All agents. That is the better demo anyway, because the governance point is what the exam tests.
- This demo works as a brief orientation. The exam tests the concept and the governance model, not operational use.

#### Steps

1. Open the Microsoft 365 Copilot app, or Copilot in Microsoft Teams.

   > "Researcher and Analyst are built into Microsoft 365 Copilot. They are not agents somebody deploys from Copilot Studio, they are not plugins users install, and IT does not build them. They came generally available in June of 2025, they require a Microsoft 365 Copilot license, and Microsoft preinstalls and pre-pins them for licensed users. A user cannot unpin Researcher."

2. Show the **Tools** menu in Microsoft 365 Copilot Chat, where Researcher and Analyst appear.

   > "Note where they are: under **Tools**. Say that word rather than agents pane, because being a Tool inside core chat is precisely the reason they behave the way they do when an admin turns agents off."

   > "Researcher does deep multi-step research. It works across your Microsoft Graph work data, Copilot connectors, and the Bing index for web content, and it synthesizes a structured result rather than answering once. It has a documented limit, twenty-five queries per user per month."

   > "Analyst is the data counterpart. Advanced data analysis with chain-of-thought reasoning, and Microsoft says specifically that it is better suited than Researcher for Excel work. If a question contrasts the two, that Excel detail is a clean tiebreaker."

3. Switch to admin.microsoft.com > **Agents** > **All agents** and select **Researcher**.

   > "Here is the governance point, and I want to give you Microsoft's actual wording because the mechanism matters more than the folklore. Microsoft says Researcher and Analyst are part of the core Copilot chat experience and **will not fall under any agent-related settings**. So turn agents off tenant-wide, for some users or all users, and these two keep right on working under Tools."

4. Show the agent details pane, specifically that **Edit users** is unavailable and **Block** is present.

   > "So how do you actually turn them off? You block the individual agent, right here. And notice what you cannot do: the Edit users panel is disabled for Researcher and Analyst. There is no assigning it to the marketing department and not to finance. Blocking is tenant-wide, all or nothing."

5. If the tenant surfaces it, show the **Computer use** tab on the Researcher details pane.

   > "One more control, newer, and worth knowing exists. **Researcher with Computer Use** lets Researcher interact with public, gated, and interactive web content through a virtual computer running on Windows 365. It is governed separately on this Computer use tab, with three policies: who can perform actions on behalf of users, whether Researcher can access work data, and which websites are allowed, either all websites, a specific allowlist, or an exclusion list. Web search has to be on for Computer use to function."

6. Add the monitoring caveat.

   > "And one thing admins ask about immediately: can you see what people asked Researcher? Microsoft says there is no existing reporting tool for the content of Researcher sessions. You get usage metrics. You do not get conversation content, unless a user explicitly submits feedback that includes session data."

#### What Learners Should See

- After step 2: The Tools menu in Copilot Chat listing Researcher and Analyst
- After step 3: The Researcher entry in the Agents > All agents list
- After step 4: The agent details pane with the Block action available and Edit users unavailable
- After step 5: The Computer use tab with its three policy settings

#### If Something Breaks

- **Copilot is not licensed in the demo tenant:** Skip the end-user portion and run the admin view only. Say: "In the end-user experience, these show up under Tools in Copilot Chat. What matters for the exam is the admin side, and specifically that the general agent settings do not govern them."
- **Researcher does not appear under Agents > All agents:** The tenant may lack Copilot licensing, since both require it. Describe the behavior: "In a licensed tenant, Researcher and Analyst appear here as individual agents with Block available and Edit users disabled."
- **The Computer use tab is absent:** It is a newer capability and may not be present in every tenant. Describe the three policies rather than hunting for the tab.
- **A learner asks whether they can allowlist specific sites for standard Researcher:** No. Standard Researcher follows the tenant-level **Allow web search in Copilot** policy, and if web search is off at the tenant level, Researcher uses no web data at all. Per-site allow and exclude lists exist only for Researcher with Computer Use.

> **Exam callout:** Researcher and Analyst are part of the **core Copilot chat experience** and do **NOT** fall under agent-related settings. They stay available under **Tools** even when agents are disabled. The only way to turn them off is the **Block** action on the individual agent, and that block is tenant-wide because Edit users is disabled for them.

---

### Demo 3D: Copilot Dashboard in Viva Insights

**Duration:** 5 minutes
**Portal URL:** Viva Insights app (Microsoft Teams or web), plus `https://admin.microsoft.com` > Reports > Usage
**Timing in segment:** 0:43-0:48

> **Access path correction:** Microsoft's current documented route to the Copilot Dashboard is to open the **Viva Insights** app in Microsoft Teams or the Viva Insights web app and select **Copilot Dashboard**. An **AI Administrator** enables the dashboard and delegates access from the Microsoft 365 admin center first.

#### Pre-Demo Setup

- Open the Viva Insights app and locate the Copilot Dashboard
- Also have admin.microsoft.com > Reports > Usage ready, so you can contrast the two reporting surfaces
- An empty dashboard in a trial tenant is acceptable. The four metric categories and the contrast with the admin center reports are what matter.
- Access note if a learner asks: the Copilot Dashboard is available to any customer with a Microsoft 365 or Office 365 business or enterprise subscription and an active Exchange Online account. Neither a paid Viva Insights license nor a Copilot license is required to view the dashboard, though feature depth scales with how many Copilot licenses the tenant has.

#### Steps

1. Start in the admin center so the contrast lands. Navigate to `admin.microsoft.com` > **Reports** > **Usage**, then under Reports select **Microsoft 365 Copilot** and then **Copilot**.

   > "There are two reporting worlds here and the exam expects you to know which is which. This one, in the Microsoft 365 admin center, gives you the **Readiness** tab and the **Usage** tab. Readiness answers who is eligible and who has a license. Usage answers who is actually using it. Data typically shows up within forty-eight hours of the end of a day in UTC."

2. Point out the **Credits** report alongside it.

   > "Right next to it is the **Credits** report, which is how you watch Copilot Credit consumption: total credits, daily and cumulative trends, and credits broken out per user, per agent, per billing policy. It alerts you when a single user goes past two thousand credits. It is in preview, it holds thirty days of history, and it has no data before May 3, 2025."

3. Open the **Viva Insights** app and select **Copilot Dashboard**.

   > "Now the other world. The Copilot Dashboard is in **Viva Insights**, not the admin center. An AI Administrator turns it on and delegates access from the admin center, and then you get to it through the Viva Insights app in Teams or on the web."

4. Show the four metric categories: **Readiness**, **Adoption**, **Impact**, **Sentiment**.

   > "Four categories, and know all four names. Readiness is your potential user base: who is licensed, who is enabled. Adoption is who is actually using Copilot, broken out by app. Impact tries to quantify the value, and the headline metric there is Copilot assisted hours, which exists so you can answer the executive asking whether this investment is paying off. Sentiment is survey data, and it only populates if the organization has configured Viva Pulse or Glint."

5. Name the umbrella term, because the objective wording uses it.

   > "Microsoft's umbrella term for all of this is **Copilot Analytics**, and the July 22 objective says 'Monitor Copilot usage and adoption, including Copilot Analytics and the Microsoft 365 admin center.' Copilot Analytics covers six things: the readiness and adoption report in the admin center, the Copilot Dashboard in Viva Insights, the Agent Dashboard, the Consumption Dashboard, the ready-to-use reports, and advanced reporting through Power BI. You do not need to memorize all six. You need to know Copilot Analytics is the umbrella and where the two main surfaces are."

6. Deliver the trap.

   > "And here is a trap worth the whole segment. Somebody always suggests pulling Copilot usage numbers out of the Purview audit log, because the interactions are all in there. Microsoft warns against it in writing: audit log data is **NOT** intended as the basis for Copilot usage reporting, and metrics built on it may not match the official reports. Audit is for compliance and investigation. Usage reporting is the admin center report or the Copilot Dashboard. Different tools, different jobs."

#### What Learners Should See

- After step 1: The Microsoft 365 Copilot report with Readiness and Usage tabs
- After step 2: The Credits report showing credit consumption
- After step 4: The Copilot Dashboard with Readiness, adoption, impact, and sentiment metrics

#### If Something Breaks

- **Viva Insights requires additional setup:** "The Copilot Dashboard has to be enabled and delegated by an AI Administrator from the Microsoft 365 admin center before it appears. For the exam, know that it is in Viva Insights and know the four metric categories: readiness, adoption, impact, and sentiment."
- **The dashboard loads but every metric is zero or shows two dashes:** That is the documented empty state and it means nobody in the tenant has a Copilot license or nobody has used Copilot yet. "The structure is what you are learning. In a tenant with real usage, these populate with trend data." Also note the refresh behavior: the dashboard refreshes daily but always shows the previous 28-day period with up to six days of delay, and newly licensed employees take up to another seven days to appear.
- **You cannot find the Copilot Dashboard in the Viva Insights navigation:** In Microsoft Teams, search for and open the **Viva Insights** app, then select **Copilot Dashboard**. If it is still missing, it has not been enabled and delegated in the admin center yet.
- **A learner asks about agent usage reporting:** There are two agent usage reports and they differ. The original **Microsoft 365 Copilot Agent usage report** is generally available but excludes SharePoint agents and agents built by Microsoft and Microsoft partners, with up to 72 hours of latency. The newer **Microsoft 365 Copilot Agents usage report** is in preview, covers declarative, SharePoint, and custom engine agents including those built by Microsoft and partners, and shows usage within an hour. Both are at Reports > Usage > Microsoft 365 Copilot > Agents.

> **Exam callout:** The **Copilot Dashboard in Viva Insights** covers readiness, adoption, impact, and sentiment, and is distinct from the **readiness and usage report** in the Microsoft 365 admin center. **Copilot Analytics** is the umbrella term for the whole reporting family.

> **Exam callout:** Microsoft explicitly warns that **Purview audit log data is NOT intended as the basis for Copilot usage reporting**. Use the Copilot usage report or the Copilot Dashboard instead.

---

## Segment 4: Agent Administration and Exam Success

### Demo 4A: Agent Approval in the M365 Admin Center

**Duration:** 6 minutes
**Portal URL:** `https://admin.microsoft.com` > **Agents** > **All agents** > **Requests**
**Timing in segment:** 0:14-0:20

> **This is the single most important path correction in this document.** The April script said "Copilot > Agents > Requested agents tab." That is wrong on both counts now. **Agents** is a **top-level node** in the Microsoft 365 admin center left navigation, not nested under Copilot, and the tab is named **Requests**, not Requested agents. The authoritative path appears in current Microsoft Learn articles: **admin.microsoft.com > Agents > All agents > Requests**.

#### Pre-Demo Setup

- Pre-navigate to admin.microsoft.com > **Agents** > **All agents**
- <!-- VERIFY: confirm the Agents node appears at the top level of the left navigation in this tenant. Agent visibility in the admin center is licensing dependent. -->
- If the tenant has pending agent submissions, they show under the Requests tab, which is ideal for the demo
- If no pending requests exist, the empty state is fine. Describe what would appear.
- Note that a narrower alternate page still exists at Copilot > Settings > Data access > Agents, with a **Manage all agents** link that jumps here. Both are current; this one is the fuller surface.

#### Steps

1. Navigate to `admin.microsoft.com`. In the left navigation, select **Agents**.

   > "Look at where this lives now. **Agents** is a top-level node in the left navigation. It is not tucked under Copilot anymore. If your study material has you clicking Copilot and then Agents, fix that page in your notes tonight, because this is exactly the kind of navigation detail this exam tests."

2. Show the **Overview** page briefly.

   > "The Overview is the dashboard. Four hero metrics: the agent registry count, active users over the last thirty days, agent run-time in hours, and registry sync for connected external platforms. Underneath are the governance action cards, and the first one is Pending Requests for Agents, which links straight to where we are going."

3. Select **All agents**, and show the **Registry** tab.

   > "All agents has two tabs. **Registry** is your inventory: three tiles across the top for total agents, agents without owners, and unmanaged agents, meaning agents created or managed outside the governance plane. You can filter by status, publisher type, channel, platform, and data source, and you can export the whole thing to CSV."

   > "The registry sorts agents into four publisher types: Microsoft agents, external partner-built agents, published by your org, and shared by creator."

4. Switch to the **Requests** tab.

   > "And **this** is the approval queue. Requests. Not Requested agents. When a maker publishes an agent to the organization, it lands here."

   > "Three states, and know all three. **Pending review** is a brand new agent waiting for you. **Pending update** is an agent already in the store whose maker shipped a new version, and until you approve it, your users keep getting the previous version. **Pending activate** is somebody asking to activate an agent so they can create agent instances from it."

   > "You can filter this list by state, and by channel: Teams, Copilot, Office, Outlook, Word, Excel, PowerPoint."

5. Open a pending request if one exists, and walk the review.

   > "As the reviewing admin, you are looking at four things: what the agent can do, what data sources it touches, its security and permissions posture, and what custom actions it wants to run. That is your review. Then you decide."

6. Show the actions.

   > "Two actions. **Publish to store** starts the publishing wizard: you pick who can install it, optionally pick who gets it preinstalled, choose a policy template, review permissions and grant admin consent if that is appropriate, and publish. Or **Reject submission**, which is under the ellipsis next to the agent name."

   > "One label difference to catch: for a **Pending update**, that first button reads **Update in store** instead of Publish to store. Same idea, different word, and it is the kind of thing that shows up in a screenshot question."

7. Show **Agents > Settings**.

   > "Settings has five areas. **Agent management rules**, which today supports exactly two bulk actions: install Microsoft agents tenant-wide, and reassign ownerless Agent Builder agents to the previous owner's manager. **Allowed agent types**, with three toggles for agents built by Microsoft, by your organization, and by external publishers. **Security templates**. **Sharing**. And **User access**."

   > "Two traps live in this page. First, agents built by Microsoft stay **visible** to users even when you disable that setting; users just cannot install them. Second, under Sharing, the No users option still lets users share directly with specific individuals, and Sharing only governs agents built with Agent Builder in the first place."

8. Name the role requirement.

   > "Last thing, and it is a clean exam answer. Only **AI Administrator** or **Global Administrator** can approve an agent request or assign ownership. Global Reader, AI Reader, Security Administrator, Security Reader, Reports Reader can all look at every screen we just walked and cannot click approve. When a question asks for the least-privileged role that can approve an agent, the answer is AI Administrator."

#### What Learners Should See

- After step 1: **Agents** at the top level of the admin center left navigation
- After step 3: The Registry tab with Total agents, Agents without owners, and Unmanaged agents tiles
- After step 4: The Requests tab, either with pending submissions or an empty queue
- After step 6: The review pane with Publish to store, and Reject submission under the ellipsis
- After step 7: The Agents Settings page with its five configuration areas

#### If Something Breaks

- **The Agents node is not in the left navigation:** Agent management visibility in the admin center is licensing dependent. Try the alternate page at **Copilot > Settings > Data access > Agents**, which includes a **Manage all agents** link. Say: "The full Agents workload requires the right licensing. Microsoft 365 plans, Microsoft 365 Copilot, and Microsoft Agent 365 all enable agent management in the admin center."
- **No pending agent requests exist:** "An empty queue means nobody has submitted an agent. In a tenant where makers are actively building, you would see submissions here with the agent name, the submitter, and the state." Walk steps 5 and 6 verbally.
- **The tenant shows "Integrated apps" rather than Agents:** That is the older surface. SharePoint documentation notes the Agents section was formerly known as integrated apps. The governance model is the same; the location and label moved. Do not teach Integrated apps as the current answer.
- **A learner asks about MCP tools:** Good question, quick answer, because it is a separate queue. Tool governance is at **Agents > Tools > Requests**, where an admin approves or rejects a registered tool such as a remote MCP server. Only AI Administrator and Global Administrator meet both the page access and tenant-wide consent requirements.
- **A learner asks about blocking versus removing:** **Block** prevents any user in the tenant from accessing the agent and removes it from users who already installed it. **Uninstall** or **Remove** takes it out of inventory, but the agent can be reacquired from the store. And blocking scope depends on where the agent was built: blocking an Agent Builder or Copilot Studio agent affects Microsoft 365 Copilot **and** other hosts such as Outlook and Teams, while blocking a SharePoint or Foundry agent affects Microsoft 365 Copilot Chat only.

> **Exam callout:** The approval queue is **admin.microsoft.com > Agents > All agents > Requests**. Agents is a top-level navigation node. The three request states are **Pending review**, **Pending update**, and **Pending activate**, and the actions are **Publish to store** (or **Update in store** for an update) and **Reject submission**.

> **Exam callout:** Only **AI Administrator** and **Global Administrator** can perform agent governance actions such as approving requests or assigning ownership. Reader roles can view the registry but cannot act.

---

### Demo 4B: Teams Admin Center -- App and Agent Governance

**Duration:** 3 minutes
**Portal URL:** `https://admin.teams.microsoft.com` > Teams apps > Manage apps
**Timing in segment:** 0:20-0:23

> **Naming changed since April.** Many tenants are migrated to **app centric management**, which replaced app permission policies and scopes access on a per-app basis from the app's **Users and groups** tab. Some tenants still show the older Permission policies page. Confirm which one this tenant uses before you narrate it.

#### Pre-Demo Setup

- Open the admin.teams.microsoft.com tab (should be pre-loaded)
- Navigate to **Teams apps** > **Manage apps** before the segment
- <!-- VERIFY: check whether this tenant is migrated to app centric management. If the Permission policies page still lists policies, the tenant is on the older model. Microsoft shows a banner on the permission policy page for migrated tenants. -->
- Use the search box to find a Copilot-related app or agent if one exists in the tenant. Otherwise use any first-party Microsoft app as a structural example.

#### Steps

1. Switch to the `admin.teams.microsoft.com` tab and navigate to **Teams apps** > **Manage apps**.

   > "This is the second governance layer. Once an agent is approved in the Microsoft 365 admin center, it lives in the app ecosystem, and agents distributed as Teams apps follow the same model as any other Teams app. If you already govern Teams apps, you already govern most of this."

2. Show the app list.

   > "Each row is an app or an agent in the tenant catalog. Status shows whether it is allowed or blocked. And there is an export to CSV button up here, which is genuinely useful when your security team wants the whole inventory in a spreadsheet."

3. Open an app's detail page and select the **Users and groups** tab.

   > "Inside the app, this is where you scope who gets it. Availability, edit availability, and then either everyone or specific users and groups. That is how you give an agent to the sales team and nobody else."

   > "Now, a naming caution, because Microsoft has been consolidating this and your tenant may look different from mine. This per-app model is called **app centric management**, and for migrated tenants it replaced app permission policies. If your tenant still shows a Permission policies page with policies on it, you are on the older model and that is fine, it still works. Microsoft has been auto-migrating tenants, so expect either one in the wild."

4. Mention the synchronization behavior.

   > "One more thing that saves confusion. **Unified agent and app management** synchronizes org-wide settings, app status, and availability between this admin center and the Microsoft 365 admin center automatically, in both directions, for tenants that have been unified. So a change you make here shows up there and the other way around. Before your tenant is unified, you have to keep both in sync yourself or you get surprises."

5. Set expectations on timing.

   > "And plan for latency. Availability changes take up to twenty-four hours to reach clients, and Microsoft says in rare cases up to six days. So when you flip a switch here and a user calls twenty minutes later saying nothing changed, that is not a bug."

#### What Learners Should See

- After step 2: The Manage apps list with app names, status, and availability information
- After step 3: An app detail page with the Users and groups tab and its availability configuration
- After step 4: Either the app centric management experience or, in an unmigrated tenant, the Permission policies page

#### If Something Breaks

- **No Copilot-related apps are visible:** Use any Microsoft-published app as a structural example. The governance model is identical. Say: "The same availability controls that govern this app govern agents distributed as Teams apps."
- **Manage apps shows almost nothing:** In a fresh trial tenant the catalog may be sparse. Show the structure and describe the rest.
- **The tenant shows Permission policies rather than per-app assignment:** That tenant has not migrated to app centric management. Narrate what is on screen and note that Microsoft replaced this model with per-app assignment for migrated tenants.

> **Exam callout:** Agents distributed as Teams apps are governed in the Teams admin center through **Manage apps**, where availability is scoped to users and groups. **App centric management** replaced app permission policies for migrated tenants, and **unified agent and app management** synchronizes settings between the Teams admin center and the Microsoft 365 admin center in both directions.

---

### Demo 4C: Power Platform Admin Center -- Environment and Data Policy Controls

**Duration:** 3 minutes
**Portal URL:** `https://admin.powerplatform.microsoft.com`
**Timing in segment:** 0:23-0:26

#### Pre-Demo Setup

- Open the admin.powerplatform.microsoft.com tab (should be pre-loaded)
- Pre-navigate to **Environments** so the list is visible
- Identify which environment Copilot Studio uses in this tenant. The default environment is most common.
- Navigate to **Policies > Data policies** and have at least one policy visible, or the creation wizard ready

#### Steps

1. Switch to the `admin.powerplatform.microsoft.com` tab. The Environments list should be visible.

   > "Third governance layer, and here is how the three divide the work. The Microsoft 365 admin center decides whether an agent is approved and deployed at all. The Teams admin center decides which users can install and use it. And the Power Platform admin center decides what the agent is allowed to reach: which data sources and which connectors."

2. Select the **default environment**, or whichever environment Copilot Studio uses here.

   > "Every Copilot Studio agent is built inside a Power Platform environment. An environment is a container with its own data store, its own security model, and its own data policies. Control who has maker rights in the environment and you control who can build agents there in the first place."

3. Show the environment details briefly, including type and region.
4. Return to the left navigation, select **Policies**, then **Data policies**.

   > "**Data policies**, and note the naming. In the Power Platform context this is what people historically called DLP, but the current UI calls them data policies. Either way, this is a completely different thing from the Purview DLP we looked at in Segment 2. Purview DLP governs data movement and classification. Power Platform data policies govern **connector access**: which external services a flow or a Copilot Studio agent is allowed to touch."

5. Open a data policy and show the connector classification.

   > "Three groups: **Business**, **Non-business**, and **Blocked**. Connectors in the same group can work together. Connectors in different groups cannot share data with each other. Blocked cannot be used at all. So if I drop a third-party CRM connector into Blocked, no agent and no flow in scope can invoke it, and it does not matter one bit that somebody approved that agent over in the Microsoft 365 admin center."

   > "Two details worth knowing. When you create a policy, every connector starts in **Non-business** by default, and Microsoft recommends leaving Non-business as the default landing group for new connectors so that anything new has to be deliberately promoted rather than silently trusted. And some connectors simply cannot be blocked, because they carry core functionality: Dataverse, Approvals, Notifications, and the Microsoft 365 standard connectors. You can classify those as Business or Non-business, but not Blocked."

6. Make the two-layer point explicit.

   > "This is the exam concept in one sentence: an agent can be fully approved in the Microsoft 365 admin center and still fail to function because a data policy blocked the connector it needs. Two layers, independent, complementary. Approval controls **who can use it**. The data policy controls **what it can reach**. And Copilot Studio enforces these in real time, so the maker and the user both see an error message rather than a silent failure."

7. Mention Power Platform inventory if time allows.

   > "One more surface worth naming: **Power Platform inventory** gives tenant admins a unified view of every agent, app, and flow built on Power Platform, and importantly that includes agents created in Agent Builder, not just Copilot Studio. When somebody asks how you find every agent in the estate, that is one of the answers."

#### What Learners Should See

- After step 1: The Environments list with name, type, and region
- After step 5: The connector classification view with Business, Non-business, and Blocked groups
- After step 6: At least one connector visible in a restricted group

#### If Something Breaks

- **No data policies exist:** Use the creation wizard. Select **New policy**, proceed through the flow, and land on the connector classification screen, which is the key visual. Cancel without saving. "The classification screen is the whole point. This is where you move a connector between groups, and putting one in Blocked stops any agent in scope from invoking it."
- **The Power Platform admin center denies access:** The demo account may need the Power Platform Administrator or Global Administrator role. Show what you can and describe the rest: "In a properly permissioned tenant, Policies, Data policies shows the connector classification I just described. The exam fact is that these policies are in the Power Platform admin center, not Purview, and they govern connector access for Copilot Studio agents."
- **The environment list is empty:** "A fresh tenant provisions a default Power Platform environment automatically, and it may still be spinning up. The default environment is where Copilot Studio operates unless the organization created separate environments for development, test, and production."
- **A learner asks about advanced connector policies:** Worth naming in passing. Advanced connector policies use a strict allowlist model where connectors are blocked unless explicitly allowed, and they currently apply to certified connectors only. Classic data policies remain the answer for custom and HTTP connectors. This is beyond AB-900 scope, so name it and move on.

> **Exam callout:** Power Platform **data policies**, configured under Policies > Data policies, classify connectors as **Business**, **Non-business**, or **Blocked** and control which connectors a Copilot Studio agent can invoke. A blocked connector stops an agent action regardless of whether the agent was approved in the Microsoft 365 admin center.

---

### Demo 4D: Build an Agent and Close the Loop to Approval

**Duration:** 8 minutes
**Portal URL:** Microsoft 365 Copilot app (Agent Builder), or `https://copilotstudio.microsoft.com`
**Timing in segment:** 0:26-0:34

> **Pick your surface before rehearsal.** **Agent Builder in Microsoft 365 Copilot** is the safer live demo because it needs no separate Copilot Studio licensing, and it maps directly to the exam's "Create an agent" objective for the user persona. Copilot Studio is Option B below if the tenant supports it.

> **Naming correction:** the in-Copilot authoring surface is **Agent Builder in Microsoft 365 Copilot**. "Copilot Studio lite" survives only in Microsoft Learn URL slugs and one FAQ phrase. Use Agent Builder.

#### Pre-Demo Setup

- Have a SharePoint site URL ready to paste as a knowledge source. Any intranet site in the tenant works.
- Do **NOT** pre-create the agent. Build it live so learners see the flow.
- Confirm you will **NOT** publish to the organization during the demo. A real submission creates a real request you then have to clean up.
- Agent Builder availability: it requires a Microsoft 365 Copilot license, or a tenant with pay-as-you-go enabled for Copilot Studio. It works at microsoft365.com/chat, office.com/chat, and in the Teams desktop and web clients, on both the Work and Web toolbar options. It is **NOT** available on mobile versions of those apps.

#### Option A: Agent Builder in Microsoft 365 Copilot (preferred)

1. Open the Microsoft 365 Copilot app and select **New agent**.

   > "This is Agent Builder, the low-code surface built right into Copilot. No code, no separate portal. This is the creation tool. The admin centers we just walked are the governance tools."

2. Use the **Describe** tab to state what the agent should do in plain language, then switch to the **Configure** tab.

   > "Two ways in. Describe lets you say what you want and the AI drafts the agent. Configure gives you the fields directly. Same destination. I am switching to Configure so you can see the anatomy of a declarative agent, because that anatomy is what the exam asks about."

3. Name the agent `Contoso HR Policy Assistant` and add a description.

   > "The Description field caps at one thousand characters. Worth knowing, because Microsoft publishes these limits and this exam has a taste for published limits."

4. Add instructions.

   ```
   You are an HR assistant for Contoso. Answer questions about company HR policies
   using only the provided knowledge sources. If you cannot answer from the
   knowledge sources, say so plainly rather than guessing.
   ```

   > "Instructions shape behavior: tone, scope, and limits. The cap here is eight thousand characters. And this is the core definition to hold onto -- a declarative agent is instructions plus knowledge plus starter prompts, running on Copilot's own orchestrator and models. That is what makes it declarative rather than a custom engine agent, where you bring your own model, your own orchestration, and your own hosting, and you own your own compliance posture."

5. Add a **SharePoint** knowledge source.

   > "Knowledge is where the agent gets its facts. Here are the limits, and these are very much fair game: twenty knowledge sources total per agent. Within that, up to four public website URLs, up to a hundred SharePoint files, folders, or sites, one SharePoint list, fifty OneDrive files, five Teams chat URLs, and twenty embedded uploaded files."

   > "The governance point matters more than the numbers. The agent respects SharePoint permissions. It surfaces only what the person asking already has rights to see. An agent is not a permissions bypass."

   > "Two gotchas on knowledge. First, if Restricted SharePoint Search is enabled in the tenant, SharePoint cannot be used as a knowledge source for a declarative agent at all, and people lose an afternoon to that one. Second, Purview Information Barriers are **NOT** supported on embedded uploaded files, so anyone who can reach the agent can see responses grounded in those files."

6. Show the **Capabilities** section.

   > "Now correct something if you learned it earlier, because it flipped. **Create documents, charts, and code**, which is the code interpreter, and **Create images**, which is the image generator, are both **on by default** in Agent Builder. Older guidance said both were off. They are on. If you want them off, you turn them off right here."

   > "A licensing detail that makes a clean distractor: code interpreter and image generator require neither a Copilot license nor metered usage. Web search does not either. But Copilot connectors, SharePoint, OneDrive, embedded file content, and Dataverse do require a license or metered usage, and email, people, Teams messages, and Teams meetings require an actual Copilot **license**, where metered usage is not sufficient."

7. Add one starter prompt.

   ```
   What is the company policy on remote work?
   ```

   > "Starter prompts help people understand what the agent is for. Microsoft says there is no minimum number, and here is the part worth flagging: Microsoft does **NOT** publish a maximum. If you have seen a course claim the limit is three, or five, or any number at all for Agent Builder, that figure is not in Microsoft's documentation. Do not memorize a ceiling that does not exist."

8. Show the **Only use specified sources** toggle if present.

   > "Subtler than it looks. Turning it on **prioritizes** your knowledge sources. It does not hard-block general model knowledge. Microsoft states plainly that Agent Builder cannot fully block general knowledge, and if you need that level of control, the answer is Copilot Studio."

9. Stop before publishing to the organization.

   > "And here is where the loop closes. When a maker publishes an agent to the organization, that submission lands in the admin center under Agents, All agents, Requests, in the Pending review state, and it sits there until an AI Administrator or a Global Administrator acts on it. The maker presses publish here. The admin sees a request there. That is the entire pipeline the exam is testing, and you have now watched both ends of it."

#### Option B: Copilot Studio

1. Navigate to `copilotstudio.microsoft.com`.
2. From the **Home** page or the **Agents** page, describe the agent in natural language, or select **Create an agent** to start from scratch. **Advanced create** lets you set primary language, solution, and schema name.

   > "Copilot Studio is the maker-grade platform. Describe what you want, and the AI generates the name, description, and instructions, then suggests triggers, channels, knowledge, and tools. You accept, ignore, or dismiss those suggestions."

3. Configure instructions and add a **SharePoint** knowledge source.

   > "Copilot Studio limits are far larger than Agent Builder's: five hundred knowledge sources per agent, eight thousand characters of instructions, five hundred uploaded files, a hundred skills, and a thousand topics per agent in Dataverse environments. When a scenario needs scale, or needs strict grounding control, Copilot Studio is the answer and Agent Builder is not."

4. Add a suggested prompt, then open the **Channels** page.

   > "Channels is the deployment surface. The one that matters here is **Teams and Microsoft 365 Copilot**, because that is the channel that routes an agent to the organization and into the admin approval queue. There are others -- SharePoint, a demo website, a custom website, and more -- but that is the one wired to the governance flow we just walked."

5. Stop without publishing to the organization.

   > "I am stopping here deliberately. Publishing for real would create a genuine pending request in this tenant, and I would be cleaning that up over lunch. The connection is the point: publish to the Teams and Microsoft 365 Copilot channel, and an admin gets a request under Agents, All agents, Requests."

#### What Learners Should See

- The agent configuration surface with name, description, and instructions filled in
- The Knowledge section showing the SharePoint source added
- The Capabilities section with code interpreter and image generator both on by default (Agent Builder)
- The publish or channel configuration, **NOT** confirmed

#### If Something Breaks

- **Agent Builder does not appear:** It requires a Microsoft 365 Copilot license, or a tenant with pay-as-you-go enabled for Copilot Studio, and it is unavailable on mobile clients. Fall back to Option B, or describe the flow.
- **Copilot Studio shows a licensing error:** "Access requires Copilot Studio licensing or a Microsoft 365 Copilot license. Here is the structure I would show you." Walk the steps verbally.
- **The creation experience opens conversationally rather than as a form:** That is current and expected. Describe the agent in natural language, then move to the configuration surface. In Agent Builder, look for the option to skip to configuration.
- **The SharePoint knowledge source fails to attach:** Check whether **Restricted SharePoint Search** is enabled in the tenant, because that alone prevents SharePoint from serving as a knowledge source for a declarative agent. Otherwise the agent identity may lack read permission on the site. Describe the intended behavior and move on. The structure is the teaching point, not the indexing.
- **Publish or the channel configuration is unavailable:** Some trial configurations restrict publication. Say: "In a fully licensed environment this is where you would publish, and choosing the Teams and Microsoft 365 Copilot channel is what creates the pending request in the admin center."
- **A learner asks about SharePoint agents specifically:** Three creation entry points, worth naming: the site homepage via **New > Agent**, the document library command bar via the **AI actions** menu, and a file's right-click or ellipsis context menu. Agents created from the homepage are stored in **Site contents > Site Assets > Copilots**; agents created from a library save to the current folder. The knowledge limit is **20 source items** in any combination, which is a different number from Agent Builder's limits. And SharePoint agents are stored as **.agent** files, so file permissions decide who can access or edit them.

> **Exam callout:** When a maker publishes an agent to the organization, the submission creates a **Pending review** request at **admin.microsoft.com > Agents > All agents > Requests**, connecting the creation workflow directly to the admin approval workflow.

> **Exam callout:** In **Agent Builder**, code interpreter ("Create documents, charts, and code") and image generator ("Create images") are **ENABLED by default**. Microsoft publishes **no maximum** for starter prompts. The "Only use specified sources" toggle **prioritizes** the listed sources rather than fully blocking general model knowledge.

---

## Cross-Demo Reference: Portal Navigation Summary

Use this table during live delivery when you need to quickly orient to the right portal.

| Demo | Portal | Key Navigation Path |
|------|--------|---------------------|
| 1A | admin.microsoft.com | Users > Active users; Billing > Licenses; Health > Service health; Settings > Org settings |
| 1B | admin.microsoft.com | Users > Active users > [user] > Licenses and apps; Teams and groups > Active teams and groups |
| 2A | purview.microsoft.com | **Solutions > Information Protection > Sensitivity labels** > [select a label] |
| 2B | purview.microsoft.com | Data Loss Prevention > Policies > [select a policy] > rules and policy mode (simulation mode) |
| 2C | purview.microsoft.com | **Solutions > DSPM** (new unified); Solutions > DSPM for AI (classic) is the exam-aligned label |
| 2D | admin.microsoft.com/sharepoint | **Reports > Data access governance**; snapshot and activity reports, including Shared with 'Everyone except external users' |
| 3A | admin.microsoft.com | Billing > Licenses; [user] > Licenses and apps; **Copilot > Billing & usage > Billing policies** and **> Pay-as-you-go services** |
| 3B | admin.microsoft.com | **Copilot > Settings** (User access, Data access, Copilot actions, Other settings). Web search links out to the Microsoft 365 Apps admin center Cloud Policy service. |
| 3C | Microsoft 365 Copilot app or Teams | Copilot Chat > **Tools** > Researcher / Analyst; admin.microsoft.com > **Agents > All agents** > Researcher > Block |
| 3D | Viva Insights app (Teams or web) | Copilot Dashboard (readiness, adoption, impact, sentiment); contrast with admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot |
| 4A | admin.microsoft.com | **Agents > All agents > Requests** (approval queue); Agents > All agents > Registry; Agents > Settings |
| 4B | admin.teams.microsoft.com | Teams apps > Manage apps > [app] > **Users and groups** (app centric management) |
| 4C | admin.powerplatform.microsoft.com | Environments > [select environment]; Policies > Data policies > connector classification |
| 4D | Microsoft 365 Copilot app, or copilotstudio.microsoft.com | New agent > Describe or Configure > Knowledge > Capabilities (stop before publishing to the organization) |

---

## Global Fallback Protocol

When any portal is unavailable, slow, or showing an unexpected state, use this protocol:

1. **Narrate the navigation path aloud.** Say the exact clicks you would make even if the screen is not cooperating. Learners lock in a navigation path from hearing it, and hearing it correctly is worth more than seeing it slowly.
2. **State the exam-relevant fact explicitly.** Every demo has an exam callout. If you cannot show the interface, deliver the callout directly.
3. **Use the admin center quick reference table** at the end of the session agenda as a verbal reference. It lists every key navigation path in current form.
4. **Do not dwell on technical issues.** Acknowledge once, something like "the portal is taking its time, which is normal in a demo tenant," then pivot to verbal delivery. Return to the portal if it comes up while you are talking.
5. **Screenshots as backup.** On a secondary device, keep screenshots of the key portal screens. The three most visually important are the DSPM dashboard, the agent approval queue at Agents > All agents > Requests, and the Power Platform connector classification view.
6. **When the tenant contradicts the script, say so and keep teaching.** Portal navigation moves faster than course material, and admitting a label changed is more credible than pretending the screen says something it does not. Give learners the exam-aligned answer and the live-portal reality as two separate facts.

---

## Known Live-Portal Divergences to Expect

These are places where a current tenant may legitimately differ from what the exam objectives say. Handle each by stating both, and label which is which.

| What the exam objective says | What a current tenant may show |
|------------------------------|--------------------------------|
| DSPM for AI | **DSPM** (new unified, GA May 2026), alongside **DSPM for AI (classic)** and **Data Security Posture Management (classic)** |
| Data Explorer | Data explorer under Information Protection > Explorers, with **Content Explorer (classic)** under Data Lifecycle Management |
| Content search in Microsoft Purview eDiscovery | One unified eDiscovery solution, with Standard and Premium wording surviving in case settings and the Cases dashboard filter |
| SharePoint Advanced Management, including restricted access control | The SharePoint admin center uses "Site-level access restriction" and "Restricted site access" wording for the same feature |
| distribution groups (Exchange) | The Exchange admin center tab label reads **Distribution list**; both terms are current in Microsoft documentation |

---

*Document version: 2.0 -- July 2026 (aligned to the AB-900 skills measured as of July 22, 2026)*
*Maintained in: `/c/github/ab900/docs/demo-scripts.md`*
