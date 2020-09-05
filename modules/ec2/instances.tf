resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.ec2_key_name}"
  public_key = "${tls_private_key.this.public_key_openssh}"
}

resource "aws_instance" "web-server" {
    count = "${var.ec2_count}"
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
	key_name = "${aws_key_pair.generated_key.key_name}"
    tags = {
    Name = "${var.ec2_name}"
  }
}


