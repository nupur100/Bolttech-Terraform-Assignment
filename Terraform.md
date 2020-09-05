# Bolttech-Terraform-Assignment

## Pre-requisites:

```

Terraform

Backend S3 Bucket for state management should be created prior to this.

```

## Modules Explanation:

```

VPC : To create Custom VPC and subnet with specified CIDR range.
EC2 : To create EC2 in this custom VPC with specified AMI and instance type.
IAM : To create IAM permissions role with defined custom policy.
Lambda : To create lambda function with the sample code along with the above IAM role permissions. 

```

## Executing Terraform template:

```
1) You need to change backend bucket name in 'backend' section of 'Production/main.tf' with your created bucket name.

2) From the Production Directory:
   terraform init
   terraform plan
   terraform apply

```

***Note: If needed, you can change the default variable values in Production/variables.tf***



