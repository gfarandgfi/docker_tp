# resource "local_file" "ansible_postinstall_vars" {
#   filename = "${var.generated_post_install_file_dir}/ansible_postinstall_${var.gcp_project.name}_vars.yml"
#   content = templatefile("./ansible_postinstall_vars.yml.tpl", {
#     project               = var.gcp_project.id
#     namespace             = var.gcp_project.name
#     lb_static_ip          = module.kubernetes.ip_loadbalancer
#     lb_internal_static_ip = module.kubernetes.ip_internal_loadbalancer
#     region                = var.gcp_project.default_region
#     zone                  = var.gcp_project.default_zone
#     k8s_cluster_name      = "k8s-${var.gcp_project.name}"
#     domain_name           = module.dns.dns_name
#     environment           = var.gcp_project.env
#     grafana_url           = module.monitoring.grafana_public_url
#     grafana_user          = module.monitoring.grafana_username
#     grafana_password      = module.monitoring.grafana_password
#   })
# }