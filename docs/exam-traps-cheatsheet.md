# AB-900 Exam Traps Cheat Sheet
**Review this in the 30 minutes before your exam. Every line earns its place.**

---

## 1. Portal Quick-Reference (Where Things Live)

| Task | Portal | Exact Path |
|------|--------|------------|
| Sensitivity labels | purview.microsoft.com | Information protection > Labels |
| DLP policies | purview.microsoft.com | Data loss prevention > Policies |
| DSPM for AI | purview.microsoft.com | Solutions > DSPM for AI (classic) |
| Insider Risk Management | purview.microsoft.com | Insider risk management |
| Communication Compliance | purview.microsoft.com | Communication compliance |
| Compliance Manager | purview.microsoft.com | Compliance Manager |
| Content Explorer | purview.microsoft.com | Data classification > Content explorer |
| Activity Explorer | purview.microsoft.com | Data classification > Activity explorer |
| Data Lifecycle Management | purview.microsoft.com | Data lifecycle management |
| Copilot settings (tenant-wide) | admin.microsoft.com | Settings > Microsoft 365 Copilot |
| Agent approval queue | admin.microsoft.com | Agents > All agents > Requests |
| Copilot billing / PAYG | admin.microsoft.com | Copilot > Billing & usage |
| Copilot Dashboard | insights.viva.cloud.microsoft | Copilot Dashboard |
| PIM | entra.microsoft.com | Identity governance > Privileged Identity Management |
| Conditional Access | entra.microsoft.com | Protection > Conditional access |
| SharePoint oversharing reports | SharePoint admin center | Reports > Data access governance |
| Power Platform DLP | admin.powerplatform.microsoft.com | Policies > Data policies |
| Teams app governance | admin.teams.microsoft.com | Teams apps > Manage apps |

> **Portal rename trap:** `compliance.microsoft.com` is being retired. The correct portal is **purview.microsoft.com**.

---

## 2. The Most Common Wrong Answers

| If the question says... | Don't pick this... | Pick this instead |
|-------------------------|--------------------|-------------------|
| Configure compliance or data protection | compliance.microsoft.com | **purview.microsoft.com** |
| Investigate AI-specific oversharing risk | Content Explorer | **DSPM for AI** |
| Who should manage Copilot compliance policies? | Global Administrator | **Compliance Administrator** (least privilege) |
| Disable all agents, including Researcher and Analyst | Toggle off the agents setting | **Separately block Researcher and Analyst** — they are NOT disabled by the general agent toggle |
| Find Copilot pay-as-you-go billing | Billing > Billing policies | **admin.microsoft.com > Copilot > Billing & usage** |
| Primary queue for agent approval requests | Teams admin center | **M365 admin center > Agents > All agents > Requests** |
| User assigned a Copilot license — are they ready? | Yes, immediately | **No — up to 24-hour activation delay** |
| Researcher and Analyst are the same | True | **False — different tools with different capabilities** |
| Block a specific 3rd-party agent in Teams | M365 admin center | **Teams admin center > Teams apps > Manage apps** |
| Copilot Studio billing unit | Tokens / messages | **Copilot Credits** |

---

## 3. The Six Domain 2 Purview Tools — What Each One Does

| Tool | What it does | When exam uses it |
|------|--------------|-------------------|
| **Sensitivity labels** | Tag and protect content (encrypt, restrict sharing) | Protecting documents and emails at rest and in transit |
| **DLP policies** | Detect and block sharing of sensitive data types | Preventing accidental data leaks via email, Teams, SharePoint |
| **Insider Risk Management** | Correlate signals to detect risky user behavior | Departing employee data theft, policy violations |
| **Communication Compliance** | Monitor messages for regulatory/policy violations | Reviewing Teams/email for harassment, compliance |
| **DSPM for AI** | AI-specific risk: oversharing, sensitive prompts, risky users | Auditing what users are sending to Copilot |
| **Compliance Manager** | Score and track compliance posture against frameworks | GDPR/ISO readiness, improvement actions |
| **Content Explorer** | Browse labeled/sensitive content across tenant | Finding where sensitive data lives (not AI-specific) |
| **Activity Explorer** | Audit label and DLP activity over time | Investigating when/how a label was applied or removed |
| **Data Lifecycle Management** | Retention policies and records management | Auto-deleting or retaining content per policy |

---

## 4. Licensing Model Comparison

