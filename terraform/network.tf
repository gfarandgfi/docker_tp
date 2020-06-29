resource "aws_vpc" "formation_docker" {
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