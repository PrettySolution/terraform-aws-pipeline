variable "ENV" {}
variable "AWS_REGION" {}
variable "AZS" {}

module "main-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "vpc-${var.ENV}"
  cidr = "10.0.0.0/16"

  azs             = [for v in var.AZS: v]
  private_subnets = [for k,v in var.AZS: cidrsubnet("10.0.0.0/16", 8, k)]
  public_subnets  = [for k,v in var.AZS: cidrsubnet("10.0.0.0/16", 8, k+10)]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = var.ENV
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.main-vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.main-vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.main-vpc.public_subnets
}

