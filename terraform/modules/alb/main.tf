resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = var.is_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.alb_name_sg_id] 
  subnets            = [for subnet_id in var.public_subnet_ids : subnet_id]
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}