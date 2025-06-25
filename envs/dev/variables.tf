variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod)"
  type        = string
}

variable "cloudfront_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
  validation {
    condition = contains([
      "PriceClass_All",
      "PriceClass_200",
      "PriceClass_100"
    ], var.cloudfront_price_class)
    error_message = "Price class must be PriceClass_All, PriceClass_200, or PriceClass_100."
  }
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Key hash for the DynamoDB table"
  type        = string
}

variable "attributes" {
  description = "define the attributes of the DynamoDB table"
  type = list(object({
    name = string
    type = string
  }))
}

variable "ttl_enabled" {
  description = "Enable TTL for the DynamoDB table"
  type        = bool
}

variable "ttl_attribute_name" {
  description = "Name of the TTL attribute for the DynamoDB table"
  type        = string
}