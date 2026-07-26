# Microsoft 365 Copilot Licensing Guide

A straightforward guide to what you can and cannot do with Microsoft 365 Copilot licensing, current as of July 2026.

**Last updated:** 2026-07-26

---

## Quick Overview

| Capability | Copilot Chat only (no Copilot license) | Microsoft 365 Copilot license |
|------------|----------------------------------------|-------------------------------|
| Microsoft 365 apps (Word, Excel, and so on) | Yes | Yes |
| Web-based chat with enterprise data protection | Yes | Yes |
| Work-based chat grounded in tenant data | No | Yes |
| Copilot embedded in Word, Excel, PowerPoint, Outlook, Teams | No | Yes |
| Researcher and Analyst | No | Yes |
| Agents from the Agent Store that cost nothing extra | Yes, if the admin enables them | Yes |
| Agents grounded in organizational data | Billed via pay-as-you-go | Included, subject to fair use |

---

## The three ways to pay for Copilot

Microsoft sells Copilot capability three different ways. The exam expects you to tell them apart.

### 1. Microsoft 365 Copilot (enterprise add-on)

- **Price:** 30.00 USD per user per month (annual billing)
- **Model:** Per-user subscription add-on
- **Prerequisite:** An eligible Microsoft 365 or Office 365 base subscription
- **Seat minimum:** **NONE.** Microsoft removed the original 300-seat minimum in January 2024 and dropped the Microsoft 365 prerequisite at the same time, which made Office 365 E3 and E5 customers eligible.

Eligible base plans include Microsoft 365 E7, E5, E3, F1, F3, Business Basic, Business Standard, Business Premium, Microsoft 365 Apps for business and enterprise, Office 365 E5, E3, E1, and F3, Teams Essentials and Enterprise, Exchange Kiosk and Plan 1 and Plan 2, SharePoint Kiosk and Plan 1 and Plan 2, OneDrive for work and school Plan 1 and Plan 2, Microsoft Planner Plan 1, Project Plan 3 and Plan 5, Project Online Essentials, Visio Plan 1 and Plan 2, and Microsoft Clipchamp.

### 2. Microsoft 365 Copilot Business (SMB add-on)

- **List price:** 21.00 USD per user per month. As of July 1, 2026 it is available at 18 USD per user per month under a 15 percent promotion extended through December 2026, with no license minimum.
- **Seat maximum:** **300 per tenant.** Microsoft defines the SMB customer for this SKU as an organization with 300 or fewer users.
- **Prerequisite:** Microsoft 365 Business Basic, Business Standard, Business Premium, or Microsoft 365 Apps for Business
- **Commitment:** Annual only, billed monthly or annually. There is **NO** month-to-month purchasing agreement.
- **Feature set:** Microsoft states Copilot Business "delivers the same capabilities as the Microsoft 365 Copilot offering." The difference is price point and eligibility, not features.

Migration note: existing Microsoft 365 Copilot add-on customers cannot switch those licenses to Copilot Business until their annual commitment ends, and licenses do **NOT** auto-convert at renewal.

Two bundled SKUs also became generally available July 1, 2026, both capped at 300 licenses on annual subscription with annual billing:

| SKU | Price per user per month |
|-----|--------------------------|
| Microsoft 365 Business Standard with Copilot | 23.50 USD |
| Microsoft 365 Business Premium with Copilot | 32 USD |

### 3. Pay-as-you-go (consumption)

Pay-as-you-go bills actual usage rather than assigning a seat. It is the right answer for occasional users. See the Copilot Credits section below.

---

## Microsoft 365 E7, the newest wrinkle

**Microsoft 365 E7**, marketed as the Frontier Suite, became generally available **May 1, 2026**. It equals Microsoft 365 E5 plus Microsoft 365 Copilot plus Microsoft Entra Suite plus Agent 365, in a single SKU. Microsoft Learn describes E7 as a strict superset of E5: it only adds capabilities, never removes them.

**E7 customers do NOT buy the Copilot add-on separately.** Any licensing slide that stops at E5 is now incomplete.

---

## Microsoft 365 Copilot Chat, the free tier

Copilot Chat is included at no additional cost for organizations with an eligible Microsoft 365 subscription. Users sign in with a Microsoft Entra work or school account to get enterprise data protection.

