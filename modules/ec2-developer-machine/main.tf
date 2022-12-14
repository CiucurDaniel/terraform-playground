terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Obtain Ubuntu AMI from code

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "user_data" {
  template = file("server.sh")

  vars = {
    "port" = var.server_port
    "environment" = var.environment
  }
}

# Configure the EC2 INSTANCE

resource "aws_instance" "app_server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.app_server_security_group.id]

  key_name = var.ssh_key_name

  user_data = data.template_file.user_data.rendered

  tags = {
    Name = "app_server_ec2"
    Description = "EC2 instance which serves a static html file"
    Environment = var.environment
    Terraform = var.terraform
  }
}

# By default no traffic is allowed incoming/outgoing from EC2
# therefore, configure a security_group to allow traffic on port var.server_port

resource "aws_security_group" "app_server_security_group" {
  name = "app_server_security_group"
  vpc_id = var.vpc_id

  ingress {
    protocol = "tcp"
    from_port = var.server_port
    to_port = var.server_port
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
