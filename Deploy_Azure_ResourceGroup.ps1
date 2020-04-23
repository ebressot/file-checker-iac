param($localPath, $resourceGroupName, $resourceGroupLocation, $armTemplate)

Set-Location -Path $localPath

New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation #use this command when you need to create a new resource group for your deployment
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\$armTemplate