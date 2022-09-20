terragrunt_version_constraint = ">=0.35"

terraform {
  // hooks can be added here
}

locals {
  env = "dev"
  env_valid = contains(["dev", "prod"], local.env)
  values = yamldecode(file("values.${local.env}.yaml"))
}

remote_state {
  backend = "s3"

  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket = "terraform-playground-state-bkt"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock-table"
  }
}
