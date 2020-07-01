output "public_ip" {
  value = aws_instance.public_ip
}

output "student_instance_1_ssh_key_public" {
  value = tls_private_key.public_key_openssh
}

output "student_instance_1_root_password" {
  value = random_string.admin_pass.result
}