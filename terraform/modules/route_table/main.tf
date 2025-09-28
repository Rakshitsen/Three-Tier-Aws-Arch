resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.public_destination_cidr
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.public_routeTable_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.private_destination_cidr
    nat_gateway_id = var.nat_id
  }

  tags = {
    Name = var.private_routeTable_name
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}