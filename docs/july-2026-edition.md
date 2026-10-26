# Earlier edition: July 2026, four hours

Before the two-hour Pearson class, this repository supported a four-hour O'Reilly Live
Learning delivery of the same course. Its plan, demo scripts, and segment folders stay here
for self-study. Back to the [course home](../README.md).

> **Currency:** This page was last reviewed **July 26, 2026** against the AB-900 study guide
> dated **July 22, 2026**. The current study guide is dated **October 14, 2026**. Check its
> [change log](https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900)
> before you rely on a dated detail here.

## O'Reilly Live Learning Session

**Duration:** 4 segments x 50 minutes, with 10-minute breaks. Delivered on ON24.

The teaching order deliberately does **NOT** follow exam domain order. It leads with Copilot because that is the draw, then agents, then the heaviest domain, then identity and security with exam prep. Full timing is in [course-plan-july-2026.md](../course-plan-july-2026.md).

| Segment | Topic | Domain |
|---------|-------|--------|
| 1 | Microsoft 365 Copilot | Domain 3 |
| 2 | Copilot agents and Copilot Studio | Domain 3 |
| 3 | Data protection and governance | Domain 2 (heaviest weight) |
| 4 | Microsoft 365 admin, identity, and security | Domain 1, plus exam prep |

The `segment-0{1-4}-*` folder names reflect the exam domain grouping rather than the delivery order, so segment folder numbers and live segment numbers are intentionally different.

### For Learners

Before the session:

1. Follow the [Tenant Setup Guide](../docs/tenant-setup-guide.md) to get a working M365 admin tenant.
2. Clone this repo and open it in VS Code.
3. Set up the cert buddy (see the [study buddy page](study-buddy.md)).

Key resources:

- [Exam Traps Cheat Sheet](../docs/exam-traps-cheatsheet.md) -- print or bookmark before the session
- [New Features Deep Dive](../docs/new-features-deep-dive.md) -- DSPM, Researcher, Analyst, Copilot Credits billing
- [Practice Questions](../shared-resources/references/AB-900-PRACTICE-QUESTIONS.md) -- 15 scenario-based questions
- [Free official practice assessment](https://learn.microsoft.com/credentials/certifications/practice-assessments-for-microsoft-certifications) -- Microsoft notes that practice questions are not exam questions and do not reflect exam length

### For the Instructor

- [Course Plan](../course-plan-july-2026.md) -- segment-by-segment plan for the July 2026 delivery
- [Session Agenda](../docs/session-agenda.md) -- full timing breakdown with cut guidance
- [Demo Scripts](../docs/demo-scripts.md) -- click-by-click scripts for all 14 demos
- [Tenant Setup Guide](../docs/tenant-setup-guide.md) -- what learners need before arriving


## Repository Structure

```
ab900/
├── .github/
│   ├── agents/
│   │   └── ab900-cert-buddy-agent.agent.md    # Main Copilot agent
│   ├── skills/
│   │   ├── ab900-item-creator/SKILL.md         # Practice question generation
│   │   ├── ab900-scenario-walkthrough/SKILL.md # Admin scenario walkthroughs
│   │   └── ab900-study-planner/SKILL.md        # Personalized study plans
│   ├── prompts/
│   │   ├── ab900-practice-questions.prompt.md  # /ab900-practice-questions command
│   │   ├── ab900-scenario-walkthrough.prompt.md # /ab900-scenario-walkthrough command
│   │   └── ab900-study-planner.prompt.md       # /ab900-study-planner command
│   ├── copilot-instructions.md                 # Workspace Copilot grounding rules
│   └── workflows/
│       └── validate.yml                        # CI: terminology + link validation
├── .vscode/
│   ├── mcp.json                                # MCP server config (3 servers, auto-loads)
│   ├── extensions.json                         # Recommended extensions
│   └── settings.json                           # Workspace settings
├── references/
│   ├── ab900-objectives.md                     # Official exam objectives (all 3 domains)
│   ├── fictional-companies.md                  # Microsoft fictional companies for scenarios
│   └── style-guide.md                          # Microsoft Writing Style Guide extract
├── course-plan-july-2026.md                    # Live session plan (4 x 50 min on ON24)
├── docs/
│   ├── module-01-security-foundations.md        # Module 1 CliffsNotes
│   ├── module-02-core-services-admin.md        # Module 2 CliffsNotes
│   ├── module-03-data-protection-governance.md  # Module 3 CliffsNotes
│   ├── module-04-copilot-and-agents.md         # Module 4 CliffsNotes
│   ├── module-05-copilot-admin-tasks.md        # Module 5 CliffsNotes
│   ├── module-06-agent-admin-tasks.md          # Module 6 CliffsNotes
│   ├── session-agenda.md                       # Instructor delivery guide (4 x 50 min)
│   ├── demo-scripts.md                         # Click-by-click scripts for all 14 demos
│   ├── tenant-setup-guide.md                   # Learner tenant setup before the session
│   ├── new-features-deep-dive.md               # DSPM, Researcher, Analyst, Copilot Credits
│   └── exam-traps-cheatsheet.md                # One-page last-minute cheat sheet
├── shared-resources/
│   ├── references/
│   │   ├── AB-900-EXAM-GUIDE.md                # Complete exam reference
│   │   ├── AB-900-SKILLS-BREAKDOWN.md          # Per-objective study notes
│   │   └── AB-900-PRACTICE-QUESTIONS.md        # 15 practice questions (5 per domain)
│   ├── scripts/                                # PowerShell helpers (license assign, usage report)
│   └── templates/                              # Deployment checklist, DLP policy template
├── slides/workspace/                           # Deck build tooling and background assets
├── warner-ab900-July-2026.pptx                 # Current session deck
└── segment-0{1-4}-*/                           # Per-segment demos, labs, slides, resources
```

