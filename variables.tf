variable "aws_region" {
  description = "AWS region in which to create the cluster."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Short name used to name resources."
  type        = string
  default     = "devops-eks-lab"
}

variable "environment" {
  description = "Environment tag."
  type        = string
  default     = "learning"
}

variable "vpc_cidr" {
  description = "IPv4 CIDR range for the VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "eks_cluster_version" {
  description = "Kubernetes version supported by EKS in the selected region."
  type        = string
  default     = "1.35"
}

variable "worker_instance_type" {
  description = "EC2 instance type for each managed worker node."
  type        = string
  default     = "t3.medium"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs allowed to reach the public Kubernetes API endpoint. Replace 0.0.0.0/0 with your public IP/32."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_cluster_control_plane_logs" {
  description = "Enable EKS control-plane logs in CloudWatch. Logs incur charges."
  type        = bool
  default     = true
}
