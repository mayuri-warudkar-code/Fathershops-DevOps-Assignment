output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate" {
  description = "Certificate authority data for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

