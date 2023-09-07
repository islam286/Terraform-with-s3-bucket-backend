terraform {
  backend "s3" {
    bucket         = "islam-terraform-backend-bucket421035169433"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    workspace_key_prefix = "my-terraform-workspace"
  }
}
