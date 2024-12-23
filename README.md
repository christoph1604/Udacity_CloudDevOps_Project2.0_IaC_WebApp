# CD12352 - Infrastructure as Code Project Solution
# Christoph Wagner

## Description
This repository contains the coding for Udacity Nanodegree "Cloud DevOps Engineer", project 2 ("Deploy a high-availability web app using Cloud Formation). 
The coding mainly consists of .yml and .json files used for the creation of
- a cloud infrastructure in AWS
- an example web-app running within this cloud infrastructure. 
Final aim is to spin up an nginx webserver in an EC2 instance and display an example web page. 

Used resource types: 
Auto-scaling groups, load balancer, IAM role, subnets, security groups, etc.

## Content
- "Cloud Architecture.jpeg": Architecture diagram created using LucidChart which displays the cloud infrastructure of the project
- folder "infrastructure": CloudFormation resource definition for the example application
    - network.yml: Cloud infrastructure definition
    - network-parameters.json: Input parameters for infrastructure creation.
    - udagram.yml: Cloud formation resource definition for the example application "Udagram"
    - udagram-parameters.json: Input parameters for example application creation.
- folder "scripts": Bash scripts for the automation of the CloudFormation resource creation (AWS CLI)
- folder "misc": Helper files
- README.MD: This file

## Entry page
When deployed, the example application "Udagram" can be accessed via the entry webpage. 
The URL is contained in the output variable "LoadBalancerURL" of the Udagram CloudFormation stack. 

Currently, it's value is: http://udacit-webap-p0l6fpmew1la-2142734151.us-east-1.elb.amazonaws.com/ 

## Spin up instructions
Execute the following bash commands:
```
./scripts/create.sh udacity-project2-iacwebapp-infra ./infrastructure/network.yml ./infrastructure/network-parameters.json (infrastructure resources)
./scripts/create.sh udacity-project2-iacwebapp-app ./infrastructure/udagram.yml ./infrastructure/udagram-parameters.json (web-app resources)
```

## Tear down instructions
Execute the following bash commands:
```
./scripts/create.sh udacity-project2-iacwebapp-infra ./infrastructure/network.yml ./infrastructure/network-parameters.json
./scripts/create.sh udacity-project2-iacwebapp-app ./infrastructure/udagram.yml ./infrastructure/udagram-parameters.json
```

## Other considerations
Manual web-app stack update:
```
aws cloudformation update-stack --stack-name udacity-project2-iacwebapp-app --template-body file://infrastructure/udagram.yml --parameters file://infrastructure/udagram-parameters.json --region us-east-1 --capabilities "CAPABILITY_NAMED_IAM"
```

Auto-scaling group instance refresh:
```
aws autoscaling start-instance-refresh --auto-scaling-group-name <tbd> --cli-input-json file://misc/config.json
```