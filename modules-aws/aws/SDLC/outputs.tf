output "bucket_id" {
  description = "Bucket criado na AWS"
  value       = aws_s3_bucket.state-terraform.id
}

output "bucket_arn" {
  description = "ARN do bucket criado na AWS"
  value       = aws_s3_bucket.state-terraform.arn
}