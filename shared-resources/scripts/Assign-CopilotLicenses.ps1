#Requires -Version 7.0
#Requires -Modules Microsoft.Graph.Authentication, Microsoft.Graph.Users, Microsoft.Graph.Identity.DirectoryManagement

<#
.SYNOPSIS
    Assigns Microsoft 365 Copilot licenses to users in bulk from a CSV file.

.DESCRIPTION
    Reads a CSV containing a UserPrincipalName column and assigns the Microsoft 365
    Copilot add-on license to each user via the Microsoft Graph PowerShell SDK.

    The script is idempotent. Users who already hold the target SKU are skipped rather
    than reassigned, so re-running after a partial failure is safe.

    Supports -WhatIf and -Confirm so you can dry-run the assignment before committing
    licenses, which matters because Copilot seats are expensive and license churn is
    visible to end users.

    Licensing context as of July 2026:
      - Microsoft 365 Copilot is a per-user add-on requiring an eligible base
        subscription. There is NO seat minimum; the original 300-seat minimum was
        removed in January 2024.
      - Microsoft 365 Copilot Business is a separate SMB SKU capped at 300 seats.
      - Microsoft 365 E7 includes Microsoft 365 Copilot in the base SKU, so E7 users do
        NOT need this add-on assigned separately.

.PARAMETER CsvPath
    Path to a CSV file containing a UserPrincipalName column.

.PARAMETER SkuPartNumber
    The SKU part number to assign. Defaults to Microsoft_365_Copilot, the string ID
    Microsoft publishes for the enterprise Microsoft 365 Copilot add-on.

    Confirm the value in your own tenant before running. Tenants can carry more than
    one Copilot-family SKU, and the SMB add-on uses a different part number. Run
    Get-MgSubscribedSku to list what your tenant actually owns, or run this script with
    -ListSkus.

.PARAMETER LogPath
    Path for the transcript-style log file. Defaults to a timestamped file in the
    current directory.

.PARAMETER ListSkus
    Switch. Lists the subscribed SKUs in the tenant with available seat counts, then
    exits without assigning anything. Use this first to discover the correct
    SkuPartNumber.

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -ListSkus

    Lists every subscribed SKU with consumed and available seats. Run this first.

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv" -WhatIf

    Dry run. Reports exactly which users would receive a license without changing
    anything.

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv"

    Assigns licenses, prompting once per user because ConfirmImpact is Medium.

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv" -Confirm:$false -LogPath ".\logs\copilot.log"

    Unattended bulk assignment with an explicit log path.

.NOTES
    Author:  AB-900 course materials, Tim Warner
    Updated: 2026-07-26
    Requires: PowerShell 7.x and the Microsoft Graph PowerShell SDK.

    Graph permissions: User.ReadWrite.All and Organization.Read.All.

    The MSOnline and AzureAD PowerShell modules are retired. Use the Microsoft Graph
    PowerShell SDK, as this script does.

    Sample CSV:
        UserPrincipalName
        dan.jump@contoso.com
        alex.wilber@contoso.com

    License activation is not instantaneous. Allow up to 24 hours for Copilot features
    to appear in the Microsoft 365 apps after assignment.

    Reference:
    https://learn.microsoft.com/microsoft-365/copilot/microsoft-365-copilot-licensing
    https://learn.microsoft.com/entra/identity/users/licensing-service-plan-reference
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium', DefaultParameterSetName = 'Assign')]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'Assign')]
    [ValidateNotNullOrEmpty()]
    [string]$CsvPath,

    [Parameter(Mandatory = $false, ParameterSetName = 'Assign')]
    [ValidateNotNullOrEmpty()]
    [string]$SkuPartNumber = 'Microsoft_365_Copilot',

    [Parameter(Mandatory = $false, ParameterSetName = 'Assign')]
    [ValidateNotNullOrEmpty()]
    [string]$LogPath = ".\copilot-license-assignment-$(Get-Date -Format 'yyyyMMdd-HHmmss').log",

    [Parameter(Mandatory = $true, ParameterSetName = 'ListSkus')]
    [switch]$ListSkus
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Script-scoped so Write-Log can reach it without a parameter on every call.
$script:ActiveLogPath = $null

