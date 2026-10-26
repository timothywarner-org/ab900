# Course FAQ

Frequently asked questions about the "Copilot & Agent Administration Fundamentals" course.

> **Currency:** Aligned to the **Skills measured as of July 22, 2026** version of the AB-900 study guide. Content last reviewed **July 26, 2026**.

## General Questions

### Q: What are the prerequisites for this course?
**A:** You should have:
- Basic understanding of Microsoft 365 services
- Familiarity with Microsoft Entra ID
- Access to a Microsoft 365 tenant (trial or production)
- Administrative privileges in Microsoft 365 admin center

### Q: Do I need a Copilot license to participate?
**A:** While hands-on labs work best with active Copilot licenses, you can still benefit from demonstrations and conceptual learning. Microsoft offers trial licenses for testing purposes.

### Q: What Microsoft 365 license do I need?
**A:** The add-on is named **Microsoft 365 Copilot**, and it requires one of a long list of qualifying base plans. The common enterprise ones are Microsoft 365 E7, E5, E3, F1, and F3, plus Office 365 E5, E3, E1, and F3, and the Microsoft 365 Business plans. Note that Microsoft 365 E7 already includes Microsoft 365 Copilot in the base SKU, so E7 customers do not buy the add-on separately.

### Q: What is Microsoft 365 Copilot Business, and how is it different?
**A:** Microsoft 365 Copilot Business is a separate SMB add-on that requires Microsoft 365 Business Basic, Business Standard, Business Premium, or Microsoft 365 Apps for Business. Microsoft states it delivers the same capabilities as the enterprise Microsoft 365 Copilot offering, so the difference is price point and eligibility rather than feature set. It is capped at a **maximum of 300 seats** per tenant and is sold only on an annual commitment.

### Q: Is there a 300-seat minimum for Copilot?
**A:** **NO**. Microsoft removed the original 300-seat minimum in January 2024, along with the Microsoft 365 base-plan requirement that had excluded Office 365 customers. The only surviving 300 figure is the seat **maximum** on Microsoft 365 Copilot Business and the Business-with-Copilot bundles. Teaching a 300-seat minimum today is flatly wrong.

### Q: Do unlicensed users get anything?
**A:** Yes. **Microsoft 365 Copilot Chat** is included at no additional cost for organizations with an eligible Microsoft 365 subscription, and it requires sign-in with a Microsoft Entra work or school account to get enterprise data protection. Web-based chat is free with an eligible subscription. Work-based chat, which returns results the Entra account can access, requires a Microsoft 365 Copilot license.

### Q: Can I use a trial tenant for the labs?
**A:** Yes. Microsoft offers trial licenses that work well for learning and testing. The Microsoft 365 Developer Program is also an option, but eligibility is limited to Visual Studio Professional or Enterprise subscribers and members of qualifying programs, so confirm you qualify before relying on it.

## Technical Questions

### Q: How long does it take for Copilot to activate after license assignment?
**A:** Typically 24-48 hours, though it can sometimes be faster. Ensure OneDrive is provisioned and Microsoft 365 Apps are updated.

### Q: What versions of Microsoft 365 Apps support Copilot?
**A:** Current Channel or Monthly Enterprise Channel with the latest updates. Semi-Annual Channel may have delayed feature availability.

### Q: Can I disable specific Copilot features?
**A:** Yes. Administrators control features through the Copilot Control System, including the tenant-level **Allow web search in Copilot** toggle, the Cloud Policy service for Microsoft 365, and agent settings in the Microsoft 365 admin center. Note the exception: Researcher and Analyst are core chat experiences and do **NOT** fall under agent-related settings, so disabling them requires blocking each agent individually.

### Q: Does Copilot work offline?
**A:** No, Copilot requires internet connectivity to access AI models and Microsoft Graph data.

## Security and Compliance Questions

### Q: Is my data used to train AI models?
**A:** No, your prompts, responses, and data accessed through Microsoft Graph are NOT used to train foundation AI models. Microsoft maintains strict data privacy.

### Q: How does Copilot handle sensitive data?
**A:** Copilot respects your existing security controls including DLP policies, sensitivity labels, and permissions. It only surfaces organizational data to which the individual user has at least view permissions.

