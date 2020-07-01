# Create network
module "network" {
  source            = "./modules/network"
  aws_default_zone  = var.aws_default_zone
  vpc_cidr_block    = "172.16.0.0/16"
  subnet_cidr_block = "172.16.0.0/24"
  network_tags = {
    Name = "subnet_formation_docker"
  }
  subnet_tags = {
    Name = "subnet_formation_docker"
  }
}

# Create an instance for each student
module "instances" {
  source            = "./modules/instances"
  subnet_id = module.network.subnet_id
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  student_names = ["tariq_anoual", "ludovic_bels", "loic_kervarec", "florian_cambier", "iliyan_pavlov"]
}

# # Create five separate instances with different tags
# module "student_instance_1" {
#   source = "./modules/instances/"
#   aws_instance_type = var.aws_instance_type
#   aws_instance_ami = var.aws_instance_ami
#   tags = {
#     student_name = "tariqanoual"
#     reason = "training"
#   }
# }

# module "student_instance_2" {
#   source = "./modules/instances/"
#   aws_instance_type = var.aws_instance_type
#   aws_instance_ami = var.aws_instance_ami
#   tags = {
#     student_name = "ludovicbels"
#     reason = "training"
#   }
# }

# module "student_instance_3" {
#   source = "./modules/instances/"
#   aws_instance_type = var.aws_instance_type
#   aws_instance_ami = var.aws_instance_ami
#   tags = {
#     student_name = "loickervarec"
#     reason = "training"
#   }
# }

# module "student_instance_4" {
#   source = "./modules/instances/"
#   aws_instance_type = var.aws_instance_type
#   aws_instance_ami = var.aws_instance_ami
#   tags = {
#     student_name = "florentcambier"
#     reason = "training"
#   }
# }

# module "student_instance_5" {
#   source = "./modules/instances/"
#   aws_instance_type = var.aws_instance_type
#   aws_instance_ami = var.aws_instance_ami
#   tags = {
#     student_name = "iliyanpavlov"
#     reason = "training"
#   }
# }