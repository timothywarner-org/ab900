# AB-900 Demo Scripts — Instructor Delivery Guide

**Instructor:** Tim Warner
**Session:** O'Reilly Live Learning — AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals
**Total demos:** 16 (1A, 1B, 2A, 2B, 2C, 2D, 3A, 3B, 3C, 3D, 4A, 4B, 4C, 4D + two unlabeled walkthroughs folded into 3C and 4D)

This document provides click-by-click scripts for every demo moment in the session. These are instructor-facing. Write narration in quotes as shown. Adapt language in the moment — do not read verbatim.

---

## Pre-Demo Checklist (complete before session start)

Open and pin these tabs in this order before learners join:

1. `admin.microsoft.com` — logged in as demo tenant global admin
2. `purview.microsoft.com` — Solutions menu expanded
3. `admin.microsoft.com/sharepoint` — SharePoint admin center
4. `entra.microsoft.com` — Identity governance section visible
5. `admin.teams.microsoft.com` — Teams apps > Manage apps
6. `admin.powerplatform.microsoft.com` — Environments list visible
7. `copilotstudio.microsoft.com` — Home screen
8. `insights.viva.cloud.microsoft` — Copilot Dashboard (or navigate via M365 admin center)

Pre-navigate each portal to its first demo landing page during the break before each segment. Portal load times — especially Purview and Power Platform — average 10–20 seconds. Do not navigate cold in front of learners.

---

## Segment 1: Core Features and Objects of Microsoft 365 Services

### Demo 1A: admin.microsoft.com Navigation

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com`
**Timing in segment:** 0:30–0:34

#### Pre-Demo Setup

- Tab should already be open and logged in
- Pre-navigate to Users > Active users before the segment begins
- Have at least one test user in the tenant (any user works)
- Confirm the tenant has at least one Copilot-eligible license visible under Billing > Licenses

#### Steps

1. Switch to the `admin.microsoft.com` tab. The Active users list should be visible.
2. Click the display name of any test user to open the user properties pane on the right side of the screen.

   > "This right-side pane is the quick view. Notice the tabs across the top — Account, Devices, Licenses, Mail, OneDrive. For the exam, know that license assignment lives on the Licenses and apps tab, not under a separate Billing section for individual users."

3. Click the **X** to close the user pane. Return to the Active users list.
4. In the left navigation, click **Billing**, then click **Licenses**.

   > "This is the tenant-level view of all licenses you own. Find the Microsoft 365 Copilot entry — if it's here, the tenant has purchased Copilot capacity. The number shown is how many seats you own, not how many are assigned. The exam distinguishes between license quantity and license assignment."

5. Scroll the license list and call out any of these SKUs if visible: Microsoft 365 E3, Microsoft 365 E5, Microsoft 365 Business Standard, Microsoft 365 Business Premium.

   > "Copilot is an add-on. It requires one of these base licenses to already be assigned to the user before Copilot can activate. If a user has only an F1 or F3 license, Copilot cannot be added. The exam will test this prerequisite."

6. In the left navigation, click **Health**, then click **Service health**.

   > "The service health dashboard is where you confirm whether M365 services are experiencing incidents. Notice the two categories — Advisory and Incident. Advisory means a degraded service; Incident means a service is down or significantly impaired. Know both terms for the exam."

7. In the left navigation, click **Settings**, then click **Org settings**.

   > "Org settings is where tenant-wide defaults live — things like letting users install apps, enabling specific Copilot behaviors, and configuring external sharing defaults. When an exam question asks where to configure a setting that affects all users by default, Org settings is usually the answer."

#### What Learners Should See

- After step 2: A right-side pane showing user properties with tabs (Account, Devices, Licenses, Mail, OneDrive)
- After step 4: A list of purchased licenses with columns for License name, Licenses purchased, and Licenses assigned
- After step 6: The service health dashboard with a color-coded service list and any active advisories or incidents
- After step 7: A scrollable list of org-wide settings grouped by category (Services, Security & privacy, News)

#### If Something Breaks

- **Portal loads a blank screen or spins:** "While the portal loads, let me describe the structure — admin.microsoft.com is the hub for all Microsoft 365 administration. Every spoke admin center — Exchange, SharePoint, Teams, Purview — can be reached from here via the Admin centers link in the left navigation." Switch to the pre-loaded screenshot backup if available.
- **Licensing tab shows no Copilot SKU:** "If you don't see Copilot here, the tenant hasn't purchased Copilot licenses yet. In a real deployment you'd see Microsoft 365 Copilot listed as a separate add-on entry." Proceed — the navigation path is the exam-relevant point, not the specific SKU.
- **Settings > Org settings is missing:** Some trial tenants have a reduced navigation menu. Navigate via the search bar at the top of the admin center — type "Org settings" and select the result.

> **Exam callout:** The Microsoft 365 admin center service health dashboard is explicitly tested — know that Advisory indicates degraded service and Incident indicates a down or severely impaired service, and that this dashboard is the first place an admin checks when users report M365 issues.

---

### Demo 1B: License Assignment

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com` > Users > Active users
**Timing in segment:** 0:34–0:38

#### Pre-Demo Setup

- Remain on admin.microsoft.com from Demo 1A (or pre-navigate back to Users > Active users)
- Identify a test user who does NOT currently have a Copilot license assigned — this makes the toggle action visible and meaningful
- Do NOT pre-assign the license; the demo value is showing the assignment action live

#### Steps

1. From the Active users list, click the display name of your designated test user.
2. In the user properties pane, click the **Licenses and apps** tab.

   > "This tab shows every license currently assigned to this user. You can see the base license — M365 Business Standard in this case — already toggled on. Notice Microsoft 365 Copilot is listed here but currently off."

3. Scroll down to find the **Microsoft 365 Copilot** entry in the license list. Toggle it **on**.

   > "I'm turning on the Copilot license. Notice there's no immediate confirmation — it queues the assignment. The exam has a specific fact here: it takes up to 24 hours for Copilot features to appear for the user after license assignment. If a user calls the help desk saying Copilot isn't showing up, the first question is when the license was assigned. If it was within the last 24 hours, tell the user to wait."

4. Click **Save changes** (blue button at the bottom of the panel).
5. Close the user pane with the **X**.
6. In the left navigation, click **Groups**, then click **Active groups**.

   > "Now I want to show you the scale approach. Instead of assigning Copilot one user at a time, you can assign it to a group. Microsoft 365 then automatically assigns the license to every member of that group — and removes it when someone leaves the group. This is called group-based licensing."

7. Click any group name to open the group properties. Click the **Licenses** tab inside the group pane (if visible) or note its location.

   > "The Licenses tab on a group is where you'd configure group-based licensing. For the exam, know that both individual assignment and group-based assignment are valid methods, and that group-based assignment scales better for large organizations."

8. Close the group pane.

#### What Learners Should See

- After step 2: The Licenses and apps tab showing a list of license entries with checkboxes/toggles, with the Copilot entry visible and currently unchecked
- After step 4: A brief success notification or the pane refreshing with the Copilot entry now checked
- After step 7: The group properties pane with a Licenses tab showing any licenses assigned to the group

