output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint."
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "Kubernetes version."
  value       = module.eks.cluster_version
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.network.vpc_id
}

output "worker_subnet_id" {
  description = "Private subnet in which all three worker nodes are placed."
  value       = module.network.private_subnet_a_id
}

output "configure_kubectl" {
  description = "Run this command to configure kubectl on a machine with AWS CLI and kubectl installed."
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}
