<#
.SYNOPSIS
    Provisions Microsoft Purview compliance objects for the AB-900 demo tenant.

.DESCRIPTION
    Creates a DLP policy and rule, a sensitivity label and publishing policy, and a
    retention policy and rule in a Microsoft 365 tenant, using Security & Compliance
    PowerShell.

    Every create is gated by a check-then-create test, so the script is IDEMPOTENT and
    safe to re-run after a partial failure. This matters the morning of a session: a
    half-provisioned tenant is worse than an empty one.

    WHY THIS SCRIPT EXISTS
    Microsoft Purview compliance solutions (DLP, sensitivity labels, retention, DSPM for
    AI) are Microsoft 365 tenant features provisioned through licensing, NOT Azure
    resources. There is no ARM template and no 'az' command for them. The Azure resource
    type Microsoft.Purview/accounts is a DIFFERENT product (Purview data governance for
    Azure data estates) and is NOT on the AB-900 exam. Security & Compliance PowerShell
    is the only supported scripted path for the objects below.

    STILL PORTAL-ONLY
    Some Domain 2 and Domain 3 surfaces have no documented PowerShell equivalent and must
    be demonstrated in the portal: DSPM for AI, Compliance Manager, Insider Risk
    Management, Communication Compliance, Data Explorer, Activity Explorer, the agent
    approval queue, and Copilot pay-as-you-go billing. See docs/portal-reference.md.

.PARAMETER UserPrincipalName
    Admin UPN used for the Security & Compliance PowerShell sign-in prompt.

.PARAMETER CompanyPrefix
    Fictional company name used for object naming. Defaults to Contoso, per the
    Microsoft fictional company list in references/fictional-companies.md.

.PARAMETER DlpMode
    Deployment mode for the DLP policy. Defaults to TestWithNotifications so a live demo
    never blocks real content. Use Enable only in a throwaway tenant.

.PARAMETER SkipRetention
    Skips the retention section. Retention objects are slow to remove from a tenant,
    so skip them if the demo tenant is reused across deliveries.

.EXAMPLE
    ./Initialize-AB900PurviewDemo.ps1 -UserPrincipalName admin@contoso.onmicrosoft.com -WhatIf

    Previews every object without creating anything.

.EXAMPLE
    ./Initialize-AB900PurviewDemo.ps1 -UserPrincipalName admin@contoso.onmicrosoft.com -Verbose

    Provisions the full demo set and reports what was created versus already present.

.NOTES
    Author:   Tim Warner
    Requires: ExchangeOnlineManagement 3.2.0 or later. Version 3.2.0 is the floor because
              full REST API support in Security & Compliance PowerShell started there.

              Do NOT chase the newest module before a delivery. On Windows 11, versions
              3.5.0 to 3.9.2 require PowerShell 7.4.0+, while 3.10.0+ requires PowerShell
              7.6.0+ because of .NET 10.0 assembly dependencies. The only change in
              3.10.0 relevant to this script's surface is a certificate-based auth fix
              for the -EnableSearchOnlySession switch, which this script does not use.
              3.9.2 runs everything here.

              Install: Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser
    Roles:    Compliance Administrator or Compliance Data Administrator.
    Grounded: All cmdlets and parameters verified against Microsoft Learn on 2026-07-27
              by an adversarial verification pass.

    NOT EXECUTED against a live tenant. Unlike Deploy-AB900Foundry.ps1, this script was
    not run end to end, because doing so writes compliance policy into a production
    Microsoft 365 tenant. Run it with -WhatIf first.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[^@]+@[^@]+\.[^@]+$')]
    [string]$UserPrincipalName,

    [ValidateNotNullOrEmpty()]
    [string]$CompanyPrefix = 'Contoso',

    [ValidateSet('Enable', 'TestWithNotifications', 'TestWithoutNotifications', 'Disable')]
    [string]$DlpMode = 'TestWithNotifications',

    [switch]$SkipRetention
)

$ErrorActionPreference = 'Stop'

