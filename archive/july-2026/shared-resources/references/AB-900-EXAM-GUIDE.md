# AB-900: Microsoft 365 Copilot and Agent Administration Fundamentals - Complete Exam Guide

## Exam Overview

**Official Title:** Microsoft 365 Certified: Copilot and Agent Administration Fundamentals

**Exam Code:** AB-900

**Status:** Generally available. AB-900 is **NOT** a beta exam. It carried a "(beta)" designation during its late-2025 beta window and exited beta status in January 2026. Scores are delivered at the end of the exam, not weeks later.

**Skills measured version:** July 22, 2026

**Duration:** 45 minutes of exam time. Fundamentals exams carry a 65-minute seat duration, which includes reviewing instructions, accepting the Candidate Agreement, answering questions, and leaving comments. Block 65 minutes; work the 45-minute clock.

**Passing Score:** 700 or greater, on a scale where 1000 is the maximum

**Question Count:** Microsoft does **NOT** publish an AB-900-specific question count. The official Microsoft-wide statement is that most Microsoft Certification exams typically contain between 40 and 60 questions, and that the number can vary by exam. Treat 40-60 as a general range, not a verified AB-900 figure. Third-party sites asserting "AB-900 has 40-60 questions" are restating that same generic sentence.

**Format:** Proctored exam that may have interactive components

**Language:** English only, as of July 22, 2026. If the exam is not available in your preferred language, you can request an additional 30 minutes.

**Delivery:** Schedule through Pearson VUE, or through Certiport if you are a student or an educator

**Cost:** Price is based on the country or region in which the exam is proctored. Microsoft publishes no single global price on the exam page.

**Retake policy:** If you fail, you can retake the exam 24 hours after the first attempt. Wait times increase for subsequent retakes.

**Renewal:** **NOT** required. Fundamentals certifications do not expire. The study guide's boilerplate renewal row states that Microsoft associate, expert, and specialty certifications expire annually. That row does not apply to AB-900, and misreading it is a common learner error.

**Microsoft Learn during the exam:** **NOT** available. The in-exam Microsoft Learn resource is offered only on role-based exams, not on Fundamentals or Microsoft Office Specialist exams. Plan to answer from knowledge.

**Breaks:** Unscheduled breaks are allowed, but the exam clock keeps running and you cannot return to any question you viewed before the break. Five minutes of break time is built into the exam duration, with questions removed to accommodate it.

**Exam scope rule (verbatim from the study guide):** "Most questions cover features that are general availability (GA). The exam may contain questions on Preview features if those features are commonly used."

## What This Certification Validates

This certification demonstrates your ability to:

- **Support, secure, and protect** an AI-enabled Microsoft 365 environment
- Work with Microsoft 365 core services including Exchange Online, SharePoint in Microsoft 365, Microsoft Teams, Microsoft Entra, and Microsoft Purview
- Implement core security features including authentication and conditional access
- Manage and administer Microsoft 365 Copilot and agents
- Apply modern IT management practices

## Exam Skills Measured

The authoritative, verbatim skills-measured list is maintained in `references/ab900-objectives.md` in this repository. The breakdown below is a teaching expansion of those objectives, not a substitute for them. Where the two disagree, the objectives file wins.

### Skills at a glance

| Domain | Skill area | Weight |
|--------|-----------|--------|
| Domain 1 | Identify the core features and objects of Microsoft 365 services | 30-35% |
| Domain 2 | Understand data protection and governance tasks for Microsoft 365 and Copilot | 35-40% |
| Domain 3 | Perform basic administrative tasks for Copilot and agents | 25-30% |

### What changed on July 22, 2026

Microsoft's change log for this refresh lists three subsections as **Minor** and **NO** subsections as Major. Domain weights were unchanged.

| Skill area | Change |
|-----------|--------|
| Audience profile | No change |
| Identify the core objects of Microsoft 365 services | Minor |
| Identify the core security features of Microsoft 365 services | Minor |
| Identify and monitor oversharing in SharePoint in Microsoft 365 | Minor |

Wording drift most likely to appear in refreshed items:

- **Exchange admin center** (not "Exchange Online admin center") and **distribution groups** (not "distribution lists") in the Domain 1 objects bullet
- **SharePoint admin center** (not "SharePoint in Microsoft 365 admin center"). The phrase "SharePoint in Microsoft 365" is still correct when it names the service
- **Microsoft Entra ID** in the Domain 1 security bullets
- **restricted access control** (not "restricted site access") in the SharePoint Advanced Management bullet
- **Microsoft Purview Data Explorer** in the sensitive-information bullet. The older tool is now labeled "Content Explorer (classic)"
- **Content search in Microsoft Purview eDiscovery**, not Content search as a standalone solution

### Domain 1: Core Microsoft 365 Features and Objects (30-35%)

#### License Management

- Understand how license assignment impacts feature access
- Assign and manage user licenses
- Monitor license usage and availability
- Understand Copilot licensing requirements (monthly and pay-as-you-go)

#### Microsoft 365 Admin Center

- Navigate and configure settings through the admin center
- Manage user accounts and groups
- Monitor service health
- Configure organizational settings

#### Exchange Administration

- Manage mailboxes (user, shared, resource)
- Create and manage distribution groups (Microsoft also uses the term "distribution lists"; the Exchange admin center tab label is **Distribution list**)
- Configure mail flow and transport rules
- Manage calendar permissions

#### SharePoint Administration

- Create and manage SharePoint sites
- Configure site permissions and sharing settings
- Manage site collections
- Implement SharePoint Advanced Management features
- Remediate oversharing issues

#### Microsoft Teams Administration

- Configure Teams policies and settings
- Manage team creation and membership
- Control app permissions
- Configure meeting policies

#### Zero Trust Security

- Understand Zero Trust principles
- Implement "never trust, always verify" methodology
- Apply least privilege access
- Use explicit verification

#### Microsoft Entra ID Features

- Manage user identities and authentication
- Configure conditional access policies
- Implement multifactor authentication (MFA)
- Set up single sign-on (SSO)
- Manage Privileged Identity Management (PIM) roles
- Understand eligible versus active role assignments
- Configure just-in-time access
- Interpret Identity Secure Score
- Understand App registrations versus Enterprise applications

### Domain 2: Data Protection and Governance (35-40%)

#### Microsoft Purview Capabilities

- **Microsoft Purview Information Protection**
  - Create and apply sensitivity labels
  - Configure label policies
  - Implement automatic labeling
  - Manage encryption and access controls

- **Microsoft Purview Data Loss Prevention (DLP)**
  - Create DLP policies
  - Configure policy rules and conditions
  - Set up alerts and notifications
  - Monitor DLP reports
  - Respond to DLP alerts

- **Microsoft Purview Insider Risk Management**
  - Understand insider risk scenarios
  - Configure insider risk policies
  - Investigate insider risk alerts
  - Manage risk cases

- **Microsoft Purview Communication Compliance**
  - Set up communication compliance policies
  - Monitor organizational communications
  - Review and resolve compliance violations
  - Manage policy violations

- **Microsoft Purview Data Security Posture Management (DSPM) for AI**
  - Assess data security posture for AI usage
  - Identify security gaps
  - Implement security recommendations
  - Monitor security improvements

- **Microsoft Purview Data Lifecycle Management**
  - Retention policies and retention labels
  - Retention for Copilot prompts and responses

#### Copilot Data Access and Permissions

- Understand how Copilot accesses organizational data
- Configure Copilot data grounding settings
- Manage permissions for Copilot interactions
- Control web search in Copilot
- Implement data boundaries

#### Compliance Manager

- Navigate the Compliance Manager interface
- Identify compliance risks
- Understand compliance score
- Use improvement actions
- Create and manage assessments
- Monitor compliance posture

#### Sensitive Data Discovery

- Use **Data explorer** (the current tool named in the July 22, 2026 objectives)
- Use Activity explorer
- Search for sensitive information
- Classify data automatically
- Create custom sensitive information types

#### SharePoint Oversharing Remediation

- Identify overshared content
- Use data access governance reports in the SharePoint admin center
- Implement **restricted access control (RAC)**
- Understand **restricted content discovery (RCD)** as the current recommendation for hiding site content from organization-wide search and Copilot
- Conduct site access reviews

