<#
.SYNOPSIS
    Provisions the Azure AI Foundry demo environment for the AB-900 live training session.

.DESCRIPTION
    Creates a resource group, an Azure AI Foundry (AIServices) account, a Foundry project,
    and a small chat model deployment, then runs a live inference smoke test.

    This script is IDEMPOTENT. Every create is guarded by an existence check, so re-running
    it after a partial failure resumes rather than erroring or duplicating resources.

    SCOPE NOTE: Azure AI Foundry does NOT appear in the AB-900 skills measured as of
    July 22, 2026. AB-900 is a Microsoft 365 administration exam. This environment exists
    as adjacent demo material only -- to contrast Azure-side AI infrastructure against the
    Microsoft 365 Copilot admin surface that the exam actually tests. Do not present it
    as exam content.

.PARAMETER ResourceGroup
    Target resource group name. Created if absent.

.PARAMETER Location
    Azure region. eastus2 is used because it carries the broadest model availability.

.PARAMETER AccountName
    Foundry (AIServices) account name. Must be globally unique -- it becomes the
    custom subdomain used by the inference endpoint.

.PARAMETER DeploymentName
    Name of the model deployment. This is the value callers pass as the model name in
    Azure OpenAI SDK calls, NOT the underlying model name.

.PARAMETER ModelName
    Underlying model. Defaults to gpt-5-mini.

    IMPORTANT: the model catalog returned by 'az cognitiveservices account list-models'
    includes models in a deprecating state that CANNOT be deployed. The catalog's
    deprecation.inference date does NOT reliably predict deployability -- as of
    July 2026 both gpt-4o-mini and gpt-4.1-mini advertise a 2027 retirement date yet are
    rejected for new deployments. The script therefore walks a fallback list and reports
    which candidate succeeded rather than trusting the catalog.

.PARAMETER WhatIf
    Reports the actions the script would take without creating anything.

.EXAMPLE
    ./Deploy-AB900Foundry.ps1 -WhatIf

    Previews the deployment without provisioning.

.EXAMPLE
    ./Deploy-AB900Foundry.ps1 -Verbose

    Provisions the environment and prints the resolved endpoint and deployment name.

.NOTES
    Author:  Tim Warner
    Requires: Azure CLI 2.85.0 or later, authenticated via 'az login'.
    Verified: Deployed successfully against tenant techtrainertim.com on 2026-07-27.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroup = 'rg-ab900-demo',

    [ValidateNotNullOrEmpty()]
    [string]$Location = 'eastus2',

    [ValidatePattern('^[a-z0-9][a-z0-9-]{1,62}$')]
    [string]$AccountName = 'ab900-foundry-tw',

    [ValidateNotNullOrEmpty()]
    [string]$ProjectName = 'ab900-demo-project',

    [ValidateNotNullOrEmpty()]
    [string]$DeploymentName = 'chat-mini',

    [ValidateRange(1, 100)]
    [int]$CapacityKTpm = 10
)

# Stop on the first unhandled error. Azure CLI failures surface as non-zero $LASTEXITCODE
# rather than terminating exceptions, so each call is checked explicitly below.
$ErrorActionPreference = 'Stop'

# Ordered fallback list. The service rejects deprecating models regardless of what the
# catalog advertises, so we try current-generation small models newest-first and stop
# at the first one the service actually accepts.
$ModelCandidates = @(
    @{ Name = 'gpt-5-mini';   Version = '2025-08-07' }
    @{ Name = 'gpt-5.4-mini'; Version = '2026-03-17' }
    @{ Name = 'gpt-5-nano';   Version = '2025-08-07' }
    @{ Name = 'gpt-5.4-nano'; Version = '2026-03-17' }
)

function Assert-AzSuccess {
    <#
        .SYNOPSIS
            Throws a descriptive error when the preceding Azure CLI call failed.
        .DESCRIPTION
            Azure CLI writes diagnostics to stderr and sets $LASTEXITCODE. Without this
            guard a failed create silently yields $null and the script continues against
            a resource that does not exist.
    #>
    param([string]$Operation, [string]$Output)

    if ($LASTEXITCODE -ne 0) {
        throw "Azure CLI failed during '$Operation' (exit $LASTEXITCODE): $Output"
    }
}