### Q: If a user can view an encrypted file, will Copilot summarize it?
**A:** Not necessarily. When a sensitivity label applies encryption, the user needs the **EXTRACT** usage right in addition to **VIEW** for Copilot to return the content. If the user has VIEW but **NOT** EXTRACT, Copilot will not summarize the item, though it can still cite it with a link so the user can open it outside Copilot. This is one of the most heavily tested Domain 2 details.

### Q: Can I stop Copilot from using specific content?
**A:** Yes, through several layers. Microsoft Purview DLP has a location named **Microsoft 365 Copilot and Copilot Chat** whose action is **Prevent Copilot from processing content**. In SharePoint, **restricted access control (RAC)** blocks who can access a site at all, and **restricted content discovery (RCD)** hides site content from organization-wide search and Copilot without changing permissions. RAC is enforcement; RCD is concealment.

### Q: Is Restricted SharePoint Search still the recommended oversharing control?
**A:** **NO**. Restricted SharePoint Search is retiring, and Microsoft blocks new enablement starting July 31, 2026. Microsoft directs customers to **restricted content discovery** instead. Do not teach or recommend Restricted SharePoint Search.

### Q: Is SharePoint Advanced Management a paid add-on or is it bundled?
**A:** Both, and the distinction is exam-worthy. The SAM capabilities that support a Microsoft 365 Copilot deployment are unlocked when at least one user in the organization holds a Microsoft 365 Copilot license, and that user does not need to be a SharePoint administrator. The full SAM feature set still requires the **SharePoint Advanced Management Plan 1** add-on. Microsoft names restricted site creation as an example of a feature a Copilot license does not unlock.

### Q: What compliance certifications does Copilot have?
**A:** Copilot is covered by Microsoft 365's comprehensive compliance certifications including ISO 27001, SOC 2, GDPR compliance, and more.

### Q: Can I control which users get Copilot?
**A:** Yes, through license assignment. Only users with assigned Copilot licenses can access Copilot features.

## Agent Questions

### Q: What is the difference between Copilot and an agent?
**A:** Copilot is Microsoft's general AI assistant across Microsoft 365 apps. Agents are customizable AI assistants built for specific purposes. Microsoft documents two primary build approaches: **declarative agents**, which reuse Copilot's own orchestrator and foundation models and are hosted in Microsoft 365, and **custom engine agents**, which are fully customized down to the model and orchestration and require hosting outside Microsoft 365.

### Q: Where do users build agents?
**A:** **Agent Builder in Microsoft 365 Copilot** is the low-code surface reached with the New agent option in the Microsoft 365 Copilot app. Makers use **Copilot Studio** for richer low-code agents. Developers use the **Microsoft 365 Agents SDK** or the **Microsoft 365 Agents Toolkit** for pro-code agents. Users can also create declarative agents directly in SharePoint. The older label "Copilot Studio lite" survives only in documentation URL slugs; the current product name is Agent Builder.

### Q: Do I need special licenses for agents?
**A:** It depends on the surface. Agent Builder requires a Microsoft 365 Copilot license or a tenant with pay-as-you-go enabled. SharePoint agents require either an assigned Microsoft 365 Copilot license or pay-as-you-go billing configured for the organization. Copilot Chat users without a Copilot license can use Agent Store agents that carry no additional cost, provided the administrator enables them, but agents that ground in organizational data are billed through metered consumption.

### Q: How is agent usage billed now?
**A:** The unit of consumption is the **Copilot Credit**, billed at $0.01 per credit under pay-as-you-go. Consumption is per-feature, not one credit per prompt: a classic answer is 1 credit, a generative answer is 2, an agent action is 5, and tenant graph grounding is 10. Because SharePoint agents are always grounded in the tenant graph, one complex SharePoint agent prompt consumes 12 credits. Licensed Microsoft 365 Copilot users incur no charge for these interactions, subject to fair usage limits. Note a documentation conflict: the Azure meter is still named "Copilot Studio," and some Microsoft pages still describe the rate in terms of messages.

### Q: Can agents access external systems?
**A:** Yes, through connectors and actions, agents can integrate with many external systems and APIs. Registering a tool such as a remote MCP server is governed separately from agent approval, at Microsoft 365 admin center > **Agents** > **Tools** > **Requests**.