Copilot Chat has two modes with different entitlements, and this distinction is testable:

| Mode | What it grounds on | Entitlement |
|------|--------------------|-------------|
| **Web-based chat** | Internet results | Included free with an eligible Microsoft 365 subscription |
| **Work-based chat** | Results the Entra account can access | Requires a Microsoft 365 Copilot license |

Note the current terminology. Microsoft says **enterprise data protection** and **Microsoft 365 Copilot Chat**. The older phrasing "Copilot with commercial data protection" survives only in pre-2025 material.

---

## Copilot Credits and pay-as-you-go

### The unit changed

The unit of consumption is now the **Copilot Credit**, not the message. Microsoft Learn states it plainly: "Copilot Credits are the unit of consumption in Microsoft 365 Copilot Chat and SharePoint agents for AI interactions."

**Rate: 0.01 USD per Copilot Credit.**

<!-- VERIFY before stating on stage: Microsoft's own documentation is inconsistent here. The Copilot Studio billing-rates page and the Power Platform pay-as-you-go meters page both use Copilot Credits, and the Microsoft 365 admin center report is literally named "Credits". But the Microsoft 365 Copilot pay-as-you-go Meters page has NOT been updated and still reads "$0.01 per message" with the meter named "Copilot Studio". The dollar figure matches; the unit noun does not. Safe phrasing: the unit is the Copilot Credit at $0.01 per credit, the Azure invoice meter is still named Copilot Studio, and some Learn pages still say per message. -->

The dollar figure did not change, so old slides are not numerically wrong. The **unit noun** is what is stale. Do **NOT** assert that one message equals one credit; consumption is per-feature and ranges from 1 to 100 credits.

### Consumption rates

| Feature | Credits |
|---------|---------|
| Classic answer | 1 |
| Generative answer | 2 |
| Agent action | 5 |
| Tenant graph grounding | 10 |
| Agent flow actions | 13 per 100 actions |
| Content processing tools | 8 per page |
| Text and generative AI tools, basic | 1 per 10 responses |
| Text and generative AI tools, standard | 15 per 10 responses |
| Text and generative AI tools, premium | 100 per 10 responses |

**Licensed users incur no charge** for classic answers, generative answers, agent actions, tenant graph grounding, agent flow actions, and AI tools in employee-facing scenarios, subject to fair usage limits. Pay-as-you-go credits are consumed by **unlicensed** users.

### The SharePoint agent math worth memorizing

SharePoint agents are always grounded in the tenant graph. So a single complex prompt from an **unlicensed** user costs a generative answer (2 credits) plus tenant graph grounding (10 credits) equals **12 credits**, or 0.12 USD. Not 1 message at 0.01 USD.

### Prepaid capacity packs

- **200.00 USD per pack per month** for **25,000 Copilot Credits**
- Credits replenish at the start of every monthly billing period
- Consumed **first**, before any pay-as-you-go billing applies
- Microsoft calls these **capacity packs**, not message packs

### Copilot credit policies, a newer construct

There are three distinct billing constructs for Copilot Chat:

1. A **Copilot credit policy** (prepaid packs only, **NO** Azure subscription required, up to 10 per tenant)
2. A **pay-as-you-go billing policy** (per-credit billing to Azure, up to 50 per tenant)
3. The two paired, for automatic overage handling

Copilot credit policies are currently available **ONLY** for Microsoft 365 Copilot Chat. For SharePoint agents, administrators must continue using pay-as-you-go billing.

### The Copilot Credit Pre-Purchase Plan

A third purchase model exists, bought in the Azure portal under **Reservations** as **Copilot Credit Pre-Purchase Plan**. It uses Copilot Credit Commit Units over a one-year term at tiered discounts. Cancellations and exchanges are **NOT** supported.

---

## Setting up pay-as-you-go billing

**The path is Microsoft 365 admin center (admin.microsoft.com) > Copilot > Billing & usage.** The **Billing policies** tab holds the policies; the **Pay-as-you-go services** tab connects them to services.

An alternate route to the same destination: **Copilot** > **Settings** > **User access** > **Copilot pay-as-you-go billing**.

**Do NOT use Billing > Billing policies for Copilot.** That Billing node covers Microsoft 365 Backup, Microsoft 365 SharePoint Storage, and High Volume Email. For Copilot it only surfaces a "Go to Copilot Billing & usage" redirect link.

