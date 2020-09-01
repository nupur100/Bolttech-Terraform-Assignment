
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

variable "ec2_key_name"{
}

variable "ec2_name"{
   default = "web-server"
}
