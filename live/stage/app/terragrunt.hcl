terraform {
  source = "../../../modules//app"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "subnet" {
  config_path = "../subnet"
}

inputs = {
  ami_id = "ami-05fa00d4c63e32376"
  environment = "prod"
  instance_type = "t2.micro"
  subnet_id = dependency.subnet.outputs.subnet_id
  vpc_id = dependency.vpc.outputs.id
}