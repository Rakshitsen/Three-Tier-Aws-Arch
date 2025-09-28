resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}   


