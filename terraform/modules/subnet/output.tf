output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = aws_subnet.private[*].id
}
output "nat_id"{ 
    value = aws_nat_gateway.main.id
}