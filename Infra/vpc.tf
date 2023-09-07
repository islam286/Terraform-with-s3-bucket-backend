module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = local.vpc_cidr

  azs                 = local.azs
  public_subnets      = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = flatten([
    for az_index, az in local.azs : [
      "10.0.${az_index + 100}.0/24", # For instances
    ]
  ])
  database_subnets = flatten([
    for az_index, az in local.azs : [
      "10.0.${az_index + 200}.0/24", # For instances
    ]
  ])

  map_public_ip_on_launch = true
  
  single_nat_gateway  = true

  enable_nat_gateway = true
  
  tags = local.tags
}