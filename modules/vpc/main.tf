terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Env = var.environment
    Terraform = var.terraform
  }
}