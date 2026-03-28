# Tenant Setup Guide — AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals

**O'Reilly Live Learning Session** | Approximate date: 2026-04-03

---

## 1. Overview

### What you need

A Microsoft 365 tenant where **you are the Global Administrator**. Every segment of this session involves hands-on work in M365 admin centers — Copilot settings, sensitivity labels, Teams policies, agent deployment, and more. Without admin access, you will be watching rather than doing.

### Time to set up

**30–45 minutes** for initial provisioning, plus up to **1 hour of background service propagation** (SharePoint, Teams, Exchange). Set up your tenant at least the evening before the session.

### Why it matters

The AB-900 exam is admin-center-heavy. Every topic maps directly to a configuration experience in the Microsoft 365 admin center or one of its satellite portals. Reading about these settings is not the same as clicking through them — muscle memory in the portals is part of exam readiness.

---

## 2. Option A: Microsoft 365 Developer Program (Best option if you qualify — Free)

The M365 Developer Program gives **qualifying members** a fully featured E5 sandbox tenant at no cost. Eligibility is **not universal** — you must hold one of the following:

- A **Visual Studio Professional or Enterprise** subscription (most individual developers qualify this way — check [https://my.visualstudio.com/benefits](https://my.visualstudio.com/benefits))
- Membership in the **Microsoft AI Cloud Partner Program** (Action Pack, Solutions Partner, etc.)
- An **ISV Success Program** enrollment
- A **Premier or Unified Support** contract

If you do not qualify, use Option B (Business Premium trial) instead — it is more universally accessible.

### What's included

- 25 user licenses (E5)
- Exchange Online, SharePoint Online, Teams, OneDrive
- Microsoft Purview (compliance portal)
- Microsoft Entra ID (Azure AD P2 features)
- Power Platform (Power Automate, Power Apps)
- Intune
- All standard M365 admin centers

> **Important:** The E5 developer sandbox does **not** include Microsoft 365 Copilot licenses. See [Section 6](#6-copilot-license-note) for your options.

### Step-by-step signup

1. Navigate to [https://developer.microsoft.com/microsoft-365/dev-program](https://developer.microsoft.com/microsoft-365/dev-program).
2. Click **Join now**. Sign in with either a personal Microsoft account (Outlook.com, Hotmail, Live) or a work/school Microsoft Entra account. Note: accounts using an `*.onmicrosoft.com` domain are not supported for sign-in. If qualifying through a Visual Studio or partner program membership, use the same account tied to that membership.
3. Complete the profile form:
   - Country/region
   - Company (use your name or "Learning" if personal)
   - Primary focus area: select **Enterprise applications** or **Microsoft Teams**
4. Click **Next**, then select **Set up E5 sandbox**.
5. Choose **Instant sandbox** (recommended — pre-populated with sample users, data, and Teams channels) or **Configurable sandbox** (blank tenant you configure yourself).

   > **Tip:** The instant sandbox saves significant setup time. It includes **25 licensed users** (24 test users + 1 admin), with 16 of those pre-populated with sample identities, email content, and photos. It also includes a pre-provisioned SharePoint intranet and Teams sample data. Use it unless you have a specific reason to start blank.

6. Set your admin username and password. Record these credentials — you will use them throughout the session.
7. Click **Continue**. Azure will provision your tenant. This typically completes in **2–5 minutes**.
8. Note your tenant domain (format: `youradminname.onmicrosoft.com`). This is your primary tenant identifier.

### Verifying your sandbox

After provisioning completes:

1. Navigate to [https://admin.microsoft.com](https://admin.microsoft.com) and sign in with your new admin credentials.
2. Go to **Users > Active users** — you should see 1 (you) or up to 16 users (instant sandbox).
3. Go to **Billing > Your products** — confirm Microsoft 365 E5 Developer (no charge) is listed.

### Renewal

Developer sandbox tenants are valid for 90 days and **auto-renew** as long as your account shows active development activity. Signing into admin centers and configuring settings counts as activity.

---

## 3. Option B: Microsoft 365 Business Premium Trial

If you want to explore Copilot licensing within the trial itself, Business Premium is an alternative.

> **Note:** Business Premium is a smaller SKU than E5 and lacks some compliance features (Purview advanced capabilities, Entra ID P2). For AB-900 coverage, the E5 developer sandbox in Option A provides better parity with exam content.

### Steps

1. Go to [https://www.microsoft.com/microsoft-365/business/compare-all-plans](https://www.microsoft.com/microsoft-365/business/compare-all-plans).
2. Locate **Microsoft 365 Business Premium** and click **Try free for 1 month**.
3. Sign in with a Microsoft account or create a new one.
4. Provide a **credit or debit card** and a phone number for identity verification. A card is required to start the Business Premium trial. Your card will **not** be charged during the 30-day trial period, but the subscription **automatically converts to a paid annual subscription** at the end of the trial unless you cancel recurring billing beforehand.
5. Set up your admin username in the format `admin@yourdomain.onmicrosoft.com`.
6. Complete setup and navigate to [https://admin.microsoft.com](https://admin.microsoft.com).

### Activating a Copilot trial

After your Business Premium tenant is active:

1. In the admin center, go to **Billing > Purchase services**.
2. Search for **Microsoft 365 Copilot**.
3. If a trial SKU is available in your region, select **Start free trial**.
4. Assign the Copilot license to your admin account under **Users > Active users**.

> **Warning:** Trial availability varies by region and changes frequently. Do not rely on a Copilot trial being available. Have a fallback plan (instructor demos) before the session.

---

## 4. Option C: Use an Existing Work or School Tenant

This option carries real risk and is only appropriate in specific circumstances.

### Risks

- **Changes affect real users.** Modifying Teams meeting policies, sensitivity labels, DLP rules, or Copilot settings in a production tenant can impact your colleagues immediately.
- **Policies may conflict.** Your organization's existing configuration may prevent you from completing lab steps (conditional access, MFA requirements, guest access restrictions).
- **Audit trail.** All changes you make are logged. Your organization's compliance team can review them.

### Minimum required permissions

If you proceed with this option, your account must have one of the following:

- **Global Administrator** — full access to all admin centers
- **Compliance Administrator** — required for Purview labs
- **Teams Administrator** — required for Teams policy labs
- **Exchange Administrator** — required for Exchange labs

> **Recommendation:** Only use a work or school tenant if it is a **dedicated test or lab tenant** that is isolated from production users. A tenant used for real business operations is not suitable for this session.

---

## 5. Pre-Session Configuration Checklist

Complete all items below **before the session starts**. Attempting to do this during the session will cause you to fall behind.

### Admin center access

Verify you can sign in to each portal with your admin account:

- [ ] [https://admin.microsoft.com](https://admin.microsoft.com) — Microsoft 365 admin center
- [ ] [https://purview.microsoft.com](https://purview.microsoft.com) — Microsoft Purview compliance portal
- [ ] [https://admin.teams.microsoft.com](https://admin.teams.microsoft.com) — Teams admin center
- [ ] [https://admin.exchange.microsoft.com](https://admin.exchange.microsoft.com) — Exchange admin center
- [ ] [https://entra.microsoft.com](https://entra.microsoft.com) — Microsoft Entra admin center
- [ ] [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) — Power Platform admin center

> **Tip:** Bookmark all six portals now. During the session, you will switch between them frequently. Pre-opening tabs in your dedicated browser profile (see [Section 7](#7-recommended-browser-setup)) saves time.

### Test users and groups

- [ ] At least **2–3 test user accounts** created and licensed
  - In the M365 admin center: **Users > Active users > Add a user**
  - Assign an E5 license to each
  - Use simple names: `testuser1@yourdomain.onmicrosoft.com`, etc.
- [ ] At least **one security group** created
  - In the M365 admin center: **Teams & groups > Active teams & groups > Add a group**
  - Type: **Security**
  - Add your test users as members

### SharePoint

- [ ] SharePoint Online is accessible at `https://yourdomain.sharepoint.com`
- [ ] At least one SharePoint site exists (the instant sandbox includes several; a configurable sandbox may need a site created manually)

> **Warning:** SharePoint provisioning can take up to **1 hour** after a new tenant is created. If SharePoint shows an error immediately after setup, wait and try again before the session. Do not skip this check.

### Copilot readiness

- [ ] Either a Microsoft 365 Copilot license is assigned to your admin account, **or** you have confirmed you will follow instructor demos for Copilot-specific segments (see [Section 6](#6-copilot-license-note))

### MFA

- [ ] Multi-factor authentication is fully configured for your admin account
  - Sign in to [https://aka.ms/mfasetup](https://aka.ms/mfasetup) and complete setup
  - Use the Microsoft Authenticator app if possible

---

## 6. Copilot License Note

This is the most common point of confusion for learners using the M365 Developer sandbox.

### The issue

The **Microsoft 365 E5 Developer sandbox does not include Microsoft 365 Copilot licenses**. Copilot is a paid add-on even in commercial E5 tenants. Developer sandbox tenants are explicitly excluded from Copilot licensing.

### Your options

**Option 1 — Follow instructor demos (works for everyone)**
Copilot-specific labs (assigning Copilot licenses, configuring Copilot settings pages, reviewing Copilot usage reports) will be demonstrated live by the instructor. You can follow the configuration logic and exam relevance without having the license yourself. This is a fully valid approach for passing AB-900.

**Option 2 — Use a commercial tenant with Copilot**
If your organization has Microsoft 365 Copilot deployed and you have a non-production test tenant or permission to use a sandbox environment, you can use that tenant for Copilot-specific segments. Keep it isolated from production users.

**Option 3 — Check for a trial SKU**
Microsoft occasionally makes Copilot trial licenses available through the admin center.

1. In your M365 admin center, go to **Billing > Purchase services**.
2. Search for **Microsoft 365 Copilot**.
3. If a trial appears, you can activate it for 30 days at no cost.

> **Important:** Trial availability is not guaranteed. Check at least 48 hours before the session so you have time to adjust your plan if the trial is not available.

---

## 7. Recommended Browser Setup

Mixing your session tenant with personal Microsoft accounts is a common source of confusion and authentication errors. Isolate it with a dedicated browser profile.

### Setting up a dedicated profile

**Microsoft Edge:**
1. Click the profile icon (top right) > **Add profile**.
2. Name it something clear: `AB-900 Lab` or `Dev Tenant`.
3. Do **not** sign the profile into a personal Microsoft account.
4. Sign in to all admin portals within this profile only.

**Google Chrome:**
1. Click the profile icon (top right) > **Add**.
2. Name the profile and skip the sign-in to Google.
3. Use this profile exclusively for your session tenant.

### Pre-open admin center tabs

Before the session starts, open these tabs in your dedicated profile:

1. [https://admin.microsoft.com](https://admin.microsoft.com)
2. [https://purview.microsoft.com](https://purview.microsoft.com)
3. [https://admin.teams.microsoft.com](https://admin.teams.microsoft.com)
4. [https://admin.exchange.microsoft.com](https://admin.exchange.microsoft.com)
5. [https://entra.microsoft.com](https://entra.microsoft.com)
6. [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com)

Sign in to each portal and leave the tabs open. This eliminates sign-in delays when the instructor moves between portals.

> **Tip:** Group the tabs into an Edge tab group or a Chrome tab group labeled "M365 Admin" for quick switching.

---

## 8. Troubleshooting Common Issues

### "You don't have permission" or "Access denied"

**Cause:** Your account does not have the Global Administrator role, or role propagation has not completed.

**Fix:**
1. Sign in to [https://entra.microsoft.com](https://entra.microsoft.com).
2. Go to **Identity > Users > All users** and select your admin account.
3. Select **Assigned roles** and confirm **Global Administrator** is listed.
4. If it is not, go to **Roles & admins > All roles**, find **Global Administrator**, and add your account.
5. Sign out and sign back in to all portals to pick up the updated token.

---

### SharePoint is not accessible or shows a provisioning error

**Cause:** SharePoint Online takes up to 1 hour to fully provision in a new tenant. The admin center shows it as active before it is fully ready.

**Fix:** Wait. There is no action to take. If your tenant was created less than an hour ago, check again in 15–30 minutes. Do not recreate the tenant — this will not speed up provisioning.

---

### Teams admin center shows no policies or "no data available"

**Cause:** This is normal for a new tenant. Default global policies exist but are not shown as custom entries. Teams policy data can take **24–48 hours** to fully appear.

**Fix:** No action needed. The global (org-wide default) policies apply to all users even when not listed explicitly. You can still create and assign custom policies during the session.

---

### MFA prompt loops or authentication keeps failing

**Cause:** MFA setup is incomplete or the authenticator app is not registered for your admin account.

**Fix:**
1. Open a private/incognito window in your dedicated browser profile.
2. Navigate to [https://aka.ms/mfasetup](https://aka.ms/mfasetup).
3. Sign in with your admin credentials and complete the MFA registration flow.
4. Use the **Microsoft Authenticator app** as the primary method — it is the most reliable option.
5. As a backup, register a phone number for SMS verification.

Complete this before the session. An MFA prompt loop during a live session is difficult to resolve quickly.

---

### Developer program sandbox shows "expired" after less than 90 days

**Cause:** Microsoft may not detect sufficient developer activity on the tenant.

**Fix:**
1. Sign in to [https://developer.microsoft.com/microsoft-365/dev-program](https://developer.microsoft.com/microsoft-365/dev-program) with the personal Microsoft account you used to register.
2. Check the dashboard for renewal options.
3. If expired, you can set up a new sandbox — provisioning is fast.

> **Note:** For this session, your sandbox only needs to be active through **2026-04-03**. If you set it up in the week before, a fresh sandbox will be well within its 90-day window.

---

## Quick Reference

| Portal | URL |
|---|---|
| Microsoft 365 admin center | https://admin.microsoft.com |
| Microsoft Purview | https://purview.microsoft.com |
| Teams admin center | https://admin.teams.microsoft.com |
| Exchange admin center | https://admin.exchange.microsoft.com |
| Microsoft Entra | https://entra.microsoft.com |
| Power Platform admin center | https://admin.powerplatform.microsoft.com |
| M365 Developer Program | https://developer.microsoft.com/microsoft-365/dev-program |
| MFA setup | https://aka.ms/mfasetup |

---

*Questions before the session? Post in the O'Reilly course Q&A forum or reach out to the instructor through the course platform.*