#### If Something Breaks

- **Copilot license is not visible in the user's Licenses and apps tab:** The tenant may not have a Copilot license purchased. Say: "In your production tenant, Microsoft 365 Copilot would appear here as a toggleable add-on, sitting below the base license. The key point is the assignment method — individual toggle here, or group-based at scale." Then navigate to Billing > Licenses to confirm what's available.
- **Save changes button is greyed out:** Some trial tenants restrict license modifications. Do not force it — describe the action verbally and move to the group-based licensing discussion.
- **Groups navigation is absent:** Navigate via the search bar at the top of admin.microsoft.com — type "Groups" and select Active groups.

> **Exam callout:** The 24-hour activation delay after Copilot license assignment is a direct exam fact — it appears in troubleshooting scenario questions where a user reports Copilot features are not visible immediately after licensing.

---

## Segment 2: Data Protection and Governance for Microsoft 365 and Copilot

### Demo 2A: Purview Sensitivity Labels

**Duration:** 3 minutes
**Portal URL:** `https://purview.microsoft.com`
**Timing in segment:** 0:24–0:27

#### Pre-Demo Setup

- Tab should already be open and logged in to purview.microsoft.com
- Pre-navigate to: Information protection > Labels
- Confirm the tenant has at least one label configured (trial tenants include default labels; if not, note the fallback below)
- Have a label with at least one sublabel available — the hierarchy is the key visual

#### Steps

1. Switch to the purview.microsoft.com tab. The Information protection > Labels page should be visible.

   > "We're in the Microsoft Purview portal — purview.microsoft.com. Important note: the old compliance.microsoft.com URL is being retired. If you see Microsoft documentation that references the compliance portal, understand that purview.microsoft.com is where all of this now lives."

2. Look at the label list. Point out the parent label and expand it to show the sublabels nested beneath it.

   > "This is the label hierarchy. A parent label — like 'Confidential' — can have sublabels beneath it — like 'Confidential - All Employees' or 'Confidential - Finance Only.' Users see the sublabels when they apply labels in Office apps. The parent exists to organize and inherit settings."

3. Click the name of a sublabel to open its configuration panel.
4. Review the **Name and description** section. Then click **Next** (or navigate to the relevant section showing scope and protection settings) to show the scope configuration.

   > "The scope setting tells you where this label can be applied — Files and emails, Groups and sites, or both. A label scoped to Groups and sites can classify an entire SharePoint site, which is relevant to Copilot governance: label a site as Confidential and that classification travels with all content in it."

5. Navigate to the protection settings section. Show whether encryption is enabled or disabled.

   > "The exam tests whether you know the difference between labeling and protection. A label can be applied without enabling encryption — it's just a classification marker. Encryption is a separate action you configure here. For AI governance, even a label without encryption is valuable because Copilot respects label-based DLP rules."

6. Click **Cancel** or close the panel without saving changes.

#### What Learners Should See

- After step 2: The label list with parent labels expandable to show indented sublabels (e.g., Confidential > Confidential - All Employees)
- After step 4: The label configuration panel showing scope options (Files and emails, Groups and sites, Schematized data assets)
- After step 5: The protection settings section with an encryption toggle (on or off)

#### If Something Breaks

- **No labels exist in the tenant:** "In a fresh tenant, this list would be empty until labels are created. Microsoft provides a default label scheme you can activate — Confidential, Highly Confidential, General — via the 'Create default labels' button if you see it. For this demo the key point is the structure: parent labels, sublabels, scope settings, and protection actions." Show the create-new-label wizard instead (first two screens only) and cancel.
- **Portal won't load:** Say: "Purview is one of the slower-loading portals. While it loads, the key structure is: labels live under Information protection > Labels. Labels have scope — they apply to files/emails and/or to containers like SharePoint sites. Protection actions like encryption are optional and configured per label."

> **Exam callout:** Sensitivity labels can be scoped to Groups and sites — meaning a single label applied to a SharePoint site classifies all content in that site — which is directly relevant to how Copilot data governance works at the container level.

---

### Demo 2B: DLP Policy Overview

**Duration:** 3 minutes
**Portal URL:** `https://purview.microsoft.com` > Data loss prevention > Policies
**Timing in segment:** 0:27–0:30

#### Pre-Demo Setup

- Remain on purview.microsoft.com from Demo 2A
- Pre-navigate to: Data loss prevention > Policies
- If at least one DLP policy exists, open it in read-only view before the segment begins
- If no policies exist, the policy creation wizard works as a fallback — stop at step 3

#### Steps

1. In the left navigation of purview.microsoft.com, click **Data loss prevention**, then click **Policies**.

   > "DLP policies live here. The structure is: a policy is the container — it defines what workloads are monitored and what rules apply. A rule is inside the policy — it defines the conditions that trigger it and the actions that result."

2. Click the name of an existing policy to open it. Navigate to the **Policy settings** or rules section.

   > "Look at the workloads this policy covers — Exchange Email, SharePoint, OneDrive, Teams chat, and so on. For the exam, know that a single DLP policy can span multiple workloads simultaneously. You don't need a separate policy per service."

3. Navigate to the **Rules** tab or expand a rule to show its conditions and actions.

   > "Here's the rule logic. The condition is what triggers the rule — in this case, content containing a U.S. Social Security Number sensitive information type. The action is what happens — in this case, a policy tip notifies the user and blocks external sharing. Conditions and actions are the two elements that every DLP rule must have."

4. Point to the **Test mode** setting if visible in the policy overview or policy creation flow.

   > "Test mode is critical for exam scenarios about safe DLP rollout. In test mode, the policy evaluates content and logs matches, but takes no action on users. Admins use activity reports to assess impact before switching to Enforce mode. The exam tests this: what mode do you use to pilot a DLP policy without disrupting users? Test mode."

5. Click **Cancel** or close the panel without saving.

#### What Learners Should See

- After step 2: The policy details showing workload scope — a list of services the policy monitors (Exchange, SharePoint, OneDrive, Teams, etc.)
- After step 3: The rule editor showing a Conditions section (content contains sensitive information type X) and an Actions section (restrict access, notify user, block send, etc.)
- After step 4: The policy status showing Test mode, or the mode selection in a creation wizard

#### If Something Breaks

- **No DLP policies exist:** Open the creation wizard. Click **Create policy**, select **Custom policy** from the template list, and walk through: (1) name the policy, (2) choose workloads, (3) add a rule — show the conditions panel with sensitive information type selector, and the actions panel. Cancel without saving. "This wizard is the same flow for every DLP policy regardless of which workloads you select."
- **Policy rules section is inaccessible (view-only tenant):** Navigate to the policy creation wizard as described above. The structure is identical.

> **Exam callout:** DLP policy test mode — where the policy logs matches but enforces no actions — is an explicitly tested concept for understanding how to safely pilot DLP changes before enforcing them against live user activity.

---

### Demo 2C: DSPM for AI

**Duration:** 4 minutes
**Portal URL:** `https://purview.microsoft.com` > Solutions > DSPM for AI (classic)
**Timing in segment:** 0:30–0:34

#### Pre-Demo Setup

