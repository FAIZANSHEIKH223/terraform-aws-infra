##############################
# General
##############################

variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

##############################
# EC2
##############################

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}
#############################################
# S3
#############################################

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "bucket_versioning" {
  description = "Enable Versioning"
  type        = bool
  default     = true
}
