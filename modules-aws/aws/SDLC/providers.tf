# provider
provider "aws" {
  region = "us-east-1"
}


# terraform state

#terraform {
# backend "s3" {
#bucket = "terraform-state-project-lab-aws"
# key    = "path/to/my/key"
# region = "us-east-1"
# }
#}