- Remain on purview.microsoft.com
- Pre-navigate to: Solutions in the left navigation
- Identify the entry labeled "DSPM for AI (classic)" — it may also appear as "Data Security Posture Management for AI" in preview
- If both entries appear, note which one you plan to show (classic recommended for exam alignment)
- This demo is acceptable with an empty dashboard — the navigation path is the exam objective, not the data

#### Steps

1. In the left navigation of purview.microsoft.com, click **Solutions**.

   > "The Solutions menu in Purview is where specialty compliance and security features live — things that are feature-complete but scoped to specific scenarios. DSPM for AI is in here. Let me point out something before we click: if your tenant shows two entries — 'DSPM for AI (classic)' and a preview version labeled 'Data Security Posture Management' — both are valid. The classic version aligns to what the exam currently covers. The preview is the evolution of the same capability."

2. Click **DSPM for AI (classic)**.

   > "DSPM stands for Data Security Posture Management for AI. This is a Purview feature specifically designed for the AI era — it exists because Copilot creates a new attack surface: previously inaccessible data is now reachable by any user who asks Copilot the right question. DSPM for AI surfaces that risk."

3. Show the overview dashboard. Point to the main sections: AI app activity, sensitive data interactions, data oversharing risks.

   > "The overview dashboard shows three things: what AI applications are active in your tenant, what sensitive data those AI apps are touching, and which users represent risk. Even if your demo tenant shows zeros because Copilot isn't actively used, the structure is what you're learning. In a production tenant with 500 active Copilot users, this dashboard would show you what sensitive information types appeared in Copilot prompts and responses."

4. Click into any available report — for example, the **AI interaction data** or **Sensitive data in AI prompts and responses** section if it shows any entries.

   > "This is the granular view — which users interacted with Copilot, which sensitivity labels appeared in those interactions, and which files were surfaced. If I see a spike of activity on files labeled Highly Confidential — Legal, that's a signal that Copilot is exposing content that needs tighter access controls."

5. Return to the DSPM for AI overview.

   > "For the exam: if a question describes an admin who needs to understand what sensitive data Copilot is accessing or surfacing to users — the answer is DSPM for AI in Microsoft Purview. Not Content Explorer, not Activity Explorer, not standard usage reports. DSPM for AI is the AI-specific answer."

#### What Learners Should See

- After step 2: The DSPM for AI overview page with a dashboard showing tiles or cards for AI app activity, sensitive data interactions, and oversharing risks (may show zero values in demo tenant)
- After step 4: A report view showing interaction data, with columns for user, sensitivity label, data type, and timestamp if data is available; otherwise an empty state with filter options

#### If Something Breaks

- **DSPM for AI does not appear in the Solutions menu:** "In some tenants — particularly trial tenants without the right Purview add-on license — DSPM for AI may not be visible or fully functional. Here's what it looks like when available..." Switch to a screenshot if prepared, or describe the navigation: "Solutions > DSPM for AI (classic). The exam knows it exists here. For the exam, the key fact is: DSPM for AI lives in Purview, not in the M365 admin center, not in Entra, and not in Teams."
- **Portal loads but dashboard shows a licensing error:** "This is a licensing gate — DSPM for AI requires Purview add-on licensing beyond the base E3/E5. For the exam, know that the feature exists in Purview and what it does. The specific licensing tier is less likely to be tested than the feature's purpose and location."
- **Portal is slow to load:** Talk through the feature conceptually while waiting. "DSPM for AI has three main reports: AI interaction data shows what Copilot sessions touched, sensitive data reports show which sensitivity labels appeared in AI interactions, and data oversharing reports show which SharePoint sites are broadly accessible and therefore Copilot-accessible."

> **Exam callout:** DSPM for AI is a uniquely AB-900 topic — it is the specific Microsoft Purview tool an admin uses to assess and monitor data risk created by Copilot, and it is distinct from general-purpose tools like Content Explorer or Activity Explorer.

---

### Demo 2D: SharePoint Advanced Management — Oversharing Reports

**Duration:** 6 minutes
**Portal URL:** `https://admin.microsoft.com/sharepoint` (SharePoint admin center)
**Timing in segment:** 0:38–0:44

#### Pre-Demo Setup

- Open the SharePoint admin center tab (admin.microsoft.com/sharepoint)
- Pre-navigate to: Reports > Data access governance
- If the tenant has SharePoint Advanced Management enabled, this section should be populated
- If the tenant is a basic trial, navigate to the section and show the empty state or the feature description panel — the navigation path is what matters

#### Steps

1. Switch to the SharePoint admin center tab at `admin.microsoft.com/sharepoint`.

   > "We're now in the SharePoint admin center — a separate admin center from the main M365 admin hub. The URL is admin.microsoft.com/sharepoint. You can also reach it from admin.microsoft.com > Admin centers > SharePoint."

2. In the left navigation, click **Reports**, then click **Data access governance**.

   > "Data access governance is the home of SharePoint oversharing reports. This is a SharePoint Advanced Management feature — it requires the SAM add-on license, but some capabilities are included with E5 or Copilot licensing. For the exam, know this navigation path and what this section shows."

3. Show the available reports. Look for: **Sites shared with "Everyone" or "Everyone except external users"** and **Sharing links activity**.

   > "This first report — Sites shared with Everyone or Everyone except external users — is exactly the oversharing problem that creates Copilot risk. If a SharePoint site is shared with Everyone except external users, that means every person in the organization can access it. If Copilot is licensed for those users, Copilot can surface that content to any of them. This report lets you find every site with that permission pattern so you can fix it."

4. Click into the **Sites shared with "Everyone"** report (or its equivalent label in your tenant).

   > "The report shows the site name, the URL, when it was last modified, and how many files it contains. Sort by file count or by last modified to prioritize which sites to remediate first. The exam may ask: 'What tool does an admin use to identify SharePoint sites that are oversharing?' — this is the answer."

5. Return to the Data access governance overview. Look for the **Site access review** capability or equivalent.

   > "Site access review is a governance workflow — the SharePoint admin triggers it, and it sends a notification to the site owner asking them to review and confirm who should have access. This is a lower-friction approach than the admin manually fixing permissions on every site — you delegate the review to the people who know the business context."

6. Navigate back to the SharePoint admin center left navigation. Click **Advanced management** if visible, or scroll the Reports section.

   > "Restricted SharePoint Search is one more tool to know for the exam. It lets an admin limit Copilot's organizational search to a curated list of approved SharePoint sites. It is a short-term mitigation — a way to reduce Copilot's data surface while you do the longer work of fixing permissions. It is not a permanent solution because it also limits the value Copilot delivers."

#### What Learners Should See

- After step 2: The Data access governance section showing available report tiles or a list of reports with descriptions
- After step 4: A report table listing SharePoint sites with columns for site name, URL, sharing type (Everyone, Everyone except external users), file count, and last activity
- After step 6: The SharePoint admin center navigation showing Advanced management as a section or the Restricted SharePoint Search setting

#### If Something Breaks

