# Open port 22 so the machine is accessible via ssh
resource "aws_security_group" "common" {
  name        = "common"
  description = "allow common ports in and all out"
  vpc_id      = aws_vpc.formation_docker.id
  subnet_id   = aws_subnet.formation_docker.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.formation_docker.cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.formation_docker.cidr_block]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.formation_docker.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.formation_docker]
}