| Model | Who needs it | Billed how | Configured where |
|-------|-------------|------------|-----------------|
| **M365 Copilot subscription** | Users who need full Copilot in M365 apps | Per user / per month (assigned seat) | admin.microsoft.com > Licenses |
| **Copilot pay-as-you-go (PAYG)** | Orgs wanting metered usage without assigned seats | Per message / consumption | admin.microsoft.com > Copilot > Billing & usage |
| **Copilot Studio subscription** | Orgs building custom agents at scale | Per tenant / per month capacity | Microsoft 365 admin center or PPAC |
| **Copilot Studio PAYG** | Low-volume or trial agent builds | Per Copilot Credit consumed | admin.powerplatform.microsoft.com |
| **SharePoint agents** | Users with M365 Copilot license | Included with Copilot license | SharePoint site > Copilot |

---

## 5. Agent Taxonomy — Know the Difference

| Type | Built with | Deployed through | Admin approval required? | Disabled by agent toggle? |
|------|-----------|-----------------|--------------------------|--------------------------|
| **Declarative agent** | Copilot Studio (no-code) or VS Code | Teams / M365 app catalog | Yes (admin.microsoft.com > Agents) | Yes |
| **Custom engine agent** | Azure Bot Framework / custom code | Teams app catalog | Yes (Teams admin center) | No (separate Teams app policy) |
| **SharePoint agent** | SharePoint (site-scoped) | SharePoint site only | No — inherits SharePoint permissions | Yes |
| **Researcher** | Microsoft built-in | Copilot Chat | No | **No — requires separate block** |
| **Analyst** | Microsoft built-in | Copilot Chat (Excel/data) | No | **No — requires separate block** |

**Researcher vs. Analyst distinction:**
- **Researcher** = deep research + live web search + file analysis. Think: synthesizing across many sources.
- **Analyst** = structured data analysis in Excel and datasets. Think: running calculations, building charts.

---

## 6. Zero Trust + Entra ID — Key Exam Concepts

- **PIM eligible vs. active:** Eligible = user can activate a role when needed; Active = role is always on. Eligible is the Zero Trust default — minimizes standing access.
- **Conditional Access IF/THEN logic:** IF (user + app + condition) THEN (grant/block/require MFA). Policies are evaluated at sign-in, not at license assignment.
- **Identity Secure Score:** Measures how well your tenant follows identity best practices. Higher = better posture. Found in Entra ID > Overview.
- **MFA methods:** TOTP (authenticator app time-based codes), FIDO2 (phishing-resistant hardware keys), passwordless (Windows Hello, phone sign-in). FIDO2 is the most phishing-resistant.
- **App registrations vs. Enterprise apps:** App registration = developer-facing, defines what the app IS. Enterprise app = admin-facing, defines how the app is used/governed in YOUR tenant.
- **Zero Trust three pillars:** Verify explicitly (always authenticate/authorize), Use least privilege access (JIT/JEA), Assume breach (segment access, monitor continuously).

---

## 7. Numbers to Know

| Fact | Value | Notes |
|------|-------|-------|
| **Passing score** | 700 / 1000 | Scaled score; not 70% of raw questions |
| **Copilot license activation delay** | Up to 24 hours | User may not see Copilot immediately after license assignment |
| **M365 Dev sandbox users** | 25 total | 24 test users + 1 global admin |
| **Dev sandbox validity** | 90 days | Auto-renews with active developer activity; expires if inactive |
| **Copilot Studio billing unit** | Copilot Credits | Not tokens, not messages — Credits |
| **Minimum Copilot license requirement** | M365 E3 or E5 base | Copilot add-on requires qualifying M365/O365 subscription |

---

## Quick-Fire Rules (Read Twice)

- **Oversharing + AI risk = DSPM for AI**, not Content Explorer, not DLP.
- **Least privilege beats Global Admin** on every question about who should perform a task.
- **Researcher and Analyst survive the agent toggle** — you must block them separately.
- **Billing questions = admin.microsoft.com > Copilot > Billing & usage**, never Billing > Billing policies.
- **Agent approval requests live in M365 admin center**, not Teams admin center.
- **purview.microsoft.com is the answer** any time you see compliance.microsoft.com as an option.
- **Conditional Access is Entra**, not Purview, not admin.microsoft.com.
- **SharePoint oversharing = SharePoint admin center > Reports > Data access governance**.

---

*AB-900 | Microsoft 365 Copilot and Agent Administration Fundamentals | Cheat sheet updated 2026-03*
