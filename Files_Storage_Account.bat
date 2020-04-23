set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_Azure_ResourceGroup.ps1
set resourceGroupName=filecheckerrg
set resourceGroupLocation=canadacentral
set armTemplate=Files_Storage_Account.json

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -armTemplate %armTemplate%"
set /p asd="Hit enter to continue"