### Domain 3: Copilot and Agent Administration (25-30%)

#### Licensing Models

- **Monthly subscription** versus **pay-as-you-go** billing, including SharePoint pay-as-you-go
- Understand license prerequisites and eligible base plans
- Assign Copilot licenses to users
- Manage billing policies
- Monitor consumption

#### Feature Management

- Enable and disable Copilot features
- Configure Copilot settings in the Microsoft 365 admin center
- Manage web search capabilities
- Control agent access
- Set data sharing preferences

#### Agent Types and Use Cases

- **Researcher** - deep, multi-step research combining work data, Copilot connectors, and web data
- **Analyst** - advanced data analysis using chain-of-thought reasoning, better suited than Researcher for Excel work
- **Custom agents** - organization-specific scenarios
- **Declarative agents** - built on Copilot's own model and orchestrator, hosted in Microsoft 365
- **Custom engine agents** - fully customized, hosted outside Microsoft 365, with the builder responsible for compliance and security

#### License Assignment Procedures

- Assign licenses individually
- Assign licenses to groups
- Use PowerShell for bulk assignment
- Verify license status

#### Billing Policy Management

- Configure pay-as-you-go billing
- Set budgets and monitor usage
- Generate billing and credits reports

#### Usage Monitoring and Adoption Metrics

- Use the Microsoft 365 admin center readiness and usage reports
- Access the Copilot Dashboard in Viva Insights
- Track readiness metrics (licenses, activation, active users)
- Monitor adoption across apps
- Collect sentiment data
- Identify usage patterns

#### Prompt Management

- Manage prompts, including saving, sharing, scheduling, and deleting
- Understand prompt engineering best practices
- Manage prompt libraries

#### Agent Creation and Configuration

- Create declarative agents in Agent Builder, SharePoint, or Copilot Studio
- Configure agent instructions and persona
- Add knowledge sources to agents
- Configure agent actions
- Set starter prompts
- Test agents before publishing

#### Agent Approval Processes

- Review and approve agent requests
- Set agent access and sharing scope
- Manage agent permissions
- Control agent distribution
- Monitor agent usage and lifecycle

## Official Study Resources

### Primary Resources

#### Official Exam Page

- **URL:** <https://learn.microsoft.com/en-us/credentials/certifications/exams/ab-900/>
- Exam overview, preparation paths, and registration

#### Official Study Guide

- **URL:** <https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900>
- Short link: <https://aka.ms/ab900-StudyGuide>
- Detailed breakdown of all exam objectives with percentages, plus the change log

#### Certification Page

- **URL:** <https://learn.microsoft.com/en-us/credentials/certifications/copilot-and-agent-administration-fundamentals/>
- Overview of the certification, exam policy, and language availability

#### Official Practice Assessment

- **URL:** <https://learn.microsoft.com/en-us/credentials/certifications/copilot-and-agent-administration-fundamentals/practice/assessment?assessment-type=practice&assessmentId=428463062&practice-assessment-type=certification>
- Free, and live on Microsoft Learn. Microsoft notes that practice assessment questions are not the same as exam questions and are not illustrative of exam length.

#### Exam Sandbox

- **URL:** <https://aka.ms/examdemo> or <https://go.microsoft.com/fwlink/?linkid=2226877>
- Interact with the real exam question types and UI. The secure browser is **NOT** enabled in the sandbox.

### Official Documentation

The study guide names four documentation sets:

- **Microsoft 365 documentation:** <https://learn.microsoft.com/microsoft-365/>
- **Microsoft 365 Copilot service description:** <https://learn.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/microsoft-365-copilot>
- **Microsoft 365 admin center help:** <https://learn.microsoft.com/microsoft-365/admin/>
- **Microsoft Purview documentation:** <https://learn.microsoft.com/purview/>

Additional documentation worth reading for each domain:

#### Microsoft 365 Copilot

- **Copilot documentation hub:** <https://learn.microsoft.com/microsoft-365/copilot/>
- **Copilot licensing:** <https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing>
- **Copilot pay-as-you-go overview:** <https://learn.microsoft.com/microsoft-365/copilot/pay-as-you-go/overview>
- **Copilot reports for admins:** <https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-reports-for-admins>

