terragrunt_version_constraint = ">=0.35"

terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Running Terraform"]
  }
}

locals {
  env = "prod"
  env_valid = contains(["dev", "prod"], local.env)
  values = yamldecode(file("values.${local.env}.yaml"))
}

// TODO: For now no backend has been used at all, therefore add remote state
