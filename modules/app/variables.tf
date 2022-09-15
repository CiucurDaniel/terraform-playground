# Required parameters to be set by module user

variable "ami_id" {
  description = "The ami you want to use for the EC2 instance"
}

variable "instance_type" {
  description = "The EC2 instance type you want to use: t2.micro t2.medium"
}

variable "environment" {
  description = "This variable should hold the environment currently being configured (dev, prod)"
}

# Optional parameters, which have defaults

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

variable "subnet_id" {
  description = "Subnet id where the EC2 should be deployed"
}

variable "vpc_id" {
  description = "Id of the VPC where EC2 and security group belong"
}

variable "terraform" {
  description = "Confirms that the following piece of infrastructure was created using Terraform"
  type = bool
  default = true
}