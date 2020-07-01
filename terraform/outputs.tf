output "student_instance_1_public_ip" {
  value = module.student_instance_1.aws_instance.public_ip
}

output "student_instance_1_ssh_key_public" {
  value = module.student_instance_1.tls_private_key.public_key_openssh
}

output "student_instance_1_root_password" {
  value = module.student_instance_1.random_string.admin_pass.result
}

output "student_instance_2_public_ip" {
  value = module.student_instance_2.aws_instance.public_ip
}

output "student_instance_2_ssh_key_public" {
  value = module.student_instance_2.tls_private_key.public_key_openssh
}

output "student_instance_2_root_password" {
  value = module.student_instance_2.random_string.admin_pass.result
}

output "student_instance_3_public_ip" {
  value = module.student_instance_3.aws_instance.public_ip
}

output "student_instance_3_ssh_key_public" {
  value = module.student_instance_3.tls_private_key.public_key_openssh
}

output "student_instance_3_root_password" {
  value = module.student_instance_3.random_string.admin_pass.result
}

output "student_instance_4_public_ip" {
  value = module.student_instance_4.aws_instance.public_ip
}

output "student_instance_4_ssh_key_public" {
  value = module.student_instance_4.tls_private_key.public_key_openssh
}

output "student_instance_4_root_password" {
  value = module.student_instance_4.random_string.admin_pass.result
}

output "student_instance_5_public_ip" {
  value = module.student_instance_5.aws_instance.public_ip
}

output "student_instance_5_ssh_key_public" {
  value = module.student_instance_5.public_key_openssh
}

output "student_instance_5_root_password" {
  value = module.student_instance_5.random_string.admin_pass.result
}

