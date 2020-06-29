# Generate randomised password for the admin user
resource "random_string" "admin_pass" {
  length = 16
  special = true
}

# Generate ssh key
resource "tls_private_key" "ssh_key" {
  algorithm  = "RSA"
  rsa_bits   = 4096
}

# Pass ssh key to AWS
resource "aws_key_pair" "admin" {
   key_name   = "admin"
   public_key = tls_private_key.ssh_key.public_key_openssh
 }

resource "aws_network_interface" "primary" {
  subnet_id   = aws_subnet.formation_docker.id
  description = "primary network interface"
  security_groups = [aws_security_group.allow_ssh.name]
  tags = {
    Name = "primary_network_interface"
  }
  depends_on = [aws_subnet.formation_docker]
}


# Provision a Debian 10 Buster machine 
resource "aws_instance" "docker1" {
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type
  key_name      = "admin"
  security_groups = ["default"]
  password_data = base64encode(random_string.admin_pass)
  get_password_data = true
  associate_public_ip_address = true
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.primary.id
    # False is the only valid value at the time of writing this code
    deletes_on_termination = false
  }

  # # Install the docker binaries
  # provisioner "local-exec" {
  #   working_dir = /tmp
  #   command = "
  #     sudo apt update                                     && \
  #     sudo apt install -y curl                            && \
  #     curl -fsSL https://get.docker.com -o get-docker.sh  && \
  #     sudo sh get-docker.sh                               && \
  #     sudo usermod -aG docker ${aws_instance.docker1.key_name}    && \
  #     rm -rf *"
  # }
}

