param($localPath, $cfTemplate, $s3Bucket, $stackName, $params)

Set-Location -Path $localPath

write-host "**********************************"

# Copy new version of file to s3
$Command = "aws s3 cp .\$cfTemplate s3://$s3Bucket"
write-host "Executing: $Command"
Invoke-Expression $Command

write-host "**********************************"

# Update CloudFormation stack
$Command = "aws cloudformation update-stack --stack-name $stackName --template-url https://$s3Bucket.s3.amazonaws.com/$cfTemplate"
$Parameters = ""

foreach ($param in $params) {
    $Parameters = "$Parameters $param"
}

if ($Parameters -ne "") {
    $Command = "$Command --parameters$Parameters"
}

write-host "Executing: $Command"
Invoke-Expression $Command

write-host "**********************************"
