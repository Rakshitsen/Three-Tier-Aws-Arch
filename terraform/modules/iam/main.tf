# -----------------------------------------
# IAM Role Trust Policy for Lambda
# -----------------------------------------
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# -----------------------------------------
# IAM Role Creation
# -----------------------------------------
resource "aws_iam_role" "IAM_ROLE_Lambda" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# -----------------------------------------
# IAM Policy Attachments
# -----------------------------------------
resource "aws_iam_role_policy_attachment" "example" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonSNSFullAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ])

  policy_arn = each.value
  role       = aws_iam_role.IAM_ROLE_Lambda.name
}