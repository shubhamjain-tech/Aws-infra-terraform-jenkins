resource "aws_s3_bucket" "example" {
  for_each = zipmap(
    range(length(var.buckets)),
    var.buckets
  )

  bucket = each.value.bucket_name
  tags = {
    Name        = each.value.bucket_name
    Environment = var.environment
  }
}
