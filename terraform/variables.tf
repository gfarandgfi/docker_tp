# variable "aws_access_key" {
#   description = "Access key provided by AWS. Please do not hardcode"
#   type = string 
# }

# variable "aws_secret_key" {
#   description = "Secret key provided by AWS. Please do not hardcode"
#   type = string
# }

variable "aws_default_region" {
  description = "Default region for the resources that will be deployed"
  type = string
}

variable "aws_default_zone" {
  description = "Default zone for the resources that will be deployed"
  type = string
}

variable "aws_instance_ami" {
  description = "The AMI for the OS. Defaults to Debian Buster"
  type = string
}

variable "aws_instance_type" {
  description = "The type of instance that will be creted. Defaults to c5.large (2vCPU 4096Mio RAM, as per Docker's recommended system requirements)"
  type = string
}
