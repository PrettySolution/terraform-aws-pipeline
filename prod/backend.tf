terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "terraform-state-d3f4g5"
    key = "multiple-env-prod.tfstate"
    profile = "prod"
  }
}