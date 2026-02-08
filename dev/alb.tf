# 2. O Application Load Balancer


resource "aws_lb" "lab_alb" {
  name               = "lab-aws-alb"
  internal           = false # Público
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  enable_deletion_protection = false

  tags = merge(local.default_tags, { Name = "lab-alb-dev" })
}


# 3. Target Group 
resource "aws_lb_target_group" "lab_tg" {
  name     = "lab-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-lab-aws.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(local.default_tags, { Name = "lab-tg-dev" })
}


# 4. Listener 
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lab_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lab_tg.arn
  }
}