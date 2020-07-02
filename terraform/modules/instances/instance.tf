# # Create a primary network interface
# resource "aws_network_interface" "primary" {
#   for_each        = var.student_names
#   tags            = {
#     Name = "${each.value}"
#   }
#   subnet_id       = var.subnet_id
#   description     = "primary network interface"
#   security_groups = var.security_group_name
# }

# Provision a Debian 10 Buster machine 
resource "aws_instance" "student" {
  for_each              = var.student_names
  tags                  = {
    Name = "${each.value}"
  }
  ami                   = var.aws_instance_ami
  instance_type         = var.aws_instance_type
  key_name              = "formation_docker"
  security_groups       = tolist(var.security_group_name)
  associate_public_ip_address = true
  # network_interface {
  #   device_index         = 0
  #   network_interface_id = aws_network_interface.primary[each.key].id
  #   # False is the only valid value at the time of writing this code. Should be changed to true as soon as supported
  #   delete_on_termination = false
  # }
  # Install the git and docker binaries
  provisioner "remote-exec" {
    script = "./files/install_server.sh"
  }
}