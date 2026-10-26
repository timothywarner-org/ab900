# AB-900 study buddy for GitHub Copilot

A GitHub Copilot agent, prompts, and skills in this repository generate practice questions,
scenario walkthroughs, and study plans grounded in Microsoft Learn. Back to the
[course home](../README.md).

> **Currency:** This page was last reviewed **July 26, 2026** against the AB-900 study guide
> dated **July 22, 2026**. The current study guide is dated **October 14, 2026**. Check its
> [change log](https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900)
> before you rely on a dated detail here.

## Quick Start: AB-900 Cert Buddy

The cert buddy is a GitHub Copilot agent that runs inside VS Code. It requires no installation beyond cloning this repo and having GitHub Copilot access.

### Setup (5 minutes)

1. Clone this repository:

   ```bash
   git clone https://github.com/timothywarner-org/ab900.git
   cd ab900
   ```

2. Open the folder in VS Code:

   ```bash
   code .
   ```

3. When prompted, install the recommended extensions (GitHub Copilot + GitHub Copilot Chat).

4. VS Code will prompt for a **Context7 API key** the first time a cert buddy command runs. Get a free key at https://context7.com and paste it when prompted. This enables version-specific M365 admin PowerShell and Graph API syntax lookups.

5. Open GitHub Copilot Chat (`Ctrl+Alt+I` / `Cmd+Alt+I`).

### Two Ways to Interact

**Option A -- Slash commands (guided input form):**

```
/ab900-practice-questions
/ab900-scenario-walkthrough
/ab900-study-planner
```

These open a guided form that collects inputs (domain, difficulty, confidence ratings, etc.) before generating content.

**Option B -- Direct agent mention (free-form):**

```
@ab900-cert-buddy-agent Give me a Domain 2 question about DSPM for AI at Apply level, medium difficulty.
@ab900-cert-buddy-agent Contrast restricted access control with restricted content discovery in SharePoint.
@ab900-cert-buddy-agent Walk me through approving an agent submission in the M365 admin center.
@ab900-cert-buddy-agent Build me a study plan. I am weak on Domain 2 and moderate on the others.
```


## Cert Buddy Features

### Practice Questions

Questions use a **two-phase interactive delivery** that mirrors the real exam experience.

**Phase 1** -- The agent presents a workplace scenario and four answer choices (A-D), then stops and waits for your reply.

**Phase 2** -- After you answer, the agent reveals the correct answer, a 2-sentence rationale for every choice, and Microsoft Learn references.

Special commands during Phase 1:

| Command | Effect |
|---------|--------|
| `hint` | Eliminates one distractor |
| `skip` | Reveals the answer and moves to rationale |
| A / B / C / D | Your answer -- triggers Phase 2 |

After a set of questions the agent reports score, percent correct, and domains to review.

### Scenario Walkthroughs

Walkthroughs simulate the admin center experience without requiring a live tenant. Each walkthrough:

- Sets a realistic admin scenario (for example: "Contoso needs to see what sensitive data Copilot has been accessing")
- Walks through 5-10 numbered steps with exact portal URL, navigation path, and correct setting
- Flags the AB-900 exam objective each step covers
- Notes the most common wrong answers (wrong portal, wrong nav path, wrong role)

Available scenario types:

- Copilot licensing and pay-as-you-go billing configuration, including SharePoint agents
- Agent approval workflow (Microsoft 365 admin center + Power Platform admin center)
- DSPM for AI dashboard review
- SharePoint oversharing identification and remediation, including data access governance reports
- Sensitivity label creation and policy assignment
- DLP policy review and alert response
- PIM role activation and Conditional Access policy review

### Study Planner

1. The agent presents the three AB-900 domains with exam weights.
2. You rate your confidence in each: Strong / Moderate / Weak / Unknown.
3. The agent generates a prioritized study plan -- weakest first, Domain 2 flagged as highest weight.
4. Each domain entry includes estimated study hours, 2-3 Microsoft Learn module links, and key objectives.
5. The agent offers to start generating practice questions on your first priority domain.


## MCP Servers

Three MCP servers are configured in `.vscode/mcp.json` and load automatically on clone.

| Server ID | Purpose |
|-----------|---------|
| `ab900buddy-context7` | Version-specific M365 admin PowerShell, Graph API, and CLI syntax |
| `ab900buddy-markitdown` | Convert your own PDFs and Word docs to markdown for the agent to analyze |
| `ab900buddy-mslearn` | Search and fetch official Microsoft Learn documentation (`microsoft_docs_search`, `microsoft_docs_fetch`) |

The Microsoft Learn MCP server (`ab900buddy-mslearn`) is the primary source of truth for all generated questions and walkthroughs. It provides grounding in official Microsoft documentation directly from the workspace configuration.