### Q: How do I control what an agent can do?
**A:** Through the agent settings in the Microsoft 365 admin center (**Agents** > **Settings**), which cover agent management rules, allowed agent types, security templates, sharing, and user access. Copilot Studio agents add finer-grained controls in the Power Platform admin center, including DLP policies that block publishing to specific channels and sharing limits at the managed environment level. Only **AI Administrator** and **Global Administrator** can perform governance actions such as approving requests or assigning ownership.

### Q: How does an agent get approved for the organization?
**A:** At Microsoft 365 admin center > **Agents** > **All agents** > **Requests**. Three request states appear there: Pending review, Pending update, and Pending activate. The primary actions are **Publish to store** and **Reject submission**. For a Pending update request the button is **Update in store**, and users keep the previous version until the admin approves. The older "Requested agents" tab label and the older Copilot > Agents path are both stale.

### Q: Are Researcher and Analyst governed by the agent on/off toggle?
**A:** **NO**. Microsoft states that Researcher and Analyst are part of the core Copilot chat experience and do not fall under any agent-related settings. They remain available in Microsoft 365 Copilot Chat under **Tools** even when agents are disabled for some or all users. To turn one off, an admin must **Block** that individual agent tenant-wide; the Edit users panel is disabled for them, so per-user assignment is not possible. Both are generally available, both require a Microsoft 365 Copilot license, and both are preinstalled for licensed users.

## Exam Preparation Questions

### Q: Is there really an AB-900 exam?
**A:** Yes. Exam AB-900 leads to the **Microsoft 365 Certified: Copilot and Agent Administration Fundamentals** certification. It covers Microsoft 365 core services and security, data protection and governance, and Copilot and agent administration. See the skills-measured reference in `references/ab900-objectives.md` for the full exam outline.

### Q: Is AB-900 still in beta?
**A:** **NO**. AB-900 is generally available. Neither the certification page nor the exam page carries a beta designation, a full retake policy is published, and a free practice assessment is live. Scores are reported immediately rather than after a beta scoring window, and you can retake after 24 hours. Any course material referencing beta scoring delays or beta discount codes is out of date.

### Q: What is the current version of the skills measured?
**A:** **July 22, 2026**. The change log for that revision records three **Minor** changes and **ZERO** Major changes: "Identify the core objects of Microsoft 365 services", "Identify the core security features of Microsoft 365 services", and "Identify and monitor oversharing in SharePoint in Microsoft 365". Domain weights did not move.

### Q: How long is the exam and how many questions are there?
**A:** 45 minutes of exam time. Block roughly 65 minutes of seat time to cover instructions and the candidate agreement. Microsoft does **NOT** publish an AB-900-specific question count. The official statement is generic: most Microsoft certification exams typically contain between 40 and 60 questions, though the number can vary. Treat any site claiming a specific AB-900 count as restating that generic sentence.

### Q: What is the passing score?
**A:** 700 or greater, on a scale where 1000 is the maximum.

### Q: Can I look things up on Microsoft Learn during the exam?
**A:** **NO**. The in-exam Microsoft Learn resource is offered on role-based exams only, not on Fundamentals exams or Microsoft Office Specialist exams.

### Q: Does the exam cover preview features?
**A:** Mostly generally available features. Microsoft states that most questions cover features that are generally available, and that the exam may contain questions on preview features when those features are commonly used.