Write-Verbose "Confirming Azure CLI authentication context."
$account = az account show -o json 2>&1 | ConvertFrom-Json
Assert-AzSuccess -Operation 'az account show' -Output $account
Write-Host "Subscription : $($account.name)"
Write-Host "Tenant       : $($account.tenantDefaultDomain)"
Write-Host "Identity     : $($account.user.name)"

# --- Resource group -------------------------------------------------------------------
# 'az group exists' returns the literal strings true/false, so compare as text.
$rgExists = az group exists -n $ResourceGroup 2>&1
if ($rgExists -eq 'true') {
    Write-Host "Resource group '$ResourceGroup' already exists. Skipping create."
}
elseif ($PSCmdlet.ShouldProcess($ResourceGroup, 'Create resource group')) {
    # delete-after tag gives the cleanup job an unambiguous signal. Demo tenants
    # accumulate orphaned spend without it.
    $out = az group create -n $ResourceGroup -l $Location `
        --tags purpose=ab900-training owner=tim delete-after=2026-08-15 -o json 2>&1
    Assert-AzSuccess -Operation 'az group create' -Output $out
    Write-Host "Created resource group '$ResourceGroup'."
}

# --- Foundry account ------------------------------------------------------------------
$existing = az cognitiveservices account show -n $AccountName -g $ResourceGroup -o json 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Foundry account '$AccountName' already exists. Skipping create."
    $acct = $existing | ConvertFrom-Json
}
elseif ($PSCmdlet.ShouldProcess($AccountName, 'Create Foundry (AIServices) account')) {
    # --custom-domain is REQUIRED for the *.openai.azure.com inference endpoint and for
    # Entra ID token auth. Without it only the regional endpoint works and key auth is
    # the sole option.
    $out = az cognitiveservices account create -n $AccountName -g $ResourceGroup -l $Location `
        --kind AIServices --sku S0 --custom-domain $AccountName --assign-identity --yes -o json 2>&1
    Assert-AzSuccess -Operation 'az cognitiveservices account create' -Output $out
    $acct = $out | ConvertFrom-Json
    Write-Host "Created Foundry account '$AccountName'."
}

# --- Foundry project ------------------------------------------------------------------
# 'az cognitiveservices' exposes no project subgroup as of CLI 2.85.0, and
# 'az resource create' cannot address the nested accounts/projects type correctly.
# Calling ARM directly is the supported path.
$projectUri = "https://management.azure.com/subscriptions/$($account.id)/resourceGroups/$ResourceGroup" +
              "/providers/Microsoft.CognitiveServices/accounts/$AccountName/projects/$ProjectName" +
              '?api-version=2026-05-01'

$projExists = az rest --method get --uri $projectUri -o json 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Foundry project '$ProjectName' already exists. Skipping create."
}
elseif ($PSCmdlet.ShouldProcess($ProjectName, 'Create Foundry project')) {
    $body = @{
        location   = $Location
        identity   = @{ type = 'SystemAssigned' }
        properties = @{
            displayName = 'AB-900 Training Demo'
            description = 'OReilly AB-900 live session demo project'
        }
    } | ConvertTo-Json -Depth 5 -Compress

    $out = az rest --method put --uri $projectUri --body $body -o json 2>&1
    Assert-AzSuccess -Operation 'create Foundry project' -Output $out
    Write-Host "Created Foundry project '$ProjectName'."
}

