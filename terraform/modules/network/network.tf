resource "aws_vpc" "formation_docker" {
  enable_dns_hostnames = true
  cidr_block           = var.vpc_cidr_block
  tags                 = var.network_tags
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

data "aws_route_table" "selected" {
  subnet_id = aws_subnet.formation_docker.id

  depends_on = [aws_internet_gateway.formation_docker]
}

resource "aws_route_table_association" "a" {
  gateway_id      = aws_internet_gateway.formation_docker.id
  route_table_id  = data.aws_route_table.selected.id
}
