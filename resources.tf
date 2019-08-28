# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "equalexpert"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "jenkins" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgvm.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("userdata.sh")}"1

  tags {
    Name = "jenkins"
  }
}

# Define private vm inside the private subnet
resource "aws_instance" "docker" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgvm.id}"]
   source_dest_check = false

  tags {
    Name = "docker"
  }
}
