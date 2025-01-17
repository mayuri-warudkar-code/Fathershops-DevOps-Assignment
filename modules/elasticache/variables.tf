variable "subnet_ids" {
  description = "The list of subnet IDs for Elasticache"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where Elasticache will be deployed"
  type        = string
}

