variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instances"
  type        = string  
}