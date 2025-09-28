variable "allocated_storage" {
  description = "The amount of allocated storage in gigabytes."
  type        = number
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres, aurora)."
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine."
  type        = string
}

variable "instance_class" {
  description = "The type of instance to use (e.g., db.t3.micro)."
  type        = string
}

variable "username" {
  description = "The master username for the database."
  type        = string
}

variable "password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true # Added for security best practice
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to associate."
  type        = string
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
  default     = true
}
variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for RDS"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for RDS"
}
