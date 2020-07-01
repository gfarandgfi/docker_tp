output "vpc_id" {
  value = aws_vpc.formation_docker.id
}

output "subnet_id" {
  value = aws_subnet.formation_docker.id
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}