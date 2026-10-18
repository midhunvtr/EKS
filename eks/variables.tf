variable "project_name" {
  type        = string
  description = "Prefix for EKS resource names."
}

variable "cluster_version" {
  type        = string
  description = "EKS Kubernetes version supported in the selected AWS region."
}

variable "cluster_subnet_ids" {
  type        = list(string)
  description = "Subnets across at least two AZs for the EKS control plane."
}

variable "worker_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for worker nodes. Supply only the private subnet in the chosen AZ."
}

variable "worker_instance_type" {
  type        = string
  description = "EC2 instance type for managed worker nodes."
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "Allowed IPv4 CIDRs for the public Kubernetes API endpoint."
}

variable "enable_control_plane_logs" {
  type        = bool
  description = "Whether to send EKS control-plane logs to CloudWatch."
}
