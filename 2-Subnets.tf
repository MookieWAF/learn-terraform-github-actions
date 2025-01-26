#These are   for  public

resource "aws_subnet" "public-us-west-2a" {
  vpc_id                  = aws_vpc.tacoTuesday.id
  cidr_block              = "10.18.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-us-west-2b" {
  vpc_id                  = aws_vpc.tacoTuesday.id
  cidr_block              = "10.18.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "public-us-west-2c" {
  vpc_id                  = aws_vpc.tacoTuesday.id
  cidr_block              = "10.18.3.0/24"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-2c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#these are for private
resource "aws_subnet" "private-us-west-2a" {
  vpc_id            = aws_vpc.tacoTuesday.id
  cidr_block        = "10.18.11.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name    = "private-us-west-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-us-west-2b" {
  vpc_id            = aws_vpc.tacoTuesday.id
  cidr_block        = "10.18.12.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name    = "private-us-west-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-us-west-2c" {
  vpc_id            = aws_vpc.tacoTuesday.id
  cidr_block        = "10.18.13.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name    = "private-us-west-2c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
