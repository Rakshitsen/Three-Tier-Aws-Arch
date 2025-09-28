resource "aws_launch_template" "foo" {
  name = var.launch_template_name

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = var.volume_size
    }
  }


  image_id      = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.security_group_id]
    subnet_id                   = null  # Let ASG assign subnet dynamically
  }

}