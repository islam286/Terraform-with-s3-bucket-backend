locals {
  name   = "Islam-${basename(path.cwd)}"
  region = "eu-north-1"
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3) 
  tags = {
    name      = local.name
    terraform = "true"
    env       = "Dev"
    User      = "Islam"
  }
}