variable "state-terraform" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "state-terraform"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"
}