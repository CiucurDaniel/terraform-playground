terragrunt_version_constraint = ">=0.35"

terraform {

}

locals {
  env = "prod"
  env_valid = contains(["dev", "prod"], local.env)
  values = yamldecode(file("values.${local.env}.yaml"))
}

// TODO: For now no backend has been used at all, therefore add remote state
