terraform {
  backend "s3" {
    bucket         = "fight-tally-terraform-state"
    key            = "global/terraform.tfstate"
    region         = "eu-west-2"

    encrypt        = true
    kms_key_id     = "alias/terraform-state"

    use_lockfile   = true
  }
}
