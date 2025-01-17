# Fathershops-DevOps-Assignment

Ensure the following tools are installed and configured:

1.Terraform (>= 1.0.0)
2.AWS CLI (configured with appropriate IAM permissions)
3.kubectl (configured for EKS)
----
Terraform Scripts:
Organize the Terraform scripts into modules:
VPC Module: Networking setup (VPC, subnets, and routes).
EKS Module: Kubernetes cluster for WordPress hosting.
ElastiCache Module: Configuration for Memcached to manage PHP sessions.
RDS Module: Configuration for hosting WordPress databases.
S3 Module: Storage bucket setup.
--Directory structure
/modules/
    /vpc/
    /eks/
    /rds/
    /elasticache/
/kubernetes/manifests/
    /configmap.yaml             
    /wordpress-ingress.yaml
    /wordpress-deployment.yaml  
    /wordpress-service.yaml
