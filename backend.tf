terraform {

  backend "s3" {

    bucket         = "terraform-state-faizan-001"

    key            = "terraform.tfstate"

    region         = "us-east-1"

    dynamodb_table = "terraform-locks"

    encrypt        = true

  }

}
