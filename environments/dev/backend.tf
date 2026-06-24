terraform {
  backend "s3" {
    bucket         = "aws-terraform-github-actionsx"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}