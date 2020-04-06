output "available_aws_availability_zones_names" {
  description = "A list of the Availability Zone names available to the account"
  value       = [for k,v in module.aws-data.available_aws_availability_zones_names: v]
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = [for k,v in module.main-vpc.private_subnets: v]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = [for k,v in module.main-vpc.public_subnets: v]
}