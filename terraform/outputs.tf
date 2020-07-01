output "student_instance_1_public_ip" {
  value = module.student_instance_1.public_ip
}

output "student_instance_1_ssh_key_public" {
  value = module.student_instance_1.public_key_openssh
}

output "student_instance_1_root_password" {
  value = module.student_instance_1.admin_pass.result
}

output "student_instance_2_public_ip" {
  value = module.student_instance_2.public_ip
}

output "student_instance_2_ssh_key_public" {
  value = module.student_instance_2.public_key_openssh
}

output "student_instance_2_root_password" {
  value = module.student_instance_2.admin_pass.result
}

output "student_instance_3_public_ip" {
  value = module.student_instance_3.public_ip
}

output "student_instance_3_ssh_key_public" {
  value = module.student_instance_3.public_key_openssh
}

output "student_instance_3_root_password" {
  value = module.student_instance_3.admin_pass.result
}

output "student_instance_4_public_ip" {
  value = module.student_instance_4.public_ip
}

output "student_instance_4_ssh_key_public" {
  value = module.student_instance_4.public_key_openssh
}

output "student_instance_4_root_password" {
  value = module.student_instance_4.admin_pass.result
}
