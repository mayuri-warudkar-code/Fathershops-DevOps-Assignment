output "rds_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_arn" {
  description = "The ARN of the RDS instance."
  value       = aws_db_instance.rds_instance.arn
}

output "rds_id" {
  description = "The ID of the RDS instance."
  value       = aws_db_instance.rds_instance.id
}
