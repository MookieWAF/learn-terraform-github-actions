# this  makes  vpc.id which is aws_vpc.tacoTuesday.id
resource "aws_vpc" "tacoTuesday" {
  cidr_block = "10.18.0.0/16"

  tags = {
    Name    = "tacoTuesday"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}
