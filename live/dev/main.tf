# Import and provide values for all modules

module "vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"
  environment = "dev"
}

module "subnet" {
  source = "../../modules/subnet"

  availability_zones = [
    "us-east-1a"]
  cidrs = [
    "10.0.0.0/16"]
  environment = "dev"
  vpc_id = module.vpc.id
  rt_name = "Route table dev"
}