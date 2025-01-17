# Fathershops-DevOps-Assignment

# Fathershops-DevOps-Assignment

Ensure the following tools are installed and configured:

1. Terraform
2. AWS CLI (configured with appropriate IAM permissions)
3. kubectl (configured for EKS)

Directory structure
/modules/
│   ├── /vpc/
│   ├── /eks/
│   ├── /rds/
│   ├── /elasticache/
│   └── /s3/
│
└── /kubernetes/
    └── /manifests/
        ├── configmap.yaml
        ├── wordpress-ingress.yaml
        ├── wordpress-deployment.yaml
        ├── wordpress-service.yaml

Initialize Terraform:
Run terraform init to initialize the Terraform modules.

Apply Terraform Configuration:
Use terraform apply to create the infrastructure in AWS (VPC, EKS, ElastiCache, RDS, and S3).

Deploy Kubernetes Resources:
Use kubectl apply -f /kubernetes/manifests/ to deploy the Kubernetes resources.
