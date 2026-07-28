# Session Opener: No-Code, Low-Code, Pro-Code -- Who Builds What, and Who Governs It

**Runtime:** 10 minutes. **Placement:** before Segment 1.
**Job:** orient learners on the maker spectrum, then pivot hard to governance. AB-900 tests **administration and governance**, not development.

**Grounding:** every claim below was verified against Microsoft Learn on July 28, 2026 by an adversarial pass that defaulted to REFUTED. Of 28 claims checked, 20 confirmed clean and 8 required correction. Corrections are folded in.

---

## 1. The maker spectrum

Microsoft documents three coding approaches: **no-code**, **low-code**, and **pro-code**.

> **Say "pro-code," not "code-first."** Pro-code is Microsoft's word and appears verbatim in the tool comparison table. Source: [Choose the right tool to build your declarative agent](https://learn.microsoft.com/microsoft-365/copilot/extensibility/declarative-agent-tool-comparison).

| Tier | Surface | Who builds | What they build | What governs it |
|------|---------|-----------|-----------------|-----------------|
| **No-code** | **Agent Builder** in Microsoft 365 Copilot | Business users | Declarative agents. Knowledge from public web, SharePoint, Copilot connectors. | admin.microsoft.com > **Agents** > **Settings** (User access, Sharing, Allowed agent types) |
| **No-code** | **SharePoint agents** | Business users | Declarative agents scoped to sites, libraries, files. | SharePoint admin center (RCD, RAC) plus `.agent` file permissions |
| **Low-code** | **Microsoft Copilot Studio** | Makers | Declarative **and** custom engine agents. Power Platform connectors. | Power Platform admin center: environments, connectors, **DLP data policies**, RBAC |
| **Pro-code** | **Microsoft 365 Agents Toolkit** (VS Code, Visual Studio) | Developers | Both types, with custom API actions and CI/CD. | Same tenant approval queue and agent settings |
| **Pro-code** | **Microsoft 365 Agents SDK** | Developers | Custom engine agents in .NET, Python, JavaScript. | **Its own** hosting, compliance, and Responsible AI posture |

### Two naming corrections to get right on stage

**There is no "Copilot Studio SDK."** Current Microsoft Learn documentation names the **Microsoft 365 Agents SDK** (with the Teams SDK as an alternate). The Agents FAQ page still says "Copilot Studio SDK" in one bullet and contradicts itself two answers later. Use **Microsoft 365 Agents SDK**.

**"Copilot Studio lite" is not the product name.** Microsoft's dedicated page names it **Agent Builder in Microsoft 365 Copilot**. The phrase "Copilot Studio (lite or full)" survives only in the FAQ. Teach **Agent Builder**. The names collide because **Copilot Studio processes Agent Builder capabilities** behind the scenes.

### On the persona labels

Microsoft's Agents FAQ describes three builder audiences: **Users**, **Makers**, **Developers**. Treat this as descriptive framing, **not** exam vocabulary -- the July 22, 2026 objectives use none of these labels.

The governance clause is built into Microsoft's own sentence: users can create agents **"if enabled by tenant settings."** The persona does not grant the capability. **The tenant setting does.** That is the whole session in one line.

---

## 2. The two-way agent taxonomy

Microsoft describes **two approaches to building** agents for Microsoft 365 Copilot. Note the wording: Learn says "two approaches to build," not "two agent types." Source: [Agents for Microsoft 365 Copilot](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agents-overview).

| Dimension | **Declarative agents** | **Custom engine agents** |
|-----------|------------------------|--------------------------|
| **Definition** | Configure Copilot with custom **instructions**, **knowledge**, and **actions**. Uses Copilot's orchestrator and foundation models. | Bring your own **orchestration** and **models**. |
| **Hosting** | **Hosted in Microsoft 365.** No additional hosting required. | Hosted in Microsoft 365 with Copilot Studio, **or externally**. Additional hosting at additional cost. |
| **Proactive interactions** | **NOT supported.** User-initiated only. | **Supported.** Can trigger actions without direct user input. |
| **Compliance and RAI** | **Inherits** Microsoft 365 compliance, RAI, and security standards. | **You must ensure your own** compliance, RAI practices, and security. |
| **Sharing** | Designed for individuals. | Individual use **and** group collaboration. |
| **Channels** | Microsoft 365 apps. | Microsoft 365 **and** external apps. |

### The sentence worth memorizing

> A **declarative** agent **inherits** the compliance and Responsible AI posture. A **custom engine** agent makes that posture **your** problem.

That single line answers a family of scenario questions.

### The axis learners collapse

