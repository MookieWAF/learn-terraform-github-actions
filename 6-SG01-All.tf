resource "aws_security_group" "tacoTuesday-TG01-SG01-80" {
  name        = "tacoTuesday-TG01-SG01-80"
  description = "tacoTuesday-TG01-SG01-80"
  vpc_id      = aws_vpc.tacoTuesday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tacoTuesday-TG01-SG01-80"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}





resource "aws_security_group" "tacoTuesday-LB01-SG01" {
  name        = "tacoTuesday-LB01-SG01"
  description = "tacoTuesday-LB01-SG01"
  vpc_id      = aws_vpc.tacoTuesday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tacoTuesday-LB01-SG01"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}


resource "aws_security_group" "tacoTuesday-TG02-SG01-443" {
  name        = "tacoTuesday-TG02-SG01-443"
  description = "tacoTuesday-TG02-SG01-443"
  vpc_id      = aws_vpc.tacoTuesday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tacoTuesday-TG02-SG01-443"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}
