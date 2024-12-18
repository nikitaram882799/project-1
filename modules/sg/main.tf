resource "aws_security_group" "dev_sg" {
    vpc_id = var.vpc_id

    ingress {

        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "TCP"
        description = "Allow Http"
    }

    ingress {

        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "TCP"
        description = "Allow Https"
    }

    ingress {

        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "TCP"
        description = "Allow to ssh"
    }

    egress {

        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = -1
        description = "Allow outbound"
    }

    tags = {
        Name = "${var.project_name}-sg"
    }
}


resource "aws_security_group" "ec2_jenkins_port_8080" {
  description = "Enable the Port 8080 for jenkins"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow 8080 port to access jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

resource "aws_security_group" "rds_mysql_sg" {
  name        = "rds-sg"
  description = "Allow access to RDS from EC2 present in public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]# replace with your EC2 instance security group CIDR block
  }
}


resource "aws_security_group" "python_api_sg" {
  name        = "python-sg"
  description = "Enable the Port 5000 for python api"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow traffic on port 5000"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
  }

  tags = {
    Name = "Security Groups to allow traffic on port 5000"
  }
}



