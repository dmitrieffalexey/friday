terraform {
/*
  backend "s3" {
    region         = "eu-central-1"
    encrypt        = true
  }
*/
}

provider "aws" {
  region           = "eu-central-1"
  version          = "4.5"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "my_access_key"
  secret_key                  = "my_secret_key"
}
/*
data "terraform_remote_state" "base" {
  backend          = "s3"
  config {
    bucket         = var.base_remote_state_bucket
    region         = var.base_remote_state_region
    key            = var.base_state_key
    dynamodb_table = var.base_state_lock
  }
}
*/
