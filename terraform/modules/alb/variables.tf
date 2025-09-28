variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}
variable "load_balancer_type" {
  description = "Type of the load balancer"
  type        = string
}
variable "alb_name_sg_id" {
  description = "Security Group ID for the ALB"
  type        = string 
}
variable "is_internal" {
  type    = bool
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with the public route table."
  type        = list(string)
}
variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created"
  type        = string
}
variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}
variable "target_port" {
  description = "Port for the target group"
  type        = number
}
variable "target_protocol" {
  description = "Protocol for the target group"
  type        = string 
}