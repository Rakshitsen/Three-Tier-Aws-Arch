resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.private_subnet_name}-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch  = true

  tags = {
    Name = "${var.public_subnet_name}-${count.index}"
  }
}

# Single Elastic IP
resource "aws_eip" "nat" {
  domain = "vpc"
}

# Single NAT Gateway in first public subnet
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.allocation_id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.nat_name}"
  }

  depends_on = [aws_subnet.public]
}


