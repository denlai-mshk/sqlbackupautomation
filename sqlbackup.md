# Steps to Deploy in Azure Automation Runbook
This Powershell script [sqlbackup.ps1](\sqlbackup.ps1) will automate the process of backing up your on-premises SQL Server database and restoring it to an Azure SQL Managed Instance.

##  1. Create an Automation Account:
    If you don’t have one, create an Azure Automation Account in the Azure portal.

##  2. Import Modules:
    Ensure the necessary modules (Az.Storage, Az.Accounts, SqlServer) are imported into your Automation Account.

##  3. Create a Runbook:
    Create a new PowerShell Runbook in your Automation Account and paste the script above.

##  4. Configure Credentials:
    Store your SQL Server credentials and Azure Storage account keys securely in the Automation Account’s credentials and variables.

##  5. Schedule the Runbook:
    Optionally, you can schedule the runbook to run at specific intervals.

