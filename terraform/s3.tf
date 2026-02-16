resource "aws_s3_bucket" "landing_page" {
    bucket = "fight-tally-landing"

    tags = {
        Name = "FightTallyLanding"
        Environment = "Dev"
        ManagedBy = "Terraform"
    }
}

resource "aws_s3_bucket_public_access_block" "landing_page" {
    bucket = aws_s3_bucket.landing_page.id
    
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "landing_page" {
#     bucket = aws_s3_bucket.landing_page.id

#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "aws:kms"

#         kms_master_key_id = aws_kms_key.s3_encryption.arn
#       }
#     }
# }


resource "aws_s3_bucket_server_side_encryption_configuration" "landing_page" {
  bucket = aws_s3_bucket.landing_page.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
