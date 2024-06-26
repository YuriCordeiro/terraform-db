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
  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
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
  cidr_block = var.ip_address
}

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