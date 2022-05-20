module "kms-key-s3-encryption" {
  source = "./modules/aws-kms-key"
  description = var.kms_description
  alias       = var.kms_alias
}