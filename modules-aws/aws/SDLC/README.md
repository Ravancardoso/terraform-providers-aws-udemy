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
| [aws_cloudwatch_metric_alarm.cpu_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/db_subnet_group) | resource |
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
| [aws_s3_account_public_access_block.block_account_public_access](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/s3_account_public_access_block) | resource |
| [aws_s3_bucket.state-terraform-infrastructure](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_versioning.state-terraform-infrastructure_versioning](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.security_group_ec2](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/security_group) | resource |
| [aws_security_group.security_group_rds](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/security_group) | resource |
| [aws_sns_topic.alarm_topic](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/sns_topic) | resource |
| [aws_subnet.private_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.private_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_subnet.public_b](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc-lab-aws](https://registry.terraform.io/providers/hashicorp/aws/4.60.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | environment | `string` | `"dev"` | no |
| <a name="input_state-terraform"></a> [state-terraform](#input\_state-terraform) | The name of the S3 bucket | `string` | `"state-terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN do bucket criado na AWS |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Bucket criado na AWS |
<!-- END_TF_DOCS -->