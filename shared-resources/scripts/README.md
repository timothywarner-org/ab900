# PowerShell Scripts

This directory contains PowerShell scripts for automating Microsoft 365 and Copilot administration tasks.

**Last updated:** 2026-07-26

## Available Scripts

### License Management

- **Assign-CopilotLicenses.ps1** -- Bulk assign Microsoft 365 Copilot licenses from a CSV. Idempotent, supports `-WhatIf` and `-Confirm`, and includes a `-ListSkus` discovery mode.
- **Get-CopilotUsageReport.ps1** -- Retrieve the Microsoft 365 Copilot usage user detail report from Microsoft Graph and save it as CSV.

### Prerequisites

Both scripts require:

- **PowerShell 7.x.** The scripts declare `#Requires -Version 7.0`. Windows PowerShell 5.1 is not supported.
- **Microsoft Graph PowerShell SDK.** The retired MSOnline and AzureAD modules are **NOT** used and must **NOT** be substituted.
- Appropriate Microsoft Entra role assignments (see each script's comment-based help)

## Installing Prerequisites

```powershell
# Install the Microsoft Graph PowerShell SDK for the current user
Install-Module Microsoft.Graph -Scope CurrentUser

# The scripts import what they need via #Requires, but these are the modules involved
Import-Module Microsoft.Graph.Authentication
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Identity.DirectoryManagement
```

## Required permissions

| Script | Graph scopes | Least-privileged Entra role |
|--------|--------------|-----------------------------|
| Assign-CopilotLicenses.ps1 | `User.ReadWrite.All`, `Organization.Read.All` | License Administrator or User Administrator |
| Get-CopilotUsageReport.ps1 | `Reports.Read.All` | Reports Reader |

For the usage report, delegated access additionally requires the signed-in user to hold one of these roles: Global Administrator, AI Administrator, Exchange Administrator, SharePoint Administrator, Teams Service Administrator, Teams Communications Administrator, or Reports Reader.

## Discovering the correct SKU

Do **NOT** hardcode a SKU part number without checking. Tenants can carry more than one Copilot-family SKU, and the SMB add-on differs from the enterprise one.

```powershell
# Lists every subscribed SKU with seat counts, then exits without changing anything
.\Assign-CopilotLicenses.ps1 -ListSkus
```

The default the script uses is `Microsoft_365_Copilot`, the string ID Microsoft publishes for the enterprise Microsoft 365 Copilot add-on in the licensing service plan reference.

## Dry-running before you commit seats

Copilot seats are expensive and license churn is visible to end users. Always dry-run first.

```powershell
# Reports exactly which users would receive a license, changes nothing
.\Assign-CopilotLicenses.ps1 -CsvPath ".\users.csv" -WhatIf
```

## Usage report scope limits

Two limits matter before you build an adoption narrative on this data:

1. The Graph API returns usage only for users who hold a Microsoft 365 Copilot license. **Unlicensed Copilot Chat usage is NOT available** through the Graph reports APIs. Use the Copilot Chat usage report in the Microsoft 365 admin center for that.
2. Microsoft does **NOT** support tracking per-user Copilot prompt counts across tenants, for privacy and security reasons.

Report data is typically available within 48 hours of the end of a day in UTC.

```powershell
# Last 28 days, v2 schema (includes prompt counts and agent activity)
.\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-usage.csv"

# 7-day window for a pilot check-in
.\Get-CopilotUsageReport.ps1 -OutputPath ".\reports\copilot-7day.csv" -Period D7
```

Period values differ by report version. Version v1 accepts D7, D30, D90, D180, and ALL. Version v2 accepts D7, **D28**, D90, D180, and ALL. The script validates the combination and fails fast rather than letting Graph return an opaque error.

## Usage Guidelines

1. **Always test in non-production first**
2. **Review and customize scripts** for your environment
3. **Understand what each script does** before running
4. **Have appropriate permissions**
5. **Keep logs** of script executions
6. **Follow security best practices**

## Security Notes

- Never commit credentials to version control
- Use secure authentication methods
- Follow principle of least privilege
- Audit script usage
- Review scripts for security issues

## Sample CSV Format

For `Assign-CopilotLicenses.ps1`. The header must read exactly `UserPrincipalName`; the script validates the schema before connecting to Graph.

```csv
UserPrincipalName
dan.jump@contoso.com
alex.wilber@contoso.com
nestor.wilke@contoso.com
```

## Licensing context these scripts assume

- Microsoft 365 Copilot is a per-user add-on requiring an eligible base subscription. There is **NO** seat minimum; the original 300-seat minimum was removed in January 2024.
- **Microsoft 365 Copilot Business** is a separate SMB SKU capped at **300 seats** per tenant.
- **Microsoft 365 E7** includes Microsoft 365 Copilot in the base SKU, so E7 users do **NOT** need the add-on assigned separately.
- Allow up to **24 hours** after assignment for Copilot features to appear in the Microsoft 365 apps.

## Support

For issues with these scripts:
1. Check script documentation and comments
2. Verify prerequisites are installed
3. Check permissions and authentication
4. Review error messages and logs
5. Consult Microsoft Graph documentation

## Contributing

Improvements and additional scripts are welcome! Please:
1. Test thoroughly
2. Add proper documentation
3. Include error handling
4. Follow PowerShell best practices
