output "iam_role_arn" {
  value = aws_iam_role.IAM_ROLE_Lambda.arn
}

output "iam_role_name" {
  value = aws_iam_role.IAM_ROLE_Lambda.name
}