#### Microsoft Purview

- **Purview overview:** <https://learn.microsoft.com/purview/purview>
- **Compliance Manager:** <https://learn.microsoft.com/purview/compliance-manager>
- **Data Security Posture Management:** <https://learn.microsoft.com/purview/data-security-posture-management-learn-about>
- **Purview and Microsoft 365 Copilot:** <https://learn.microsoft.com/purview/ai-m365-copilot>
- **eDiscovery:** <https://learn.microsoft.com/purview/ediscovery>

#### Microsoft Entra ID

- **Entra ID overview:** <https://learn.microsoft.com/entra/fundamentals/whatis>
- **Conditional Access:** <https://learn.microsoft.com/entra/identity/conditional-access/overview>
- **Identity Secure Score:** <https://learn.microsoft.com/entra/identity/monitoring-health/concept-identity-secure-score>
- **Privileged Identity Management:** <https://learn.microsoft.com/entra/id-governance/privileged-identity-management/pim-configure>

#### SharePoint

- **SharePoint Advanced Management:** <https://learn.microsoft.com/sharepoint/advanced-management>
- **Data access governance reports:** <https://learn.microsoft.com/sharepoint/data-access-governance-reports>
- **Restricted access control:** <https://learn.microsoft.com/sharepoint/restricted-access-control>
- **Restricted content discovery:** <https://learn.microsoft.com/sharepoint/restricted-content-discovery>

#### Microsoft Teams and Exchange

- **Teams administration:** <https://learn.microsoft.com/microsoftteams/manage-teams-in-modern-portal>
- **Exchange admin center:** <https://learn.microsoft.com/exchange/features-in-new-eac>
- **Manage distribution groups:** <https://learn.microsoft.com/exchange/recipients-in-exchange-online/manage-distribution-groups/manage-distribution-groups>

#### Agents and Extensibility

- **Agents overview:** <https://learn.microsoft.com/microsoft-365/copilot/extensibility/agents-overview>
- **Agent Builder:** <https://learn.microsoft.com/microsoft-365/copilot/extensibility/agent-builder>
- **Agent requests and approval:** <https://learn.microsoft.com/microsoft-365/admin/manage/agent-requests>
- **Agent registry:** <https://learn.microsoft.com/microsoft-365/admin/manage/agent-registry>

#### Monitoring and Analytics

- **Copilot usage report:** <https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-usage>
- **Copilot Credits report:** <https://learn.microsoft.com/microsoft-365/admin/activity-reports/microsoft-365-copilot-credits>
- **Copilot Analytics:** <https://learn.microsoft.com/viva/insights/copilot-analytics-introduction>

## Practice Resources

### Official Practice Assessment

- **Status:** Live. Free on Microsoft Learn, assessment ID 428463062.
- Microsoft notes that practice assessment questions are not the same as exam questions and are not illustrative of exam length.

### Exam Sandbox

- **URL:** <https://aka.ms/examdemo>
- Demo environment for the exam interface and question types
- The secure browser is **NOT** enabled in the sandbox

### Hands-On Lab Environments

- **Microsoft 365 trial or developer tenant** for admin center practice
- **Microsoft Learn sandbox** environments included with many training modules

### Community Resources

- **Microsoft 365 Copilot community hub:** <https://techcommunity.microsoft.com/category/microsoft365copilot>
- **Microsoft 365 community hub:** <https://techcommunity.microsoft.com/category/microsoft365>
- **Microsoft 365 Community (PnP):** <https://aka.ms/m365pnp>

## Study Plan

### Phase 1: Foundation (Weeks 1-2)

**Focus:** Domain 1 - Core Microsoft 365 features and objects

- [ ] Review Microsoft 365 architecture
- [ ] Study Exchange administration (mailboxes, distribution groups)
- [ ] Learn SharePoint administration (sites, libraries, folders, roles)
- [ ] Understand Teams administration (teams, channels, policies)
- [ ] Master license management
- [ ] Practice in the Microsoft 365 admin center
- [ ] Complete Microsoft Entra ID training
- [ ] Understand Zero Trust principles
- [ ] Study conditional access policies
- [ ] Learn Privileged Identity Management
- [ ] Interpret Identity Secure Score
- [ ] Distinguish App registrations from Enterprise applications

