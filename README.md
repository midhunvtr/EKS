# EKS
eks cluster setup 
# Modular Terraform: EKS with three worker nodes in one AZ

This learning project creates:
- A VPC with public/private subnets across two Availability Zones.
- An Internet Gateway and one NAT Gateway.
- An EKS control plane configured with subnets in two AZs.
- An EKS managed node group with exactly three On-Demand worker nodes in one private subnet/AZ.
- Cluster and worker IAM roles with the standard AWS-managed policies.
- Optional EKS control-plane logging.

## Important before running

1. EKS cluster subnets must span at least two AZs. The worker node group is restricted to one private subnet/AZ.
2. This is not a highly available worker layout. If that AZ fails, all three workers can become unavailable.
3. `t3.medium` nodes, the EKS control plane, NAT Gateway, public IPv4 addresses, CloudWatch logs and data transfer incur charges. One NAT Gateway is used to reduce (not eliminate) cost.
4. The public Kubernetes API CIDR defaults to `0.0.0.0/0` for initial learning convenience. Change it to your current public IP in CIDR form (for example, `x.x.x.x/32`) before applying.
5. The configured Kubernetes version must still be supported by EKS in your selected region when you deploy. Change `eks_cluster_version` if needed.
6. The AWS identity running Terraform needs permissions to create VPC, IAM, EKS, EC2, CloudWatch and related resources. Do not use root access keys or hard-code credentials.
7. This code has not been run against your AWS account. Validate the plan and resolve any account-specific or provider-version issues before applying.

## Files

- Root module: provider, inputs and module wiring.
- `modules/network`: VPC, subnets, routing, IGW, NAT Gateway.
- `modules/eks`: IAM roles/policies, EKS control plane and managed node group.

## Run

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars; especially the API endpoint CIDR and supported EKS version.

aws sts get-caller-identity
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan
terraform show tfplan
terraform apply tfplan
```

Configure kubectl:

```bash
aws eks update-kubeconfig --region ap-south-1 --name devops-eks-lab-cluster
kubectl get nodes -o wide
kubectl get pods -A
```

Expected: three nodes in `Ready` state. Their `topology.kubernetes.io/zone` label should show the same AZ.

## Destroy when finished

First delete Kubernetes services/ingresses that created external load balancers, then destroy Terraform resources:

```bash
terraform destroy
```

Confirm the destroy plan. If an AWS load balancer or other resource was created outside Terraform, remove it too. Check the AWS Billing console after cleanup.