function Write-Log {
    <#
    .SYNOPSIS
        Writes a timestamped message to the information stream and, when configured, to
        a log file.
    .DESCRIPTION
        Uses Write-Information rather than Write-Host so output can be redirected. File
        logging failures are non-fatal: losing the log should never abort a license run
        that is already partly complete.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [Parameter(Mandatory = $false)]
        [ValidateSet('INFO', 'WARN', 'ERROR')]
        [string]$Level = 'INFO'
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $line = "$timestamp [$Level] $Message"
    Write-Information $line -InformationAction Continue

    if ($script:ActiveLogPath) {
        try {
            Add-Content -Path $script:ActiveLogPath -Value $line -ErrorAction Stop
        }
        catch {
            Write-Warning "Could not write to log file '$script:ActiveLogPath': $($_.Exception.Message)"
            # Stop trying so we do not emit a warning per line for the rest of the run.
            $script:ActiveLogPath = $null
        }
    }
}

function Connect-GraphSession {
    <#
    .SYNOPSIS
        Establishes a Microsoft Graph session if one is not already active.
    .DESCRIPTION
        Reusing an existing context avoids an interactive prompt on every run during an
        interactive troubleshooting session.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Scopes
    )

    $context = $null
    try {
        $context = Get-MgContext -ErrorAction Stop
    }
    catch {
        $context = $null
    }

    if (-not $context) {
        Write-Log "Connecting to Microsoft Graph with scopes: $($Scopes -join ', ')"
        Connect-MgGraph -Scopes $Scopes -NoWelcome
        $context = Get-MgContext
    }
    else {
        Write-Log "Reusing existing Microsoft Graph session for tenant $($context.TenantId)."
    }

    if (-not $context) {
        throw 'Unable to establish a Microsoft Graph session.'
    }

    return $context
}

# ----- ListSkus mode: discovery only, no changes -----------------------------------

