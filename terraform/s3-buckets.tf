// Crazy Berlin Weather S3 Buckets
module "crazy_berlin_weather_s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.2.0"

  count               = length(var.bucket_names)
  bucket              = element(var.bucket_names,count.index)
  force_destroy       = var.s3_force_destroy
  acceleration_status = var.s3_acceleration_status
  request_payer       = var.s3_request_payer

  tags = var.resource_tags

// Bucket policies
  attach_policy                         = var.s3_attach_policy
  policy                                = element(data.aws_iam_policy_document.bucket_policy.json, count.index)
  attach_deny_insecure_transport_policy = var.s3_attach_deny_insecure_transport_policy
  attach_require_latest_tls_policy      = var.s3_attach_require_latest_tls_policy

// Public Access Block configuration
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets

// Ownership Controls
  control_object_ownership = var.s3_control_object_ownership
  object_ownership         = var.s3_object_ownership

  expected_bucket_owner    = data.aws_caller_identity.current.account_id

  acl = var.s3_acl

  versioning = {
    status     = var.s3_versioning_status
    mfa_delete = var.s3_versioning_mfa_delete
  }
// Encryption Configuration
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = module.kms-key-s3-encryption.key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
// Life Cycle rules
  lifecycle_rule = [element(var.s3_lifecycle_rules,count.index)]
}