project_name = "terraform-demo"

environment = "dev"

aws_region = "us-east-1"

ami_id = "ami-052355af2a014bd2c"

instance_type = "t2.micro"

key_name = "mykey2.pem"

subnet_id = "subnet-08fda56e0a6345f85"

security_group_ids = [
  "sg-03f8d28fe8bb81736"
]

bucket_name = "terraform-demo-dev-001"

bucket_versioning = true
