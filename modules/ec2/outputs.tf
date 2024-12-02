

output "instance_ids" {
  value = [for instance in aws_instance.example : instance.id]
}

output "public_ips" {
  value = [for instance in aws_instance.example : instance.public_ip]
}
