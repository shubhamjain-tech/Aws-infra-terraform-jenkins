resource "aws_s3_bucket" "example" {
  for_each = var.buckets

  bucket = each.value.bucket_name
  tags = {
    Name        = each.value.bucket_name
    Environment = var.environment
  }
}
