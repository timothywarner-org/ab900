# PowerShell Scripts

This directory contains PowerShell scripts for automating Microsoft 365 and Copilot administration tasks.

## Available Scripts

### License Management
- **Assign-CopilotLicenses.ps1** - Bulk assign Copilot licenses from CSV
- **Get-CopilotUsageReport.ps1** - Generate usage reports

### Prerequisites

All scripts require:
- PowerShell 5.1 or PowerShell 7+
- Microsoft.Graph PowerShell SDK
- Appropriate admin permissions

## Installing Prerequisites

```powershell
# Install Microsoft Graph PowerShell SDK
Install-Module Microsoft.Graph -Scope CurrentUser

# Import required modules (example)
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Reports
```

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

For `Assign-CopilotLicenses.ps1`:
```csv
UserPrincipalName
john.doe@contoso.com
jane.smith@contoso.com
```

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
