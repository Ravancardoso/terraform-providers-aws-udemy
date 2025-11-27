# IAM Role para EC2 for AWS Systems Manager


# 1. IAM Role EC2 for SSM
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2-ssm-role-lab-aws"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = merge(
    local.default_tags,
    local.environment_tags,
    {
      Name = "lab-iam-dev"
    }
  )
}

# 2. Anexar Policy SSM

resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 3. Instance Profile

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "ssm-instance-profile-lab-aws"
  role = aws_iam_role.ec2_ssm_role.name
}