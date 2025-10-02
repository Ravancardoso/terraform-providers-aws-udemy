resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment for tagging"
  type        = string
  default     = "dev"
}
