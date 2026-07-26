# AB-900 Live Session Plan

**Platform:** O'Reilly Live Learning (ON24)
**Duration:** 4 x 50 min segments, 10-min breaks between
**Exam:** AB-900 -- Microsoft 365 Copilot and Agent Administration Fundamentals

## Exam Domain Weights (keep visible while teaching)

| Domain | Weight |
|--------|--------|
| 1 -- Core features and objects of M365 services | 30-35% |
| 2 -- Data protection and governance for M365 and Copilot | **35-40%** |
| 3 -- Basic admin tasks for Copilot and agents | 25-30% |

---

## Segment 1: Microsoft 365 Copilot (50 min)

*Lead with the thing everyone came to learn about.*

- What Copilot actually is -- NOT a standalone app, embedded in Word/Excel/PowerPoint/Outlook/Teams
- Architecture: Microsoft Graph + Work IQ + LLMs (Azure OpenAI) + Orchestration Service
- The 5-step orchestration: prompt intake > evaluation > enrichment > execution > formatting
- Grounded prompting -- user prompt enriched with Graph data before hitting the LLM
- Semantic index -- meaning-based retrieval, not keyword matching
- **Key security point:** Copilot can only see what the user can already see (Graph enforces permissions)
- Data never leaves the tenant; never used to retrain public models
- Copilot in each app: Word (draft/summarize), Excel (formulas/charts via NL), PowerPoint (outline to deck), Outlook (thread summary/draft), Teams (meeting recap + action items)
- Copilot Chat -- cross-app search, multi-meeting summaries, tenant-wide queries
- Responsible AI: data minimization, transparency (source references), content filtering, auditability
- Licensing overview: Free Copilot Chat (web only) vs. M365 Copilot Business (300 cap) vs. Enterprise (E3/E5)
- Monthly per-user vs. pay-as-you-go -- when to use which
- **Demo:** Copilot in action across apps (show Graph grounding, source references)

---

## Segment 2: Copilot Agents + Copilot Studio (50 min)

*Agents are the exam's "new hotness" -- combine with Copilot Studio lite experience since that is the testable creation path.*

- What agents are -- intelligent software that automates tasks, answers questions, acts on user intent
- 4 agent types: prebuilt (Researcher, Analyst, Writing Coach), SharePoint site agents, everyday-user agents, advanced agents
- Prebuilt agent use cases: Researcher (semantic search + reports), Analyst (data analysis + Python)
- **Researcher and Analyst require separate admin block -- NOT governed by general agent on/off toggle**
- Copilot vs. agents comparison: reactive/assistive vs. autonomous/customizable; user permissions vs. service accounts
- Creating a Copilot Chat agent (Copilot Studio lite):
  - Describe tab (plain language) vs. Configure tab (manual)
  - Knowledge sources (up to 20): files, SharePoint, web, Copilot connectors
  - Capabilities: Code Interpreter, Image Generator (both off by default)
  - Starter prompts (unlimited in Copilot Chat)
- Creating a SharePoint agent:
  - 4 entry points: site homepage, library command bar, file context menu, chat pane
  - 3 tabs: Overview, Sources (up to 20), Behavior
  - Key diffs: welcome message (yes), starter prompts (max 3), no Code Interpreter, no Image Generator
- Testing and editing agents
- Agent approval: 3-stage process (submission > review > decision)
  - Portal path: **admin.microsoft.com > Copilot > Agents > Requested agents tab**
- Agent lifecycle: create > approve > deploy > maintain > block/remove
- Agent licensing buckets: free (declarative), licensed (Copilot Studio), consumption-billed (PAYG)
- **Demo:** Create a Copilot Chat agent and a SharePoint agent side by side

---

## Segment 3: Data Protection and Governance (50 min)

*Heaviest exam domain at 35-40%. Give it the time it deserves.*

- Microsoft Purview -- the unified portal (purview.microsoft.com)
- Information Protection: sensitivity labels (encrypt, restrict, watermark); labels travel with the data
- Data classification: SITs (regex + checksums), trainable classifiers (50+ samples), Exact Data Match
- DLP: block/warn/justify across email, chat, files, devices, Copilot interactions
  - Device-level enforcement via Defender for Endpoint
- Insider Risk Management: behavioral analytics + HR signals; mass download detection, personal email sharing
- Communication Compliance: monitors email/Teams/Yammer/Copilot prompts; ML classifiers
- DSPM for AI: **purview.microsoft.com > Solutions > DSPM for AI (classic)**
  - Shadow AI detection, AI activity monitoring, oversharing assessments
- Compliance Manager: compliance score, assessments (GDPR, HIPAA, ISO 27001), improvement actions
- Data Explorer: find where sensitive data lives before setting policies
- eDiscovery: Standard (search + hold) vs. Premium (case management + analytics + redaction)
- Retention: labels (per-item) vs. policies (location-wide); auto-apply rules
- How Copilot accesses data through Graph:
  - Semantic index, OAuth tokens, user-scoped permissions
  - Purview labels and DLP enforced on Copilot responses
  - All Copilot interactions logged and auditable
- SharePoint oversharing: DAG reports in SharePoint admin center; SharePoint Advanced Management (paid add-on)
- **Demo:** Purview portal walkthrough -- sensitivity labels, DLP policy, DSPM for AI, Compliance Manager

---

## Segment 4: M365 Admin, Identity, and Security (50 min)

*Tie it all together with the admin center, identity stack, and exam prep.*

- Microsoft 365 admin center (admin.microsoft.com): dashboard, users, groups, billing, reports, service health
- Core services config: Exchange (mailboxes, shared mailboxes, transport rules), SharePoint (sites, libraries, permissions), Teams (channels, policies, apps)
- Copilot admin tasks:
  - Assign licenses: individual vs. group-based
  - PAYG billing 2-step: create billing policy > connect to Copilot service
    - Portal path: **admin.microsoft.com > Copilot > Billing & usage**
  - Monitor usage: Reports > Usage > Microsoft 365 Copilot; Viva Insights Copilot Dashboard
  - Prompt governance: save, share, schedule, delete
  - Agent management: access, permissions, environment roles (Power Platform admin center)
- Identity and security:
  - Zero Trust: verify explicitly, least privilege, assume breach
  - Microsoft Entra ID: cloud-only vs. hybrid identities
  - Auth methods: MFA, passwordless (FIDO2, Windows Hello, Authenticator), SSPR
  - Hybrid auth: Password Hash Sync vs. Pass-through vs. Federation
  - SSO across M365 and third-party apps
  - Conditional Access: signals (risk, device, location, app) > decision > enforcement
  - Identity Secure Score and PIM (just-in-time access)
- RBAC: built-in roles (Global Admin, Exchange Admin, Teams Admin, etc.) vs. custom roles
- Group types: Security, M365, Mail-enabled Security, Distribution, Dynamic
- Troubleshooting: sign-in logs, What If tool, audit logs
- **Demo:** Admin center tour -- license assignment, Copilot billing, Conditional Access, service health
- Exam tips and wrap-up:
  - Domain 2 (data protection) is the heaviest -- review Purview features
  - Know the portal paths (admin.microsoft.com, purview.microsoft.com, entra.microsoft.com)
  - Know Copilot vs. agents vs. Copilot Studio distinctions
  - Know the 3-stage agent approval process
  - Passing score: 700/1000; 45 minutes; exam sandbox at aka.ms/examdemo
