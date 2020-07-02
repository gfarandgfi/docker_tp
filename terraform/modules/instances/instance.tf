# Create a primary network interface
resource "aws_network_interface" "primary" {
  subnet_id       = var.subnet_id
  description     = "primary network interface"
  security_groups = var.security_group_id
  tags = {
    Name = "primary_network_interface"
  }
  depends_on = [module.network]
}


# Provision a Debian 10 Buster machine 
resource "aws_instance" "student" {
  count  = length(var.student_names)
  student_names = var.student_names[count.index]
  tags      = {
    Name    = "${each.key}"
  }
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type
  key_name      = "formation_docker"
  security_groups = [data.aws_security_group.selected.id]
  associate_public_ip_address = true
  # tags = var.tags
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.primary.id
    # False is the only valid value at the time of writing this code
    delete_on_termination = false
  }

  # Install the git and docker binaries
  provisioner "remote-exec" {
    script = "./files/install_server.sh"
  }
}

