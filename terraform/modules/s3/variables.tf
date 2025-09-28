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
variable "lambda_function_arn" {
  description = "ARN of the Lambda function to trigger on S3 events"
  type        = string
}
variable "lambda_function_name" {
  description = "Name of the Lambda function to grant S3 permission"
  type        = string
}