### Prerequisites

- Billing Administrator, AI Administrator, or Global Administrator role
- An Azure subscription in the same tenant as Microsoft 365
- An Azure resource group in that subscription
- Owner or Contributor rights to both
- At least one SharePoint license, or a license that includes SharePoint, in the tenant

### The four setup steps

1. Create a billing policy and add billing details (name, Azure subscription, resource group, region, accept terms of service)
2. Choose users (**All users** or a **Specific group**)
3. Set an optional budget
4. Review and select **Create policy**

### Services available for pay-as-you-go

- Microsoft 365 Copilot Chat
- SharePoint agents
- Microsoft Copilot Retrieval API (in preview, billed at 0.10 USD per API call rather than per credit)

### Two traps in this area

**Budget trap.** A budget on a pay-as-you-go billing policy triggers **email notifications only**. Microsoft states the system does not enforce the budget or prevent the organization from exceeding it, and usage continues uninterrupted past the budget. The default alert threshold is 100 percent, and alerts can take up to 24 hours to arrive.

**SharePoint migration trap.** SharePoint agent pay-as-you-go policies previously configured under **Org settings** > **Pay-as-you-go services** must be disconnected there (select **SharePoint agents**, then **Disconnect previous billing**) before a new Copilot-node billing policy can be linked. For SharePoint agents you can create up to 10 billing policies, each assigned **one** security group.

### Policy limits

| Limit | Value |
|-------|-------|
| Pay-as-you-go billing policies per tenant | 50 |
| Copilot credit policies per tenant | 10 |
| SharePoint agent billing policies | 10, one security group each |

---

## Which model for which user

The cost-optimization answer the exam wants is usually a **hybrid**:

- **Heavy daily users:** per-user Microsoft 365 Copilot subscription. A flat monthly rate beats metered consumption once usage is routine.
- **Occasional users:** pay-as-you-go enabled at the organization or billing-policy level. You pay only for actual usage, and users are not pre-assigned.

Note the mechanics carefully. You do **NOT** purchase "pay-as-you-go licenses" for named individuals. Pay-as-you-go is a **billing model** enabled through a policy, not a license object assigned to a user.

---

## What you can do without a Copilot license

- Use all standard Microsoft 365 applications
- Use Microsoft 365 Copilot Chat in web-based mode with enterprise data protection
- Use agents from the Agent Store that cost nothing extra, if the admin has enabled them
- Use agents grounded in organizational data, if the organization has configured pay-as-you-go billing
- Use the Word, Excel, and PowerPoint Agents, which Microsoft installs for both Copilot Chat users and licensed users

## What you cannot do without a Copilot license

- Use Copilot embedded in Word, Excel, PowerPoint, Outlook, and Teams
- Use work-based chat grounded in tenant data
- Use **Researcher** and **Analyst**, which require a Microsoft 365 Copilot license and have no separate add-on
- Use Copilot to summarize meetings in Teams or draft email in Outlook

---

## License assignment

### How to assign

1. **Microsoft 365 admin center** -- individual or bulk assignment at **Users** > **Active users** > select user > **Licenses and apps**
2. **Group-based licensing** -- assign via Microsoft Entra ID groups
3. **PowerShell** -- automated assignment at scale using the Microsoft Graph PowerShell SDK. See `shared-resources/scripts/Assign-CopilotLicenses.ps1`.

The Copilot SKU string ID in the licensing service plan reference is `Microsoft_365_Copilot`. Confirm the exact `SkuPartNumber` in your own tenant with `Get-MgSubscribedSku` before scripting against it; tenants can carry more than one Copilot-family SKU.

### Who should get a license

**High priority:**
- Knowledge workers who create documents frequently
- Managers and executives who need meeting summaries
- Teams that handle large volumes of email
- Employees who analyze data in Excel

**Consider pay-as-you-go instead:**
- Frontline workers with limited desktop app usage
- Users who work primarily on mobile devices
- Temporary or seasonal employees
- Anyone whose expected usage is a few interactions per month

---

## Monitoring usage and cost

| Report | Path |
|--------|------|
| Microsoft 365 Copilot usage | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Copilot** > **Usage** tab |
| Copilot Credits | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Credits** |
| Copilot Dashboard | Viva Insights (in Teams or the web app) > **Copilot Dashboard** |
| Agent usage | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Agents** |

