output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.dev_subnet_public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.dev_subnet_private.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.dev_igw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.dev_nat_gateway.id
}

output "nat_eip" {
  description = "Elastic IP associated with NAT Gateway"
  value       = aws_eip.dev_nat_eip.public_ip
}
