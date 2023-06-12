variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the EKS cluster will be created"
  type        = list(string)
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use for the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_group_instance_type" {
  description = "Instance type for the EKS node group"
  type        = string
}

variable "node_group_desired_capacity" {
  description = "Desired capacity for the EKS node group"
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum size for the EKS node group"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum size for the EKS node group"
  type        = number
}
