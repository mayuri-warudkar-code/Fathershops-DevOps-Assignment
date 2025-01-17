variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "db_user" {
  description = "The master username for the database."
  type        = string
}

variable "db_password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance."
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs for the RDS instance."
  type        = list(string)
}
