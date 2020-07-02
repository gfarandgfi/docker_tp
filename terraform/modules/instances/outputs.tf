output "all_public_ips" {
  value = aws_instance.student[each.key].public_ip
}

output "all_public_dns" {
  value = aws_instance.student[each.key].public_dns
}