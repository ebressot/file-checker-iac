param($localPath, $resourceGroupName, $resourceGroupLocation, $armTemplate, $parameterFile, $addParameters)

Set-Location -Path $localPath
New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation #use this command when you need to create a new resource group for your deployment

if ($addParameters) {
    Update-Module AzureAD
    Import-Module AzureAD
    
    $context = Get-AzContext
    
    if (!($context)) 
    {
        Connect-AzAccount
        $context = Get-AzContext
    } 
    else 
    {
        Write-Host "Already connected to Azure"
    }
    
    Connect-AzureAD -TenantId $context.Tenant.Id
    $user = Get-AzureADUser -ObjectId $context.Account.Id
    $secretValue = Read-Host -Prompt 'Enter Alpha Vantage API key'

    $parameters = @{
        servicePrincipal = $user.ObjectId;
        secretValue = $secretValue.ToString()
    }

    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\$armTemplate -TemplateParameterObject $parameters
} elseif ($parameterFile) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\$armTemplate -TemplateParameterFile .\$parameterFile
} else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\$armTemplate
}
