# Elasticache Subnet Group
resource "aws_elasticache_subnet_group" "memcached_subnet_group" {
  name        = "memcached-subnet-group"
  description = "Subnet group for Memcached"
  subnet_ids  = var.subnet_ids

  tags = {
    Name = "memcached-subnet-group"
  }
}

# Security Group for Memcached
resource "aws_security_group" "memcached_sg" {
  name        = "memcached-sg"
  description = "Security group for Memcached instances"
  vpc_id      = var.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 11211
    to_port     = 11211
    protocol    = "tcp"
  }

  tags = {
    Name = "memcached-sg"
  }
}

# Elasticache Memcached Cluster
resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t3.micro"  # Choose the instance type based on your requirements
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.memcached_subnet_group.name
  security_group_ids   = [aws_security_group.memcached_sg.id]
  port                 = 11211

  tags = {
    Name = "memcached-cluster"
  }
}

