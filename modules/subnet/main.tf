// Subnet module should create N public subnets
// in turn on route table will be created and an internet gateway
// afterwards the route to internet gateway will be added to the route table

terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


# Create the subnet

resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr
  availability_zone = var.availability_zone
  //map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet for ${var.environment}"
  }
}

# Create the route table

resource "aws_route_table" "table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Public route table for ${var.environment}"
    Env = var.environment
    Terraform = var.terraform
  }
}

# Append subnet to the route_table

resource "aws_route_table_association" "assoc" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.table.id
}

# Create Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Internet gateway for ${var.environment}"
  }
}

# Route for Internet Gateway
resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}