variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling group"
  type        = number
}
variable "max_size" {
    description = "Maximum size of the Auto Scaling group"
    type        = number
}
variable "min_size" {
    description = "Minimum size of the Auto Scaling group"
    type        = number
}
variable "launch_template_id" {
  description = "ID of the launch template to use for the Auto Scaling group"
  type        = string
}
variable "asg_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}
variable "availability_zones" {
  description = "List of availability zones for the Auto Scaling group"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}
