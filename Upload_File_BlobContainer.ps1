param($fileName, $localPath, $remotePath, $metadata)

$resourceGroupName = "filecheckerrg"
$storageAccountName = "storehc3iipvwyqd4m"
$containerName = "blobshc3iipvwyqd4m"

if (!(Get-AzContext)) 
{
    Connect-AzAccount
} 
else 
{
    Write-Host "Already connected to Azure"
}

$storageAccount = Get-AzStorageAccount `
  -ResourceGroupName $resourceGroupName `
  -AccountName $storageAccountName

$ctx = $storageAccount.Context

Set-AzStorageBlobContent -File "$localPath$fileName" `
  -Container $containerName `
  -Blob "$remotePath$fileName" `
  -Context $ctx `
  -Metadata $metadata
