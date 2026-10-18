output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "EKS cluster name."
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "Kubernetes API endpoint."
}

output "cluster_version" {
  value       = aws_eks_cluster.this.version
  description = "Kubernetes version reported by EKS."
}

output "node_group_name" {
  value       = aws_eks_node_group.workers.node_group_name
  description = "Managed node group name."
}

output "worker_role_arn" {
  value       = aws_iam_role.nodes.arn
  description = "IAM role ARN assumed by worker nodes."
}
