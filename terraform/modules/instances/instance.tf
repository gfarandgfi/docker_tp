# Get the id of the security group created in the root module
data "aws_security_group" "selected" {
  name = "allow_ssh"
}

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
  security_groups = [data.aws_security_group.selected.id]
  associate_public_ip_address = true
  tags = var.tags
  # network_interface {
  #   device_index = 0
  #   network_interface_id = aws_network_interface.primary.id
  #   # False is the only valid value at the time of writing this code
  #   delete_on_termination = false
  # }

  # Install the git and docker binaries
  provisioner "remote-exec" {
    script = "./files/install_server.sh"
  }
  # depends_on = [aws_security_group.allow_ssh, aws_key_pair.docker]
}