### Phase 2: Data Protection (Weeks 3-4)

**Focus:** Domain 2 - Data protection and governance. This is the heaviest domain.

- [ ] Study the Microsoft Purview portal layout
- [ ] Learn Information Protection and sensitivity labels
- [ ] Master DLP policy creation, including the Microsoft 365 Copilot and Copilot Chat location
- [ ] Understand Insider Risk Management
- [ ] Study Communication Compliance, including Copilot interaction detection
- [ ] Learn Compliance Manager
- [ ] Practice sensitive data discovery in Data explorer and Activity explorer
- [ ] Study SharePoint Advanced Management
- [ ] Learn oversharing remediation: data access governance reports, restricted access control, restricted content discovery
- [ ] Understand how Copilot accesses data and how permissions constrain it
- [ ] Learn Content search inside Microsoft Purview eDiscovery

### Phase 3: Copilot Administration (Weeks 5-6)

**Focus:** Domain 3 - Copilot administration

- [ ] Study Copilot architecture and capabilities
- [ ] Learn Copilot licensing models, monthly versus pay-as-you-go
- [ ] Practice license assignment
- [ ] Configure Copilot settings
- [ ] Study billing policy management and budgets
- [ ] Learn usage monitoring across the admin center and Viva Insights
- [ ] Understand prompt management: saving, sharing, scheduling, deleting
- [ ] Study Copilot security and governance

### Phase 4: Agents (Week 7)

**Focus:** Agent creation, approval, and governance

- [ ] Understand agent types (Researcher, Analyst, declarative, custom engine, custom)
- [ ] Learn agent creation in Agent Builder, SharePoint, and Copilot Studio
- [ ] Study the agent approval workflow in the Microsoft 365 admin center
- [ ] Configure agent access and sharing settings
- [ ] Monitor agent usage and lifecycle
- [ ] Understand the split between the Microsoft 365 admin center and the Microsoft Power Platform admin center

### Phase 5: Review and Practice (Week 8)

**Focus:** Comprehensive review and exam preparation

- [ ] Review all three domains
- [ ] Take the official practice assessment
- [ ] Revisit weak areas
- [ ] Practice hands-on scenarios
- [ ] Run the exam sandbox to get familiar with question types
- [ ] Time yourself on practice questions
- [ ] Schedule the exam

## Exam Tips and Strategies

### Before the Exam

1. **Hands-on practice is essential.** This exam tests practical knowledge of admin centers.
2. **Use the study guide.** Focus on the official objectives, verbatim.
3. **Practice in a real tenant.** Portal navigation questions reward muscle memory.
4. **Understand concepts, not just facts.** Know the reasoning behind configurations.
5. **Review all three domains.** Domain 2 is the heaviest at 35-40%, but Domain 1 at 30-35% is close behind.
6. **Do not count on looking things up.** Microsoft Learn access during the exam is not offered on Fundamentals exams.

### During the Exam

1. **Read questions carefully.** Watch for negatives such as EXCEPT, NOT, and LEAST.
2. **Manage your time.** 45 minutes goes quickly.
3. **Eliminate wrong answers.** Narrow the field before committing.
4. **Mark questions for review.** Come back if unsure.
5. **Look for scenario details.** The stem usually names the deciding constraint.
6. **Remember break rules.** If you take an unscheduled break, the clock keeps running and you cannot return to any question you already viewed.

### Question Types to Expect

- **Multiple choice** - single correct answer
- **Multiple response** - multiple correct answers
- **Interactive components** - the exam policy states the exam may have interactive components
- **Drag and drop** - ordering or matching
- **Case studies** - multi-question scenarios

Use the exam sandbox to see the real question types rather than guessing at the format.

### Key Areas to Master

- License assignment and management, including Copilot prerequisites
- DLP policy creation, including the Copilot location
- Sensitivity label configuration and how labels constrain Copilot
- Copilot deployment and billing configuration
- Agent creation, approval, and access control
- Security and compliance features across Purview
- Admin center navigation
- Troubleshooting common sign-in issues

