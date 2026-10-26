# Data Loss Prevention (DLP) Policy Template

**Last updated:** 2026-07-26

Create the policy at **purview.microsoft.com** > **Solutions** > **Data Loss Prevention** > **Policies** > **+ Create policy**. The former compliance.microsoft.com portal is retired.

## Policy Information

**Policy Name:** [Enter Policy Name]  
**Description:** [Enter detailed description of what this policy protects]  
**Owner:** [Policy Owner Name/Team]  
**Created Date:** [Date]  
**Last Modified:** [Date]  
**Status:** Draft | Active | Disabled

## Policy Scope

### Locations
- [ ] Exchange Online (Email)
- [ ] SharePoint in Microsoft 365
- [ ] OneDrive for work and school
- [ ] Microsoft Teams (Chat and Channel messages)
- [ ] Devices (Endpoint DLP)
- [ ] Fabric and Power BI workspaces
- [ ] Microsoft Defender for Cloud Apps
- [ ] **Microsoft 365 Copilot and Copilot Chat** (see the Copilot section below)

### Copilot protection (the AB-900-relevant location)

Turn on the **Microsoft 365 Copilot and Copilot Chat** location on the Locations page to control what Copilot may ground on.

Four supported condition and action pairs:

| Condition | Action | Effect |
|-----------|--------|--------|
| Content contains > **Sensitivity labels** | Prevent Copilot from processing content | Item is excluded from the response summary, but may still appear in citations |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Processing prompts** | Copilot does not respond to the prompt at all |
| Content contains > **Sensitive information types** | Prevent Copilot from processing content > **Performing Web Searches** | Blocks external web search as a grounding source |
| **Email is received from** > External users (preview) | Prevent Copilot from processing content | Excludes external email from grounding, summarization, and citation, reducing prompt injection risk |

**Rule construction gotcha.** You can **NOT** combine the "Content contains sensitive info types" condition and the "Content contains sensitivity labels" condition in the **same rule**. Create a separate rule for each condition within the same policy.

**Coverage limits.** Sensitivity-label rules cover stored files, actively open files, and emails sent on or after January 1, 2025. Calendar invites are **NOT** supported. In Word, Excel, and PowerPoint, the policy is evaluated **at file open**, so a label applied mid-session takes effect the next time the file is opened.

**Related control worth knowing.** The **EXTRACT** usage right on an encrypted label is separate from DLP. If a user has VIEW but **NOT** EXTRACT, Copilot will not summarize the content regardless of DLP configuration, though it can still reference it with a link.

### Users
- [ ] All users in organization
- [ ] Specific users: [List users]
- [ ] Specific groups: [List groups]
- [ ] All users except: [List exceptions]

## Sensitive Information Types

Select all that apply and configure confidence levels:

### Financial Information
- [ ] Credit Card Number (Confidence: Low | Medium | High)
- [ ] Bank Account Number (Confidence: Low | Medium | High)
- [ ] ABA Routing Number (Confidence: Low | Medium | High)
- [ ] International Banking Account Number (IBAN)
- [ ] SWIFT Code

### Personal Information
- [ ] Social Security Number (SSN)
- [ ] Passport Number
- [ ] Driver's License Number
- [ ] National ID Number
- [ ] Date of Birth
- [ ] Email Address
- [ ] Phone Number
- [ ] Physical Address

### Healthcare Information
- [ ] Medical Record Number
- [ ] Health Insurance Number
- [ ] Prescription Information
- [ ] PHI (Protected Health Information)

### Custom Information Types
- [ ] [Custom Type 1]: [Description]
- [ ] [Custom Type 2]: [Description]

## Conditions

### Content Contains
- Sensitive information types (selected above)
- Instance count: Minimum [X] | Maximum [X]
- Confidence level: Low | Medium | High

### Additional Conditions
- [ ] Content is shared with people outside organization
- [ ] Content is shared with specific people/groups: [List]
- [ ] Document property matches: [Property] = [Value]
- [ ] Sensitivity label: [Label Name]
- [ ] File extension: [Extensions]
- [ ] File size greater than: [Size] MB

## Actions

### When conditions are met:

