project_name = "terraform-demo"

environment = "dev"

aws_region = "ap-south-1"

ami_id = "ami-xxxxxxxxxxxxxxxx"

instance_type = "t2.micro"

key_name = "terraform-key"

subnet_id = "subnet-xxxxxxxx"

security_group_ids = [
  "sg-xxxxxxxx"
]

bucket_name = "terraform-demo-dev-001"

bucket_versioning = true
