# Microsoft 365 Copilot Deployment Checklist

**Last updated:** 2026-07-26

## Pre-Deployment Phase

### Technical Readiness
- [ ] Verify an eligible base subscription: Microsoft 365 E7, E5, E3, F1, F3; Business Basic, Standard, or Premium; Office 365 E5, E3, E1, or F3; or a qualifying standalone plan
- [ ] Confirm OneDrive is provisioned for all users
- [ ] Ensure Microsoft 365 Apps are up to date (Current Channel or Monthly Enterprise Channel)
- [ ] Verify Exchange Online mailboxes are active
- [ ] Confirm SharePoint sites are configured
- [ ] Test network connectivity and bandwidth
- [ ] Review firewall and proxy configurations
- [ ] If you maintain network allow lists, add `*.cloud.microsoft`, `*.static.microsoft`, and `*.usercontent.microsoft`. Microsoft is consolidating user-facing apps and admin centers onto the cloud.microsoft domain, and omitting these causes connectivity failures.

### Security and Compliance
- [ ] Review and update data governance policies
- [ ] Configure sensitivity labels, and confirm encrypted labels grant **EXTRACT** in addition to VIEW where Copilot must summarize content
- [ ] Implement DLP policies, including the **Microsoft 365 Copilot and Copilot Chat** location
- [ ] Review retention policies in Data Lifecycle Management
- [ ] Confirm unified audit logging is enabled. Copilot prompts and responses are captured automatically as part of Audit (Standard).
- [ ] Configure Conditional Access policies
- [ ] Confirm mandatory MFA posture. Microsoft enforces mandatory MFA independently of security defaults and Conditional Access, and both enforcement phases are now in force.
- [ ] Plan the passkey transition. Microsoft-provided SMS and voice retire February 1, 2027, with passkey auto-enablement beginning September 1, 2026.
- [ ] Review compliance requirements and document data handling procedures

### Oversharing remediation (do this BEFORE broad rollout)

Copilot surfaces whatever the user already has permission to see. Oversharing that was invisible becomes very visible once Copilot can summarize it.

- [ ] Run **Data access governance** reports: SharePoint admin center > **Reports** > **Data access governance**
- [ ] Review the "Site permissions across your organization" snapshot report and the "Shared with 'Everyone except external users'" activity report
- [ ] Apply **restricted access control (RAC)** where access itself must be gated to specific groups
- [ ] Apply **restricted content discovery (RCD)** where content should stay out of org-wide search and Copilot without changing permissions
- [ ] Use **Site access review** to delegate permission validation to site owners
- [ ] Check **Change history** to find the permission changes that caused the oversharing
- [ ] Do **NOT** plan around Restricted SharePoint Search. New enablement is blocked starting July 31, 2026; Microsoft directs customers to RCD.
- [ ] Confirm DAG reports will run: a Global Administrator must clear **Display concealed user, group, and site names in all reports** in the Microsoft 365 admin center Reports settings

### Licensing
- [ ] Choose the purchase model: per-user add-on, pay-as-you-go, prepaid capacity packs, or a Copilot Credit Pre-Purchase Plan
- [ ] Confirm which SKU applies. **Microsoft 365 Copilot Business** caps at 300 seats and requires a Business base plan. **Microsoft 365 E7** already includes Copilot, so E7 users need **NO** add-on.
- [ ] Note there is **NO** seat minimum. The 300-seat minimum was removed in January 2024.
- [ ] Procure Microsoft 365 Copilot licenses
- [ ] Plan license distribution strategy
- [ ] Create licensing assignment groups if using group-based licensing
- [ ] If using pay-as-you-go, create the billing policy at admin.microsoft.com > **Copilot** > **Billing & usage**. Do **NOT** use the Billing node.
- [ ] Understand that a pay-as-you-go budget **notifies only**. It does **NOT** enforce a spending cap.
- [ ] Document license management procedures

### Governance
- [ ] Establish Copilot steering committee
- [ ] Define acceptable use policies
- [ ] Create incident response plan
- [ ] Plan monitoring and reporting approach
- [ ] Identify key stakeholders
- [ ] Define success metrics and KPIs

## Pilot Phase

### Pilot Preparation
- [ ] Select pilot users (20-100 users recommended)
- [ ] Identify use cases for pilot
- [ ] Create pilot program timeline
- [ ] Develop feedback collection mechanism
- [ ] Prepare pilot user communication
- [ ] Schedule pilot kickoff meeting
- [ ] Create support process for pilot users

