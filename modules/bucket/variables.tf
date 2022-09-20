variable "environment" {
  description = "The environment in which the resource belongs"
  type = string
}

variable "terraform" {
  description = "Confirms that the following piece of infrastructure was created using Terraform"
  type = bool
  default = true
}