# Track outcomes so the closing summary reports reality rather than optimism.
$script:Created = [System.Collections.Generic.List[string]]::new()
$script:Skipped = [System.Collections.Generic.List[string]]::new()

function Test-ComplianceObject {
    <#
        .SYNOPSIS
            Returns $true when a compliance object already exists.
        .DESCRIPTION
            Wraps the Get-* cmdlets in the check-then-create pattern.

            CRITICAL: Microsoft Learn warns that passing a $null or non-existent value to
            -Identity on these Get- cmdlets "returns all objects as if you ran the Get-
            command without the Identity parameter". A naive truthiness test on the result
            therefore reports every object as existing. Guarding on a non-empty name and
            re-checking the returned Name is what makes this test trustworthy.
    #>
    param(
        [Parameter(Mandatory)][string]$Cmdlet,
        [Parameter(Mandatory)][string]$Name
    )

    if ([string]::IsNullOrWhiteSpace($Name)) {
        throw "Test-ComplianceObject called with an empty name for $Cmdlet."
    }

    try {
        $result = & $Cmdlet -Identity $Name -ErrorAction SilentlyContinue
    }
    catch {
        return $false
    }

    # Re-confirm the returned object actually carries the requested name, defeating the
    # "returns everything" failure mode described above.
    return [bool]($result | Where-Object { $_.Name -eq $Name -or $_.DisplayName -eq $Name })
}

function New-ComplianceObjectIfMissing {
    <#
        .SYNOPSIS
            Creates a compliance object only when it does not already exist.
        .PARAMETER Label
            Human-readable description used in the run summary.
        .PARAMETER TestCmdlet
            The Get-* cmdlet used for the existence check.
        .PARAMETER Name
            Object name, used both for the check and the summary.
        .PARAMETER Action
            Scriptblock that performs the create.
    #>
    param(
        [Parameter(Mandatory)][string]$Label,
        [Parameter(Mandatory)][string]$TestCmdlet,
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][scriptblock]$Action
    )

    if (Test-ComplianceObject -Cmdlet $TestCmdlet -Name $Name) {
        Write-Host "  [skip]   $Label '$Name' already exists."
        $script:Skipped.Add("$Label : $Name")
        return
    }

    if ($PSCmdlet.ShouldProcess($Name, "Create $Label")) {
        try {
            & $Action | Out-Null
            Write-Host "  [create] $Label '$Name'."
            $script:Created.Add("$Label : $Name")
        }
        catch {
            throw "Failed creating $Label '$Name': $($_.Exception.Message)"
        }
    }
}

# --- Module and connection ------------------------------------------------------------
Write-Verbose 'Verifying ExchangeOnlineManagement module is present.'
$module = Get-Module -ListAvailable -Name ExchangeOnlineManagement |
          Sort-Object Version -Descending | Select-Object -First 1

if (-not $module) {
    throw "ExchangeOnlineManagement module not found. Install with: Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser"
}

# 3.2.0 is the floor: full REST API support in Security & Compliance PowerShell began
# there. Anything older cannot run the DLP, label, and retention cmdlets below.
$minimumVersion = [version]'3.2.0'
if ($module.Version -lt $minimumVersion) {
    throw "ExchangeOnlineManagement $($module.Version) is too old. Version $minimumVersion or later is required for Security & Compliance REST cmdlets. Update with: Update-Module -Name ExchangeOnlineManagement"
}
Write-Host "ExchangeOnlineManagement version $($module.Version) detected (minimum $minimumVersion)."

