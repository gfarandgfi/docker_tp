## Lease set up your credentials as env vars, so you don't have to hardcode them

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key  
  version = "~> 2.0"
  region  = var.aws_default_region
}