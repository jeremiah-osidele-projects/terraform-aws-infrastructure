terraform {
    required_version = ">= 1.5.0"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}


provider "aws" {
  region = "eu-west-2"
}

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