# Connect-IPPSSession reaches the Security & Compliance endpoint. Connect-ExchangeOnline
# does NOT expose the DLP, label, or retention cmdlets -- this is the single most common
# reason these scripts fail with "term not recognized".
#
# For commercial and GCC tenants, do NOT pass -ConnectionUri or
# -AzureADAuthorizationEndpointUri; the correct values are already the defaults.
# MFA needs no extra switch: PowerShell 7 opens browser-based sign-in automatically.
#
# The connection is NOT wrapped in ShouldProcess. Connecting is a read-only act that
# changes nothing in the tenant, and every existence check below depends on the session
# being live. Skipping it under -WhatIf would leave the script reporting hypothetical
# creates for objects that may already exist -- a dry run that lies is worse than none.
if (-not (Get-Command Get-DlpCompliancePolicy -ErrorAction SilentlyContinue)) {
    Write-Host "Connecting to Security & Compliance PowerShell as $UserPrincipalName ..."
    if ($WhatIfPreference) {
        Write-Host '  (-WhatIf still connects: the session is read-only and is required for accurate existence checks.)'
    }
    Connect-IPPSSession -UserPrincipalName $UserPrincipalName
}
else {
    Write-Host 'Existing Security & Compliance session detected. Reusing it.'
}

# --- Preflight: confirm the sensitive information type name resolves ------------------
# Fail fast here rather than letting New-DlpComplianceRule fail at create time with a
# less obvious error. SIT display names vary by tenant locale.
#
# Deliberately NOT wrapped in ShouldProcess: this is a read-only validation, and it is
# precisely the check a -WhatIf run should perform. Guarding it would mean -WhatIf
# printed a reassuring "verifying..." line while verifying nothing.
$sitName = 'Credit Card Number'
$sit = Get-DlpSensitiveInformationType -Identity $sitName -ErrorAction SilentlyContinue
if (-not $sit) {
    throw "Sensitive information type '$sitName' not found in this tenant. List available types with: Get-DlpSensitiveInformationType | Sort-Object Name"
}
Write-Host "Preflight: sensitive information type '$sitName' confirmed."

# --- Data Loss Prevention -------------------------------------------------------------
Write-Host ''
Write-Host 'Data Loss Prevention'

$dlpPolicyName = "$CompanyPrefix PCI Protection"
$dlpRuleName   = "$CompanyPrefix PCI Rule"

New-ComplianceObjectIfMissing -Label 'DLP policy' -TestCmdlet 'Get-DlpCompliancePolicy' -Name $dlpPolicyName -Action {
    # TestWithNotifications shows policy tips without blocking, which is what you want in
    # front of an audience. -Mode Enable would actively block content.
    New-DlpCompliancePolicy -Name $dlpPolicyName `
        -Comment 'AB-900 demo policy for payment card data' `
        -ExchangeLocation All -SharePointLocation All -OneDriveLocation All -TeamsLocation All `
        -Mode $DlpMode
}

New-ComplianceObjectIfMissing -Label 'DLP rule' -TestCmdlet 'Get-DlpComplianceRule' -Name $dlpRuleName -Action {
    # -GenerateAlert takes a MultiValuedProperty whose valid values are an email address
    # or the literal SiteAdmin. It is NOT a Boolean -- passing $true fails at runtime.
    New-DlpComplianceRule -Name $dlpRuleName `
        -Policy $dlpPolicyName `
        -ContentContainsSensitiveInformation @{ Name = $sitName } `
        -BlockAccess $true `
        -NotifyUser Owner `
        -GenerateAlert 'SiteAdmin'
}

# --- Sensitivity labels ---------------------------------------------------------------
Write-Host ''
Write-Host 'Sensitivity labels'

$labelName       = "${CompanyPrefix}Confidential"
$labelPolicyName = "$CompanyPrefix Label Publishing"

New-ComplianceObjectIfMissing -Label 'Sensitivity label' -TestCmdlet 'Get-Label' -Name $labelName -Action {
    # -Name is the immutable identifier; -DisplayName is what users see and is NOT unique
    # across a tenant. Always key automation off Name or the GUID.
    New-Label -Name $labelName `
        -DisplayName 'Confidential' `
        -Tooltip 'Business data that would cause harm if shared externally.' `
        -ApplyContentMarkingFooterEnabled $true `
        -ApplyContentMarkingFooterText "$CompanyPrefix Confidential" `
        -ApplyContentMarkingFooterAlignment Left
}

New-ComplianceObjectIfMissing -Label 'Label policy' -TestCmdlet 'Get-LabelPolicy' -Name $labelPolicyName -Action {
    # New-LabelPolicy IS the publish action. There is no separate publish cmdlet -- a
    # label that exists but has no policy is invisible to end users, which is a common
    # "why can nobody see my label" support question and a good teaching beat.
    New-LabelPolicy -Name $labelPolicyName `
        -Labels $labelName `
        -ExchangeLocation All `
        -Comment 'AB-900 demo publishing policy'
}

