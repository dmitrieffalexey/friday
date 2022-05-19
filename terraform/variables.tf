// Base variables
variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
variable "aws_iam_role_arn" {
  type    = string
  default = "arn:aws:iam::account:role/role-name-with-path"
}
// Remote State
variable "base_remote_state_bucket" {
  type    = string
  default = "friday-remote-state-files"
}
variable "base_state_key" {
  type    = string
  default = "base-state-keys/berlin-weather/terraform.tfstate"
}
variable "base_remote_state_region" {
  type    = string
  default = "eu-central-1"
}
variable "base_state_lock" {
  type    = string
  default = "Terraform-State-Lock"
}
// Resource tags
variable "resource_tags" {
  type    = map(string)
  default = {}
}
// S3 buckets
variable "bucket_names" {
  type    = list(string)
  default = ["crazy-berlin-weather-hourly", "crazy-berlin-weather-daily", "crazy-berlin-weather-weekly"]
}
variable "s3_force_destroy" {
  type    = bool
  default = true
}
variable "s3_acceleration_status" {
  type    = string
  default = "Suspended"
}
variable "s3_request_payer" {
  type    = string
  default = "BucketOwner"
}
variable "s3_attach_policy" {
  type    = bool
  default = true
}
variable "s3_attach_deny_insecure_transport_policy" {
  type    = bool
  default = true
}
variable "s3_attach_require_latest_tls_policy" {
  type    = bool
  default = true
}
variable "s3_block_public_acls" {
  type    = bool
  default = true
}
variable "s3_block_public_policy" {
  type    = bool
  default = true
}
variable "s3_ignore_public_acls" {
  type    = bool
  default = true
}
variable "s3_restrict_public_buckets" {
  type    = bool
  default = true
}
variable "s3_control_object_ownership" {
  type    = bool
  default = true
}
variable "s3_object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"
}
variable "s3_acl" {
  type    = string
  default = "private" # "acl" conflicts with "grant" and "owner"
}
variable "s3_versioning_status" {
  type    = bool
  default = true
}
variable "s3_versioning_mfa_delete" {
  type    = bool
  default = false
}
variable "s3_lifecycle_rule_id" {
  type    = string
  default = "data"
}
variable "s3_lifecycle_rule_days_0" {
  type    = number
  default = 30
}
variable "s3_lifecycle_rule_storage_class_0" {
  type    = string
  default = "ONEZONE_IA"
}
variable "s3_lifecycle_rule_days_1" {
  type    = number
  default = 60
}
variable "s3_lifecycle_rule_storage_class_1" {
  type    = string
  default = "GLACIER"
}

// KMS
variable "kms_description" {
  type    = string
  default = "A KMS key for crazy-berlin-weather-s3-bucket"
}
variable "kms_alias" {
  type    = string
  default = "crazy-berlin-weather-s3-bucket-kms-key"
}