- **Data access governance section is empty or missing:** "SharePoint Advanced Management — the add-on that fully unlocks these reports — may not be licensed in this trial tenant. Here's the navigation path that matters for the exam: SharePoint admin center > Reports > Data access governance. The reports you would see in a licensed tenant are: Sites with most sharing links, Sites shared with Everyone, and Sharing links activity." Proceed verbally.
- **Reports section is not visible in the left nav:** The SharePoint admin center navigation can vary. Try searching for "Data access governance" in the admin center search bar, or navigate to the Reports section and scroll for governance-related entries.
- **Restricted SharePoint Search is not listed:** Some tenants have not enabled SharePoint Advanced Management at all. Describe it verbally: "Restricted SharePoint Search is in SharePoint admin center under Settings. When enabled, it adds an allowlist — you specify which sites Copilot can draw from for organizational search. It's a containment measure while you remediate oversharing at scale."

> **Exam callout:** SharePoint Advanced Management's Data access governance reports — specifically the Sites shared with Everyone report — are the primary tool for identifying and remediating oversharing that creates Copilot data exposure risk.

---

## Segment 3: Copilot Features and Administration

### Demo 3A: License Assignment and Billing Policy

**Duration:** 10 minutes
**Portal URL:** `https://admin.microsoft.com`
**Timing in segment:** 0:18–0:28

#### Pre-Demo Setup

- Pre-navigate to admin.microsoft.com > Billing > Licenses before the segment begins
- Also pre-navigate to admin.microsoft.com > Copilot > Billing & usage in a second tab or bookmark it
- Confirm the tenant has an Azure subscription linked if you plan to show the PAYG billing configuration — if not, note the fallback
- Have a test user selected in Users > Active users for the license assignment portion

#### Steps

1. Navigate to `admin.microsoft.com` > **Billing** > **Licenses**.

   > "Starting with subscription licensing — the fixed, per-user per-month model. Here under Billing > Licenses, you see every SKU the tenant has purchased. Find Microsoft 365 Copilot. The number in 'Licenses purchased' is your capacity. The number in 'Licenses assigned' is how many are in use. The gap between those two numbers is unused capacity you're paying for — an admin detail that matters for budget conversations."

2. Click on the **Microsoft 365 Copilot** entry to open the license details.

   > "From here you can see every user who currently has this license. You can also add or remove users from this view. The subscription model is straightforward: each named user gets a Copilot license, and they get full Copilot access in Word, Excel, PowerPoint, Outlook, Teams, and Microsoft 365 Chat — formerly called Business Chat."

3. Click **Assign licenses** (or close and navigate to Users > Active users > select a test user > Licenses and apps tab).
4. On the test user's **Licenses and apps** tab, locate Microsoft 365 Copilot and show the toggle state.

   > "Here's the individual assignment workflow. I find the user, go to their Licenses and apps tab, toggle on Copilot, and save. This is the path for assigning to individuals. The group-based path we showed in Segment 1 is how you do this at scale."

5. Click **Save changes** if making a change, or leave it as-is and close the panel.
6. In the left navigation, locate **Copilot** (in the main left nav, below Settings). Click **Copilot**, then click **Billing & usage**.

   > "Now for the pay-as-you-go model — and here's the exam navigation fact: this is NOT under Billing. It is under the Copilot section in the left nav. Copilot > Billing & usage. If an exam question asks where you configure the Azure billing policy for Copilot pay-as-you-go consumption, the answer is the Copilot section of the M365 admin center, not the standard Billing section."

7. Click the **Billing policies** tab within Billing & usage.

   > "A billing policy connects the Microsoft 365 tenant to an Azure subscription and resource group. This is what enables consumption-based charging for things like Copilot Studio agents running on pay-as-you-go. You can set a spending limit here to prevent runaway costs. Without a billing policy configured, pay-as-you-go scenarios cannot run."

8. Point out the fields: Azure subscription selector, resource group, and spending limit input.

   > "Three fields to know for the exam: the Azure subscription the charges flow to, the resource group for cost tracking, and the optional spending limit. The spending limit is a guardrail. Copilot Studio's PAYG billing unit is called a Copilot Credit — not a message, not a token. Copilot Credits. That specific terminology can appear in exam questions."

#### What Learners Should See

- After step 2: The Microsoft 365 Copilot license detail page showing assigned users and a list of users with the license
- After step 6: The Copilot > Billing & usage section with a Billing policies tab visible
- After step 8: The billing policy configuration form showing Azure subscription dropdown, resource group field, and spending limit input

#### If Something Breaks

- **Copilot is not in the left navigation:** Some tenants organize this differently. Try Settings > Microsoft 365 Copilot, or search "billing policy" in the admin center search bar. Describe the intended path: "Copilot > Billing & usage > Billing policies. In some tenant configurations this is also accessible under Settings > Microsoft 365 Copilot."
- **Billing policies tab shows no configuration options:** "In a trial tenant without an Azure subscription linked, the billing policy section may show an empty state or a prompt to link a subscription. The exam won't test the Azure subscription ID — it tests that you know this configuration lives in the Copilot section, not the Billing section of the admin center."
- **Spending limit field is not visible:** The PAYG configuration UI has changed over time. Show whatever fields are available and narrate the expected content: "You'd see an Azure subscription selector, resource group, and a spending limit guardrail field here."

> **Exam callout:** Pay-as-you-go Copilot billing policy configuration lives at admin.microsoft.com > Copilot > Billing & usage > Billing policies — not under the standard Billing navigation node — and Copilot Studio's consumption unit is called a Copilot Credit.

---

### Demo 3B: Copilot Settings in the Admin Center

**Duration:** 4 minutes
**Portal URL:** `https://admin.microsoft.com` > Settings > Microsoft 365 Copilot (or Copilot in left nav)
**Timing in segment:** 0:28–0:32 (compressed within the combined lecture + demo block)

#### Pre-Demo Setup

- Remain on admin.microsoft.com from Demo 3A
- Navigate to Settings > Microsoft 365 Copilot (or the Copilot section in the left nav, whichever is available in your tenant)
- This section's label and location vary by tenant configuration — be prepared to navigate by search if needed

#### Steps

1. In the left navigation of admin.microsoft.com, click **Settings**, then click **Microsoft 365 Copilot** — or click **Copilot** directly in the left nav if present.

   > "This is the central configuration panel for Microsoft 365 Copilot settings at the tenant level. Think of this as Copilot's feature control panel — you're not managing licenses here, you're managing behavior."

2. Locate the **Web search** toggle (may be labeled "Allow Copilot to access web content" or similar).

   > "The web search toggle controls whether Copilot can include Bing-sourced web content in its responses. When this is on, Copilot can answer questions using both your organizational data and real-time web information. When it's off, Copilot is limited to organizational data only — your emails, files, meetings. Some organizations disable web search for compliance or information control reasons."

3. Locate the **Optional connected experiences** or data diagnostic sharing setting if visible.

   > "Optional connected experiences is a setting that controls whether Copilot can use Microsoft's online services for features beyond what's strictly required. This is relevant to organizations with strict data handling policies. When exam questions describe an organization that needs to limit what data Microsoft can use for service improvement, this toggle is part of the answer."

