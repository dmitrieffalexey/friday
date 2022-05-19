resource "aws_kms_key" "new_key" {
  description             = var.description

  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy

  tags                    = var.tags
}

resource "aws_kms_alias" "alias_to_new_key" {
  name                    = "alias/${var.alias}"
  target_key_id           = aws_kms_key.new_key.id
}