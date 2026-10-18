data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  az_a         = data.aws_availability_zones.available.names[0]
  az_b         = data.aws_availability_zones.available.names[1]
}

module "eks" {
  source = "./modules/eks"

  project_name                        = var.project_name
  cluster_version                     = var.eks_cluster_version
  cluster_subnet_ids                  = module.network.private_subnet_ids
  worker_subnet_ids                   = [module.network.private_subnet_a_id]
  worker_instance_type                = var.worker_instance_type
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  enable_control_plane_logs           = var.enable_cluster_control_plane_logs

  depends_on = [module.network]
}
