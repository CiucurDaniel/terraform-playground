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
  environment = "prod"
  instance_type = "t2.micro"
  ssh_key_name = "EC2_DEMO_SSH" # This was created in AWS
  subnet_id = dependency.subnet.outputs.subnet_id
  vpc_id = dependency.vpc.outputs.id
}