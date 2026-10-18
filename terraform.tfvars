aws_region             = "ap-south-1"
project_name           = "devops-eks-lab"
environment            = "learning"
vpc_cidr               = "10.20.0.0/16"
eks_cluster_version    = "1.35"
worker_instance_type   = "t3.medium"

# IMPORTANT: Replace this with your current public IP address followed by /32.
# Example format only: ["203.0.113.10/32"]
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

enable_cluster_control_plane_logs = true
