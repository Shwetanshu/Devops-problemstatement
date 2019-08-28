variable "aws_region" {
  description = "Region for the VPC"
  default = "ap-southeast-1"
}

variable "vpc_devops" {
  description = "CIDR for the VPC"
  default = "172.20.0.0/16"
}

variable "public_subnet_devops" {
  description = "CIDR for the public subnet"
  default = "172.20.10.0/24"
}

variable "private_subnet_devops" {
  description = "CIDR for the private subnet"
  default = "172.20.20.0/24"
}

variable "ami_devops" {
  description = "Amazon Linux AMI"
  default = "ami-14c5486b"
}

variable "key_path_devops" {
  description = "SSH Public Key path"
  default = "public_key"
}
