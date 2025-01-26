resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tacoTuesday.id

  tags = {
    Name    = "tacoTuesday_IG"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
