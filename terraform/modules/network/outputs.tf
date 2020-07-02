output "vpc_id" {
  value = aws_vpc.formation_docker.id
}

output "subnet_id" {
  value = aws_subnet.formation_docker.id
}

output "security_group_id" {
  value = [aws_security_group.common.id]
}

# # Uncomment if you created a new ssh key
# output "ssh_key" {
#   value = tls_private_key.ssh_key.public_key_pem
# }