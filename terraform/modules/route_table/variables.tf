variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created"
  type        = string
}

variable "public_destination_cidr" {
  description = "The destination CIDR block for the public route table."
  type        = string
}

variable "private_destination_cidr" {
  description = "The destination CIDR block for the private route table."
  type        = string
}
variable "igw_id" {
  description = "The ID of the Internet Gateway."
  type        = string
}

variable "nat_id" {
  description = "The ID of the NAT Gateway."
  type        = string
}

variable "public_routeTable_name" {
  description = "The name of the public route table."
  type        = string
}

variable "private_routeTable_name" {
  description = "The name of the private route table."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with the public route table."
  type        = list(string)
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the private route table."
  type        = list(string)
}