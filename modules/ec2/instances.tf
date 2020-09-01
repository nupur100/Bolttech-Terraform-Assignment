resource "aws_instance" "web-server" {
    count = "${var.ec2_count}"
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
	key_name = "${var.ec2_key_name}"
    tags = {
    Name = "${var.ec2_name}"
  }
}


