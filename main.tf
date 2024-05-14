# Create a Project
resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username = "user-1"
  password = random_password.db-user-password.result
  project_id = mongodbatlas_project.atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}"
    collection_name = "*"
  }
}

# Create a Database Password
resource "random_password" "db-user-password" {
  length = 16
  special = false // Special Characters
  override_special = "_%@"
}

# Create Database IP Access List 
resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.atlas-project.id
  //ip_address = var.ip_address
  cidr_block = var.ip_address
}

# resource "mongodbatlas_serverless_instance" "atlas-cluster" {
#   project_id   = mongodbatlas_project.atlas-project.id
#   name         = "${var.atlas_project_name}-${var.environment}-cluster-serverless"

#   provider_settings_backing_provider_name = var.cloud_provider
#   provider_settings_provider_name = "SERVERLESS"
#   provider_settings_region_name = var.atlas_region
# }

# Create Free Tier Cluster
resource "mongodbatlas_advanced_cluster" "atlas-cluster" {
  project_id = mongodbatlas_project.atlas-project.id
  name = "${var.atlas_project_name}-${var.environment}-cluster"
  cluster_type = "REPLICASET"
  replication_specs {
    region_configs {
      electable_specs {
        instance_size = var.cluster_instance_size_name
        node_count    = 3
      }
      priority      = 7
      provider_name = "TENANT"
      backing_provider_name = var.cloud_provider
      region_name   = var.atlas_region
    }
  }
}

## Free Tier
# Wait until VPC Creation to create Atlas Cluster
# data "mongodbatlas_advanced_cluster" "atlas-cluser" {
#   project_id = mongodbatlas_project.atlas-project.id
#   name       = mongodbatlas_advanced_cluster.atlas-cluster.name
#   depends_on = [mongodbatlas_privatelink_endpoint_service.atlaseplink]
# }

## Serverless
# # Wait until VPC Creation to create Atlas Cluster
# data "mongodbatlas_serverless_instance" "atlas-cluser" {
#   project_id = mongodbatlas_project.atlas-project.id
#   name       = mongodbatlas_serverless_instance.atlas-cluster.name
#   depends_on = [mongodbatlas_privatelink_endpoint_service_serverless.atlaseplink]
# }