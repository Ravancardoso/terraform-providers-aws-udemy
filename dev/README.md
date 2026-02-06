<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.monthly_budget](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/budgets_budget) | resource |
| [aws_cloudwatch_metric_alarm.cpu_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/db_subnet_group) | resource |
| [aws_dynamodb_table.tf_locks](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/dynamodb_table) | resource |
| [aws_eip.nat_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/eip) | resource |
| [aws_eip.nat_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/eip) | resource |
| [aws_iam_instance_profile.ec2_ssm_profile](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ec2_ssm_role](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/internet_gateway) | resource |
| [aws_key_pair.key](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/key_pair) | resource |
| [aws_nat_gateway.nat_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_a_route](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route) | resource |
| [aws_route.private_b_route](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route) | resource |
| [aws_route_table.private_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table) | resource |
| [aws_route_table.private_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/route_table_association) | resource |
| [aws_security_group.security_group_ec2](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/security_group) | resource |
| [aws_security_group.security_group_rds](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/security_group) | resource |
| [aws_sns_topic.alarm_topic](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic.billing_alerts](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/sns_topic) | resource |
| [aws_subnet.private_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.private_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.public_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc-lab-aws](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_state-terraform-infrastructure-lab-ravan"></a> [state-terraform-infrastructure-lab-ravan](#input\_state-terraform-infrastructure-lab-ravan) | The name of the S3 bucket | `string` | `"state-terraform-infrastructure-lab-ravan"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | EC2 instance ID |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | EC2 public IP |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Private subnet IDs |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Public subnet IDs |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS endpoint |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | SNS Topic ARN |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_TF_DOCS -->