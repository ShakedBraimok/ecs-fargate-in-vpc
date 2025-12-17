variable "env" {
  type        = string
  default     = "prod"
  description = "Environment: prod or staging"
}

variable "app_name" {
  type        = string
  default     = "myapp"
  description = "Application/service name"
}

variable "rds_password" {
  type        = string
  sensitive   = true
  description = "RDS Database password"
}