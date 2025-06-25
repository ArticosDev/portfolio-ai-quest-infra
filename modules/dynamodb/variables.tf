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

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}