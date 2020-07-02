# Uncomment the two resources below only if you need to create a new ssh key
# You will also need to uncomment output "ssh_key" in outputs.tf
# This is untested
# # Generate ssh key
# resource "tls_private_key" "ssh_key" {
#   algorithm  = "RSA"
#   rsa_bits   = 4096
# }

# # Pass ssh key to AWS
# resource "aws_key_pair" "docker" {
#    key_name   = "formation_docker"
#    public_key = tls_private_key.ssh_key.public_key_openssh
#  }
