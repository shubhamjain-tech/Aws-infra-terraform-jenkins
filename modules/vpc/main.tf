resource "aws_vpc" "dev_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name        = "dev-vpc"
    Environment = var.environment
  }
}

# Public Subnet
resource "aws_subnet" "dev_subnet_public" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name        = "dev-public-subnet"
    Environment = var.environment
  }
}

# Private Subnet
resource "aws_subnet" "dev_subnet_private" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone
  tags = {
    Name        = "dev-private-subnet"
    Environment = var.environment
  }
}

# Internet Gateway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name        = "dev-igw"
    Environment = var.environment
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "dev_public_route_table" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name        = "dev-public-route-table"
    Environment = var.environment
  }
}

# Public Route: Route traffic to internet through the internet gateway
resource "aws_route" "dev_public_route" {
  route_table_id         = aws_route_table.dev_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_igw.id
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "dev_public_subnet_association" {
  subnet_id      = aws_subnet.dev_subnet_public.id
  route_table_id = aws_route_table.dev_public_route_table.id
}

# NAT Gateway
resource "aws_nat_gateway" "dev_nat_gateway" {
  allocation_id = aws_eip.dev_nat_eip.id
  subnet_id     = aws_subnet.dev_subnet_public.id
  tags = {
    Name        = "dev-nat-gateway"
    Environment = var.environment
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "dev_nat_eip" {
  vpc = true
  tags = {
    Name        = "dev-nat-eip"
    Environment = var.environment
  }
}

# Route Table for Private Subnet
resource "aws_route_table" "dev_private_route_table" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name        = "dev-private-route-table"
    Environment = var.environment
  }
}

# Private Route: Route traffic to the internet via NAT Gateway
resource "aws_route" "dev_private_route" {
  route_table_id         = aws_route_table.dev_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.dev_nat_gateway.id
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "dev_private_subnet_association" {
  subnet_id      = aws_subnet.dev_subnet_private.id
  route_table_id = aws_route_table.dev_private_route_table.id
}