#####################
##     main.tf     ##
#####################

# Welcome to the docker training stack
# This stack deploys as many EC2 instances as you have students
# The instances will run on an independent VPC and subnet, each called "formation_docker"
# They will be set with the tag "Name = <student_name>"
# They will have public ips and public dns set up
# Authentication is via an ssh key. Create a new one by uncommenting the appropriate code, 
# or provide your own in module/instances/instance.tf aws_instance.student.key_name
# Main values are set in terraform.tfvars

## TODO
## install docker and git binaries
## bind internet gateway to routing table