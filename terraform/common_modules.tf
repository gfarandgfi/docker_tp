# Create five separate instances with different tags
module "student_instance_1" {
  source = "./modules/instances/"
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  tags = {
    student_name = "tariqanoual"
    reason = "training"
  }
}

module "student_instance_2" {
  source = "./modules/instances/"
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  tags = {
    student_name = "ludovicbels"
    reason = "training"
  }
}

module "student_instance_3" {
  source = "./modules/instances/"
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  tags = {
    student_name = "loickervarec"
    reason = "training"
  }
}

module "student_instance_4" {
  source = "./modules/instances/"
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  tags = {
    student_name = "florentcambier"
    reason = "training"
  }
}

module "student_instance_5" {
  source = "./modules/instances/"
  aws_instance_type = var.aws_instance_type
  aws_instance_ami = var.aws_instance_ami
  tags = {
    student_name = "iliyanpavlov"
    reason = "training"
  }
}