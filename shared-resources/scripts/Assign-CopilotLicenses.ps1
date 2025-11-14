<#
.SYNOPSIS
    Assigns Microsoft 365 Copilot licenses to users in bulk.

.DESCRIPTION
    This script reads a CSV file containing user principal names and assigns
    Copilot for Microsoft 365 licenses to those users. It includes error 
    handling and logging.

.PARAMETER CsvPath
    Path to CSV file containing UserPrincipalName column

.PARAMETER LogPath
    Path where log file will be created (optional)

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv"

.EXAMPLE
    .\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv" -LogPath ".\logs\license-assignment.log"

.NOTES
    Author: Course Materials
    Requires: Microsoft.Graph PowerShell SDK
    License SKU: Microsoft_365_Copilot (or your specific SKU)
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$CsvPath,
    
    [Parameter(Mandatory=$false)]
    [string]$LogPath = ".\copilot-license-assignment-$(Get-Date -Format 'yyyyMMdd-HHmmss').log"
)

# Function to write log messages
function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $Message"
    Write-Host $logMessage
    Add-Content -Path $LogPath -Value $logMessage
}

# Main script execution
try {
    Write-Log "=== Starting Copilot License Assignment ==="
    
    # Check if Microsoft.Graph module is installed
    if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
        Write-Log "ERROR: Microsoft.Graph module not found. Please install it first."
        Write-Log "Run: Install-Module Microsoft.Graph -Scope CurrentUser"
        exit 1
    }
    
    # Import required modules
    Write-Log "Importing Microsoft.Graph modules..."
    Import-Module Microsoft.Graph.Users
    Import-Module Microsoft.Graph.Identity.DirectoryManagement
    
    # Connect to Microsoft Graph
    Write-Log "Connecting to Microsoft Graph..."
    Connect-MgGraph -Scopes "User.ReadWrite.All", "Organization.Read.All"
    
    # Read CSV file
    if (-not (Test-Path $CsvPath)) {
        Write-Log "ERROR: CSV file not found at $CsvPath"
        exit 1
    }
    
    Write-Log "Reading users from CSV: $CsvPath"
    $users = Import-Csv -Path $CsvPath
    Write-Log "Found $($users.Count) users in CSV"
    
    # Get Copilot license SKU
    # Note: Update the SKU part number based on your tenant's available licenses
    $copilotSkuPartNumber = "MICROSOFT_365_COPILOT"
    
    Write-Log "Looking up Copilot license SKU..."
    $copilotSku = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq $copilotSkuPartNumber }
    
    if (-not $copilotSku) {
        Write-Log "ERROR: Copilot license SKU not found. Available SKUs:"
        Get-MgSubscribedSku | ForEach-Object { Write-Log "  - $($_.SkuPartNumber)" }
        exit 1
    }
    
    Write-Log "Found Copilot SKU: $($copilotSku.SkuId)"
    Write-Log "Available licenses: $($copilotSku.PrepaidUnits.Enabled - $copilotSku.ConsumedUnits)"
    
    # Process each user
    $successCount = 0
    $errorCount = 0
    
    foreach ($user in $users) {
        try {
            $upn = $user.UserPrincipalName
            Write-Log "Processing user: $upn"
            
            # Get user details
            $mgUser = Get-MgUser -UserId $upn -Property Id,UserPrincipalName,AssignedLicenses
            
            # Check if user already has Copilot license
            if ($mgUser.AssignedLicenses.SkuId -contains $copilotSku.SkuId) {
                Write-Log "  SKIPPED: User already has Copilot license"
                continue
            }
            
            # Assign license
            $licensesToAssign = @{
                AddLicenses = @(
                    @{
                        SkuId = $copilotSku.SkuId
                    }
                )
                RemoveLicenses = @()
            }
            
            Set-MgUserLicense -UserId $mgUser.Id -BodyParameter $licensesToAssign
            Write-Log "  SUCCESS: Copilot license assigned"
            $successCount++
            
        } catch {
            Write-Log "  ERROR: Failed to assign license - $($_.Exception.Message)"
            $errorCount++
        }
    }
    
    Write-Log "=== License Assignment Complete ==="
    Write-Log "Successfully assigned: $successCount"
    Write-Log "Errors: $errorCount"
    Write-Log "Log file: $LogPath"
    
    # Disconnect from Graph
    Disconnect-MgGraph
    
} catch {
    Write-Log "FATAL ERROR: $($_.Exception.Message)"
    exit 1
}
