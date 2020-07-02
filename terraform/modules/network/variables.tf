variable "aws_default_zone" {
  description = "Default zone for the resources that will be deployed"
  type        = string
}

variable "network_tags" {}

variable "vpc_cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}