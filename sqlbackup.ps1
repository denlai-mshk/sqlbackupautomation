# Variables
$resourceGroupName = "YourResourceGroupName"
$automationAccountName = "YourAutomationAccountName"
$storageAccountName = "YourStorageAccountName"
$containerName = "YourContainerName"
$backupFileName = "YourDatabaseName.bak"
$localBackupPath = "C:\Backup\$backupFileName"
$blobUri = "https://$storageAccountName.blob.core.windows.net/$containerName/$backupFileName"
$managedInstanceName = "YourManagedInstanceName"
$databaseName = "YourDatabaseName"
$adminLogin = "YourAdminLogin"
$adminPassword = "YourAdminPassword"

# Step 1: Backup the on-premises SQL Server database
Invoke-Sqlcmd -Query "BACKUP DATABASE [$databaseName] TO DISK = '$localBackupPath'" -ServerInstance "YourOnPremServerInstance"

# Step 2: Upload the backup file to Azure Blob Storage
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -AccountName $storageAccountName).Value[0]
Set-AzStorageBlobContent -File $localBackupPath -Container $containerName -Blob $backupFileName -Context $context

# Step 3: Restore the database to Azure SQL Managed Instance
$restoreQuery = @"
RESTORE DATABASE [$databaseName] 
FROM URL = '$blobUri'
WITH MOVE '$databaseName' TO 'path_to_data_file', 
     MOVE '$databaseName_log' TO 'path_to_log_file'
"@

Invoke-Sqlcmd -Query $restoreQuery -ServerInstance "$managedInstanceName.database.windows.net" -Username $adminLogin -Password $adminPassword

# Clean up local backup file
Remove-Item -Path $localBackupPath
