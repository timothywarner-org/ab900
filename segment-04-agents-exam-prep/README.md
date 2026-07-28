# Segment 4: Agent Administration and Exam Success

**Duration:** 50 minutes

**Maps to AB-900 Domain 3: Perform basic administrative tasks for Copilot and agents (25-30%)**, plus exam logistics

**Last updated:** 2026-07-26 (aligned to the AB-900 skills measured as of July 22, 2026)

## Learning Objectives

By the end of this segment, you will be able to:

- Understand AI Agents and their role in Microsoft 365
- Create and manage custom agents using Copilot Studio
- Govern and secure agent deployments
- Integrate agents with Power Platform
- Apply security best practices for AI agents
- Prepare effectively for Microsoft certification exams
- Apply learned concepts to real-world scenarios

## Topics Covered

### 1. Understanding AI Agents (10 minutes)

#### What are AI Agents?
- Definition and purpose
- Agents vs. Copilot vs. traditional automation
- Autonomous vs. semi-autonomous agents
- Agent capabilities and limitations

#### The two-way taxonomy Microsoft actually documents

Microsoft documents **two** primary approaches to building agents for Microsoft 365 Copilot. Everything else is a variation on these.

| Aspect | Declarative agent | Custom engine agent |
|--------|-------------------|---------------------|
| Hosting | Hosted in Microsoft 365, nothing extra to stand up | Requires hosting outside Microsoft 365 |
| Model and orchestration | Uses Copilot's AI infrastructure, model, and orchestrator | Fully customizable, including choice of models and orchestration |
| Intended use | Individual use | Individual use and group collaboration |
| Proactive interactions | **NOT** supported; relies on user-initiated interactions | Supported; can trigger actions without direct user input |
| Compliance posture | Inherits Microsoft 365 compliance | The builder must ensure their own compliance, Responsible AI practices, and security |
| Availability | Microsoft 365 Copilot and Microsoft 365 apps such as Teams, Word, Excel, Outlook | Microsoft 365 and external apps |

#### The four creator personas

- **Users** create declarative agents in **Agent Builder** or **SharePoint**. Requires a Copilot license or a pay-as-you-go subscription, and tenant settings must permit it.
- **Makers** use **Copilot Studio** for low-code agents.
- **Developers** use the **Microsoft 365 Agents SDK** or the **Microsoft 365 Agents Toolkit** for pro-code agents.
- Both Makers and Developers can add actions, connectors, and advanced logic.

#### Naming corrections

- The low-code, in-Copilot authoring surface is **Agent Builder in Microsoft 365 Copilot**, reached via **New agent** in the Microsoft 365 Copilot app. The older "Copilot Studio lite" label survives only in Learn URL slugs. Use **Agent Builder**.
- **Power Virtual Agents** is retired branding. The product is **Microsoft Copilot Studio**.
- **Teams Toolkit** is now the **Microsoft 365 Agents Toolkit**. The admin center agent type label is **Agent Toolkit**.
- Prefer **Microsoft Foundry** over "Azure AI Studio" in agent contexts. The admin center type labels are **Foundry LOB**, **Foundry non-LOB**, and **Foundry hosted**.

#### Admin-facing agent type labels

The Microsoft 365 admin center classifies agents as: MCS DA (Copilot Studio declarative agent), MCS CEA (Copilot Studio custom engine agent), MCS BP (business process agent), Foundry LOB, Foundry non-LOB, Foundry hosted, Agent Builder, SharePoint, Agent Toolkit, and Agent instance.

The **Agent Registry** separately divides agents by publisher into four types: Microsoft agents, External partner-built agents, Published by your org (LOB agents), and Shared by creator.

#### Agent Use Cases
- Customer service automation
- IT helpdesk support
- HR inquiries and onboarding
- Knowledge base navigation
- Process automation
- Data retrieval and reporting

### 2. Copilot Studio and Agent Builder (12 minutes)

#### Copilot Studio Overview
- What is Microsoft Copilot Studio. Note the branding: **Power Virtual Agents** is retired; the product is Copilot Studio.
- Development environment, publishing, and deployment
- **Division of labor.** Agents built with Microsoft 365 Copilot tooling (Agent Builder, SharePoint) are managed primarily through the Microsoft 365 admin center. Agents built with Copilot Studio are managed through the **Power Platform admin center** for finer-grained enterprise controls. Copilot Studio agents still require Microsoft 365 admin center approval to reach the tenant-wide Microsoft 365 Copilot or Teams catalog.
- Controls that live **only** in the Power Platform admin center: DLP policies that block publishing through specific channels, Editor and Viewer sharing roles, and block-or-limit-sharing rules at the managed environment or environment group level.
- **Deprecation:** after the end of June 2026, the Copilot Studio for Teams app can no longer be used to create classic chatbots; it redirects makers to the Copilot Studio web app.

