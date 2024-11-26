provider "aws" {
  region = var.aws_region
}

# Call the VPC module
module "vpc" {
  source             = "./modules/aws_vpc"
  #name               = var.name
  vpc_cidr_block     = var.vpc_cidr_block
  subnet_cidr_block  = var.subnet_cidr_block
  tags               = var.tags
}

# Outputs from the module
output "aws_vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "route_table_id" {
  value = module.vpc.route_table_id
}


