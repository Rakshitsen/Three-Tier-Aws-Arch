variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the subnet"
  type        = string
}


variable "availability_zones" {
  description = "The availability zone for the subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "nat_name" {
    description = "The name of the NAT"
  type        = string
}
# variable "vpc_cidr" {
#   description = "CIDR block for VPC"
#   type        = string
# }

# variable "subnet_cidr" {
#   description = "The CIDR block for the subnet"
#   type        = string
# }