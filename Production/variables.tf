variable "backend_S3_bucket" {
    default = "lambda-serverless-python-code"
  
}

variable "terraform_state_lock_DynamoDB" {
    default = "terraform-lock"
  
}

variable "ec2_count" {
    default = "1"
  
}
variable "ami_id" {
    default = "ami-0ded330691a314693"
  
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "subnet_id" {
  default = ""
}

variable "s3_bucket" {
    default = "terraform-backend-bucket123"
  
}
variable "s3_key" {
    default = "amibackup.zip"
  
}

variable "handler" {
    default = "lambda_function.lambda_handler"
  
}

variable "function_name" {
  default = "amibackup-function"
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
    default = "nupur-key-pair"
}





