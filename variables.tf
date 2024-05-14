# Atlas Organization ID 
variable "atlas_org_id" {
  type        = string
  description = "Atlas Organization ID"
}
# Atlas Project Name
variable "atlas_project_name" {
  type        = string
  description = "Atlas Project Name"
  default = "order-manager"
}

# Atlas Project Environment
variable "environment" {
  type        = string
  description = "The environment to be built"
  default = "environment"
}

# Cluster Instance Size Name 
variable "cluster_instance_size_name" {
  type        = string
  description = "Cluster instance size name"
  default = "M0"
}

# Cloud Provider to Host Atlas Cluster
variable "cloud_provider" {
  type        = string
  description = "AWS or GCP or Azure"
  default = "AWS"
}

# Atlas Region
variable "atlas_region" {
  type        = string
  description = "Atlas region where resources will be created"
  default = "US_EAST_1"
}

# MongoDB Version 
variable "mongodb_version" {
  type        = string
  description = "MongoDB Version"
  default = "6.0"
}

# IP Address Access
variable "ip_address" {
  type = string
  description = "IP address used to access Atlas cluster"
  default = "0.0.0.0/0"
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
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
  description = "AWS VPC ID"
  default = "vpc-0a5631d68e32e6699"
}

variable "route_table_id" {
  type = string
  description = "VPC Route Table"
  default = "rtb-013f2114158d07269"
}

variable "subnetA" {
  type = string
  description = "SubnetA ID"
  default = "subnet-09eb19942faa0589d"
}

variable "subnetB" {
  type = string
  description = "SubnetB ID"
  default = "subnet-0ca2c685ec3e897c3"
}

variable "subnetC" {
  type = string
  description = "SubnetC ID"
  default = "subnet-0c9235a23c8769293"
}