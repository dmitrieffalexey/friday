# README #

AWS KMS key

Usage
```
module "kms" {
  source      = "modules/aws-kms-key"
  description = "Test KMS module"
  alias       = "test-kms-key"
}
```