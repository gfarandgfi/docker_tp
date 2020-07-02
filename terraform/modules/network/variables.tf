# variable "student_names" {
#   description = "the name of the students taking part in the training, in firstname_name format"
#   type = list(string)
# }

# variable "aws_default_region" {
#   description = "Default region for the resources that will be deployed"
#   type        = string
# }

variable "aws_default_zone" {
  description = "Default zone for the resources that will be deployed"
  type        = string
}

variable "network_tags" {}

variable "subnet_tags" {}

variable "vpc_cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}