### Pilot Execution
- [ ] Assign Copilot licenses to pilot users
- [ ] Conduct pilot user training session
- [ ] Provide access to learning resources
- [ ] Monitor pilot user adoption
- [ ] Collect feedback regularly
- [ ] Track usage metrics
- [ ] Document issues and resolutions
- [ ] Adjust policies based on feedback

### Pilot Review
- [ ] Analyze usage data
- [ ] Review user feedback
- [ ] Document lessons learned
- [ ] Identify improvement areas
- [ ] Update training materials
- [ ] Refine deployment plan
- [ ] Present pilot results to stakeholders

## Deployment Phase

### Communication
- [ ] Create organization-wide announcement
- [ ] Develop training schedule
- [ ] Prepare FAQ documentation
- [ ] Set up support channels
- [ ] Create quick start guides
- [ ] Produce video tutorials
- [ ] Schedule awareness sessions

### Training and Enablement
- [ ] Conduct admin training
- [ ] Schedule end-user training sessions
- [ ] Provide self-service learning resources
- [ ] Create prompt engineering guides
- [ ] Establish champions program
- [ ] Develop use case library
- [ ] Create best practices documentation

### License Assignment
- [ ] Execute phased license rollout
- [ ] Monitor license activation
- [ ] Track license utilization
- [ ] Handle license assignment issues
- [ ] Document license distribution

### Technical Configuration
- [ ] Configure tenant-wide Copilot settings
- [ ] Set up **Cloud Policy service for Microsoft 365** configurations
- [ ] Configure agent settings at admin.microsoft.com > **Agents** > **Settings**: agent management rules, allowed agent types, security templates, sharing, and user access
- [ ] Set the **Allow web search in Copilot** toggle. Note this also governs whether Researcher can use web data.
- [ ] Decide on **Copilot Frontier** enrollment: Copilot > **Settings** > **View all** > **Copilot Frontier**. Default is No access.
- [ ] Establish the agent approval process at admin.microsoft.com > **Agents** > **All agents** > **Requests**. Only AI Administrator and Global Administrator can approve.
- [ ] Review MCP tool requests at **Agents** > **Tools** > **Requests**
- [ ] Set up usage reporting at admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot**
- [ ] Confirm the **Viva Insights web app** is enabled (ON by default). This governs Copilot Dashboard access; the separate admin-center control to enable the dashboard was removed

## Post-Deployment Phase

### Monitoring and Support
- [ ] Monitor usage analytics daily/weekly
- [ ] Review support tickets
- [ ] Track adoption rates
- [ ] Monitor performance issues
- [ ] Review security alerts
- [ ] Check service health regularly

### Optimization
- [ ] Analyze usage patterns
- [ ] Identify power users and champions
- [ ] Gather ongoing feedback
- [ ] Update training based on common questions
- [ ] Refine governance policies
- [ ] Optimize license assignments
- [ ] Share success stories

### Continuous Improvement
- [ ] Regular stakeholder updates
- [ ] Monthly metrics review
- [ ] Quarterly governance review
- [ ] Update documentation
- [ ] Stay informed of new features
- [ ] Plan for new capabilities rollout
- [ ] Conduct user satisfaction surveys

## Success Metrics

### Adoption Metrics
- [ ] Number of licensed users
- [ ] Percentage of active users
- [ ] Usage frequency
- [ ] Feature utilization by app
- [ ] User engagement trends

### Business Impact Metrics
- [ ] Time saved per user
- [ ] Productivity improvements
- [ ] User satisfaction scores
- [ ] ROI analysis
- [ ] Quality of outputs

### Security and Compliance Metrics
- [ ] DLP policy violations
- [ ] Audit log completeness
- [ ] Compliance score
- [ ] Security incidents
- [ ] Data governance effectiveness

## Escalation Paths

### Level 1: Self-Service
- Knowledge base articles
- Video tutorials
- User documentation
- Community forums

### Level 2: Help Desk
- IT support tickets
- Email support
- Chat support
- Phone support

### Level 3: Microsoft Support
- Critical issues
- Product bugs
- Service outages
- Feature requests

## Document Version Control

- **Version:** 2.0
- **Last Updated:** 2026-07-26
- **Owner:** [Name/Team]
- **Next Review:** [Date]

---

**Notes:**
- Customize this checklist based on your organization's needs
- Add/remove items as appropriate
- Update regularly based on Microsoft changes
- Share with deployment team