#### Creating Declarative Agents
1. **Planning the Agent**
   - Define purpose and scope
   - Identify knowledge sources
   - Design conversation flow
   - Set expectations and limitations

2. **Building in Agent Builder**
   - Instructions and persona
   - Knowledge configuration
   - Actions and skills
   - Conversation starters

3. **Testing and Refinement**
   - Test in development environment
   - Refine responses
   - Add guardrails
   - Handle edge cases

4. **Publishing and Distribution**
   - Publish to organization
   - Share with specific users
   - Publish to Teams
   - Add to SharePoint

#### Advanced Agent Features
- **Plugins** - Extend agent capabilities
- **Connectors** - Integrate with external systems
- **Generative answers** - AI-powered responses
- **Topics** - Structured conversation paths
- **Entities** - Data extraction
- **Variables** - Store and reuse information

### 3. Managing and Governing Agents (10 minutes)

#### The agent approval path

**admin.microsoft.com > Agents > All agents > Requests.** This exact path appears across current Microsoft Learn articles, and "Manage agent requests in Microsoft 365 admin center" reached general availability on July 15, 2026.

The older path "Copilot > Agents > Requested agents tab" is stale on **both** counts. The Agents workload is a top-level node now, not nested under Copilot, and the tab is named **Requests**, not "Requested agents".

Three request states appear under Requests:

| State | Admin action | Note |
|-------|--------------|------|
| **Pending review** | **Publish to store** | Starts the publishing wizard |
| **Pending update** | **Update in store** | Users keep the previous version until approved |
| **Pending activate** | Approve and activate | For agents the user wants to instantiate |

**Reject submission** is available from the ellipses next to the agent name. A fourth state, **Allow user to install**, appears when a user requests a blocked Microsoft-built agent; the admin must select **Unblock agent** first, then Approve.

**Only AI Administrator and Global Administrator** can approve requests or assign ownership. Global Reader, AI Reader, Security Administrator, Security Reader, and Reports Reader can view but cannot act.

#### The Agents workload

Four sub-pages: **Overview** (dashboard), **All agents** (Registry and Requests tabs), **Tools** (MCP server registration and approval), and **Settings**.

**Agents > Settings** contains exactly five areas: Agent management rules, Allowed agent types, Security templates, Sharing, and User access.

Exam traps in this area:
- Agents built by Microsoft remain **visible** to users even when "Allow apps and agents built by Microsoft" is disabled. Users simply cannot install them.
- Only agents built with Agent Builder are governed by the **Sharing** control, and under "No users" users can **STILL** share directly with specific individuals.
- Agent management rules support exactly two bulk actions today: **Install Microsoft agents**, and **Reassign ownerless agents created with Agent Builder to manager**. The reassignment rule works **ONLY** for Agent Builder agents.

#### Block versus remove

- **Block** prevents any user in the tenant from accessing the agent **AND** removes it from users who already installed it.
- **Uninstall/Remove** takes the agent out of inventory, but it can be re-added from the store. Admins can only remove shared agents and custom LOB agents.

**Blocking scope trap.** Blocking an agent built with Agent Builder or Copilot Studio affects availability in Microsoft 365 Copilot **and** other hosts such as Outlook and Teams. Blocking an agent built with SharePoint or Microsoft Foundry affects **only** Microsoft 365 Copilot Chat.

#### Availability versus installation

These are **independent** settings on the agent's Users tab:
- **Installed for** controls automatic pre-installation (Just me, Entire organization, Specific users/groups)
- **Available to** controls who can install and use it (No users, All users, Specific users/groups)

Installing to the entire organization installs automatically regardless of the availability scope.

#### Researcher and Analyst, restated correctly

The older course claim that these "require a separate administrative block and are NOT governed by the general agent on/off toggle" reached the right conclusion by the wrong mechanism. Microsoft's current wording: Researcher and Analyst **"are part of the core Copilot chat experience and will not fall under any agent-related settings."** They stay available in Microsoft 365 Copilot Chat under **Tools** even when agents are disabled for some or all users.

To disable one, use the **Block** action on the individual agent. The **Edit users** panel is **disabled** for Researcher and Analyst, so granular per-user assignment is not possible; blocking is tenant-wide only.

**Researcher with Computer Use** is separately governed at Agents > select Researcher > **Computer use** tab, exposing three policies: who can perform actions on behalf of users, whether Researcher can access work data, and which websites are allowed. Web search is required for Computer use.

