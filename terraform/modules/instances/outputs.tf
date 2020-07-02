output "all_public_info" {
  value = {
    for student_names in aws_instance.student:
      student_names.public_ip => student_names.public_dns
  }
}

# output "all_public_dns" {
#   value = aws_instance.student.public_dns
# }