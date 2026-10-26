#Requires -Version 7.0
#Requires -Modules Microsoft.Graph.Authentication

<#
.SYNOPSIS
    Retrieves the Microsoft 365 Copilot usage user detail report from Microsoft Graph
    and saves it as CSV.

.DESCRIPTION
    Calls the Microsoft Graph Copilot reports endpoint
    /copilot/reports/getMicrosoft365CopilotUsageUserDetail and writes the returned
    report to disk.

    Two report versions are available. Version v1 returns last-activity dates per app.
    Version v2 adds prompt counts, active usage days, and Copilot Agent last activity
    date, which is what most adoption conversations actually need.

    Two important scope limits to understand before you rely on this data:

    1. The API returns usage only for users who hold a Microsoft 365 Copilot license.
       Unlicensed Copilot Chat usage is NOT available through the Graph reports APIs.
       For unlicensed usage, use the Copilot Chat usage report in the Microsoft 365
       admin center, or Microsoft Purview audit data.

    2. Microsoft does NOT support tracking per-user Copilot prompt counts across
       tenants, for privacy and security reasons.

    Report data is typically available within 48 hours of the end of a day in UTC.

.PARAMETER OutputPath
    Full path to the CSV file to create. The parent directory is created if missing.

.PARAMETER Period
    Aggregation window. Valid values depend on ReportVersion.
    For v1: D7, D30, D90, D180, ALL.
    For v2: D7, D28, D90, D180, ALL.
    Defaults to D30, which is valid only for v1. If you pass ReportVersion v2 without
    also setting Period, the script switches the default to D28 for you.

.PARAMETER ReportVersion
    Report schema version, v1 or v2. Defaults to v2 because it includes prompt counts
    and agent activity, which v1 omits.

.PARAMETER ConcealedNames
    Switch. When present, the script leaves the tenant's report privacy setting alone.
    By default the script warns if display names appear concealed, because the
    Microsoft 365 admin center "Display concealed user, group, and site names in all
    reports" setting replaces user names with pseudonyms in the output.

.EXAMPLE
    .\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-usage.csv"

    Retrieves the last 28 days of v2 usage detail for Copilot-licensed users.

.EXAMPLE
    .\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-7day.csv" -Period D7

    Retrieves a 7-day window, useful for a pilot check-in.

.EXAMPLE
    .\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\legacy.csv" -ReportVersion v1 -Period D90

    Retrieves the older v1 schema over 90 days, for comparison against historical exports.

.NOTES
    Author:  AB-900 course materials, Tim Warner
    Updated: 2026-07-26
    Requires: PowerShell 7.x and the Microsoft Graph PowerShell SDK.

    Graph permission: Reports.Read.All (delegated or application).

    For delegated access the signed-in user must additionally hold one of these Entra
    roles: Global Administrator, AI Administrator, Exchange Administrator, SharePoint
    Administrator, Teams Service Administrator, Teams Communications Administrator, or
    Reports Reader. Reports Reader is the least-privileged option and is the right
    default for an adoption analyst.

    This API is available in the global service only. It is NOT available in US
    Government L4, US Government L5 (DoD), or China operated by 21Vianet.

    Reference:
    https://learn.microsoft.com/microsoft-365/copilot/extensibility/api/admin-settings/reports/copilotreportroot-getmicrosoft365copilotusageuserdetail
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath,

    [Parameter(Mandatory = $false)]
    [ValidateSet('D7', 'D28', 'D30', 'D90', 'D180', 'ALL')]
    [string]$Period,

    [Parameter(Mandatory = $false)]
    [ValidateSet('v1', 'v2')]
    [string]$ReportVersion = 'v2',

    [Parameter(Mandatory = $false)]
    [switch]$ConcealedNames
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Log {
    <#
    .SYNOPSIS
        Writes a timestamped status message to the information stream.
    .DESCRIPTION
        Uses Write-Information rather than Write-Host so that callers can redirect or
        suppress script output without losing the ability to capture it.
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [Parameter(Mandatory = $false)]
        [ValidateSet('INFO', 'WARN', 'ERROR')]
        [string]$Level = 'INFO'
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Information "$timestamp [$Level] $Message" -InformationAction Continue
}

