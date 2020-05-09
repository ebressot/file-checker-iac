set localPath=C:\Users\Eric\file-checker\file-checker-iac
set scriptFile=Deploy_Azure_ResourceGroup.ps1
set resourceGroupName=filechecker-tst-factory-rg
set resourceGroupLocation=canadacentral
set armTemplate=Azure_Data_Factory_Tst.json

cd %localPath%
powershell ".\%scriptFile% -localPath %localPath% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -armTemplate %armTemplate%"
set /p asd="Hit enter to continue"