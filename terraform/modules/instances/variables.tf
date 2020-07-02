variable "aws_instance_ami" {
  description = "The AMI for the OS. Defaults to Debian Buster"
  type        = string
}

variable "aws_instance_type" {
  description = "The type of instance that will be creted. Defaults to c5.large (2vCPU 4096Mio RAM, as per Docker's recommended system requirements)"
  type        = string
}

variable "student_names" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