# Period defaults differ by report version: v1 supports D30 but not D28, v2 the
# reverse. Resolve the default here so the caller does not have to memorize the split.
if (-not $PSBoundParameters.ContainsKey('Period')) {
    $Period = if ($ReportVersion -eq 'v2') { 'D28' } else { 'D30' }
    Write-Log "No -Period supplied. Defaulting to $Period for report version $ReportVersion."
}

# Reject the two invalid version and period combinations up front rather than letting
# Graph return an opaque 400.
if ($ReportVersion -eq 'v1' -and $Period -eq 'D28') {
    throw "Report version v1 does not support period D28. Use D7, D30, D90, D180, or ALL."
}
if ($ReportVersion -eq 'v2' -and $Period -eq 'D30') {
    throw "Report version v2 does not support period D30. Use D7, D28, D90, D180, or ALL."
}

try {
    Write-Log '=== Starting Microsoft 365 Copilot usage report retrieval ==='

    # Ensure the output directory exists before Graph returns a payload we cannot save.
    $outputDirectory = Split-Path -Path $OutputPath -Parent
    if ($outputDirectory -and -not (Test-Path -Path $outputDirectory)) {
        Write-Log "Creating output directory: $outputDirectory"
        New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
    }

    # Connect only if there is no usable context, so re-running the script in the same
    # session does not force an interactive prompt every time.
    $context = $null
    try {
        $context = Get-MgContext -ErrorAction Stop
    }
    catch {
        $context = $null
    }

    if (-not $context) {
        Write-Log 'Connecting to Microsoft Graph with the Reports.Read.All scope...'
        Connect-MgGraph -Scopes 'Reports.Read.All' -NoWelcome
        $context = Get-MgContext
    }
    else {
        Write-Log "Reusing existing Microsoft Graph session for tenant $($context.TenantId)."
    }

    if (-not $context) {
        throw 'Unable to establish a Microsoft Graph session.'
    }

    # The endpoint returns a CSV stream, so request it directly to a file rather than
    # trying to deserialize it as JSON.
    $graphUri = "https://graph.microsoft.com/v1.0/copilot/reports/getMicrosoft365CopilotUsageUserDetail(period='$Period',version='$ReportVersion')"

    Write-Log "Requesting report: period=$Period, version=$ReportVersion"
    Write-Log "Endpoint: $graphUri"

    Invoke-MgGraphRequest -Method GET -Uri $graphUri -OutputFilePath $OutputPath

    if (-not (Test-Path -Path $OutputPath)) {
        throw "Graph call completed but no file was written to $OutputPath."
    }

    # Read the result back so we can report row count and sanity-check the payload.
    $rows = @(Import-Csv -Path $OutputPath)
    Write-Log "Report written to: $OutputPath"
    Write-Log "Rows returned: $($rows.Count)"

    if ($rows.Count -eq 0) {
        Write-Log 'The report returned zero rows. Common causes: no users hold a Microsoft 365 Copilot license, or usage data for the requested window is not yet available. Data typically appears within 48 hours of the end of a day in UTC.' -Level 'WARN'
    }
    elseif (-not $ConcealedNames) {
        # Concealed reporting replaces display names with pseudonyms. Warn rather than
        # fail, because some organizations deliberately keep concealment enabled.
        $firstName = $rows[0].'User Principal Name'
        if ($firstName -and $firstName -notmatch '@') {
            Write-Log "User names appear to be concealed. To show real names, a Global Administrator must clear 'Display concealed user, group, and site names in all reports' in the Microsoft 365 admin center Reports settings. Pass -ConcealedNames to suppress this warning." -Level 'WARN'
        }
    }

    Write-Log '=== Report retrieval complete ==='
    Write-Log 'Reminder: this report covers Copilot-licensed users only. Unlicensed Copilot Chat usage is not exposed through Microsoft Graph. Use the Copilot Chat usage report in the Microsoft 365 admin center for that.'

    exit 0
}
catch {
    Write-Log "Report retrieval failed: $($_.Exception.Message)" -Level 'ERROR'
    Write-Log "Failing command: $($_.InvocationInfo.Line.Trim())" -Level 'ERROR'
    exit 1
}
finally {
    # Leave the Graph session intact. Disconnecting here would break interactive use
    # where an analyst runs several report pulls back to back.
    Write-Log 'Microsoft Graph session left open. Run Disconnect-MgGraph when finished.'
}
