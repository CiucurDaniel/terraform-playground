terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "subnet" {
  count = length(var.cidrs)
  vpc_id = var.vpc_id
  cidr_block = var.cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.name}${count.index}"
  }
}

resource "aws_route_table" "table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
    Env = var.environment
    Terraform = var.terraform
  }
}

resource "aws_route_table_association" "assoc" {
  count = length(var.cidrs)
  subnet_id = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.table.id
}
