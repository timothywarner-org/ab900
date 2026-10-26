# Class handouts

These are the four PDF handouts for the Pearson Live Training class
**Copilot and Agent Administration Fundamentals** (October 27, 2026). They are the
same files Pearson shares in your session's **Resources** widget, byte for byte.
Keep one open beside the [step-by-step tutorials](../TUTORIALS.md), which carry the
newest steps.

| Handout | Pages | Use it with | What it gives you |
| --- | --- | --- | --- |
| [01 Admin portal map](01-Admin-Portal-Map.pdf) | 2 | [Tutorial 1](../TUTORIALS.md#1-trace-access-and-adoption) and [tutorial 5](../TUTORIALS.md#5-approve-and-operate-the-agent) | Where each admin task lives, and what evidence each screen can and cannot prove. |
| [02 Admin and Purview walkthrough](02-Admin-and-Purview-Walkthrough.pdf) | 4 | [Tutorials 1](../TUTORIALS.md#1-trace-access-and-adoption), [2](../TUTORIALS.md#2-create-a-dlp-policy-for-copilot-in-simulation), and [3](../TUTORIALS.md#3-read-a-data-access-governance-report) | Numbered steps for access and usage, the label-based DLP example, the oversharing report, and the posture follow-up, plus an evidence record to fill in. |
| [03 Sample DLP and DSPM configurations](03-Sample-DLP-and-DSPM-Configurations.pdf) | 2 | [Tutorials 2](../TUTORIALS.md#2-create-a-dlp-policy-for-copilot-in-simulation) and [3](../TUTORIALS.md#3-read-a-data-access-governance-report) | The exact DLP recipe settings, its acceptance criteria, and a DSPM investigation record. |
| [04 Starter agent configuration](04-Starter-Agent-Configuration.pdf) | 3 | [Tutorials 4](../TUTORIALS.md#4-build-and-test-the-starter-agent) and [5](../TUTORIALS.md#5-approve-and-operate-the-agent) | The agent settings, the test prompts with what to look for, and the publication review. |

The Resources widget also has a starter-files ZIP. Its four files are identical to
the [starter files](../starter-files/README.md) in this repository, so use whichever
copy is handy.

## Updates since the handouts were written

The handouts were checked against Microsoft Learn on October 19, 2026. The points
below changed or were added by October 26, 2026. When a handout and this list
disagree, follow this list.

| Handout | Topic | Current guidance |
| --- | --- | --- |
| 01, page 2 | License activation time | The handout says some apps can take up to 24 hours to show a new assignment. The page that said so has been retired. If Copilot does not appear for a user, run the Copilot License Details diagnostic linked from [Microsoft Copilot requirements](https://learn.microsoft.com/microsoft-365/copilot/microsoft-copilot-requirements#validate-a-users-configuration). |
| All | Product name | Microsoft Learn now calls the product [Microsoft Copilot](https://learn.microsoft.com/microsoft-365/copilot/microsoft-copilot-requirements), and Copilot Chat is now Microsoft Copilot Chat. The AB-900 study guide still says Microsoft 365 Copilot. Both names mean the same product. |
| 01 and 02 | Billing | The handouts cover classic pay-as-you-go budgets, which only send alerts. [Copilot Credits spending policies](https://learn.microsoft.com/microsoft-365/copilot/usage-based-billing-manage-copilot-credits), under **Copilot > Cost management > Configuration**, do enforce a monthly limit. |
| 04, page 3 | Channel name | The Copilot Studio channel is now [Teams and Microsoft Copilot](https://learn.microsoft.com/microsoft-copilot-studio/publication-add-bot-to-microsoft-teams). Learn pages label it a few different ways, so pick the Teams and Copilot channel your tenant shows. |
| 04, page 3 | Who can approve | In the Microsoft 365 admin center, only the [AI Administrator and Global Administrator roles](https://learn.microsoft.com/microsoft-365/admin/manage/agent-roles-perms) can approve agent requests. Agents sent to the Teams store can also be [approved in the Teams admin center](https://learn.microsoft.com/microsoftteams/submit-approve-custom-apps) under **Teams apps > Manage apps**. |
| 01 | Monitoring agents | **Agents > All agents > Registry** in the Microsoft 365 admin center lists the agents in your tenant. See [Agent Registry](https://learn.microsoft.com/microsoft-365/admin/manage/agent-registry). |
| 04, page 1 | Authoring experience | On October 26, 2026 the demo tenant offered **More options (...) > Open classic experience** instead of a New experience toggle. Either way, use the standard experience the [quickstart](https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-get-started) documents. [Tutorial 4](../TUTORIALS.md#4-build-and-test-the-starter-agent) has the full steps. |
| 04, page 2 | Test T05 | Copilot Studio [content moderation](https://learn.microsoft.com/troubleshoot/power-platform/copilot-studio/generative-answers/agent-response-filtered-by-responsible-ai) may block T05 with error code `ContentFiltered` before the agent answers. No password or approval is invented, so the test still passes. See the [observed results](../evidence/README.md). |
| 04, page 3 | Channel tile | The demo tenant labeled the Teams and Copilot channel **Microsoft 365 and Microsoft Teams** on October 26, 2026. |

Everything in these handouts is fictional training material. Contoso, Ltd., the
ServiceHub application, and every name in them are invented.
