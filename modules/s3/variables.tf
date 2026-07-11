variable "bucket_name" {
  description = "Unique S3 Bucket Name"
  type        = string
}

variable "bucket_versioning" {
  description = "Enable Bucket Versioning"
  type        = bool
  default     = true
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}
