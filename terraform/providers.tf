## Please set up your credentials as env vars, so you don't have to hardcode them

provider "aws" {
  version = "~> 2.0"
  region  = var.aws_default_region
}