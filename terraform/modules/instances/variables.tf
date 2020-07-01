variable "tags" {
  description = "The tags that will be assigned to the instance"
  type        = map(string)
}

variable "aws_instance_type" {
  type = string
}

variable "aws_instance_ami" {
  type = string
}

variable "student_names" {
  type = list(string)
}
  