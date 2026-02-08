# Launch Template


resource "aws_launch_template" "app_lt" {
  name_prefix   = "lab-app-lt-"
  image_id      = "ami-0360c520857e3138f"
  instance_type = "t3.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_ssm_profile.name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.security_group_ec2.id]
  }

  user_data = base64encode(file("files/ec2_setup.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.default_tags,
      local.environment_tags,
      {
        Name = "lab-ec2-asg-dev"
      }
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Group


resource "aws_autoscaling_group" "app_asg" {
  name             = "lab-asg-dev"
  min_size         = 1
  desired_capacity = 1
  max_size         = 3
  vpc_zone_identifier = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.lab_tg.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 120

  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "lab-asg-ec2-dev"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }
}


# Auto Scaling Policy

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "lab-scale-out-policy"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
}