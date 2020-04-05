# file-checker-iac
Infrastructure as Code for the File Checker App

## Jenkins_Single_Instance.yml
CloudFormation template to launch an EC2 instance with Java 1.8 open JDK (required by Jenkins), Git, NodeJs 12.x and Jenkins.

The CF template also creates a security group which gives "SSHLocation" access to port 22 (SSH) and port 8080 (HTTP).

The CF template finally configures the AWS CLI: Jenkins will run as the IAM user defined by the credentials "AWSAccessKeyId/AWSSecretAccessKey".

The CF template outputs the Jenkins Url.

Direct link: https://cf-templates-1e0b4nzsaectk-us-east-1.s3.amazonaws.com/Jenkins_Single_Instance.yml

Reference: WordPress basic single instance at https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/sample-templates-applications-us-east-1.html

## Bucket_Website_Hosting.yml
CloudFormation template to create an s3 bucket with Static Website Hosting enabled and public read policy.

This bucket can be used to host the static elements (html, css, js) of your public website.

The CF template outputs the wesite Url.

Direct link: https://cf-templates-1e0b4nzsaectk-us-east-1.s3.amazonaws.com/Bucket_Website_Hosting.yml

Reference: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-s3.html#scenario-s3-bucket-website

## Deploy_CloudFormation_Template.ps1
PowerShell script to deploy one of the above CloudFormation templates and update the associated stack.

The PS script sets the current location to localPath, copies the cfTemplate to the s3Bucket and updates the CF stack.

The CF template's parameter values can optionally be modified at the same time (default: UsePreviousValue=true).

The command fails if there is nothing to update.

Use case examples: Jenkins_Single_Instance.bat, Bucket_Website_Hosting.bat