**Agent type and coding approach are independent axes.** A declarative agent can be built no-code, low-code, or pro-code. Learners who fuse the two will miss questions.

---

## 3. Six governance questions, each mapped to an admin surface

### Who can build?

- **User access:** admin.microsoft.com > **Agents** > **Settings** > **User access**
- **Allowed agent types:** admin.microsoft.com > **Agents** > **Settings** > **Allowed agent types**. Toggles for agents built by **Microsoft**, **your organization**, and **external publishers**.
- Microsoft-built agents stay **visible** even when their type is disabled, but users cannot install them.

### What can it reach?

- Knowledge sources are bounded per surface. Agent Builder allows **up to 20 knowledge sources** total.
- Copilot honors existing permissions: **an agent can only reach what its user can already reach.**
- **DLP for Copilot:** the policy location is named **"Microsoft 365 Copilot and Copilot Chat."**

### Who approves it?

- admin.microsoft.com > **Agents** > **All agents** > **Requests**
- Three request states: **Pending review**, **Pending update**, **Pending activate**
- Two primary actions: **Publish to store** and **Reject submission**. For a Pending update, the button reads **Update in store**.
- Requests filter by **State** and by **Channel** (Microsoft Teams, Copilot, Office, Outlook, Word, Excel, PowerPoint).

### Who approves? The roles

Agent management is governed by **Microsoft Entra admin roles**. Two roles can install, modify, approve, and manage agent configurations: **AI Administrator** and **Global Administrator**. **Global Reader** is view-only and cannot edit.

### Who pays?

- Licensed Copilot users: covered by the license.
- Unlicensed users: **pay-as-you-go**, billed in **Copilot Credits** at **$0.01** per credit.
- Path: admin.microsoft.com > **Copilot** > **Billing & usage**

### How do we watch it?

- Usage: admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > then **Copilot**, **Credits**, or **Agents**
- Audit: Copilot prompts and responses land in the unified audit log as **CopilotInteraction**
- **Trap:** Microsoft explicitly warns audit data is **NOT** the basis for usage reporting.

### How do we stop it?

- **Block** prevents access tenant-wide **and** removes the agent from users who already installed it.
- **Remove** takes it out of inventory, but it can be reacquired from the store.
- **Scope trap:** blocking an Agent Builder or Copilot Studio agent affects Microsoft 365 Copilot **and** other hosts such as Outlook and Teams. Blocking a SharePoint agent affects Microsoft 365 Copilot Chat **only**.

---

## 4. The pivot line

Say this out loud to move from "how things get built" to "what the exam actually tests":

> "Everything I just showed you is how an agent gets **made**. AB-900 does not test any of it. The exam tests what happens **next** -- who approved it, what data it can touch, who pays for it, and how you shut it off. Fundamentals is not a builder credential. It is an **administrator** credential. For the next three hours, every feature we look at, we look at from the admin center, not the maker's canvas."

---

## 5. Five governance questions every candidate must answer

| # | Question | Domain |
|---|----------|--------|
| 1 | How does Copilot decide what a user is allowed to see, and what enforces it? | 2 |
| 2 | A site is oversharing. Do you reach for **restricted access control** or **restricted content discovery**, and what is the difference? | 2 |
| 3 | A maker publishes an agent. What happens next, who acts, and where? | 3 |
| 4 | An unlicensed user runs a SharePoint agent. Who pays, and in what unit? | 3 |
| 5 | Which admin role can approve an agent request, and which can only look? | 1 and 3 |

**Answers, one line each:**

1. **Microsoft Graph** enforces existing permissions. Copilot can only see what the user can already see. The **semantic index** respects permission structures.
2. **RAC controls ACCESS** (who can open the site). **RCD controls DISCOVERABILITY** (whether content surfaces in org-wide search and Copilot) without changing permissions. RAC is enforcement. RCD is concealment.
3. It lands in **Agents > All agents > Requests** as **Pending review**. An **AI Administrator** or **Global Administrator** selects **Publish to store** or **Reject submission**.
4. The organization pays in **Copilot Credits** at **$0.01** each, through a pay-as-you-go billing policy. Licensed Copilot users incur no charge.
5. **AI Administrator** and **Global Administrator** can approve. **Global Reader** can view but not act.

---

## Scope note

**Microsoft Foundry** (formerly Azure AI Foundry, formerly Azure AI Studio) appears **nowhere** in the July 22, 2026 AB-900 objectives. Mention it only as adjacent context if a learner surfaces it, and say plainly that it is not on the exam. The same applies to Agent 365 policy templates: real, but beyond Fundamentals scope.
