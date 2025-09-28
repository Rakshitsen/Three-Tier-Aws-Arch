# -----------------------------------------
# Archive Lambda Code
# -----------------------------------------
data "archive_file" "example" {
  type        = "zip"
  source_file = "${path.module}/../../lambda-function/${var.index_filename}"
  output_path = "${path.module}/../../lambda-function//function.zip"
}

# -----------------------------------------
# Lambda Function Resource
# -----------------------------------------
resource "aws_lambda_function" "example" {
  filename         = data.archive_file.example.output_path
  function_name    = var.function_name
  role             = var.IAM_role_arn
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.example.output_base64sha256
  runtime          = var.runtime
  environment {
    variables = {
      SNS_TOPIC_ARN = var.SNS_TOPIC_ARN
    }
  }

}