4. Scroll to find any plugin management or extensibility settings.

   > "Plugin management controls whether users can connect third-party plugins to Copilot — things like a Salesforce connector or a Jira integration. Admins can allow all plugins, restrict to Microsoft-published plugins only, or block all plugins. This is a governance control — it prevents users from connecting Copilot to unsanctioned data sources through the plugin model."

5. Point out the **Manage agents** or Agents section if visible.

   > "We'll spend more time on this in Segment 4, but note it lives here — Copilot settings is also where the tenant-level agent policy lives. This is the toggle that controls whether agents can be deployed in the tenant at all, and whether users can install agents that haven't been explicitly approved by an admin."

#### What Learners Should See

- After step 2: A settings page with named toggles including web search, optional connected experiences, and similar Copilot behavior controls
- After step 5: A section showing agent-related settings including allow/block agent policy options

#### If Something Breaks

- **Settings > Microsoft 365 Copilot is missing:** Search "Copilot settings" in the admin center search bar. If not found, the tenant may need the Copilot admin role assigned, or the feature may not be fully deployed to this tenant version. Navigate to any available Copilot-related setting and describe what would be visible in a production tenant.
- **Toggles are greyed out:** The signed-in account may not have sufficient permissions. Describe what would be configurable: "In a tenant where the signed-in account has the Copilot Admin role, each of these toggles would be clickable. The role required to change Copilot feature settings is Copilot Admin — not Global Admin, though Global Admin can do it too."

> **Exam callout:** The Copilot Admin role — not Global Administrator — is the appropriate minimum-privilege role for managing Copilot feature settings including the web search toggle, plugin management, and agent policies in the M365 admin center.

---

### Demo 3C: Researcher and Analyst in Copilot

**Duration:** 3 minutes
**Portal URL:** `https://microsoft365.com` or Microsoft Teams (Copilot chat)
**Timing in segment:** 0:32–0:35 (compressed within the combined lecture + demo block)

#### Pre-Demo Setup

- If Copilot is licensed in the demo tenant: open Microsoft 365 (microsoft365.com) or Teams and navigate to Copilot chat
- If Copilot is NOT fully licensed: use the admin settings view showing the control for these features — the control location is the fallback
- This demo is acceptable as a brief UI orientation — the exam tests concepts about Researcher and Analyst, not their operational use

#### Steps

1. Navigate to `microsoft365.com` or open Copilot in Microsoft Teams (the Copilot icon in the Teams left rail).

   > "Researcher and Analyst are built into Microsoft 365 Copilot — they are not agents you deploy from Copilot Studio, not plugins users install, and not something IT builds. They are part of the core Copilot experience for licensed users."

2. If Copilot is available, point to the Researcher or deep research option in the Copilot chat interface. It may appear as a prompt option, a mode selector, or a specific entry in the Copilot home panel.

   > "Researcher performs multi-step research tasks. When a user invokes it, Copilot doesn't just answer once — it plans a sequence of steps, queries organizational data through Microsoft Graph, optionally queries the web through Bing, and synthesizes a structured research output. That's what makes it 'agentic' — it plans and executes a sequence of actions, not a single response."

3. Point to the Analyst option if visible.

   > "Analyst is the data-focused counterpart. It works with structured data — primarily Excel files and similar sources — to produce analysis, charts, and trend summaries. Think of it as Copilot with data analysis reasoning built in."

4. Return to admin.microsoft.com > Settings > Microsoft 365 Copilot. Show the control for Researcher and/or Analyst if it is surfaced in the admin panel.

   > "Here's the admin angle that the exam tests specifically: Researcher and Analyst are NOT disabled by the general agent on/off toggle in the admin center. If you turn off agents at the tenant level, Researcher and Analyst continue to work. They require a separate, explicit block action in the admin settings. Users cannot opt themselves out — only admins can block these experiences. This is a tested distinction."

#### What Learners Should See

- After step 2: The Copilot chat interface showing a mode selector or prompt option for Researcher / deep research
- After step 4: The admin settings showing Researcher and/or Analyst as separately toggleable items, distinct from the general agent policy toggle

#### If Something Breaks

- **Copilot is not licensed or available in the demo tenant:** Skip to step 4 — show the admin controls only. Say: "The UI for Researcher in the end user experience looks like a mode selector or a specific entry in the Copilot home panel. For the exam, the navigation to understand is the admin control — and specifically the fact that the general agent toggle does NOT disable Researcher and Analyst."
- **Researcher and Analyst controls are not visible in admin settings:** Describe the expected behavior: "In a fully configured M365 Copilot tenant, the Settings > Microsoft 365 Copilot panel would show Researcher and Analyst as separately controlled features. The exam fact remains: they require explicit blocking, separate from the general agent governance toggle."

> **Exam callout:** Researcher and Analyst are built-in agentic experiences in Microsoft 365 Copilot — they are not disabled by the general agent management toggle and require a separate explicit admin action to block, making them distinct from Copilot Studio-deployed agents in the governance model.

---

### Demo 3D: Copilot Dashboard in Viva Insights

**Duration:** 5 minutes
**Portal URL:** `https://insights.viva.cloud.microsoft` or admin.microsoft.com > Reports > Copilot Dashboard
**Timing in segment:** 0:43–0:48

#### Pre-Demo Setup

- Pre-navigate to insights.viva.cloud.microsoft and look for the Copilot Dashboard section
- Alternatively, navigate from admin.microsoft.com > Reports > Copilot usage > select "Open in Viva Insights"
- The dashboard may require the Insights Administrator or Global Administrator role to access fully
- An empty dashboard in a trial tenant is acceptable — the four section names and their purpose are what matter

#### Steps

1. Navigate to `insights.viva.cloud.microsoft` or follow the path admin.microsoft.com > **Reports** > look for **Copilot Dashboard** or **Copilot usage**.

   > "The Copilot Dashboard is in Viva Insights, not in the standard M365 usage reports. This is an important exam navigation fact. The standard usage reports at admin.microsoft.com > Reports > Usage give you generic app usage data. The Copilot Dashboard gives you Copilot-specific adoption metrics broken down in a way that's actionable for admins and business sponsors."

2. Show the dashboard and point to the four main sections: **Readiness**, **Adoption**, **Impact**, **Sentiment**.

   > "Four sections. Know all four names for the exam. Readiness shows how many users are licensed and enabled — your potential Copilot user base. Adoption shows how many of those licensed users are actually using Copilot, broken down by app — Teams, Outlook, Word, Excel. Impact attempts to quantify the value Copilot is delivering. Sentiment is optional survey data if the organization has configured pulse surveys."

3. Click into the **Readiness** section.

   > "Readiness is where an admin starts before a Copilot rollout. How many users have licenses? How many have activated? If 100 users are licensed and only 40 have activated, you have a change management problem — not a technology problem. Readiness surfaces that gap."

4. Click into the **Adoption** section.

   > "Adoption breaks down active usage by app. This is where you see whether users are engaging with Copilot in the apps where it delivers the most value — Teams meetings, Outlook email drafts, Word documents. Low adoption in Teams but high adoption in Outlook might tell you the organization uses Teams differently than expected."

