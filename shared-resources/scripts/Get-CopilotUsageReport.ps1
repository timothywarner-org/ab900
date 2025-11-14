<#
.SYNOPSIS
    Generates a report of Microsoft 365 Copilot usage across the organization.

.DESCRIPTION
    This script retrieves Copilot usage data from Microsoft Graph API and 
    generates a comprehensive report showing adoption metrics.

.PARAMETER OutputPath
    Path where the report CSV will be saved

.PARAMETER Days
    Number of days to include in the report (default: 30)

.EXAMPLE
    .\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-usage.csv"

.EXAMPLE
    .\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-usage.csv" -Days 7

.NOTES
    Author: Course Materials
    Requires: Microsoft.Graph PowerShell SDK
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$OutputPath,
    
    [Parameter(Mandatory=$false)]
    [int]$Days = 30
)

# Function to write log messages
function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "$timestamp - $Message"
}

try {
    Write-Log "=== Starting Copilot Usage Report Generation ==="
    
    # Import required modules
    Import-Module Microsoft.Graph.Reports
    Import-Module Microsoft.Graph.Users
    
    # Connect to Microsoft Graph
    Write-Log "Connecting to Microsoft Graph..."
    Connect-MgGraph -Scopes "Reports.Read.All", "User.Read.All"
    
    Write-Log "Retrieving Copilot usage data for the last $Days days..."
    
    # Get all users with Copilot licenses
    $users = Get-MgUser -All -Property UserPrincipalName,DisplayName,AssignedLicenses
    
    # Note: This is a template. Actual Copilot usage reports would use specific
    # Microsoft Graph endpoints when available. Adapt based on current API.
    
    $report = @()
    
    foreach ($user in $users) {
        # Check if user has Copilot license
        # This is placeholder logic - update based on actual SKU
        $hasCopilot = $false
        foreach ($license in $user.AssignedLicenses) {
            # Check for Copilot SKU
            if ($license.SkuId -match "Copilot") {
                $hasCopilot = $true
                break
            }
        }
        
        if ($hasCopilot) {
            $reportEntry = [PSCustomObject]@{
                UserPrincipalName = $user.UserPrincipalName
                DisplayName = $user.DisplayName
                HasCopilotLicense = $true
                # Add more metrics as available from API
            }
            $report += $reportEntry
        }
    }
    
    # Export report
    Write-Log "Exporting report to: $OutputPath"
    $report | Export-Csv -Path $OutputPath -NoTypeInformation
    
    Write-Log "=== Report Generation Complete ==="
    Write-Log "Total users with Copilot: $($report.Count)"
    Write-Log "Report saved to: $OutputPath"
    
    # Disconnect from Graph
    Disconnect-MgGraph
    
} catch {
    Write-Log "ERROR: $($_.Exception.Message)"
    exit 1
}
