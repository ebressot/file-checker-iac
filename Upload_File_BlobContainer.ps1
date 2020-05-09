param($fileName, $localPath, $remotePath, $metadata)

$resourceGroupName = "filechecker-tst-store-rg"
$storageAccountName = "storeiptr3ogmewhhg"
$containerName = "files"

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

if ($metadata) {
    Set-AzStorageBlobContent -File "$localPath$fileName" `
      -Container $containerName `
      -Blob "$remotePath$fileName" `
      -Context $ctx `
      -Metadata $metadata
} else {
    Set-AzStorageBlobContent -File "$localPath$fileName" `
      -Container $containerName `
      -Blob "$remotePath$fileName" `
      -Context $ctx
}
