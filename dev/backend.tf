terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "terraform-state-d3f4g5"
    key = "project777-dev.tfstate"
    profile = "dev"
    dynamodb_table = "terraform-locks-268591637005"
  }
}