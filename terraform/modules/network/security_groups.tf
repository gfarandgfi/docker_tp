# Open port 22 so the machine is accessible via ssh
resource "aws_security_group" "common" {
  name        = "common"
  description = "allow all traffic in and out"
  vpc_id      = aws_vpc.formation_docker.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.formation_docker]
}

