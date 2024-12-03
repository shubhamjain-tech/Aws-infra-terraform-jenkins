output "all_instance_ids" {
  description = "List of all instance IDs"
  value       = aws_instance.example.*.id
}

output "all_public_ips" {
  description = "List of public IPs for instances in public subnets"
  value       = [for instance in aws_instance.example : instance.public_ip if instance.public_ip != null]
}

output "private_ips" {
  description = "List of private IPs for instances in private subnets"
  value       = aws_instance.example.*.private_ip
}

output "public_instance_ids" {
  description = "Instance IDs for instances in public subnets"
  value       = [for instance in aws_instance.example : instance.id if instance.public_ip != null]
}

output "private_instance_ids" {
  description = "Instance IDs for instances in private subnets"
  value       = [for instance in aws_instance.example : instance.id if instance.public_ip == null]
}