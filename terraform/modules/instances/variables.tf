variable "aws_instance_type" {
  type = string
}

variable "aws_instance_ami" {
  type = string
}

variable "student_names" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

