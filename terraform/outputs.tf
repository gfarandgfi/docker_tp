# # Uncomment output below if you created a new ssh key
# ouput "ssh_key" {
#   value = module.network.ssh_key
# }

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "instance_info" {
  value = module.instances.all_public_info
}