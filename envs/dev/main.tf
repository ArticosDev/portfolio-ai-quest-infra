# Datos locales
locals {
  common_tags = {
    project_name = var.project_name
    environment  = var.environment
    ManagedBy    = "Terraform"
  }
}

# Module S3
module "s3" {
  source      = "../../modules/s3"
  bucket_name = "${var.project_name}-${var.environment}"
  tags        = local.common_tags
}

# Module CloudFront
module "cloudfront" {
  source = "../../modules/cloudfront"

  bucket_name            = module.s3.bucket_name
  bucket_domain_name     = module.s3.bucket_domain_name
  bucket_regional_domain = module.s3.bucket_regional_domain_name
  price_class            = var.cloudfront_price_class
  tags                   = local.common_tags
}

# Module DynamoDB
module "dynamodb" {
  source = "../../modules/dynamodb"

  table_name         = var.table_name
  hash_key           = var.hash_key
  attributes         = var.attributes
  ttl_attribute_name = var.ttl_attribute_name
  ttl_enabled        = var.ttl_enabled
  tags               = local.common_tags
}