### Q: How should I prepare for Microsoft 365 certification exams?
**A:**
1. Complete hands-on labs in real environments
2. Use Microsoft Learn learning paths
3. Take the free official practice assessment. Microsoft notes that practice questions are not the same as exam questions and are not illustrative of exam length.
4. Try the [exam sandbox](https://aka.ms/examdemo) to get familiar with the question types. The secure browser is not enabled in the sandbox.
5. Join study groups
6. Review official documentation

### Q: How long are Microsoft certifications valid? Does AB-900 need renewal?
**A:** AB-900 needs **NO** renewal. Microsoft states plainly that Fundamentals certifications do not expire. The free annual renewal assessment applies only to associate, expert, and specialty certifications. This is a common trap, because the AB-900 study guide carries boilerplate stating that associate, expert, and specialty certifications expire annually, and learners misread it as applying to AB-900.

### Q: What happened to MS-900?
**A:** MS-900 (Microsoft 365 Fundamentals) retired March 31, 2026. AB-900 is the successor Fundamentals credential in the Microsoft 365 space. Do not present MS-900 as a currently available alternative.

## Cert Buddy Agent Questions

### Q: What is the AB-900 Cert Buddy agent?
**A:** It is a GitHub Copilot agent defined in `.github/agents/ab900-cert-buddy-agent.agent.md` that generates exam-realistic practice questions, guided scenario walkthroughs, and personalized study plans. The agent is read-only and does not modify any files in the repository.

### Q: What slash commands are available?
**A:** There are three slash commands:
1. `/ab900-practice-questions` -- Generate multiple-choice practice questions
2. `/ab900-scenario-walkthrough` -- Walk through realistic admin scenarios
3. `/ab900-study-planner` -- Generate a personalized study plan based on your confidence ratings (Strong, Moderate, Weak, or Unknown) across the three exam domains

### Q: What MCP servers does the agent use?
**A:** Three MCP servers are configured in `.vscode/mcp.json`:
- `ab900buddy-context7` -- Context7 for version-specific M365 admin PowerShell and Graph API docs
- `ab900buddy-markitdown` -- MarkItDown for converting PDFs and Office documents to Markdown
- `ab900buddy-mslearn` -- Microsoft Learn MCP (`@microsoft/learn-cli@0.1.0`) for searching and fetching official Microsoft Learn documentation

### Q: Does the agent have write access to the repository?
**A:** No. The agent is configured with read-only tools (`agent`, `codebase`, `fileSearch`) and MCP server access. It does not have `terminal` or `editFiles` tools.

### Q: What are the module docs in the docs/ directory?
**A:** Six distilled module documents (module-01 through module-06) from the AB-900T00 Microsoft Learn course serve as a local knowledge corpus. They cover security foundations, core services administration, data protection and governance, Copilot and agents, Copilot admin tasks, and agent admin tasks.

## Course Materials Questions

### Q: Are the course materials downloadable?
**A:** Yes, all materials in this repository are available under the MIT License.

### Q: Will the materials be updated?
**A:** Yes, materials are updated as Microsoft releases new features and capabilities.

### Q: Can I share these materials with my team?
**A:** Yes, under the MIT License terms. Please maintain attribution and license information.

### Q: Are the PowerShell scripts production-ready?
**A:** The scripts are educational examples. Always test thoroughly in non-production before using in production environments.

## Troubleshooting Questions

### Q: Copilot is not showing up in my apps. What should I check?
**A:** Verify:
1. License is assigned and activated (wait 24-48 hours)
2. Microsoft 365 Apps are updated to Current Channel
3. OneDrive is provisioned
4. You are signed in with the licensed account
5. Network connectivity is working

### Q: I am getting errors when running PowerShell scripts. Help?
**A:**
1. Ensure Microsoft.Graph module is installed
2. Check you have necessary admin permissions
3. Verify you are connected to Microsoft Graph
4. Review error messages for specific issues
5. Check script prerequisites

### Q: Where can I get help if I am stuck?
**A:**
1. Review course materials and documentation
2. Check Microsoft's official documentation
3. Post questions in Microsoft Tech Community
4. Open an issue in this repository
5. Contact Microsoft Support for production issues

## Additional Resources

### Q: Where can I learn more about Copilot?
**A:** These four are the documentation study resources the AB-900 study guide itself names, plus adoption and community links:
- [Microsoft 365 documentation](https://learn.microsoft.com/microsoft-365/)
- [Microsoft 365 Copilot documentation](https://learn.microsoft.com/microsoft-365/copilot/)
- [Microsoft 365 admin center help](https://learn.microsoft.com/microsoft-365/admin/)
- [Microsoft Purview documentation](https://learn.microsoft.com/purview/)
- [Copilot adoption resources](https://adoption.microsoft.com/copilot/)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/)

### Q: Are there other courses I should take?
**A:** Consider:
- Microsoft 365 administrator courses
- Power Platform training
- Azure AI fundamentals
- Security and compliance training

---

**Have a question not listed here?** Open an issue in the repository!
