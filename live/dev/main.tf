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
}

module "app" {
  source = "../../modules/app"
  ami_id = "ami-05fa00d4c63e32376"
  environment = "dev"
  instance_type = "t2.micro"
  subnet_id = module.subnet.subnet_ids[0]
  vpc_id = module.vpc.id
}