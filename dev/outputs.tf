# VPC
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc-lab-aws.id
}

# Subnets públicas
output "public_subnet_ids" {
  description = "Public subnet IDs"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

# Subnets privadas
output "private_subnet_ids" {
  description = "Private subnet IDs"
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

# ALB
output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.lab_alb.dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.lab_alb.arn
}

# Target Group
output "alb_target_group_arn" {
  description = "ALB Target Group ARN"
  value       = aws_lb_target_group.lab_tg.arn
}

# Security Groups
output "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  value       = aws_security_group.security_group_ec2.id
}

output "rds_security_group_id" {
  description = "RDS Security Group ID"
  value       = aws_security_group.security_group_rds.id
}