Usage report data is typically available within 48 hours of the end of a day in UTC. The Credits report alerts administrators when a user exceeds 2,000 credits; during preview it shows a maximum of 30 days of history and has no data before May 3, 2025.

**Reporting trap.** Microsoft explicitly warns that Purview audit log data is **NOT** intended as the basis for Copilot usage reporting. Aggregated metrics built on it may not match the official reports.

---

## Compliance and data considerations

| Concern | How Copilot handles it |
|---------|------------------------|
| Data residency | Respects Microsoft 365 data boundaries |
| Data access | Only accesses data the user already has permission to view, with no permission elevation |
| Audit logging | Prompts and responses captured in the unified audit log as part of Audit (Standard), viewed at purview.microsoft.com > **Audit** |
| Retention | Follows Data Lifecycle Management retention policies; conflicts resolve to the longest duration |
| Model training | No customer data is used to train the foundation models |

Audit billing note: audit logs for **non-Microsoft** AI applications use pay-as-you-go billing and are retained 180 days. All Microsoft applications, including Microsoft 365 Copilot, are included in Audit (Standard) at no extra charge.

---

## Common licensing questions

### Can users share a Copilot license?
No. Licenses are assigned per user and cannot be shared or used concurrently.

### What happens when a license is removed?
The user loses access to Copilot features but retains access to all Microsoft 365 apps and data.

### Can guests use Copilot?
External guests cannot consume your organization's Copilot licenses. They need their own.

### Do I need additional licenses for Copilot Studio?
Copilot Studio agents consume Copilot Credits. Prepaid capacity packs cost 200.00 USD per pack per month for 25,000 credits, or you can bill consumption to Azure via pay-as-you-go.

### Is there a seat minimum?
No. The 300-seat minimum was removed in January 2024. The only surviving 300 is a **maximum** on Copilot Business and the Business-with-Copilot SKUs.

### Does Microsoft 365 E5 include Copilot?
No. E5 requires the Copilot add-on. **Microsoft 365 E7 does include it** in the base SKU.

---

## Summary Table

| Scenario | What to buy | Model |
|----------|-------------|-------|
| Enterprise employee using Copilot daily in Teams and Office | Microsoft 365 Copilot add-on | Per-user subscription, 30 USD per user per month annual |
| Organization of 300 or fewer on a Business plan | Microsoft 365 Copilot Business | Per-user subscription, annual commitment, 300-seat cap |
| Organization wanting E5 plus Copilot plus Agent 365 in one SKU | Microsoft 365 E7 | Per-user subscription, Copilot included |
| Occasional users, unpredictable volume | Pay-as-you-go billing policy | 0.01 USD per Copilot Credit |
| Predictable agent volume, no Azure subscription | Prepaid capacity pack plus Copilot credit policy | 200 USD per 25,000 credits per month |
| Large committed credit spend | Copilot Credit Pre-Purchase Plan | Azure reservation, one-year term, tiered discount |
| Basic Microsoft 365 usage with free chat | Existing Microsoft 365 subscription | Copilot Chat included at no additional cost |

---

## Additional Resources

- [Microsoft 365 Copilot licensing](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing)
- [Microsoft 365 Copilot Business FAQ](https://learn.microsoft.com/microsoft-365/copilot/copilot-business-faq)
- [Copilot license and feature overview](https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-license-feature-overview)
- [Set up pay-as-you-go for Copilot](https://learn.microsoft.com/microsoft-365/commerce/services/pay-as-you-go-setup-copilot)
- [Copilot pay-as-you-go overview](https://learn.microsoft.com/microsoft-365/copilot/pay-as-you-go/overview)
- [Copilot capacity packs and credit policies](https://learn.microsoft.com/microsoft-365/copilot/pay-as-you-go/copilot-capacity-packs)
- [Copilot Studio billing rates](https://learn.microsoft.com/microsoft-copilot-studio/requirements-messages-management)
- [SharePoint agents Azure billing](https://learn.microsoft.com/sharepoint/sharepoint-agents-azure-billing)
- [Microsoft 365 Copilot usage report](https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-usage)
- [Copilot Credits report](https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-credits)