if ($PSCmdlet.ParameterSetName -eq 'ListSkus') {
    try {
        Connect-GraphSession -Scopes @('Organization.Read.All') | Out-Null

        Write-Log 'Retrieving subscribed SKUs...'
        $skus = Get-MgSubscribedSku -All

        $skus |
            Select-Object `
                SkuPartNumber,
                SkuId,
                @{ Name = 'Enabled';   Expression = { $_.PrepaidUnits.Enabled } },
                @{ Name = 'Consumed';  Expression = { $_.ConsumedUnits } },
                @{ Name = 'Available'; Expression = { $_.PrepaidUnits.Enabled - $_.ConsumedUnits } } |
            Sort-Object SkuPartNumber |
            Format-Table -AutoSize

        Write-Log 'Look for a Copilot SKU in the list above, then pass its SkuPartNumber to -SkuPartNumber.'
        exit 0
    }
    catch {
        Write-Log "Failed to list SKUs: $($_.Exception.Message)" -Level 'ERROR'
        exit 1
    }
}

# ----- Assign mode -----------------------------------------------------------------

$exitCode = 0

try {
    $script:ActiveLogPath = $LogPath

    # Create the log directory before the first Write-Log that targets a file.
    $logDirectory = Split-Path -Path $LogPath -Parent
    if ($logDirectory -and -not (Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }

    Write-Log '=== Starting Microsoft 365 Copilot license assignment ==='

    if (-not (Test-Path -Path $CsvPath)) {
        throw "CSV file not found at '$CsvPath'."
    }

    Write-Log "Reading users from CSV: $CsvPath"
    $users = @(Import-Csv -Path $CsvPath)

    if ($users.Count -eq 0) {
        throw "CSV file '$CsvPath' contains no rows."
    }

    # Validate the schema before touching Graph, so a typo in the header fails fast
    # rather than after a sign-in prompt.
    $csvColumns = $users[0].PSObject.Properties.Name
    if ($csvColumns -notcontains 'UserPrincipalName') {
        throw "CSV file must contain a 'UserPrincipalName' column. Found: $($csvColumns -join ', ')"
    }

    Write-Log "Found $($users.Count) rows in CSV."

    Connect-GraphSession -Scopes @('User.ReadWrite.All', 'Organization.Read.All') | Out-Null

    Write-Log "Looking up license SKU '$SkuPartNumber'..."
    $targetSku = Get-MgSubscribedSku -All | Where-Object { $_.SkuPartNumber -eq $SkuPartNumber }

    if (-not $targetSku) {
        Write-Log "SKU '$SkuPartNumber' was not found in this tenant. Available SKUs:" -Level 'ERROR'
        Get-MgSubscribedSku -All |
            Sort-Object SkuPartNumber |
            ForEach-Object { Write-Log "  - $($_.SkuPartNumber)" -Level 'ERROR' }
        throw "SKU '$SkuPartNumber' not found. Run this script with -ListSkus to see seat counts."
    }

    $availableSeats = $targetSku.PrepaidUnits.Enabled - $targetSku.ConsumedUnits
    Write-Log "Found SKU '$SkuPartNumber' with SkuId $($targetSku.SkuId)."
    Write-Log "Seats: $($targetSku.PrepaidUnits.Enabled) enabled, $($targetSku.ConsumedUnits) consumed, $availableSeats available."

    if ($availableSeats -lt $users.Count) {
        Write-Log "CSV requests $($users.Count) assignments but only $availableSeats seats are available. Assignments will fail once seats are exhausted." -Level 'WARN'
    }

    $successCount = 0
    $skippedCount = 0
    $errorCount   = 0

    foreach ($row in $users) {
        $upn = $row.UserPrincipalName

        if ([string]::IsNullOrWhiteSpace($upn)) {
            Write-Log 'Skipping a row with an empty UserPrincipalName.' -Level 'WARN'
            $skippedCount++
            continue
        }

        $upn = $upn.Trim()

        try {
            $mgUser = Get-MgUser -UserId $upn -Property 'Id,UserPrincipalName,AssignedLicenses'

            # Idempotency check: never reassign a SKU the user already holds.
            if ($mgUser.AssignedLicenses.SkuId -contains $targetSku.SkuId) {
                Write-Log "$upn : SKIPPED, already holds $SkuPartNumber."
                $skippedCount++
                continue
            }

            if ($PSCmdlet.ShouldProcess($upn, "Assign license $SkuPartNumber")) {
                $licenseBody = @{
                    AddLicenses    = @(@{ SkuId = $targetSku.SkuId })
                    RemoveLicenses = @()
                }

                Set-MgUserLicense -UserId $mgUser.Id -BodyParameter $licenseBody | Out-Null
                Write-Log "$upn : SUCCESS, $SkuPartNumber assigned."
                $successCount++
            }
            else {
                # -WhatIf path. Counted as skipped so the summary reflects reality.
                $skippedCount++
            }
        }
        catch {
            Write-Log "$upn : ERROR, $($_.Exception.Message)" -Level 'ERROR'
            $errorCount++
        }
    }

    Write-Log '=== License assignment complete ==='
    Write-Log "Assigned: $successCount"
    Write-Log "Skipped:  $skippedCount"
    Write-Log "Errors:   $errorCount"

    if ($script:ActiveLogPath) {
        Write-Log "Log file: $script:ActiveLogPath"
    }

    Write-Log 'Allow up to 24 hours for Copilot features to appear in the Microsoft 365 apps after license assignment.'

    # Signal partial failure to the caller so CI or a scheduled run can react.
    if ($errorCount -gt 0) {
        $exitCode = 1
    }
}
catch {
    Write-Log "FATAL: $($_.Exception.Message)" -Level 'ERROR'
    $exitCode = 1
}
finally {
    # Leave the Graph session open for interactive follow-up work.
    Write-Log 'Microsoft Graph session left open. Run Disconnect-MgGraph when finished.'
}

exit $exitCode
