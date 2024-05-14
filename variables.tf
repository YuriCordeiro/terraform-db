# Atlas Organization ID 
variable "atlas_org_id" {
  type        = string
  description = "Atlas Organization ID"
}
# Atlas Project Name
variable "atlas_project_name" {
  type        = string
  description = "Atlas Project Name"
}

# Atlas Project Environment
variable "environment" {
  type        = string
  description = "The environment to be built"
}

# Cluster Instance Size Name 
variable "cluster_instance_size_name" {
  type        = string
  description = "Cluster instance size name"
}

# Cloud Provider to Host Atlas Cluster
variable "cloud_provider" {
  type        = string
  description = "AWS or GCP or Azure"
}

# Atlas Region
variable "atlas_region" {
  type        = string
  description = "Atlas region where resources will be created"
}

# MongoDB Version 
variable "mongodb_version" {
  type        = string
  description = "MongoDB Version"
}

# IP Address Access
variable "ip_address" {
  type = string
  description = "IP address used to access Atlas cluster"
}

# Mongodb atlas public key
variable "mongodbatlas_public_key" {
  type = string
  description = "Mongodb atlas API public key"
}

# Mongodb atlas private key
variable "mongodbatlas_private_key" {
  type = string
  description = "# Mongodb atlas API private key"
}

# AWS public key
variable "aws_access_key_id" {
  type = string
  description = "AWS public key"
}

# AWS secret key
variable "aws_secret_access_key" {
  type = string
  description = "# AWS secret key"
}

# AWS Region
variable "aws_region" {
  type = string
  description = "AWS Region"
}

variable "vpc_id" {
  type = string
  description = "AWS VPC ID"
}

variable "route_table_id" {
  type = string
  description = "VPC Route Table"
}

variable "subnetA" {
  type = string
  description = "SubnetA ID"
}

variable "subnetB" {
  type = string
  description = "SubnetB ID"
}

variable "subnetC" {
  type = string
  description = "SubnetC ID"
}