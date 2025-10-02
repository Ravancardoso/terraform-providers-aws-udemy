output "bucket_id" {
  description = "Bucket criado na AWS"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "ARN do bucket criado na AWS"
  value       = aws_s3_bucket.bucket.arn
}