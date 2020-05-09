set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_Azure_ResourceGroup.ps1
set resourceGroupName=filechecker-tst-key-rg
set resourceGroupLocation=canadacentral
set armTemplate=Azure_Key_Vault.json

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -armTemplate %armTemplate% -addParameters true"
set /p asd="Hit enter to continue"