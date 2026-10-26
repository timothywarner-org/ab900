# Starter files for the Contoso service assistant

These four files are the synthetic material for the Pearson October 27, 2026 class
**Copilot and Agent Administration Fundamentals**. I use them in the live demos, and
you can use them in your own lab tenant afterward. Follow [TUTORIALS.md](../TUTORIALS.md)
for every click.

Everything here is fictional. Contoso, Ltd., the ServiceHub application, Debra, and
Kim Akers are training characters. The files contain no real customer data,
credentials, tenant settings, or production instructions, so uploading them to a lab
agent can't leak anything real.

| File | Used in | What it is |
| --- | --- | --- |
| [contoso-service-guide.txt](contoso-service-guide.txt) | Tutorial 4 | The knowledge source. Six short sections, owner Kim Akers, and the harmless test marker `SERVICE-ORCHID-42` in section 2. |
| [agent-instructions.txt](agent-instructions.txt) | Tutorial 4 | The complete agent instructions. Paste all of it, unchanged. |
| [agent-test-cases.csv](agent-test-cases.csv) | Tutorial 4 | Test matrix T01 to T08. Every row starts as `NOT RUN`. |
| [synthetic-sharing-report.csv](synthetic-sharing-report.csv) | Tutorial 3 and the exercise | A two-row synthetic data access governance finding to argue with. |

## Agent settings

Use these values when you build the agent in Copilot Studio.

| Setting | Value |
| --- | --- |
| Name | Contoso Service Guide |
| Description | Help a fictional service team understand approved escalation and access-request procedures from the Contoso, Ltd. Service Desk Guide. |
| Knowledge | contoso-service-guide.txt, named Contoso Service Desk Guide |
| Instructions | The complete contents of agent-instructions.txt |
| Language | English |
| Web Search | Disabled, so answers come only from the guide |
| Actions | None |
| Audience | A named pilot group, with no public channel |
| Authentication | Keep authenticated access, and inspect it before publishing |

## How to use these files

1. **Record what you observe, not what you expect.** The test matrix lists an
   acceptance criterion for each prompt. Fill in the `Observed result` column with
   the agent's actual answer, the agent version, and the date. An expected answer
   isn't a result. My own run is in [evidence](../evidence/README.md).
2. **Treat the sharing report as an exercise.** Its first column says
   `SYNTHETIC EXERCISE - NOT TENANT EVIDENCE`. It shows you how to read a finding,
   and it doesn't describe any real tenant.
3. **Remember who can read uploaded knowledge.** Content in a file uploaded to an
   agent is available to anyone who chats with that agent, whatever the original
   file's permissions were. That's why this guide is synthetic.
   See [Upload files as a knowledge source](https://learn.microsoft.com/microsoft-copilot-studio/knowledge-add-file-upload)
   and [Use uploaded files with generative answers](https://learn.microsoft.com/microsoft-copilot-studio/nlu-documents).
