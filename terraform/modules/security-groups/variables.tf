variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  
}
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}
variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}
variable "ingress_rules" {
  type = list(object({
    description     = string
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}
variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