5. Click into the **Impact** section.

   > "Impact is the 'why does this matter to leadership' section. The key metric here is Copilot-assisted hours — an estimate of how much time Copilot is saving users based on usage patterns. This metric exists specifically for business justification conversations. Admins use this data to demonstrate ROI to sponsors asking whether the Copilot investment is worth it."

6. Point to the **Sentiment** section.

   > "Sentiment is optional — it requires pulse survey configuration to populate. If configured, it shows user-reported feedback on Copilot helpfulness. Not all tenants use it. For the exam, know it exists as one of the four sections but don't expect deep questions on its configuration."

#### What Learners Should See

- After step 2: The Copilot Dashboard overview with four labeled sections or tabs: Readiness, Adoption, Impact, Sentiment
- After step 3: The Readiness view showing licensed user count vs. activated user count
- After step 4: The Adoption view showing active users by application (Teams, Outlook, Word, Excel, etc.) with trend lines
- After step 5: The Impact view with the Copilot-assisted hours metric prominently displayed

#### If Something Breaks

- **Viva Insights portal redirects or requires additional licensing:** "Viva Insights access for the Copilot Dashboard may require specific licensing in some tenants. Here's the navigation: insights.viva.cloud.microsoft, look for Copilot Dashboard in the left nav. You can also reach it from admin.microsoft.com > Reports > Copilot usage, then selecting the Viva Insights view. For the exam, know the four sections: Readiness, Adoption, Impact, Sentiment."
- **Dashboard loads but all metrics show zero or N/A:** "A demo tenant with no real Copilot usage will show empty metrics — that's expected. The structure is what you're learning. In a production tenant with 200 active Copilot users, these sections would be populated with trend data." Proceed through the section descriptions verbally.
- **Can't find Copilot Dashboard in Viva Insights nav:** Try admin.microsoft.com > Reports > Usage > Microsoft 365 Copilot usage > click "Open in Viva Insights." If that also fails, navigate to the Viva Insights home and look for Copilot-specific content under the Reports or Analytics sections.

> **Exam callout:** The Copilot Dashboard in Viva Insights — with its four sections (Readiness, Adoption, Impact, Sentiment) — is the specific tool for monitoring Copilot adoption and impact, and is distinct from the standard Microsoft 365 usage reports at admin.microsoft.com.

---

## Segment 4: Agent Administration and Exam Success

### Demo 4A: Agent Approval in the M365 Admin Center

**Duration:** 6 minutes
**Portal URL:** `https://admin.microsoft.com` > Copilot > Agents (or Settings > Microsoft 365 Copilot > Agents)
**Timing in segment:** 0:14–0:20

#### Pre-Demo Setup

- Pre-navigate to admin.microsoft.com and locate the Agents section — it may be under:
  - Copilot > Agents in the left nav, OR
  - Settings > Microsoft 365 Copilot > Agents tab, OR
  - The specific path may be labeled "Integrated apps" in older tenant configurations
- If the tenant has any pending agent submissions, those will show in the Requests queue — ideal for the demo
- If no pending requests exist, the empty state is acceptable — describe what would appear

#### Steps

1. Navigate to `admin.microsoft.com`. In the left navigation, locate **Copilot** and expand it, then click **Agents**. If the path differs in your tenant, try **Settings** > **Microsoft 365 Copilot** > and look for an Agents tab or section.

   > "This is the primary agent governance location in the M365 admin center. This is where the AB-900 exam expects you to go when a question asks: 'Where does an admin approve a Copilot agent for org-wide deployment?' — the answer is here. Not in the Teams admin center, not in Copilot Studio — here."

2. Show the tenant-level agent policy setting. It typically presents as three options: Allow all agents, Allow only specific agents, or Block all agents.

   > "The tenant-level policy is the master switch. Allow all means any published agent becomes available to users. Block all means no agents run in the tenant regardless of who built them. The middle option — Allow only specific agents — is the most governance-appropriate choice: admins review and approve individual agents before they reach users."

3. Navigate to the **Requests** tab or queue within the Agents section.

   > "This is the approval queue. When a maker in Copilot Studio submits an agent for org-wide publication, it lands here as a pending request. The request shows the agent's name, description, the maker's identity, and what permissions or knowledge sources the agent is requesting access to."

4. If a pending request exists, click it and walk through the review pane.

   > "As the reviewing admin, I'm looking at three things: What is this agent supposed to do? What data sources does it access — is it limited to SharePoint within my tenant, or does it reach external services? And who built it — is this a maker in a business-sanctioned department, or an unknown source? Based on that review, I approve or reject."

5. Show the Approve and Reject (or Block) buttons.

   > "Approve means the agent becomes available per the tenant policy. Reject or Block means the agent is prevented from publishing. For the exam, the key navigation is: M365 admin center > Agents > Requests for the approval queue, and the agent policy setting at the top of this page for the tenant-level master control."

6. Return to the main Agents page without making changes.

#### What Learners Should See

- After step 2: The agent policy setting showing three radio button or dropdown options (Allow all, Allow specific, Block all)
- After step 3: A Requests tab showing either pending agent submissions with columns for agent name, submitter, and status — or an empty queue with a message about how submissions will appear here
- After step 5: The review pane for an individual agent request with an Approve and a Reject/Block action button

#### If Something Breaks

- **Agents section is not visible in the left nav:** Navigate via Settings > Microsoft 365 Copilot and look for an Agents section or tab. Some tenant configurations also surface this under Settings > Integrated apps. Say: "The navigation label may vary slightly by tenant configuration — in current tenants it's under Copilot > Agents, but you may also see it under Settings > Microsoft 365 Copilot > Agents."
- **No pending agent requests exist:** "An empty queue means no agents have been submitted for review. In a production tenant where makers are actively building in Copilot Studio, you would see submissions here. The empty state shows you what the queue looks like — agent name, submitter, submission date. Let me describe what you'd do with an actual submission." Proceed through steps 4–5 verbally.
- **Tenant shows "Integrated apps" instead of "Agents":** This is an older UI label for the same feature. Navigate to Settings > Integrated apps > All apps and filter for agent-type apps. The governance model is the same — the label changed.

> **Exam callout:** The M365 admin center Agents section (Copilot > Agents > Requests) is the primary approval queue for Copilot Studio agent submissions intended for org-wide deployment — this is separate from the Teams admin center, which handles app permission policies after the agent is approved.

---

### Demo 4B: Teams Admin Center — App Governance for Agents

**Duration:** 3 minutes
**Portal URL:** `https://admin.teams.microsoft.com` > Teams apps > Manage apps
**Timing in segment:** 0:20–0:23

#### Pre-Demo Setup

- Open admin.teams.microsoft.com tab (should be pre-loaded)
- Navigate to Teams apps > Manage apps before the segment
- Use the search/filter to find any Copilot-related apps or agents if available in the tenant
- If a previously approved agent is visible, use it; otherwise use any first-party Microsoft app as a structural example

#### Steps

1. Switch to the `admin.teams.microsoft.com` tab. Navigate to **Teams apps** > **Manage apps**.

   > "The Teams admin center handles the second layer of agent governance — after an agent is approved in the M365 admin center, it enters the Teams app ecosystem. Agents published as Teams apps follow the same governance model as any other Teams app. If you already understand Teams app governance, you already understand Copilot agent deployment governance."

