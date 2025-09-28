resource "aws_sns_topic" "topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}