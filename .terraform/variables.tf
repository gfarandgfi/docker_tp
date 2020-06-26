variable "aws_access_key" {
  description = "Access key provided by AWS. Please do not hardcode"
  type = string 
}

variable "aws_secret_key" {
  description = "Secret key provided by AWS. Please do not hardcode"
  type = string
}

variable "aws_default_region" {
  description = "Default region for the resources that will be deployed"
  type = string
  default = "eu-west-3"
}