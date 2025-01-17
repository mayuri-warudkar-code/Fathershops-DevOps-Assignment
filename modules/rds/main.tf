resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier              = "wordpress-rds"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = var.db_name   # Use db_name instead of name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = var.security_groups
  backup_retention_period = 7
  multi_az                = false
  storage_encrypted       = true

  tags = {
    Name = "wordpress-rds"
  }
}

