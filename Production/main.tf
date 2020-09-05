provider "aws" {
    region = "${var.aws_region}" 
}

module "lambda_function" {
  source = "../modules/lambda"
  function_name = "${var.function_name}"   
  lambda_role = "${module.iam_module.lambda_role}"
  handler = "${var.handler}"
  runtime = "${var.runtime}"   
}

module iam_module {
  source = "../modules/iam"
}

module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  tenancy = "${var.tenancy}"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_cidr = "${var.subnet_cidr}"
  
}

module "ec2" {
  source = "../modules/ec2"
  ec2_count = "${var.ec2_count}"
  instance_type="${var.instance_type}"
  ami_id = "${var.ami_id}"
  subnet_id = "${module.vpc.subnet_id}"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket123"
  }
}

