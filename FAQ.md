# Course FAQ

Frequently asked questions about the "Copilot & Agent Administration Fundamentals" course.

## General Questions

### Q: What are the prerequisites for this course?
**A:** You should have:
- Basic understanding of Microsoft 365 services
- Familiarity with Azure Active Directory/Entra ID
- Access to a Microsoft 365 tenant (trial or production)
- Administrative privileges in Microsoft 365 admin center

### Q: Do I need a Copilot license to participate?
**A:** While hands-on labs work best with active Copilot licenses, you can still benefit from demonstrations and conceptual learning. Microsoft offers trial licenses for testing purposes.

### Q: What Microsoft 365 license do I need?
**A:** Copilot requires Microsoft 365 E3/E5 or Business Standard/Premium as a base license, plus the Copilot for Microsoft 365 add-on license.

### Q: Can I use a trial tenant for the labs?
**A:** Yes! Microsoft offers Microsoft 365 Developer tenants and trial licenses that work well for learning and testing.

## Technical Questions

### Q: How long does it take for Copilot to activate after license assignment?
**A:** Typically 24-48 hours, though it can sometimes be faster. Ensure OneDrive is provisioned and Microsoft 365 Apps are updated.

### Q: What versions of Microsoft 365 Apps support Copilot?
**A:** Current Channel or Monthly Enterprise Channel with the latest updates. Semi-Annual Channel may have delayed feature availability.

### Q: Can I disable specific Copilot features?
**A:** Yes, administrators can control features through Cloud Policy, including web search and plugin permissions.

### Q: Does Copilot work offline?
**A:** No, Copilot requires internet connectivity to access AI models and Microsoft Graph data.

## Security and Compliance Questions

### Q: Is my data used to train AI models?
**A:** No, your prompts, responses, and data accessed through Microsoft Graph are NOT used to train foundation AI models. Microsoft maintains strict data privacy.

### Q: How does Copilot handle sensitive data?
**A:** Copilot respects your existing security controls including DLP policies, sensitivity labels, and permissions. It only accesses data the user already has permissions to see.

### Q: What compliance certifications does Copilot have?
**A:** Copilot is covered by Microsoft 365's comprehensive compliance certifications including ISO 27001, SOC 2, GDPR compliance, and more.

### Q: Can I control which users get Copilot?
**A:** Yes, through license assignment. Only users with assigned Copilot licenses can access Copilot features.

## Agent Questions

### Q: What's the difference between Copilot and an Agent?
**A:** Copilot is Microsoft's general AI assistant across Microsoft 365 apps. Agents are customizable AI assistants you build for specific purposes using Copilot Studio.

### Q: Do I need special licenses for Agents?
**A:** Copilot Studio is included with certain Power Platform and Microsoft 365 licenses. Check licensing documentation for specifics.

### Q: Can agents access external systems?
**A:** Yes, through connectors and plugins, agents can integrate with many external systems and APIs.

### Q: How do I control what an agent can do?
**A:** Through permissions, authentication, DLP policies, and configuration in Copilot Studio.

## Exam Preparation Questions

### Q: Is there really an AB-900 exam?
**A:** AB-900 is used as a hypothetical example in this course. For actual Microsoft certifications, check MS-900, MS-102, AI-900, and PL-200.

### Q: How should I prepare for Microsoft 365 certification exams?
**A:** 
1. Complete hands-on labs in real environments
2. Use Microsoft Learn learning paths
3. Take practice assessments
4. Join study groups
5. Review official documentation

### Q: How long are Microsoft certifications valid?
**A:** Most role-based certifications require annual renewal through continuing education.

## Course Materials Questions

### Q: Are the course materials downloadable?
**A:** Yes, all materials in this repository are available under the MIT License.

### Q: Will the materials be updated?
**A:** Yes, we'll update materials as Microsoft releases new features and capabilities.

### Q: Can I share these materials with my team?
**A:** Yes, under the MIT License terms. Please maintain attribution and license information.

### Q: Are the PowerShell scripts production-ready?
**A:** The scripts are educational examples. Always test thoroughly in non-production before using in production environments.

## Troubleshooting Questions

### Q: Copilot isn't showing up in my apps. What should I check?
**A:** Verify:
1. License is assigned and activated (wait 24-48 hours)
2. Microsoft 365 Apps are updated to Current Channel
3. OneDrive is provisioned
4. You're signed in with the licensed account
5. Network connectivity is working

### Q: I'm getting errors when running PowerShell scripts. Help?
**A:** 
1. Ensure Microsoft.Graph module is installed
2. Check you have necessary admin permissions
3. Verify you're connected to Microsoft Graph
4. Review error messages for specific issues
5. Check script prerequisites

### Q: Where can I get help if I'm stuck?
**A:** 
1. Review course materials and documentation
2. Check Microsoft's official documentation
3. Post questions in Microsoft Tech Community
4. Open an issue in this repository
5. Contact Microsoft Support for production issues

## Additional Resources

### Q: Where can I learn more about Copilot?
**A:** 
- [Microsoft 365 Copilot Documentation](https://docs.microsoft.com/microsoft-365-copilot/)
- [Copilot Adoption Resources](https://adoption.microsoft.com/copilot/)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/)

### Q: Are there other courses I should take?
**A:** Consider:
- Microsoft 365 Administrator courses
- Power Platform training
- Azure AI fundamentals
- Security and compliance training

---

**Have a question not listed here?** Open an issue in the repository!
