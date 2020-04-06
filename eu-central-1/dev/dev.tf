module "main-vpc" {
  source     = "../modules/vpc"
  ENV        = var.ENV
  AWS_REGION = var.AWS_REGION
  AZS = [for v in module.aws-data.available_aws_availability_zones_names: v]
}

module "aws-data" {
  source = "../modules/aws-data"
}