## Common Pitfalls to Avoid

1. **Confusing Copilot licensing.** Know the prerequisites and the add-on model. There is **NO** 300-seat minimum; the only 300-seat number is a maximum on the SMB SKUs.
2. **Overlooking permissions.** Know which admin role each task requires.
3. **Misunderstanding DLP versus sensitivity labels.** Know when to use each.
4. **Mixing up agent types.** Researcher, Analyst, declarative, custom engine, and custom agents each have distinct scopes.
5. **Ignoring prerequisites.** Know what is required before Copilot deployment.
6. **Not understanding data grounding.** Copilot honors existing permissions; it does not grant new access.
7. **Overlooking Compliance Manager.** Know its role in risk identification.
8. **Assuming a pay-as-you-go budget blocks spending.** A budget triggers email notifications only. Usage continues after the budget is exceeded.
9. **Assuming AB-900 needs renewal.** Fundamentals certifications do not expire.
10. **Using retired portal names.** compliance.microsoft.com is retired. Classic Content Search, classic eDiscovery (Standard), and classic eDiscovery (Premium) all retired on August 31, 2025.

## Post-Exam

### If You Pass

- Certificate is available in your Microsoft Learn profile
- Share on LinkedIn and your resume
- Join the Microsoft Certified community
- Consider follow-on certifications (see below)

### If You Do Not Pass

- Review the score report to identify weak areas
- Focus study on those domains
- Get more hands-on practice in a tenant
- You can retake 24 hours after the first attempt; wait times increase for later retakes

## Next Steps After Certification

### Related Certifications

- **MS-102:** Microsoft 365 Administrator
- **SC-300:** Microsoft Identity and Access Administrator
- **SC-400:** Microsoft Information Protection Administrator
- **PL-200:** Microsoft Power Platform Functional Consultant
- **AI-900:** Microsoft Azure AI Fundamentals

**Note on MS-900:** Microsoft 365 Fundamentals (MS-900) retired March 31, 2026. AB-900 is the successor Fundamentals credential in the Microsoft 365 space. Do **NOT** plan on MS-900 as an alternative.

### Continuing Education

- Stay current on Copilot and agent release notes
- Join Microsoft 365 community events
- Follow the Microsoft 365 Copilot community hub
- Participate in user groups

## Additional Resources

### Blogs and News

- **Microsoft 365 blog:** <https://www.microsoft.com/en-us/microsoft-365/blog/>
- **Microsoft 365 Copilot release notes:** <https://learn.microsoft.com/microsoft-365/copilot/release-notes>
- **Microsoft 365 Copilot community hub:** <https://techcommunity.microsoft.com/category/microsoft365copilot>
- **Microsoft Mechanics:** <https://techcommunity.microsoft.com/t5/microsoft-mechanics-blog/bg-p/MicrosoftMechanicsBlog>

### Tools for Practice

| Portal | URL |
|--------|-----|
| Microsoft 365 admin center | <https://admin.microsoft.com> |
| Microsoft Entra admin center | <https://entra.microsoft.com> |
| Microsoft Purview portal | <https://purview.microsoft.com> |
| Microsoft Defender portal | <https://security.microsoft.com> |
| SharePoint admin center | <https://admin.microsoft.com/sharepoint> |
| Teams admin center | <https://admin.teams.microsoft.com> |
| Exchange admin center | <https://admin.exchange.microsoft.com> |
| Copilot Studio | <https://copilotstudio.microsoft.com> |
| Power Platform admin center | <https://admin.powerplatform.microsoft.com> |

## Quick Reference Tables

### Admin Centers Overview

| Admin Center | URL | Primary Purpose |
|--------------|-----|----------------|
| Microsoft 365 | admin.microsoft.com | General Microsoft 365 administration, Copilot, and Agents |
| Microsoft Entra | entra.microsoft.com | Identity and access management |
| Microsoft Purview | purview.microsoft.com | Data security, governance, and compliance |
| Microsoft Defender | security.microsoft.com | Threat protection and Microsoft Defender XDR |
| SharePoint | admin.microsoft.com/sharepoint | SharePoint administration and oversharing reports |
| Teams | admin.teams.microsoft.com | Teams policies and settings |
| Exchange | admin.exchange.microsoft.com | Exchange Online management |
| Power Platform | admin.powerplatform.microsoft.com | Copilot Studio agent governance |

