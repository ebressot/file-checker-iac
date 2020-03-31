# file-checker-iac
Infrastructure as Code for the File Checker App

## Jenkins_Single_Instance.yml
CloudFormation template to launch an EC2 instance with Java 1.8 open JDK (required by Jenkins), Git, NodeJs 12.x and Jenkins.

The CF template also creates a security group which gives "SSHLocation" access to port 22 (SSH) and port 8080 (HTTP).

The CF template finally configures the AWS CLI: Jenkins will run as the IAM user defined by the credentials "AWSAccessKeyId/AWSSecretAccessKey".

The CF template outputs the Jenkins Url.

Direct reference: https://cf-templates-1e0b4nzsaectk-us-east-1.s3.amazonaws.com/Jenkins_Single_Instance.yml
