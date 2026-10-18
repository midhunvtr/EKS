variable "project_name" {
  type        = string
  description = "Prefix for network resource names."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR."
}

variable "az_a" {
  type        = string
  description = "First available AZ."
}

variable "az_b" {
  type        = string
  description = "Second available AZ."
}