**Retired, do NOT use:** compliance.microsoft.com (Microsoft Purview compliance portal) and protection.office.com (Office 365 Security and Compliance Center). Use purview.microsoft.com and security.microsoft.com.

**Also current:** admin.cloud.microsoft resolves to the Microsoft 365 admin center. Microsoft is consolidating user-facing services onto the cloud.microsoft domain, and current Learn procedures increasingly link that host.

### Copilot Licensing Prerequisites

Microsoft 365 Copilot is an add-on that requires a qualifying base subscription. Eligible base plans include, among others:

| Base plan family | Copilot add-on eligibility |
|-----------------|---------------------------|
| Microsoft 365 E7 | Includes Microsoft 365 Copilot in the base SKU, no add-on needed |
| Microsoft 365 E5 | Eligible |
| Microsoft 365 E3 | Eligible |
| Microsoft 365 F1 / F3 | Eligible |
| Microsoft 365 Business Basic / Standard / Premium | Eligible |
| Microsoft 365 Apps for business / enterprise | Eligible |
| Office 365 E5 / E3 / E1 / F3 | Eligible |
| Microsoft Teams Essentials / Enterprise | Eligible |
| Exchange, SharePoint, OneDrive standalone plans | Eligible |

**Microsoft 365 E7** (the Frontier Suite) became generally available on May 1, 2026 and equals E5 plus Microsoft 365 Copilot plus Microsoft Entra Suite plus Agent 365. E7 customers do **NOT** buy the Copilot add-on separately.

**Microsoft 365 Copilot Business** is a separate SMB add-on requiring a Microsoft 365 Business Basic, Business Standard, Business Premium, or Microsoft 365 Apps for Business plan. It supports a **maximum** of 300 seats per tenant and delivers the same capabilities as the enterprise Microsoft 365 Copilot offering.

**Microsoft 365 Copilot Chat** is included at no additional cost with an eligible Microsoft 365 subscription. Web-based chat is free; work-based chat grounded in tenant data requires a Microsoft 365 Copilot license or pay-as-you-go.

**Seat minimum:** there is none. Microsoft removed the original 300-seat minimum in January 2024. Teaching a 300-seat minimum today is flatly wrong.

### Copilot Pricing Reference

| Item | Price |
|------|-------|
| Microsoft 365 Copilot (enterprise add-on) | $30.00 per user per month (annual billing) |
| Microsoft 365 Copilot Business | $21.00 per user per month list, annual subscription with annual billing, 300-seat maximum |
| Copilot Studio prepaid capacity pack | $200.00 per pack per month for 25,000 Copilot Credits |
| Pay-as-you-go rate | $0.01 per Copilot Credit |

**Unit of consumption:** the **Copilot Credit**, not the message. Rates are per feature: classic answer 1 credit, generative answer 2 credits, agent action 5 credits, tenant graph grounding 10 credits. A single SharePoint agent interaction by an unlicensed user consumes 12 credits (10 grounding plus 2 generative answer), not 1.

<!-- VERIFY: Microsoft's own documentation is inconsistent here. The Copilot Studio billing-rates page and the Power Platform meters page use "Copilot Credits", and the admin center report is named "Credits". The Microsoft 365 Copilot pay-as-you-go Meters page still reads "$0.01 per message" with the meter named "Copilot Studio". The dollar figure matches; the unit noun does not. Teach credits, and note the Azure invoice meter is still named Copilot Studio. -->

### Copilot Billing Administration Path

| Task | Path |
|------|------|
| Create a pay-as-you-go billing policy | admin.microsoft.com > **Copilot** > **Billing & usage** > **Billing policies** |
| Connect a service to a policy | admin.microsoft.com > **Copilot** > **Billing & usage** > **Pay-as-you-go services** |
| Copilot usage report | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Copilot** > Usage tab |
| Copilot Credits report | admin.microsoft.com > **Reports** > **Usage** > **Microsoft 365 Copilot** > **Credits** |

