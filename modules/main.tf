module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  project_name         = "wordpress-project"
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnet_count  = 2
  private_subnet_count = 2
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = "wordpress-eks"
  subnet_ids         = module.vpc.private_subnets
  node_desired_size  = 2
  node_min_size      = 1
  node_max_size      = 3
}

module "elasticache" {
  source   = "./modules/elasticache"
  vpc_id   = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source          = "./modules/rds"
  db_name         = var.db_name
  db_user         = var.db_user
  db_password     = var.db_password
  subnet_ids      = var.subnet_ids
  security_groups = [module.eks.worker_security_group_id]
}

module "s3" {
  source              = "./modules/s3"
  region              = "us-west-1"
  bucket_name         = "wordpress-media-bucket"
  acl                 = "private"
  source_vpc_id       = module.vpc.vpc_id
  logging_target_bucket = "logging-bucket-name"
  environment         = "testing"
}

