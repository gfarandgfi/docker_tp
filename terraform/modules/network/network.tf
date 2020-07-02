resource "aws_vpc" "formation_docker" {
  enable_dns_hostnames = true
  cidr_block           = var.vpc_cidr_block

  tags = {
    Name = "vpc_formation_docker"
  }
}

resource "aws_subnet" "formation_docker" {
  vpc_id            = aws_vpc.formation_docker.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.aws_default_zone
  tags              = var.network_tags

  depends_on = [aws_vpc.formation_docker]
}

resource "aws_internet_gateway" "formation_docker" {
  vpc_id = aws_vpc.formation_docker.id
  tags   = var.network_tags

  depends_on = [aws_vpc.formation_docker, aws_subnet.formation_docker]
}

# Open port 22 so the machine is accessible via ssh
resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "allow common traffic in from anywhere and all out"
  vpc_id      = aws_vpc.formation_docker.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.formation_docker]
}

# Open port 80 so the machine is accessible via http
resource "aws_security_group" "http" {
  name        = "http"
  description = "allow common traffic in from anywhere and all out"
  vpc_id      = aws_vpc.formation_docker.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.formation_docker]
}

# Open port 443 so the machine is accessible via tls
resource "aws_security_group" "tls" {
  name        = "tls"
  description = "allow common traffic in from anywhere and all out"
  vpc_id      = aws_vpc.formation_docker.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.formation_docker]
}