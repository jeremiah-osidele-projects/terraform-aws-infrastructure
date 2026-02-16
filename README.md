# AWS Infrastructure (Terraform) Fight Tally Website hosting

## Overview

This repository provisions the AWS infrastructure for the Fight Tally landing page using **Infrastructure as Code (Terraform)**.

The infrastructure is designed using production-grade best practices including:

- Remote state management (S3 + DynamoDB locking)
- KMS encryption
- Private S3 bucket
- CloudFront Origin Access Control (OAC)
- Strict IAM policies
- Infrastructure modularity and environment separation readiness

---

# Architecture Overview

## High-Level Flow

```
User Browser
        │
        ▼
CloudFront (CDN, HTTPS, caching)
        │
        ▼
Private S3 Bucket (Static React App)
        │
        ▼
KMS Encryption at Rest
```

---

## Detailed Architecture

```
┌──────────────────────────────┐
│ Internet User │
└──────────────┬───────────────┘
               │
             HTTPS
               ▼
┌──────────────────────────────┐
│ AWS CloudFront CDN │
│ - HTTPS redirect │
│ - Edge caching │
│ - Origin Access Control │
└──────────────┬───────────────┘
               │
        Signed Requests
               ▼
┌──────────────────────────────┐
│ Private S3 Bucket │
│ fight-tally-landing │
│ - No public access │
│ - SSE-KMS encryption │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ AWS KMS │
│ - Key rotation enabled │
│ - Encryption at rest │
└──────────────────────────────┘
```

---

# Remote State Architecture

Terraform state is stored securely using:

- **S3 backend**
- **DynamoDB state locking**
  - State corruption
  - Concurrent applies
  - Credential leakage
  - Local state risks
- **KMS encryption**

---

# Technologies & Tools Used

## Cloud & Infrastructure

- AWS (S3, CloudFront, KMS, DynamoDB, IAM)
- Terraform (>= 1.5)
- AWS Provider v5

## DevOps & Automation

- Remote backend configuration
- State locking
- Infrastructure as Code
- CloudFront OAC (modern secure pattern)
- CI/CD ready structure

## Security Best Practices Applied

- Private S3 bucket (no public access)
- CloudFront Origin Access Control
- KMS encryption for objects
- KMS key rotation
- Encrypted Terraform state
- IAM least privilege principles

---

# Project Structure

terraform/
│
├── versions.tf # Terraform + provider versions
├── backend.tf # Remote state (S3)
├── provider.tf # AWS provider config
├── kms.tf # KMS keys
├── s3.tf # Landing page bucket
├── s3-policy.tf # CloudFront access policy
├── cloudfront.tf # CDN configuration

---

# 🚀 Deployment

## 1. Initialize Terraform

```
terraform init
```

## 2. Plan Infrastructure

```
terraform plan
```

## 3. Apply Infrastructure

```
terraform apply
```

## 4. Build static files (From the location of the webpage):

```
npm install
npm run build (This generates the static files in dist)
```

## 5. Upload to S3

```
aws s3 sync dist/ s3://fight-tally-landing/
```

## Cloudfront Distribution Domain:

https://d2s44n3svtfhza.cloudfront.net/#
