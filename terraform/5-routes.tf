resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-us-west-1b" {
  subnet_id = aws_subnet.private-us-west-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-west-1c" {
  subnet_id = aws_subnet.private-us-west-1c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-us-west-1b" {
  subnet_id = aws_subnet.public-us-west-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-west-1c" {
  subnet_id = aws_subnet.public-us-west-1c.id
  route_table_id = aws_route_table.public.id
}