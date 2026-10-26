# Build a lab tenant

You don't need a tenant for the live class, because I run every demo on screen. You do
need one to practice afterward, and it has to be a tenant you're allowed to break: every
tutorial changes configuration that real people would feel in production. Back to the
[course home](../README.md).

> **Currency:** I checked this guide against Microsoft Learn on **October 26, 2026**.
> Trial and Developer Program terms change, so confirm on the linked pages before you
> sign up.

## My recommendation

**Start a Microsoft 365 E5 trial.** You don't need a program membership, it includes Microsoft Purview,
and it's the tenant the [tutorials](../TUTORIALS.md) assume. If you already qualify for
the Microsoft 365 Developer Program, its sandbox is a good second choice, because it
lasts longer. Never practice in a production tenant.

| | Microsoft 365 E5 trial | Developer Program sandbox |
| --- | --- | --- |
| Who can get it | No program membership needed | Visual Studio Professional or Enterprise subscribers, eligible Microsoft partners, and Premier or Unified Support customers |
| Licenses | 25, for the trial period | 25, including the admin |
| How long it lasts | 30 days, with 300 GB of pooled storage | Up to 90 days |
| Microsoft 365 Copilot | A paid add-on | A paid add-on, which you can buy only in an instant sandbox issued with commerce enabled |
| What to watch | Most trials convert to a paid subscription unless you turn off recurring billing | Licensed for development use only, so read the terms first |

Sources: [Try or buy a Microsoft 365 for business subscription](https://learn.microsoft.com/microsoft-365/commerce/try-or-buy-microsoft-365),
[Microsoft 365 Developer Program eligibility](https://learn.microsoft.com/office/developer-program/microsoft-365-developer-program#microsoft-365-developer-program-eligibility-overview),
[Set up a developer sandbox](https://learn.microsoft.com/office/developer-program/microsoft-365-developer-program-get-started),
[Developer Program FAQ](https://learn.microsoft.com/office/developer-program/microsoft-365-developer-program-faq).

## Option 1: Microsoft 365 E5 trial

1. Open the [Microsoft 365 E5 trial signup](https://signup.microsoft.com/get-started/signup?products=e77f0fb2-8d0f-46a0-b1ba-6c1b5ba4b1a4)
   and create a new organization with a new admin account. Don't use your work account.
2. Write down the tenant domain (`yourname.onmicrosoft.com`) and keep the admin
   credentials in your password manager.
3. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com), go to
   **Billing > Your products**, and turn off recurring billing if you don't want the
   trial to convert to a paid subscription when it ends.

## Option 2: Microsoft 365 Developer Program sandbox

1. [Join the Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program).
   Visual Studio subscribers [join through their subscription](https://learn.microsoft.com/office/developer-program/join-with-visual-studio).
2. If you qualify, the dashboard shows **Set up E5 subscription**. If it says you don't
   currently qualify, use the E5 trial instead.
3. Choose the **instant sandbox**. It comes with sample users and data, and new instant
   sandboxes can buy add-ons such as Microsoft 365 Copilot. A configurable sandbox can't,
   and an existing sandbox can't be converted later.
4. Setup asks you to link a billing account. That's verification, and you aren't charged
   unless someone buys a paid product.

## Get one Copilot license

Copilot is a paid add-on in both options. The tutorials assume your pilot user has a
Microsoft 365 Copilot license ([tutorial 0, step 4](../TUTORIALS.md#step-4-prepare-the-pilot-user-and-the-fixtures)),
and the data access governance reports need SharePoint Advanced Management, which the
tenant gets once a single user holds that license. Without a license, you can still build and test the starter agent in tutorial 4
with a [Copilot Studio trial](https://copilotstudio.microsoft.com), and you can follow the
rest in the [handouts](../handouts/README.md).

Sources: [Purchase Copilot licenses from a Developer Program sandbox](https://learn.microsoft.com/office/developer-program/purchase-copilot-licenses),
[Data access governance reports](https://learn.microsoft.com/sharepoint/data-access-governance-reports).

## Before you practice

Work through this list once, the day before you start:

- [ ] Sign in to each portal with your lab admin account:
  [Microsoft 365 admin center](https://admin.microsoft.com),
  [Microsoft Purview portal](https://purview.microsoft.com),
  [SharePoint admin center](https://admin.microsoft.com/sharepoint),
  [Copilot Studio](https://copilotstudio.microsoft.com),
  [Power Platform admin center](https://admin.powerplatform.microsoft.com), and
  [Microsoft Entra admin center](https://entra.microsoft.com).
- [ ] Assign the least privileged roles from [tutorial 0, step 3](../TUTORIALS.md#step-3-confirm-the-admin-roles).
  Use Global Administrator only when no smaller role does the job.
- [ ] Create two or three test users, and pick one of them to play Debra, the pilot user.
- [ ] Confirm that at least one SharePoint site exists and opens.
- [ ] Register multifactor authentication for your admin account at
  [aka.ms/mfasetup](https://aka.ms/mfasetup). I find the Microsoft Authenticator app
  the easiest method.
- [ ] Start the slow data access governance report from
  [tutorial 0, step 5](../TUTORIALS.md#step-5-start-the-slow-report-now), because the
  first one can take up to five days.

## Use a separate browser profile

Mixing your lab tenant with your work or personal Microsoft account is the fastest way
to sign in to the wrong place. Create a browser profile just for the lab:

- **Microsoft Edge:** select your profile picture, then **Add profile**. Name it
  `AB-900 Lab`, and don't sign it in to a personal Microsoft account.
- **Google Chrome:** select your profile picture, then **Add**. Name it, and skip the
  Google sign-in.

Sign in to every portal from that profile only, and pin the portal tabs so they're
there the next time you practice.

## When something goes wrong

**"You don't have permission" or "Access denied."** The account is missing the role
for that task, or your sign-in token predates the assignment. In the
[Microsoft Entra admin center](https://entra.microsoft.com), open the user and check
**Assigned roles**. Then sign out of every portal and sign back in.

**SharePoint shows an error in a brand-new tenant.** Provisioning can take a while to
finish. Wait and retry. Creating another tenant won't make it faster.

**Copilot doesn't appear for the pilot user.** Run the Copilot License Details
diagnostic linked from
[Microsoft Copilot requirements](https://learn.microsoft.com/microsoft-365/copilot/microsoft-copilot-requirements#validate-a-users-configuration)
before you change anything else.

**The data access governance report is still running.** That's normal for the first
run. Use [synthetic-sharing-report.csv](../starter-files/synthetic-sharing-report.csv)
in the meantime, as tutorial 3 describes.

**MFA keeps prompting you in a loop.** Open a private window in your lab profile, go to
[aka.ms/mfasetup](https://aka.ms/mfasetup), and finish registering the Authenticator
app. Add a phone number as a backup method.

Questions about the course materials are welcome as
[issues](https://github.com/timothywarner-org/ab900/issues).