# --- Retention ------------------------------------------------------------------------
if ($SkipRetention) {
    Write-Host ''
    Write-Host 'Retention skipped by request.'
}
else {
    Write-Host ''
    Write-Host 'Retention'

    $retentionPolicyName = "$CompanyPrefix 7 Year Retention"
    $retentionRuleName   = "$CompanyPrefix 7 Year Rule"

    New-ComplianceObjectIfMissing -Label 'Retention policy' -TestCmdlet 'Get-RetentionCompliancePolicy' -Name $retentionPolicyName -Action {
        New-RetentionCompliancePolicy -Name $retentionPolicyName `
            -Enabled $true `
            -ExchangeLocation All -SharePointLocation All -OneDriveLocation All -ModernGroupLocation All `
            -Comment 'AB-900 demo retention policy'
    }

    # A retention POLICY defines scope; the RULE supplies the actual retain-and-delete
    # behavior. A policy with no rule silently does nothing, which is the single most
    # common retention misconfiguration and worth calling out on stage.
    #
    # Only ONE rule is permitted per retention policy, so this create must be gated.
    #
    # The existence check is gated on the rule's PARENT POLICY, not on the rule name, so
    # it cannot reuse Test-ComplianceObject (which tests -Identity). It is wrapped in
    # try/catch for the same reason that helper is: under -WhatIf the parent policy may
    # not exist yet, and Get-RetentionComplianceRule -Policy then throws rather than
    # returning $null. Treat any failure as "no rule found" and let ShouldProcess decide.
    $existingRule = $null
    try {
        $existingRule = Get-RetentionComplianceRule -Policy $retentionPolicyName -ErrorAction SilentlyContinue
    }
    catch {
        Write-Verbose "Retention rule lookup failed (expected when the parent policy does not exist yet): $($_.Exception.Message)"
    }

    if ($existingRule) {
        Write-Host "  [skip]   Retention rule already exists on '$retentionPolicyName'."
        $script:Skipped.Add("Retention rule : $retentionRuleName")
    }
    elseif ($PSCmdlet.ShouldProcess($retentionRuleName, 'Create retention rule')) {
        # 2555 days is 7 years. RetentionDurationDisplayHint only affects portal display.
        New-RetentionComplianceRule -Name $retentionRuleName `
            -Policy $retentionPolicyName `
            -RetentionDuration 2555 `
            -RetentionDurationDisplayHint Years `
            -RetentionComplianceAction KeepAndDelete `
            -ExpirationDateOption ModificationAgeInDays | Out-Null
        Write-Host "  [create] Retention rule '$retentionRuleName'."
        $script:Created.Add("Retention rule : $retentionRuleName")
    }
}

# --- Summary --------------------------------------------------------------------------
Write-Host ''
Write-Host '--- Run summary ---'
Write-Host "Created : $($script:Created.Count)"
$script:Created | ForEach-Object { Write-Host "  + $_" }
Write-Host "Existing: $($script:Skipped.Count)"
$script:Skipped | ForEach-Object { Write-Host "  = $_" }

Write-Host ''
Write-Host 'Verify in the portal at https://purview.microsoft.com'
Write-Host '  DLP policy     : Solutions > Data Loss Prevention > Policies'
Write-Host '  Sensitivity    : Solutions > Information Protection > Sensitivity labels'
Write-Host '  Label policy   : Solutions > Information Protection > Publishing policies'
Write-Host '  Retention      : Solutions > Data Lifecycle Management > Policies > Retention policies'
Write-Host ''
Write-Host 'Policy distribution across workloads takes up to 24 hours. Provision the day BEFORE the session.'
Write-Host ''
Write-Host 'Disconnect when finished:'
Write-Host '  Disconnect-ExchangeOnline -Confirm:$false'
