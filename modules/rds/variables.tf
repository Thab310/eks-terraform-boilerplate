variable "vpc_id" {
  type        = string
  description = "vpc cidr"
}

variable "project_name" {
  type        = string
  description = "project name"
}


variable "identifier" {
  type        = string
  description = "rds identifier"
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "max_allocated_storage" {
  type = string
}

variable "storage_type" {
  type = string
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "database_subnets" {
  type = list(string)
}

variable "multi_az" {
  type = bool
}

variable "availability_zone" {
  type = string
}

variable "backup_retention_period" {
  type = number
}

variable "backup_window" {
  description = "Backup window (UTC)"
  type        = string
}

variable "maintenance_window" {
  type = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion (set to false for productio"
  type        = bool
}

variable "performance_insights_enabled" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}







