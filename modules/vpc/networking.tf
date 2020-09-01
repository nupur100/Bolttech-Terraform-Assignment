resource "aws_vpc" "prod-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "prod-subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "prod-subnet"
  }
}

output "vpc_id" {
  value = "${aws_vpc.prod-vpc.id}"
}
output "subnet_id" {
  value = "${aws_subnet.prod-subnet.id}"
}

