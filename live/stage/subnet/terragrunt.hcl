terraform {
  source = "../../../modules//subnet"
}

include {
  path = find_in_parent_folders()
}

include "provider" {
  path = find_in_parent_folders("terraform-aws-provider.hcl")
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  availability_zone = "us-east-1a"
  cidr = "10.0.0.0/16"
  environment = "prod"
  vpc_id = dependency.vpc.outputs.id
  rt_name = "Route table"
}