2. In the Manage apps list, look for any Copilot-related apps or agents. Use the search bar to filter by "Copilot" or "agent" if needed.

   > "Each row here represents an app or agent that exists in the tenant's app catalog. The Status column shows whether the app is Allowed or Blocked. The Type column distinguishes Microsoft-published apps from Custom — agents you build in your org show up as Custom."

3. Click on any relevant app to open its detail panel. Show the permission and availability settings.

   > "Inside the app detail, I can see what permissions this app requests — whether it can read messages, access files, or call external APIs. I can also set availability: assign the app to specific users or groups, or make it available to everyone. This is how you scope a Copilot agent to a specific department rather than the whole organization."

4. Return to the Manage apps list. Point to **App permission policies** in the left navigation.

   > "App permission policies are the template approach. Instead of managing every app per-user, you create a policy — 'Finance Users can access these apps, everyone else cannot' — and assign it to groups. When you approve a new agent in the M365 admin center and want to deploy it only to the Sales team, you add it to the Sales team's app permission policy here."

#### What Learners Should See

- After step 2: The Manage apps list with columns for Name, Status (Allowed/Blocked), Type (Microsoft/Custom), and availability settings
- After step 3: An app detail panel showing the Permissions section and an Availability setting with options to restrict by user or group
- After step 4: The App permission policies section in the Teams admin center left nav showing a list of named policies

#### If Something Breaks

- **No Copilot-related apps are visible:** Use any Microsoft-published app as a structural example — the governance model is identical. Say: "The same permission and availability controls that govern this app apply equally to Copilot agents published as Teams apps. The agent would show up here as a Custom app after being approved in the M365 admin center."
- **Manage apps shows no entries:** In a fresh trial tenant, the app list may be empty or show only system apps. Navigate to App permission policies as the primary visual and describe the Manage apps structure verbally.

> **Exam callout:** Copilot agents published as Teams apps are governed through the Teams admin center's Manage apps and app permission policies — these controls determine which users can install and use an agent after it has been approved in the M365 admin center.

---

### Demo 4C: Power Platform Admin Center — Environment and DLP Controls

**Duration:** 3 minutes
**Portal URL:** `https://admin.powerplatform.microsoft.com`
**Timing in segment:** 0:23–0:26

#### Pre-Demo Setup

- Open admin.powerplatform.microsoft.com tab (should be pre-loaded)
- Pre-navigate to Environments — the list of environments should be visible
- Identify which environment Copilot Studio uses in this tenant (default environment is most common)
- Navigate to Policies > Data policies (DLP) and have at least one policy visible or the creation wizard ready

#### Steps

1. Switch to the `admin.powerplatform.microsoft.com` tab. The Environments list should be visible.

   > "The Power Platform admin center is the third governance layer for agents. Here's how the three centers divide responsibility: the M365 admin center controls whether agents can be deployed to users; the Teams admin center controls which users can install and use an agent; the Power Platform admin center controls what the agent is allowed to do — specifically which data sources and connectors it can access."

2. Click on the **default environment** (or whichever environment Copilot Studio is active in).

   > "Every Copilot Studio agent is built inside a Power Platform environment. The environment is a container — it has its own data store, its own security model, and its own DLP policies. Admins control which users can create agents by controlling who has the Maker role in the environment."

3. Briefly show the environment details — note the environment type, location, and any Copilot Studio resources listed.
4. Navigate back to the admin center. In the left navigation, click **Policies**, then click **Data policies**.

   > "Data policies — called DLP policies in the Power Platform context — control which connectors agents can invoke. This is distinct from the Purview DLP we saw earlier. Purview DLP governs data movement and classification. Power Platform DLP governs connector access — which external services a Power Automate flow or a Copilot Studio agent can connect to."

5. Click on an existing DLP policy (or the creation wizard if none exist). Show the connector classification view.

   > "Connectors are classified into three buckets: Business, Non-business, and Blocked. Business connectors can work together in a single agent or flow. Non-business connectors are isolated — they can't share data with Business connectors. Blocked connectors simply cannot be used at all. If I add a third-party CRM connector to the Blocked category, no agent or flow in this environment can invoke it — regardless of whether that agent was approved in the M365 admin center."

6. Point out the separation between M365 admin center approval and Power Platform DLP enforcement.

   > "This is a critical exam concept: an agent can be approved in the M365 admin center and still be unable to function if its required connector is blocked by a Power Platform DLP policy. The two governance layers are independent and complementary. Approving the agent controls who can use it; the DLP policy controls what it can do."

#### What Learners Should See

- After step 1: The Environments list showing one or more Power Platform environments with columns for Name, Type, and Region
- After step 5: The DLP policy connector classification view showing connectors divided into Business, Non-business, and Blocked columns (or tiles)
- After step 6: The connector classification view with at least one connector visible in the Blocked category

#### If Something Breaks

- **No DLP policies exist:** Use the creation wizard. Click **New policy**, proceed through the workload selection, and land on the connector classification screen — this is the key visual. Cancel without saving. "The connector classification screen is what matters — this is where you drag connectors from one classification to another. Putting a connector in Blocked prevents any agent in this environment from invoking it."
- **Power Platform admin center shows access denied:** The demo account may need the Power Platform Service Admin or Global Admin role. Show what you can access and describe the rest: "In a properly permissioned tenant, Policies > Data policies would show the connector classification view I just described. The key exam fact is that these DLP policies are in the Power Platform admin center, not Purview, and they govern connector access for Copilot Studio agents."
- **Environment list is empty:** "A fresh M365 trial tenant creates a default Power Platform environment automatically. If it's not showing, it may be provisioning. The default environment is where Copilot Studio operates unless the organization has created separate environments for development, testing, and production."

> **Exam callout:** Power Platform data policies (DLP) — configured in the Power Platform admin center under Policies > Data policies — control which connectors Copilot Studio agents can invoke, and a Blocked connector prevents agent actions regardless of the agent's approval status in the M365 admin center.

---

### Demo 4D: Copilot Studio — Declarative Agent Creation Walkthrough

**Duration:** 8 minutes
**Portal URL:** `https://copilotstudio.microsoft.com`
**Timing in segment:** 0:26–0:34

#### Pre-Demo Setup

- Open copilotstudio.microsoft.com and sign in with the demo tenant account
- Navigate to the home screen — the Create agent button should be visible
- Do NOT pre-create a draft agent; create live so learners see the full flow
- Have a SharePoint site URL ready to paste as a knowledge source (any intranet SharePoint URL in the tenant works)
- Confirm you will NOT click Publish during the demo — stop at the publish screen

#### Steps

1. Navigate to `copilotstudio.microsoft.com`. The Copilot Studio home screen should be visible.

   > "Copilot Studio is the low-code platform for building agents. Everything here is visual and configuration-driven — makers do not need to write code to build a functional agent. This is the creation tool; the admin centers we visited are the governance tools."

2. Click **Create** in the left navigation, then click **New agent** (or equivalent label in the current UI).

   > "The creation experience starts with a conversation or a form — depending on the UI version you see. Either way, the result is the same: a named agent with a description, a system prompt, knowledge sources, and optionally, actions."

