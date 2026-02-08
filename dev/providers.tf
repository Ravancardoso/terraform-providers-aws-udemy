# provider
provider "aws" {
  region = "us-east-1"
}


# terraform state

terraform {
  backend "s3" {
    bucket         = "state-terraform-infrastructure-lab-ravan"
    key            = "development/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-lab-udemy"
    encrypt        = true
  }
}