// Outputs
output "s3_bucket_arns" {
  description = "The ARN of the bucket."
  value       = join("", module.crazy_berlin_weather_s3.*.s3_bucket_arn)
}

output "s3_bucket_domain_names" {
  description = "The ARN of the bucket."
  value       = join("", module.crazy_berlin_weather_s3.*.s3_bucket_bucket_domain_name)
}
