resource "aws_instance" "web" {
  ami           = "ami-0c9cd2ced662e57e8"
  instance_type = "t2.micro"

  key_name = "kp1"
  vpc_security_group_ids = [aws_security_group.testsg.id]
  tags = {
    Name = "wpserver1"
  }
}

resource "aws_security_group" "testsg" {
  name        = "home"
  description = "Allow Vegas home traffic"

  ingress {
    description      = "traffic from Vegas"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["70.173.201.20/32"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vegas home"
  }
}