#### For Email (Exchange)
- [ ] Block - Block the message
- [ ] Block with override - Allow sender to override with justification
- [ ] Notify - Send notification but allow sending
- [ ] Encrypt - Apply Office 365 Message Encryption
- [ ] Require justification
- [ ] Policy tips enabled

#### For SharePoint/OneDrive
- [ ] Block access - Prevent external access
- [ ] Block and restrict access - Limit who can access
- [ ] Notify document owner
- [ ] Notify site admin
- [ ] Send incident report to administrators

#### For Teams
- [ ] Block - Prevent message from being sent
- [ ] Show policy tip - Warn user but allow sending
- [ ] Notify user
- [ ] Notify compliance team

#### For Devices (Endpoint DLP)
- [ ] Audit only - Log activity but do not block
- [ ] Block - Prevent action
- [ ] Block with override - Allow with justification
- [ ] Warn - Show warning to user

### Advanced Actions
- [ ] Apply sensitivity label: [Label Name]
- [ ] Remove sharing permissions
- [ ] Restrict access to content
- [ ] Generate incident report

## User Notifications

### Policy Tip Configuration
**Enable policy tips:** Yes | No

**Policy tip text:**
```
[Custom message explaining why content was blocked/flagged and what user should do]

Example:
"This message contains sensitive financial information. Sharing this information 
externally may violate company policy. If you must send this, please use encryption 
or contact the compliance team."
```

### Email Notifications

**Notify sender:** Yes | No  
**Notify manager:** Yes | No  
**Notify compliance team:** Yes | No  
**Custom recipients:** [Email addresses]

**Notification message:**
```
[Custom notification text]
```

## Incident Reports

### Report Settings
- [ ] Send incident report to administrators
- [ ] Recipients: [List email addresses]
- [ ] Include incident severity: Low | Medium | High
- [ ] Include user who last modified content
- [ ] Include device information (for Endpoint DLP)
- [ ] Include matched content sample: None | First 20 chars | Full match

### Report Frequency
- [ ] Send report for every policy match
- [ ] Aggregate reports daily
- [ ] Aggregate reports weekly

## Exceptions

### Users/Groups Exempt from Policy
- [List users/groups and justification]

### Domains Exempt from Policy
- [List domains and justification]

### Other Exceptions
- [ ] Content marked with sensitivity label: [Label Name]
- [ ] Content in specific SharePoint sites: [URLs]
- [ ] Content owned by specific users: [Users]

## Testing and Validation

### Test Mode
- [ ] Test policy without enforcement (simulation mode)
- [ ] Show policy tips during testing
- [ ] Test duration: [Number] days
- [ ] Test with specific users: [List]

### Validation Checklist
- [ ] Policy conditions tested
- [ ] User notifications tested
- [ ] Policy tips appear correctly
- [ ] Incident reports received
- [ ] Exceptions working as expected
- [ ] Performance impact assessed
- [ ] False positives reviewed

## Monitoring and Maintenance

### Review Schedule
- [ ] Weekly review during first month
- [ ] Monthly review after stabilization
- [ ] Quarterly comprehensive review
- [ ] Annual policy assessment

### Metrics to Monitor
- [ ] Number of policy matches
- [ ] False positive rate
- [ ] User override frequency
- [ ] Incident severity distribution
- [ ] User feedback and complaints

### Tuning Notes
[Document any adjustments made and reasons]

## Approval and Sign-off

**Policy Reviewed By:**
- Compliance Team: [Name] - [Date]
- Security Team: [Name] - [Date]
- Legal Team: [Name] - [Date]
- Business Unit: [Name] - [Date]

**Policy Approved By:**
- [Approver Name] - [Title] - [Date]

**Next Review Date:** [Date]

---

## Notes and Best Practices

1. **Start with Audit Mode:** Test policies before enforcement
2. **Clear Communication:** Ensure users understand why policy exists
3. **Minimize False Positives:** Fine-tune conditions to reduce business disruption
4. **Regular Reviews:** Update policies as business needs change
5. **User Education:** Train users on data protection practices
6. **Incident Response:** Have clear process for handling violations
7. **Documentation:** Keep detailed records of policy changes

## Related Policies

- [Link to related DLP policies]
- [Link to sensitivity label schema]
- [Link to retention policies]
- [Link to acceptable use policy]

---

**Template Version:** 1.0  
**Last Updated:** [Date]
