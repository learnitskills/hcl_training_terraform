resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh-rajat"
  description = "Dev Pc SSH"
  

  ingress {
      description      = "allow port 22"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }
  

  egress{
      from_port        = 0
      to_port          = 0
      protocol         = "-1" #tcp upd all allow
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  

  tags = {
    Name = "vpc-ssh-gopal"
  }
}
resource "aws_security_group" "vpc-http" {
  name        = "vpc-http-rajat"
  description = "Dev Pc ssh"
  

  ingress {
      description      = "allow port 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }

  ingress {
      description      = "allow port 443"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }


  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

    }

  tags = {
    Name = "vpc-https-rajat"
  }
}
