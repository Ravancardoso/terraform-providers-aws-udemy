# IAM 

# 1. IAM Role para EC2 (SSM)
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2-ssm-role-lab-aws"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(
    local.default_tags,
    local.environment_tags,
    {
      Name = "lab-iam-ec2-ssm-dev"
    }
  )
}


# 2. Policies anexadas à Role EC2


resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_role_policy_attachment" "cloudwatch_agent_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}


resource "aws_iam_role_policy_attachment" "s3_read_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


resource "aws_iam_role_policy_attachment" "sns_publish_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}


# 3. Instance Profile (associado à EC2)

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "ssm-instance-profile-lab-aws"
  role = aws_iam_role.ec2_ssm_role.name
}
