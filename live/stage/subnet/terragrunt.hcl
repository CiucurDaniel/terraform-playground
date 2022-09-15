terraform {
  source = "../../../modules//subnet"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  availability_zones = [
    "us-east-1a"]
  cidrs = [
    "10.0.0.0/16"]
  environment = "prod"
  vpc_id = dependency.vpc.outputs.id
  rt_name = "Route table prod"
}

