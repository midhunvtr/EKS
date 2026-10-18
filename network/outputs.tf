output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID."
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  description = "Private subnets across two AZs for the EKS control plane ENIs."
}

output "private_subnet_a_id" {
  value       = aws_subnet.private_a.id
  description = "Private subnet in AZ A; the worker node group is restricted to this subnet."
}

output "public_subnet_ids" {
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  description = "Public subnets for internet-facing load balancers."
}
