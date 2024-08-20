resource "aws_subnet" "private-us-west-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "us-west-1b"

  tags = {
    "Name" = "private-us-west-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private-us-west-1c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.128.0/19"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "private-us-west-1c"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-west-1c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.160.0/19"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "public-us-west-1c"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-west-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.96.0/19"
  availability_zone = "us-west-1b"

  tags = {
    "Name" = "public-us-west-1b"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}