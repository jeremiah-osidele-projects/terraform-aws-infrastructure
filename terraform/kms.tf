resource "aws_kms_key" "s3_encryption" {
  description             = "KMS key for encrypting S3 objects"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_kms_alias" "s3_encryption_alias" {
  name          = "alias/s3-dev-encryption"
  target_key_id = aws_kms_key.s3_encryption.key_id
}