#### Security and Compliance
- Data protection in agent interactions
- Authentication and authorization
- DLP policies for agent content
- Audit logging for agent activities
- **Information Barriers are NOT supported on embedded files.** Any user who can access the agent sees responses grounded in that embedded content.
- If **Restricted SharePoint Search** is enabled, SharePoint cannot be used as a knowledge source for a declarative agent

#### Agent risk types

The Agent Registry surfaces an "Agents at risk" card aggregating signals from Microsoft Entra, Microsoft Defender, and Microsoft Purview:

| Severity | Risk types |
|----------|------------|
| Critical | Shadow agent, No owner assigned, Excessive permissions |
| High | Security misconfiguration, Prompt injection, Sensitive data access, Conditional access violation |
| Medium | Pending approval, Operational exceptions, Compliance/retention gap |

A **Microsoft 365 E7 or Agent 365 license** is required to see the Risks column in the Registry, the Security tab, and the Activity tab details.

#### MCP tool governance

Separate from agent governance. After a developer registers a tool such as a remote MCP server, an admin reviews it at **Agents** > **Tools** > **Requests**, then selects Approve or Reject. Only AI Administrator and Global Administrator meet both requirements: page access plus the ability to grant tenant-wide consent.

### 4. Integration with Power Platform (8 minutes)

#### Power Platform Components
- **Power Apps** - Custom apps that use agents
- **Power Automate** - Workflow integration
- **Power BI** - Data visualization and reporting
- **Dataverse** - Data storage for agents

#### Integration Scenarios
- Agent triggers from Power Automate flows
- Agent calls to Power Automate actions
- Data exchange with Dataverse
- Embedding agents in Power Apps
- Using agents with Power BI reports

#### Connectors and APIs
- Microsoft Graph integration
- Custom connectors
- Pre-built connectors (SharePoint, Teams, etc.)
- RESTful API calls
- Authentication for integrations

### 5. Security Best Practices (5 minutes)

#### Agent Security Checklist
- [ ] Implement least privilege access
- [ ] Use managed identities where possible
- [ ] Enable audit logging
- [ ] Apply data classification
- [ ] Configure DLP policies
- [ ] Regular security reviews
- [ ] Monitor for anomalies
- [ ] User training on responsible AI use

#### Common Security Risks
- Prompt injection attacks
- Data leakage through agent responses
- Unauthorized access to agent capabilities
- Overprivileged agent permissions
- Lack of monitoring and auditing

#### Mitigation Strategies
- Input validation and sanitization
- Response filtering
- Rate limiting
- Authentication requirements
- Regular security assessments
- Incident response planning

### 6. Exam AB-900 Preparation (3 minutes)

#### About Microsoft AB-900
- **Certification:** Microsoft 365 Certified: Copilot and Agent Administration Fundamentals
- **Exam Code:** AB-900
- **Status: GENERALLY AVAILABLE.** AB-900 is **NOT** in beta. It exited beta on January 28, 2026, and the live pages carry no "(beta)" designation. Learners receive scores immediately and can retake after 24 hours.
- **Skills measured as of:** July 22, 2026
- **Duration:** 45 minutes of exam time. Block **65 minutes** of seat time, which includes instructions, the Candidate Agreement, and comments.
- **Passing Score:** 700 or greater, on a scale where 1000 is the maximum
- **Question count:** Microsoft publishes **NO** AB-900-specific number. The official statement is generic: most Microsoft exams typically contain between 40 and 60 questions. Present 40-60 as a Microsoft-wide typical range, not a verified AB-900 figure.
- **Language:** English only, as of July 22, 2026
- **Delivery:** Pearson VUE, or Certiport for students and educators. Proctored, and may have interactive components.
- **Renewal: NOT required.** Microsoft states "Fundamentals certifications do not expire." The study guide's boilerplate renewal row about associate, expert, and specialty certifications expiring annually does **NOT** apply to AB-900. This is a genuine exam trap.
- **Microsoft Learn during the exam: NOT available.** The in-exam Learn resource is offered only on role-based exams, not Fundamentals. Correct any material implying learners can look things up.
- **Breaks:** unscheduled breaks are allowed, but the clock keeps running and you cannot return to any question viewed before the break.
- **Scope rule (verbatim):** "Most questions cover features that are general availability (GA). The exam may contain questions on Preview features if those features are commonly used."
- **Exam Page:** https://learn.microsoft.com/credentials/certifications/copilot-and-agent-administration-fundamentals/
- **Study Guide:** https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900
- **Free practice assessment:** live on Microsoft Learn. See the practice assessments availability table.
- **Exam sandbox:** https://aka.ms/examdemo

