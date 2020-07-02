# Create network
module "network" {
  source            = "./modules/network"
  aws_default_zone  = var.aws_default_zone
  vpc_cidr_block    = "172.16.0.0/16"
  subnet_cidr_block = "172.16.0.0/24"
  network_tags = {
    Name = "formation_docker"
  }
}

# Create an instance for each student
module "instances" {
  source            = "./modules/instances"
  subnet_id = module.network.subnet_id
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  aws_default_zone = var.aws_default_zone
  security_group_ids = [module.network.security_group_id_common]
  student_names = var.student_names
}