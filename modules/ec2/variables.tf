variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "Security Group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "root_volume_size" {
  description = "Root Volume Size"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Root Volume Type"
  type        = string
  default     = "gp3"
}
