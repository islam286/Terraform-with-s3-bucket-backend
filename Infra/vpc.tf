module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = local.vpc_cidr

  azs                 = local.azs
  public_subnets      = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets     = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 100)]
  database_subnets    = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 200)]

  map_public_ip_on_launch = true
  
  single_nat_gateway  = true

  enable_nat_gateway = true
  
  tags = local.tags
}