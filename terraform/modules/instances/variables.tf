variable "student_names" {
  description = "the name of the students taking part in the training, in firstname_name format"
  type        = map(string)
}

variable "aws_instance_ami" {
  description = "The AMI for the OS. Defaults to Debian Buster"
  type        = string
}

variable "aws_instance_type" {
  description = "The type of instance that will be creted. Defaults to c5.large (2vCPU 4096Mio RAM, as per Docker's recommended system requirements)"
  type        = string
}

# variable "aws_default_region" {
#   description = "Default region for the resources that will be deployed"
#   type        = string
# }

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = set(string)
}
