#-------------------------------------------------------------------------
# Region Configuration
#-------------------------------------------------------------------------
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

#-------------------------------------------------------------------------
# VPC Configuration
#-------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "igw_name" {
  description = "The name of the IGW"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT"
  type        = string
}

#-------------------------------------------------------------------------
# Subnet Configuration
#-------------------------------------------------------------------------
variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

#-------------------------------------------------------------------------
# Route Table Configuration
#-------------------------------------------------------------------------
variable "public_destination_cidr" {
  description = "The destination CIDR block for the public route table"
  type        = string
}

variable "private_destination_cidr" {
  description = "The destination CIDR block for the private route table"
  type        = string
}

variable "public_routeTable_name" {
  description = "The name of the public route table"
  type        = string
}

variable "private_routeTable_name" {
  description = "The name of the private route table"
  type        = string
}

#-------------------------------------------------------------------------
# S3 Bucket Configuration
#-------------------------------------------------------------------------
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = string
}

variable "index_html_file" {
  description = "Content for the index.html file"
  type        = string
}

variable "error_html_file" {
  description = "Content for the error.html file"
  type        = string
}

#-------------------------------------------------------------------------
# SNS Topic Configuration
#-------------------------------------------------------------------------
variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "protocol" {
  description = "Protocol for the SNS topic subscription"
  type        = string
}

variable "endpoint" {
  description = "Endpoint for the SNS topic subscription"
  type        = string
}

#-------------------------------------------------------------------------
# Lambda Function Configuration
#-------------------------------------------------------------------------
variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "index_filename" {
  description = "Entry point filename for the Lambda function"
  type        = string
}

variable "function_folder_name" {
  description = "Folder name containing the Lambda function code"
  type        = string
}

#-------------------------------------------------------------------------
# IAM Role Configuration
#-------------------------------------------------------------------------
variable "role_name" {
  description = "IAM role name for the Lambda function"
  type        = string
}

#-------------------------------------------------------------------------
# DynamoDB Configuration
#-------------------------------------------------------------------------
variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "partition_key" {
  description = "The partition key for the DynamoDB table"
  type        = string
}

variable "sort_key" {
  description = "The sort key for the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table (e.g., PROVISIONED or PAY_PER_REQUEST)"
  type        = string
}

variable "read_capacity" {
  description = "Read capacity units for DynamoDB table (only for PROVISIONED mode)"
  type        = number
}

variable "write_capacity" {
  description = "Write capacity units for DynamoDB table (only for PROVISIONED mode)"
  type        = number
}

#-------------------------------------------------------------------------
# ALB Configuration
#-------------------------------------------------------------------------
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "load_balancer_type" {
  description = "Type of the load balancer"
  type        = string
}

variable "is_internal" {
  description = "Whether the ALB is internal"
  type        = bool
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

#-------------------------------------------------------------------------
# Launch Template Configuration
#-------------------------------------------------------------------------
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

#-------------------------------------------------------------------------
# Auto Scaling Group Configuration
#-------------------------------------------------------------------------
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

variable "asg_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

#-------------------------------------------------------------------------
# RDS Configuration
#-------------------------------------------------------------------------
variable "allocated_storage" {
  description = "Allocated storage in gigabytes"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "Type of database instance (e.g., db.t3.micro)"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "DB parameter group name"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deletion"
  type        = bool
  default     = true
}
