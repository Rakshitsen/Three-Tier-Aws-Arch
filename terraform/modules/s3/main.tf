resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  bucket_name_with_suffix = "${var.bucket_name}-${random_string.suffix.result}"
}

resource "aws_s3_bucket" "example" {
  bucket = local.bucket_name_with_suffix
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.example.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.example.id
  index_document {
    suffix = var.index_html_file
  }
  error_document {
    key = var.error_html_file
  }
}
