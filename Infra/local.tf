locals {
  name   = "Islam-${basename(path.cwd)}"
  region = "eu-north-1"
  ubuntu_ami_id = "ami-0989fb15ce71ba39e"
  vpc_cidr = "10.0.0.0/16"
  vpc_cidr_source = "0.0.0.0/0"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3) 

  tags = {
    name      = local.name
    terraform = "true"
    env       = "Dev"
    User      = "Islam"
  }
}