#### Related Certifications
  - MS-102: Microsoft 365 Administrator
  - SC-300: Microsoft Identity and Access Administrator
  - SC-400: Microsoft Information Protection Administrator
  - AI-900: Microsoft Azure AI Fundamentals
  - PL-200: Power Platform Functional Consultant

  Note: **MS-900 retired March 31, 2026.** AB-900 is the successor Fundamentals credential in the Microsoft 365 space. Do **NOT** present MS-900 as a currently available option.

#### Study Strategies
- Hands-on practice is essential
- Understand concepts, not just memorization
- Use Microsoft Learn learning paths
- Practice with official practice tests
- Join study groups and communities
- Review Microsoft documentation
- Lab environment practice

### 7. Real-World Scenarios and Case Studies (2 minutes)

#### Case Study 1: IT Helpdesk Agent
- Automated password resets
- FAQ responses
- Ticket routing
- Knowledge base integration

#### Case Study 2: HR Onboarding Agent
- Answer policy questions
- Guide new employees
- Provide resources
- Track onboarding progress

#### Case Study 3: Sales Assistant Agent
- Product information lookup
- Quote generation
- CRM integration
- Lead qualification

## Hands-On Labs

### Lab 4.1: Create Your First Declarative Agent
**Objective:** Build a simple FAQ agent using Copilot Studio

**Steps:**
1. Access Copilot Studio
2. Create a new agent
3. Define agent name and description
4. Add instructions for agent behavior
5. Configure knowledge sources (upload FAQs)
6. Add conversation starters
7. Test the agent
8. Refine responses based on testing
9. Publish to Teams

### Lab 4.2: Build an Advanced Agent with Actions
**Objective:** Create an agent that performs actions using plugins

**Steps:**
1. Create new agent in Copilot Studio
2. Define agent persona and capabilities
3. Add a Power Automate flow as an action
4. Configure parameters for the action
5. Test action invocation
6. Handle action responses
7. Add error handling
8. Deploy to organization

### Lab 4.3: Configure Agent Governance
**Objective:** Implement governance controls for agents

**Steps:**
1. Access Power Platform admin center
2. Review agent creation policies
3. Configure user permissions
4. Set up approval workflows
5. Enable audit logging
6. Create DLP policy for agents
7. Monitor agent usage
8. Review compliance reports

### Lab 4.4: Integrate Agent with Power Automate
**Objective:** Create a workflow that uses an agent

**Steps:**
1. Open Power Automate
2. Create new automated flow
3. Add trigger (e.g., form submission)
4. Add agent action
5. Pass parameters to agent
6. Process agent response
7. Send notification with results
8. Test end-to-end flow

### Lab 4.5: Security Hardening for Agents
**Objective:** Apply security best practices to an agent

**Steps:**
1. Review agent permissions
2. Implement authentication requirements
3. Configure data loss prevention
4. Apply sensitivity labels
5. Enable detailed logging
6. Test security controls
7. Document security configuration
8. Create incident response plan

### Lab 4.6: Agent Analytics and Optimization
**Objective:** Monitor and improve agent performance

**Steps:**
1. Access agent analytics dashboard
2. Review conversation metrics
3. Identify common queries
4. Analyze success vs. escalation rate
5. Review user satisfaction scores
6. Identify improvement areas
7. Update agent knowledge
8. A/B test improvements

## Demonstrations

### Demo 1: Agent Builder Walkthrough
- Creating an agent from scratch
- Adding knowledge sources
- Configuring actions
- Testing and debugging
- Publishing process

### Demo 2: Enterprise Agent Deployment
- Governance workflow
- Approval process
- Distribution to users
- Monitoring and management

### Demo 3: Power Platform Integration
- Agent + Power Automate scenario
- Agent + Power Apps scenario
- Data flow demonstration
- End-to-end solution

### Demo 4: Security and Compliance
- Implementing security controls
- DLP policy application
- Audit log review
- Incident investigation

## Key Takeaways

1. **Agents Extend Copilot** - Customize AI for specific organizational needs
2. **Governance is Critical** - Control who can create and use agents
3. **Start Simple** - Begin with declarative agents before advanced scenarios
4. **Security First** - Apply security controls from the beginning
5. **Monitor and Iterate** - Use analytics to continuously improve agents
6. **Integration Amplifies Value** - Combine agents with Power Platform
7. **User Training Essential** - Educate users on effective agent interaction
8. **Responsible AI** - Consider ethical implications and bias

## Agent Development Best Practices

### Design Principles
- Clear purpose and scope
- Well-defined persona
- Comprehensive knowledge base
- Graceful failure handling
- Escalation paths for complex queries
- User-friendly conversation flow
- Transparent AI limitations

