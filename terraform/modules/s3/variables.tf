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