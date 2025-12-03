resource "aws_db_instance" "postgres" {
  identifier = var.identifier

  #Engine configuration
  engine         = var.engine         //"postgresql"
  engine_version = var.engine_version //"16.2"
  instance_class = var.instance_class //"db.t3.medium"

  #Storage
  allocated_storage     = var.allocated_storage //10
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true
  kms_key_id            = var.kms_key_id

  #Database configuration
  db_name  = var.db_name  
  username = var.username 
  password = var.password 
  port     = 5432

  #Network
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false

  #High Availability
  multi_az          = var.multi_az
  availability_zone = var.availability_zone

  #Backup configuration
  backup_retention_period  = var.backup_retention_period
  backup_window            = var.backup_window
  maintenance_window       = var.maintenance_window
  delete_automated_backups = false

  #Snapshots
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = "${var.identifier}-final-snapshot"
  copy_tags_to_snapshot     = true

  #parameter group
  parameter_group_name = "default.postgres16"

  #Monitoring
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  monitoring_interval             = 60
  monitoring_role_arn             = aws_iam_role.rds_monitoring.arn
  performance_insights_enabled    = var.performance_insights_enabled

  #IAM authentication
  iam_database_authentication_enabled = true

  #Protection
  deletion_protection        = var.deletion_protection
  auto_minor_version_upgrade = true

  tags = {
    Name = var.identifier
  }

}

resource "aws_db_subnet_group" "rds" {
  name       = "rds"
  subnet_ids = var.database_subnets

  tags = {
    Name = "RDS subnet group"
  }
}


resource "aws_iam_role" "rds_monitoring" {
  name = "${var.identifier}-rds-monitoring"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    //tags = var.tags
  }
}

resource "aws_iam_role_policy_attachment" "rds_monitoring" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}