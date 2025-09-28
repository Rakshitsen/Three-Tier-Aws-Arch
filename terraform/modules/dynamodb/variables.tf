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
  description = "The read capacity units for the DynamoDB table (only for PROVISIONED mode)"
  type        = number
}
variable "write_capacity" {
  description = "The write capacity units for the DynamoDB table (only for PROVISIONED mode)"
  type        = number
}