Do **NOT** use the Billing node for Copilot. admin.microsoft.com > Billing > Pay-as-you-go covers Microsoft 365 Backup, SharePoint storage, and High Volume Email, and only surfaces a redirect link for Copilot.

**Exam trap:** a budget on a pay-as-you-go billing policy triggers email notifications only. Microsoft states the system does not enforce the budget or prevent the organization from exceeding it. The default alert threshold is 100%, and alerts can take up to 24 hours.

### Microsoft Purview Features

| Feature | Purpose |
|---------|---------|
| Microsoft Purview Information Protection | Classify and label sensitive data |
| Microsoft Purview Data Loss Prevention | Prevent data leakage, including a Microsoft 365 Copilot and Copilot Chat location |
| Microsoft Purview Insider Risk Management | Detect insider threats, including the Risky AI usage template |
| Microsoft Purview Communication Compliance | Monitor communications, including Copilot interactions |
| Microsoft Purview Data Security Posture Management (DSPM) for AI | Discover and manage AI activity |
| Microsoft Purview Data Lifecycle Management | Retention policies and labels, including for Copilot prompts and responses |
| Microsoft Purview Compliance Manager | Manage compliance requirements and improvement actions |
| Microsoft Purview eDiscovery | Search and preserve content, including Content search |

**Portal note:** the Microsoft Purview portal now shows three DSPM entries under **Solutions**: **DSPM** (the new unified experience, generally available since May 2026), **Data Security Posture Management (classic)**, and **DSPM for AI (classic)**. The AB-900 objectives use the "DSPM for AI" wording, which maps to the classic label. Teach the classic label as the exam answer while showing learners where the new unified DSPM lives.

### Agent Types

| Agent Type | Hosting | Use Case |
|-----------|---------|----------|
| Declarative | Microsoft 365 hosts it; uses Copilot's model and orchestrator | Individual use, grounded in org knowledge, no proactive actions |
| Custom engine | Hosted outside Microsoft 365; you choose the model and orchestration | Individual or group use, supports proactive actions, you own compliance |
| SharePoint agent | Declarative agent created in SharePoint, stored as an .agent file | Site or library knowledge, permissions follow the .agent file |
| Researcher | Microsoft-installed | Deep, multi-step research across work data and the web |
| Analyst | Microsoft-installed | Advanced data analysis with chain-of-thought reasoning, strong on Excel |

**Exam trap:** Researcher and Analyst are part of the core Copilot chat experience and do **NOT** fall under any agent-related settings. They remain accessible under **Tools** in Microsoft 365 Copilot Chat even when agents are disabled for some or all users. To disable them, use the tenant-wide **Block** action on the individual agent in the Microsoft 365 admin center. The **Edit users** panel is disabled for them, so per-user assignment is not possible.

### Agent Administration Paths

| Task | Path |
|------|------|
| Agent approval queue | admin.microsoft.com > **Agents** > **All agents** > **Requests** |
| Agent inventory | admin.microsoft.com > **Agents** > **All agents** > **Registry** |
| Agent settings | admin.microsoft.com > **Agents** > **Settings** |
| Agent tool (MCP server) approval | admin.microsoft.com > **Agents** > **Tools** > **Requests** |
| Copilot Studio agent governance | Microsoft Power Platform admin center |

The **Requests** tab shows three request states: Pending review, Pending update, and Pending activate. The two primary actions are **Publish to store** and **Reject submission**. Only the AI Administrator and Global Administrator roles can approve agent requests.

**Do NOT use** the older path "admin.microsoft.com > Copilot > Agents > Requested agents tab". The Agents workload is a top-level node, and the tab is named **Requests**.

---

## Document Version

**Version:** 2.0
**Last Updated:** 2026-07-26
**Skills Measured Version:** July 22, 2026
**Exam Status:** Generally available (not beta)
**Next Review:** Check the official study guide change log for the next skills-measured refresh

---

For the latest exam information, always refer to the official Microsoft Learn pages:

- Study guide: <https://learn.microsoft.com/credentials/certifications/resources/study-guides/ab-900>
- Certification: <https://learn.microsoft.com/en-us/credentials/certifications/copilot-and-agent-administration-fundamentals/>
