resource "aws_security_group" "capstone_sg" {
  name        = "capstone-project-1-sg"
  description = "Security Group for Capstone Project"

  ingress {
    description = "SSH from Home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "SSH between DevOps servers"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "Jenkins UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Capstone-SG"
  }
}

resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.capstone_sg.id]

  tags = {
    Name = "Jenkins-Master"
    Role = "Jenkins"
  }
}

resource "aws_instance" "developer_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.capstone_sg.id]

  tags = {
    Name = "Developer-Server"
    Role = "Build-Test"
  }
}

resource "aws_instance" "production_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.capstone_sg.id]

  tags = {
    Name = "Production-Server"
    Role = "Production"
  }
}