# Provision a Debian 10 Buster machine 
resource "aws_instance" "student" {
  for_each              = var.student_names
  tags                  = {
    Name = "${each.value}"
  }
  ami                     = var.aws_instance_ami
  instance_type           = var.aws_instance_type
  key_name                = "formation_docker"
  vpc_security_group_ids  = var.security_group_ids
  associate_public_ip_address = true
  # Install the git and docker binaries
  provisioner "remote-exec" {
    script = "./files/install_server.sh"
  }
}