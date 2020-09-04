variable "aws_region" {
    description = "Enter AWS Region in which resources needs to create"
  
}

variable "ec2_count" {
    default = "1"
  
}
variable "ami_id" {
    description = "AMI ID to be used for instance creation"
  
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "subnet_id" {
  default = ""
}

variable "handler" {
    default = "lambda_function.lambda_handler"
  
}

variable "function_name" {
  description = "Lambda Function Name"
}

variable "runtime" {
  default = "python3.8"
}

variable "Retention_Days" {
  default = "30"
}

variable "role_name" {
  default = "lambda_role"
}

variable "policy_name" {
  default = "LambdaBackupPolicy"
}


variable "vpc_cidr" {
    default = "10.0.0.0/16"
  
}

variable "tenancy" {
    default = "default"
  
}


variable "vpc_id" {
    default = ""
  
}


variable "subnet_cidr" {
    default = "10.0.0.0/24"
  
}

variable "ec2_key_name"{
    description = "Key pair name to be used with EC2"
}