# --- Model deployment -----------------------------------------------------------------
$depExists = az cognitiveservices account deployment show `
    -n $AccountName -g $ResourceGroup --deployment-name $DeploymentName -o json 2>&1

if ($LASTEXITCODE -eq 0) {
    $dep = $depExists | ConvertFrom-Json
    Write-Host "Deployment '$DeploymentName' already exists (model $($dep.properties.model.name)). Skipping create."
    $deployedModel = $dep.properties.model.name
}
elseif ($PSCmdlet.ShouldProcess($DeploymentName, 'Create model deployment')) {
    $deployedModel = $null

    foreach ($candidate in $ModelCandidates) {
        Write-Verbose "Attempting deployment of $($candidate.Name) $($candidate.Version)."
        $out = az cognitiveservices account deployment create -n $AccountName -g $ResourceGroup `
            --deployment-name $DeploymentName `
            --model-name $candidate.Name --model-version $candidate.Version --model-format OpenAI `
            --sku-name GlobalStandard --sku-capacity $CapacityKTpm -o json 2>&1

        if ($LASTEXITCODE -eq 0) {
            $deployedModel = $candidate.Name
            Write-Host "Deployed '$DeploymentName' using model $($candidate.Name) $($candidate.Version)."
            break
        }

        # Two distinct, expected failure modes are worth surfacing separately: a model the
        # service has closed to new deployments, versus a model this subscription has no
        # quota for. Both are recoverable by moving to the next candidate.
        $reason = switch -Regex ("$out") {
            'ServiceModelDeprecating' { 'model is closed to new deployments' }
            'bigger than the current available capacity' { 'subscription has no quota for this model' }
            default { 'see error detail' }
        }
        Write-Warning "Candidate $($candidate.Name) unavailable -- $reason. Trying next."
    }

    if (-not $deployedModel) {
        throw "No candidate model could be deployed. Run 'az cognitiveservices account list-models -n $AccountName -g $ResourceGroup' and check quota at Azure portal > Quotas."
    }
}

# --- Smoke test -----------------------------------------------------------------------
# Provisioning success does NOT prove the endpoint serves traffic. Always verify with a
# real inference call before relying on this in front of an audience.
if ($PSCmdlet.ShouldProcess($DeploymentName, 'Run inference smoke test')) {
    $key = az cognitiveservices account keys list -n $AccountName -g $ResourceGroup --query key1 -o tsv 2>&1
    Assert-AzSuccess -Operation 'retrieve account key' -Output $key

    $endpoint = "https://$AccountName.openai.azure.com/openai/deployments/$DeploymentName/chat/completions?api-version=2024-10-21"

    # max_completion_tokens must be generous. gpt-5 family models are REASONING models --
    # they spend tokens on internal reasoning before emitting any visible text. A budget of
    # 60 returns an empty string with finish_reason 'length' and looks like a broken
    # deployment when it is merely starved.
    $payload = @{
        messages = @(
            @{ role = 'user'; content = 'Reply with exactly: AB-900 Foundry deployment online.' }
        )
        max_completion_tokens = 800
    } | ConvertTo-Json -Depth 5

    try {
        $response = Invoke-RestMethod -Uri $endpoint -Method Post `
            -Headers @{ 'api-key' = $key; 'Content-Type' = 'application/json' } `
            -Body $payload -TimeoutSec 60

        $reply = $response.choices[0].message.content
        $usage = $response.usage

        if ([string]::IsNullOrWhiteSpace($reply)) {
            Write-Warning "Endpoint responded but returned empty content. Reasoning tokens consumed: $($usage.completion_tokens_details.reasoning_tokens). Raise -max_completion_tokens."
        }
        else {
            Write-Host ""
            Write-Host "SMOKE TEST PASSED"
            Write-Host "Model reply : $($reply.Trim())"
            Write-Host "Tokens      : prompt $($usage.prompt_tokens), completion $($usage.completion_tokens), reasoning $($usage.completion_tokens_details.reasoning_tokens)"
        }
    }
    catch {
        throw "Smoke test failed against $endpoint. The resource provisioned but is not serving inference: $($_.Exception.Message)"
    }
}

Write-Host ""
Write-Host "--- Connection details ---"
Write-Host "Inference endpoint : https://$AccountName.openai.azure.com/"
Write-Host "Deployment name    : $DeploymentName   (pass THIS as the model name in SDK calls)"
Write-Host "Foundry portal     : https://ai.azure.com"
Write-Host "Retrieve key       : az cognitiveservices account keys list -n $AccountName -g $ResourceGroup --query key1 -o tsv"
Write-Host ""
Write-Host "Teardown when finished:"
Write-Host "  az group delete -n $ResourceGroup --yes --no-wait"
