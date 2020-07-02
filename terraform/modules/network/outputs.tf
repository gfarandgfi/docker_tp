output "vpc_id" {
  value = aws_vpc.formation_docker.id
}

output "subnet_id" {
  value = aws_subnet.formation_docker.id
}

output "security_group_name" {
  value = aws_security_group.common.name
}

# # Uncomment if you created a new ssh key
# output "ssh_key" {
#   value = tls_private_key.ssh_key.public_key_pem
# }