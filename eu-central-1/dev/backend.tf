terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "terraform-states-268591637005"
    key = "terraform-aws-pipeline-dev.tfstate"
    dynamodb_table = "terraform-locks-268591637005"
  }
}