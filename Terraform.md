# Bolttech-Terraform-Assignment

# Pre-requisites:

```
Terraform
Backend S3 Bucket for state management should be created (Specify bucket name in 'backend' section of 'main.tf')
S3 bucket with .zip file should be there to upload zip code to lambda function. (Specify S3 bucket name and zip file key name in Production/variables.tf)

```

# Modules:

```
VPC: To create Custom VPC and subnet with specified CIDR range.
EC2: To create EC2 in this custom VPC with specified AMI and instance type.
IAM: To create IAM permissions role with custom policy for Lambda function.
Lambda: To create lambda function with the zip file code along with this IAM role permissions. 

```

# Executing Terraform template:

```
From the Production Directory:
terraform init
terraform plan
terraform apply

```




