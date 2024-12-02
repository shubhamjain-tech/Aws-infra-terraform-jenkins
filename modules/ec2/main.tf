resource "aws_instance" "example" {
  for_each = var.instances
  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}


