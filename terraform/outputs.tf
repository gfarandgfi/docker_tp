output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "security_group_id" {
  value = module.network.security_group_id
}

output "instance_ip" {
  value = module.instances.public_ip

output "instance_dns_name" {
  value = module.network.public_dns
}

# # Uncomment if you created a new ssh key
# ouput "ssh_key" {
#   value = module.network.ssh_key
# }