### Testing Checklist
- [ ] Test with expected queries
- [ ] Test with edge cases
- [ ] Test with invalid inputs
- [ ] Test error handling
- [ ] Test escalation paths
- [ ] Test performance under load
- [ ] Test security controls
- [ ] User acceptance testing

### Maintenance Plan
- Regular knowledge base updates
- Performance monitoring
- User feedback incorporation
- Security patch application
- Compliance reviews
- Version control
- Documentation updates

## Exam Preparation Resources

### Study Materials
- Microsoft Learn learning paths
- Official Microsoft documentation
- Hands-on lab environments
- Practice exams and assessments
- Video training series
- Study guides and books

### Practice Areas
- Microsoft 365 architecture
- Identity and access management
- Security and compliance
- Copilot deployment and management
- Agent development and governance
- Troubleshooting scenarios

### Exam Tips
- Read questions carefully
- Eliminate obviously wrong answers
- Watch for "EXCEPT" or "NOT" questions
- Manage your time effectively
- Review marked questions
- Trust your first instinct
- Stay calm and focused

## Additional Resources

### Documentation
- [Agents overview: declarative versus custom engine](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agents-overview)
- [Agent Builder in Microsoft 365 Copilot](https://learn.microsoft.com/microsoft-365/copilot/extensibility/agent-builder)
- [Manage agent requests](https://learn.microsoft.com/microsoft-365/admin/manage/agent-requests)
- [Agent registry](https://learn.microsoft.com/microsoft-365/admin/manage/agent-registry)
- [Agent settings](https://learn.microsoft.com/microsoft-365/admin/manage/agent-settings)
- [Microsoft Copilot Studio documentation](https://learn.microsoft.com/microsoft-copilot-studio/)
- [Microsoft 365 Copilot extensibility](https://learn.microsoft.com/microsoft-365/copilot/extensibility/)
- [Power Platform documentation](https://learn.microsoft.com/power-platform/)
- [Responsible AI Guidelines](https://www.microsoft.com/ai/responsible-ai)

### Tools
- [Copilot Studio](https://copilotstudio.microsoft.com/)
- [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/)
- [Power Automate](https://make.powerautomate.com/)
- [Microsoft Learn](https://learn.microsoft.com/)

### Community
- [Power Platform Community](https://powerusers.microsoft.com/)
- [Copilot Studio Community](https://powerusers.microsoft.com/t5/Microsoft-Copilot-Studio/ct-p/PVACommunity)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/)

### Certification
- [Microsoft Certification Overview](https://learn.microsoft.com/certifications/)
- [Exam Registration](https://examregistration.microsoft.com/)
- [Practice Assessments](https://learn.microsoft.com/certifications/practice-assessments-for-microsoft-certifications)

## Real-World Implementation Roadmap

### Phase 1: Foundation (Weeks 1-2)
- Complete prerequisites training
- Set up development environment
- Create pilot agent
- Test with small user group

### Phase 2: Pilot (Weeks 3-4)
- Deploy to pilot users
- Gather feedback
- Refine agent capabilities
- Document lessons learned

### Phase 3: Scale (Weeks 5-8)
- Deploy to broader audience
- Monitor usage and performance
- Provide user training
- Optimize based on analytics

### Phase 4: Optimize (Ongoing)
- Regular updates and improvements
- Add new capabilities
- Expand to additional use cases
- Share best practices

## Q&A Notes

Use this section to capture questions and answers from the live session:

---

## Course Wrap-Up

### What We have Covered
1. **Segment 1:** Microsoft 365 foundations and core services
2. **Segment 2:** Data protection, governance, and compliance
3. **Segment 3:** Copilot features, deployment, and administration
4. **Segment 4:** AI Agents, advanced scenarios, and exam preparation

### Next Steps for Your Journey
- [ ] Complete hands-on labs in your environment
- [ ] Review all course materials
- [ ] Practice in lab environment
- [ ] Join Microsoft communities
- [ ] Stay updated on new features
- [ ] Consider certification path
- [ ] Implement in your organization
- [ ] Share knowledge with colleagues

### Stay Connected
- Follow Microsoft 365 blogs and announcements
- Join relevant LinkedIn groups
- Attend Microsoft events and webinars
- Participate in user groups
- Contribute to communities

### Feedback
We value your feedback! Please share your thoughts on:
- Course content and structure
- Lab exercises
- Demonstrations
- Pace and delivery
- Suggestions for improvement

---

**Thank you for participating in this O'Reilly Live Learning course!**

For questions or follow-up, please reach out through the repository issues or contact the instructor directly.
