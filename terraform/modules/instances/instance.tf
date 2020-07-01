# Create a primary network interface
resource "aws_network_interface" "primary" {
  subnet_id   = aws_subnet.formation_docker.id
  description = "primary network interface"
  security_groups = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "primary_network_interface"
  }
  depends_on = [aws_subnet.formation_docker, aws_security_group.allow_ssh]
}


# Provision a Debian 10 Buster machine 
resource "aws_instance" "student" {
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type
  key_name      = "docker"
  security_groups = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  tags = var.tags
  # network_interface {
  #   device_index = 0
  #   network_interface_id = aws_network_interface.primary.id
  #   # False is the only valid value at the time of writing this code
  #   delete_on_termination = false
  # }

  # Install the git and docker binaries
  provisioner "local-exec" {
    working_dir = /tmp
    command = <<EOT
    sudo apt update && sudo apt install -y git 
    && sudo apt install -y curl 
    && curl -fsSL https://get.docker.com -o get-docker.sh 
    && sudo sh get-docker.sh 
    && sudo usermod -aG docker ${aws_instance.docker1.key_name} rm -rf *
    EOT
  }
  depends_on = [aws_security_group.allow_ssh, aws_key_pair.docker]
}

