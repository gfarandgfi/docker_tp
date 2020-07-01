resource "aws_vpc" "formation_docker" {
  enable_dns_hostnames = true
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc_formation_docker"
  }
}

resource "aws_subnet" "formation_docker" {
  vpc_id            = aws_vpc.formation_docker.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.aws_default_zone

  tags = {
    Name = "subnet_formation_docker"
  }
  depends_on = [aws_vpc.formation_docker]
}

resource "aws_internet_gateway" "formation_docker" {
  vpc_id = aws_vpc.formation_docker.id

  tags = {
    Name = "internet_gateway_formation_docker"
  }
  depends_on = [aws_vpc.formation_docker, aws_subnet.formation_docker]
}

# Open port 22 so the machine is accessible via ssh
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh in and all out"
  vpc_id      = aws_vpc.formation_docker.id

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks     = [aws_vpc.formation_docker.cidr_block]
    }

  egress {
      from_port       = 0
      to_port         = 0
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }

  depends_on = [aws_vpc.formation_docker]
  }