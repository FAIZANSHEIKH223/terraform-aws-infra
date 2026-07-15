module "ec2" {

  source = "./modules/ec2"

  project_name = var.project_name
  environment  = var.environment

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids
  key_name           = var.key_name

  root_volume_size = var.root_volume_size
  root_volume_type = var.root_volume_type
}

module "s3" {

  source = "./modules/s3"

  bucket_name       = var.bucket_name
  bucket_versioning = var.bucket_versioning

  project_name = var.project_name
  environment  = var.environment
}
