resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  count                  = var.public_subnet_count
  cidr_block             = element(var.public_subnets, count.index)
  vpc_id                 = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone      = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.project_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                  = var.private_subnet_count
  cidr_block             = element(var.private_subnets, count.index)
  vpc_id                 = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone      = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.project_name}-private-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = var.public_subnet_count
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

