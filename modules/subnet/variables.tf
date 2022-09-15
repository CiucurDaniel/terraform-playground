variable "vpc_id" {
  description = "Id of the VPC where we will reside the subnets"
  type = string
}

variable "availability_zones" {
  description = "Which AZs to use for the subnets"
  type = list(string)
}

variable "rt_name" {
  description = "Name of this subnet"
  type = string
}

variable "cidrs" {
  description = "CIDR blocks for this subnet"
  type = list(string)
}

variable "environment" {
  description = "The environment in which the resource belongs"
  type = string
}

variable "terraform" {
  description = "Confirms that the following piece of infrastructure was created using Terraform"
  type = bool
  default = true
}