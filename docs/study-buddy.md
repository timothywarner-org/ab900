# AB-900 study buddy for GitHub Copilot

If you decide to sit the exam, this repository ships a GitHub Copilot agent, prompts,
and skills that write practice questions, scenario walkthroughs, and study plans
grounded in Microsoft Learn. Back to the [course home](../README.md).

> **Currency:** I last reviewed this page on **July 26, 2026** against the AB-900 study
> guide dated **July 22, 2026**. The current study guide is dated **October 14, 2026**.
> Check its [change log](https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900)
> before you rely on a dated detail here.

## Set it up

The cert buddy runs inside VS Code. You don't install anything beyond cloning this
repository, as long as you have GitHub Copilot access. Plan on about five minutes.

1. Clone this repository:

   ```bash
   git clone https://github.com/timothywarner-org/ab900.git
   cd ab900
   ```

2. Open the folder in VS Code:

   ```bash
   code .
   ```

3. When VS Code prompts you, install the recommended extensions (GitHub Copilot and
   GitHub Copilot Chat).

4. The first time a cert buddy command runs, VS Code asks for a **Context7 API key**.
   Get a free key at https://context7.com and paste it in. Context7 looks up
   version-specific Microsoft 365 admin PowerShell and Graph API syntax.

5. Open GitHub Copilot Chat (`Ctrl+Alt+I` on Windows, `Cmd+Alt+I` on macOS).

## Talk to it

**Slash commands** open a guided form that collects your inputs (domain, difficulty,
confidence ratings, and so on) before the agent writes anything:

```
/ab900-practice-questions
/ab900-scenario-walkthrough
/ab900-study-planner
```

**Mention the agent directly** when you'd rather ask in your own words:

```
@ab900-cert-buddy-agent Give me a Domain 2 question about DSPM for AI at Apply level, medium difficulty.
@ab900-cert-buddy-agent Contrast restricted access control with restricted content discovery in SharePoint.
@ab900-cert-buddy-agent Walk me through approving an agent submission in the M365 admin center.
@ab900-cert-buddy-agent Build me a study plan. I am weak on Domain 2 and moderate on the others.
```

## What it does

### Practice questions

Each question arrives in two phases, so you commit to an answer before you see it.

**Phase 1:** the agent gives you a workplace scenario and four answer choices (A to D),
then stops and waits for your reply.

**Phase 2:** after you answer, the agent reveals the correct answer, a two-sentence
rationale for every choice, and the Microsoft Learn references.

During phase 1 you can type:

| Command | Effect |
|---------|--------|
| `hint` | Eliminates one distractor |
| `skip` | Reveals the answer and moves to the rationale |
| A, B, C, or D | Your answer, which starts phase 2 |

After a set of questions, the agent reports your score, your percent correct, and the
domains to review.

### Scenario walkthroughs

A walkthrough talks you through an admin task when you don't have a tenant handy. Each
one:

- Sets up a realistic admin scenario (for example: "Contoso needs to see what sensitive data Copilot has been accessing")
- Walks through 5 to 10 numbered steps with the exact portal URL, navigation path, and setting
- Flags the AB-900 exam objective each step covers
- Calls out the most common wrong answers (wrong portal, wrong navigation path, wrong role)

You can ask for these scenarios:

- Copilot licensing and pay-as-you-go billing configuration, including SharePoint agents
- Agent approval workflow (Microsoft 365 admin center and Power Platform admin center)
- DSPM for AI dashboard review
- SharePoint oversharing identification and remediation, including data access governance reports
- Sensitivity label creation and policy assignment
- DLP policy review and alert response
- PIM role activation and Conditional Access policy review

### Study planner

1. The agent shows the AB-900 domains with their exam weights.
2. You rate your confidence in each one: Strong, Moderate, Weak, or Unknown.
3. The agent builds a study plan that puts your weakest domain first and flags Domain 2 as the highest weight.
4. Each domain entry includes estimated study hours, two or three Microsoft Learn module links, and the key objectives.
5. The agent offers to start practice questions on your first priority domain.

## MCP servers

The repository configures these MCP servers in `.vscode/mcp.json`, and VS Code loads
them when you open the folder.

| Server ID | Purpose |
|-----------|---------|
| `ab900buddy-context7` | Version-specific Microsoft 365 admin PowerShell, Graph API, and CLI syntax |
| `ab900buddy-markitdown` | Converts your own PDFs and Word documents to Markdown for the agent to analyze |
| `ab900buddy-mslearn` | Searches and fetches official Microsoft Learn documentation (`microsoft_docs_search`, `microsoft_docs_fetch`) |

The agent grounds every question and walkthrough in the Microsoft Learn server
(`ab900buddy-mslearn`), so its answers trace back to official documentation.
