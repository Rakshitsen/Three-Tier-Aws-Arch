resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.dynamodb_table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.partition_key
  range_key      = var.sort_key

  attribute {
    name = var.partition_key
    type = "S"
  }

  attribute {
    name = var.sort_key
    type = "S"
  }
}

# DynamoDB Capacity Mode Recommendation:
#
# Demo/Learning -> PROVISIONED (you control cost, test scaling limits).
# Prod, Unpredictable Traffic -> PAY_PER_REQUEST(on_demand) (simplicity, no capacity planning, scales automatically).
# Prod, Steady Traffic -> PROVISIONED with Auto Scaling (cost-optimized for predictable load, handles minor spikes).