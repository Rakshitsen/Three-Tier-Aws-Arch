resource "aws_autoscaling_group" "this" {
  name                      = var.asg_name
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  vpc_zone_identifier       = var.subnet_ids  # List of subnet IDs

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
}
