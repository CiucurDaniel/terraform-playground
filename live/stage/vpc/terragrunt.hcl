terraform {
  source = "../../../modules//vpc"
}

include {
  path = find_in_parent_folders()
}

include "provider" {
  path = find_in_parent_folders("terraform-aws-provider.hcl")
}

inputs = {
  cidr_block = "10.0.0.0/16"
  environment = "prod"
}

