terraform {
  backend "s3" {
    bucket         = "tf-state-articos"
    key            = "portfolio-ai-quest-infra/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-locks"
    encrypt        = true
  }
}
