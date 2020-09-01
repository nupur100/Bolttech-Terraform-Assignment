
variable "s3_bucket" {
    default = "lambda-serverless-python-code"
  
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

variable "lambda_role" {}




