output "landing_bucket_name" {
  description = "S3 bucket hosting the landing page"
  value       = aws_s3_bucket.landing_page.bucket
}

output "s3_kms_key_alias" {
  description = "KMS alias used to encrypt S3 objects"
  value       = aws_kms_alias.s3_encryption_alias.name
}
