terraform {
  backend "s3" {
    region         = var.aws_region
    encrypt        = true
  }
}

provider "aws" {
  region           = var.aws_region
  version          = "4.5"
}

data "terraform_remote_state" "base" {
  backend          = "s3"
  config {
    bucket         = var.base_remote_state_bucket
    region         = var.base_remote_state_region
    key            = var.base_state_key
    dynamodb_table = var.base_state_lock
  }
}

