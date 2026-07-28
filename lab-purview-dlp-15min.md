# 15-Minute Lab: Set Up Microsoft Purview DLP for Microsoft 365 Copilot and Copilot Chat

## Goal

Create and publish a Data Loss Prevention (DLP) policy in Microsoft Purview that protects sensitive data across Microsoft 365 workloads, including Microsoft 365 Copilot and Copilot Chat.

## AB-900 Alignment

- Domain: Domain 2 - Data protection and governance for Microsoft 365 and Copilot
- Objective: Configure and validate a DLP policy with correct scope and controls

## Estimated Time

- 15 minutes

## Prerequisites

1. Role: Compliance Administrator, Security Administrator, or Global Administrator.
2. Licensing: A tenant with Microsoft Purview DLP-capable licensing.
3. Accounts: One admin account and one standard test user account.
4. Test data: A sample string or file that matches a built-in Sensitive info type.
5. Portal access: purview.microsoft.com.

## Scenario

Contoso needs to prevent sensitive financial data from being exposed in Microsoft 365 services and Microsoft 365 Copilot Chat. You are the assigned administrator and must create, publish, and verify a DLP policy in a controlled rollout.

## Step-by-Step Lab

### Step 1: Open the correct DLP location

1. Sign in to Microsoft Purview at purview.microsoft.com.
2. Select **Data loss prevention**.
3. Select **Policies**.

Exam note: AB-900 often tests exact navigation paths.

### Step 2: Start a new DLP policy

1. Select **Create policy**.
2. Choose a template category, such as Financial.
3. Continue to the policy naming screen.

Exam note: Template-based creation is a common admin workflow in scenario questions.

### Step 3: Name the policy and define intent

1. Enter a policy name, for example: Contoso-Financial-DLP-Copilot-Chat.
2. Add an admin description that states the business objective.
3. Select **Next**.

Exam note: Governance questions tie technical settings to business outcomes.

### Step 4: Select locations and include Copilot

1. In location selection, enable required Microsoft 365 workloads.
2. Explicitly enable **Microsoft 365 Copilot and Copilot Chat**.
3. Select **Next**.

Exam note: Copilot has a dedicated DLP location, which is easy to miss.

### Step 5: Configure detection conditions

1. Add a condition for **Sensitive info types**.
2. Select appropriate built-in types for your policy goal.
3. Tune thresholds as needed to reduce false positives.

Exam note: AB-900 expects you to distinguish policy scope from rule logic.

### Step 6: Configure actions and user guidance

1. Set actions to block or restrict disallowed handling of sensitive content.
2. Enable user notifications or policy tips.
3. Review the rule summary.

Exam note: User guidance is part of practical governance, not only enforcement.

### Step 7: Publish in test mode first

1. Choose a test-first mode before full enforcement.
2. Submit and publish the policy.
3. Allow time for propagation.

Exam note: Test-first rollout is a best-practice pattern that appears in exam distractors.

### Step 8: Validate behavior and finalize

1. Return to **Data loss prevention** > **Policies**.
2. Open the new policy and confirm status.
3. Verify expected matches and behavior across selected locations, including Microsoft 365 Copilot and Copilot Chat.

Reversal note: If impact is too strict, switch back to test mode, tune settings, and republish.

## Common Distractors to Avoid

1. Using admin.microsoft.com > Copilot > Billing and usage for DLP authoring. That path is billing, not policy creation.
2. Using admin.microsoft.com > Agents > All agents > Requests for DLP. That path is for agent approvals.
3. Assuming Copilot coverage without explicitly selecting **Microsoft 365 Copilot and Copilot Chat** in policy locations.

## Grounding References

### Repo Sources

- docs/module-03-data-protection-governance.md
- references/ab900-objectives.md
- .github/agents/ab900-cert-buddy-agent.agent.md

### Microsoft Learn

- [Learn about Data Loss Prevention](https://learn.microsoft.com/purview/dlp-learn-about-dlp)
- [Create and deploy a DLP policy](https://learn.microsoft.com/purview/dlp-create-deploy-policy)
- [Use DLP with Microsoft 365 Copilot](https://learn.microsoft.com/purview/dlp-microsoft-365-copilot)
- [Microsoft 365 DLP overview](https://learn.microsoft.com/microsoft-365/compliance/dlp-learn-about-dlp?view=o365-worldwide)
