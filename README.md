# AWS Infrastructure (Terraform) Fight Tally Website hosting

This project provisions the AWS infrastructure for the Fight Tally landing page.

## What this project creates

- Secure S3 bucket for static website assets
- Customer-managed KMS key for S3 encryption
- Encrypted remote Terraform state (S3 + KMS)
- State locking via Terraform lockfile

## Security highlights

- No public S3 access
- Server-side encryption using AWS KMS
- Infrastructure managed via Terraform
- Designed to be fronted by CloudFront

## Next steps

- CloudFront distribution
- Origin Access Control (OAC)
- HTTPS via ACM
- Route53 DNS
