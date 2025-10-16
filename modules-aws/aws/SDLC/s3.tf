# ---------------------------------------------------------------------------------------------------------------------
# AMAZON S3
# ---------------------------------------------------------------------------------------------------------------------

# Allows configuring public access block settings at the account level for Amazon S3.
resource "aws_s3_account_public_access_block" "block_account_public_access" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


#bucket state terraform

resource "aws_s3_bucket" "state-terraform" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# versionament
resource "aws_s3_bucket_versioning" "state-terraform_versioning" {
  bucket = aws_s3_bucket.state-terraform.id

  versioning_configuration {
    status = "Suspended"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
