# # Uncomment if you created a new ssh key
# ouput "ssh_key" {
#   value = module.network.ssh_key
# }

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "security_group_ids" {
  value = module.network.security_group_ids
}

output "instance_ips" {
  value = module.instances.all_public_ips
}

# output "instance_dns_names" {
#   value = module.instances.all_public_dns
# }