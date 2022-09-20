terraform {
  source = "../../../modules//bucket"
}

include {
  path = find_in_parent_folders()
}

include "data" {
  # with exposing and no_merge we can use include.data.inputs.values / include.data.inputs.secrets!
  expose         = true
  merge_strategy = "no_merge"

  path = find_in_parent_folders("terragrunt-common-data.hcl")
}

include "aws_providers" {
  path = find_in_parent_folders("terragrunt-aws-providers.hcl")
}

inputs = {
  environment = "dev"
}