variable "buckets" {
  description = "List of S3 bucket configurations"
  type        = list(object({
    bucket_name = string
  }))
}

variable "environment" {}
