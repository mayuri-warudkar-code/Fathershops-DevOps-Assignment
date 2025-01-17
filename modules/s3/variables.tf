variable "region" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The access control list for the S3 bucket"
  type        = string
  default     = "private"
}

variable "source_vpc_id" {
  description = "The VPC ID allowed to access the bucket"
  type        = string
}

variable "logging_target_bucket" {
  description = "The S3 bucket where logs will be stored"
  type        = string
  default     = null
}

variable "environment" {
  description = "Environment tag for the S3 bucket"
  type        = string
  default     = "testing"
}

