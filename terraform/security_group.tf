# Opening port 22 so the machine is accessible via ssh
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  descrition = "allow ssh in and all out"
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

  depends_on = [aws_vpc.formation_docke]
  }