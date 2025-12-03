output "aws_db_instance_id" {
  description = "RDS instance ID"
  value = aws_db_instance.postgres.id
}

output "aws_db_instance_id" {
  description = "RDS instance ARN"
  value = aws_db_instance.postgres.arn
}