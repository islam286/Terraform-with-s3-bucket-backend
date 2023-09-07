terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}


provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}
