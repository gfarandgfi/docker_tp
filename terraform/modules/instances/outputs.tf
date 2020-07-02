output "all_public_ips" {
  value = {
    for student_names in aws_instance.student:
      instance.id => instance.private_ip
  }}

output "all_public_dns" {
  value = aws_instance.student.public_dns
}