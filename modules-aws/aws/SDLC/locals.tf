locals {
  environment_tags = {
    Environment = "dev"
  }

  default_tags = {
    Project   = "Lab"
    Owner     = "Ravan"
    ManagedBy = "Terraform"
  }
}