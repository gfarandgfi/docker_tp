output "public_ip" {
  value = aws_instance.public_ip
}

output "ssh_key_public" {
  value = tls_private_key.ssh_key.public_key_openssh
}

output "root_password" {
  value = random_string.root_pass.result
}