3. Name the agent: type `HR Policy Assistant` (or any clear demo name).
4. Write a brief description: `Answers employee questions about HR policies using company documentation.`
5. Write a system prompt. Type or paste:

   ```
   You are an HR assistant for Contoso. Answer questions about company HR policies using only the provided knowledge sources. If you cannot answer from the knowledge sources, say you don't know.
   ```

   > "The system prompt is the instruction layer that shapes how the agent behaves — its tone, its scope, and its limitations. For the exam, know that a declarative agent is defined primarily by its system prompt, its knowledge sources, and its conversation starters. No code is required."

6. Navigate to the **Knowledge** section. Click **Add knowledge** (or equivalent label).

   > "Knowledge sources are where the agent gets its information. Copilot Studio supports several knowledge source types: SharePoint sites and document libraries, uploaded files, public websites, and custom connectors. The knowledge source you add here determines what data the agent can draw from when answering questions."

7. Select **SharePoint** as the knowledge source type. Paste a SharePoint site URL from the demo tenant.

   > "I'm adding a SharePoint site. The agent will index this site's content and use it to answer questions. This is important for understanding the data governance angle: the agent respects SharePoint permissions — it can only surface content that the end user asking the question has permission to access. The agent does not bypass SharePoint security."

8. Click **Add** to confirm the knowledge source.
9. Navigate to the **Conversation starters** section. Add one example question:

   ```
   What is the company's policy on remote work?
   ```

   > "Conversation starters are suggested prompts that appear to users when they open the agent. They help users understand what the agent can do. They are not required for the agent to function, but they improve discoverability."

10. Scroll to find the **Publish** button (typically in the top right or via the Publish navigation section). Click it to open the publication options panel.

    > "Here is where the creation-to-governance pipeline connects. When I click Publish, Copilot Studio will ask me where to publish this agent — Teams and Microsoft 365, SharePoint, a standalone website, or all of the above. If I choose 'Publish to your organization,' this triggers the submission that lands in the M365 admin center approval queue we saw in Demo 4A. The maker hits Publish here; the admin sees a pending request there."

11. Point out the publication destination options without clicking Publish.

    > "I'm going to stop here without actually publishing. In a demo tenant, hitting Publish for org-wide distribution would create a real pending request and I'd have to clean it up. The important visual is what you see here: the connection between this Publish action and the M365 admin center approval queue. That is the pipeline the exam tests."

12. Click **Cancel** or navigate away without publishing.

#### What Learners Should See

- After step 5: The agent creation canvas showing the agent name, description, and a system prompt input field with the typed instructions
- After step 8: The Knowledge section showing the SharePoint site URL added as a knowledge source with a status indicator
- After step 10: The publication options panel showing available channels (Teams and Microsoft 365, SharePoint, web) with a Publish button — NOT yet clicked
- After step 12: The Copilot Studio canvas with the agent saved as a draft

#### If Something Breaks

- **Copilot Studio requires sign-in or shows a licensing error:** "Copilot Studio access requires either a Copilot Studio standalone license or a Microsoft 365 Copilot license in the tenant. In a demo tenant without that, the portal will prompt for licensing. Here's the structure I'd show you if we could get in..." Walk through the creation steps verbally using the session agenda description as a reference.
- **Agent creation wizard shows a different flow (conversational vs. form):** Some Copilot Studio versions open a conversational creation experience — a chat prompt that asks you to describe the agent. Either enter the agent description conversationally and then navigate to the configuration canvas, or look for a "Skip to manual configuration" option.
- **SharePoint knowledge source fails to add (authentication error):** "The knowledge source needs the agent's identity to have read permissions on the SharePoint site. In a fresh demo tenant, this permissions setup may not be complete. Describe what would happen: the URL is entered, Copilot Studio validates access, and if successful, indexes the site's content. For the demo, the structure is what matters — not the data."
- **Publish button is missing or greyed out:** Some trial tenant configurations restrict publication. Navigate to the Publish section in the left nav of Copilot Studio if the button isn't on the main canvas. If still unavailable, say: "In a fully licensed environment, the Publish button would be here, and clicking it opens the channel selection screen. That selection — particularly 'publish to your organization' — is what creates the pending request in the M365 admin center."

> **Exam callout:** When a maker clicks Publish in Copilot Studio and selects org-wide distribution, this action creates a pending agent request in the M365 admin center (Copilot > Agents > Requests) — connecting the creation workflow in Copilot Studio directly to the admin approval workflow in the M365 admin center.

---

## Cross-Demo Reference: Portal Navigation Summary

Use this table during live delivery when you need to quickly orient to the right portal.

| Demo | Portal | Key Navigation Path |
|------|--------|---------------------|
| 1A | admin.microsoft.com | Users > Active users; Billing > Licenses; Health > Service health; Settings > Org settings |
| 1B | admin.microsoft.com | Users > Active users > [user] > Licenses and apps |
| 2A | purview.microsoft.com | Information protection > Labels > [select a label] |
| 2B | purview.microsoft.com | Data loss prevention > Policies > [select a policy] > Rules |
| 2C | purview.microsoft.com | Solutions > DSPM for AI (classic) > Overview dashboard |
| 2D | admin.microsoft.com/sharepoint | Reports > Data access governance > Sites shared with Everyone |
| 3A | admin.microsoft.com | Billing > Licenses; [user] > Licenses and apps; Copilot > Billing & usage > Billing policies |
| 3B | admin.microsoft.com | Settings > Microsoft 365 Copilot (or Copilot in left nav) |
| 3C | microsoft365.com or Teams | Copilot chat > Researcher / Analyst entry point; admin.microsoft.com > Settings > Microsoft 365 Copilot > controls |
| 3D | insights.viva.cloud.microsoft | Copilot Dashboard > Readiness, Adoption, Impact, Sentiment sections |
| 4A | admin.microsoft.com | Copilot > Agents > Requests (approval queue); agent policy setting |
| 4B | admin.teams.microsoft.com | Teams apps > Manage apps; Teams apps > Permission policies |
| 4C | admin.powerplatform.microsoft.com | Environments > [select env]; Policies > Data policies > [connector classification] |
| 4D | copilotstudio.microsoft.com | Create > New agent > [configure] > Publish (stop before confirming) |

---

## Global Fallback Protocol

When any portal is unavailable, slow, or showing an unexpected state, use this protocol:

1. **Narrate the navigation path aloud** — say the exact clicks you would make even if the screen is not cooperating. Learners lock in the navigation path from hearing it.
2. **State the exam-relevant fact explicitly** — every demo has an exam callout. If you cannot show the UI, deliver the exam callout statement directly.
3. **Use the admin center quick reference table** (at the end of the session agenda) as a verbal reference — it lists every key navigation path.
4. **Do not dwell on technical issues** — acknowledge once ("the portal is loading slowly — common in demo environments") and immediately pivot to verbal delivery. Return to the portal if it loads while you are talking.
5. **Screenshots as backup** — if you have a secondary device, pull up screenshots of each key portal screen. A static screenshot of the DSPM for AI dashboard, the agent approval queue, and the DLP connector classification view covers the three most visually important demos.
