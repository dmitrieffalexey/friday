output "key_arn" {
  description = "Key ARN"
  value       = aws_kms_key.new_key.arn
}

output "key_id" {
  description = "Key ID"
  value       = aws_kms_key.new_key.key_id
}

output "alias_arn" {
  description = "Alias ARN"
  value       = aws_kms_alias.alias_to_new_key.arn
}

output "alias_name" {
  description = "Alias name"
  value       = aws_kms_alias.alias_to_new_key.name
}