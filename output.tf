# Outputs to Display
// Serverless Tier
# output "atlas_cluster_connection_string" { value = mongodbatlas_serverless_instance.atlas-cluster.connection_strings_standard_srv }
// Free Tier
output "atlas_cluster_connection_string" { value = mongodbatlas_advanced_cluster.atlas-cluster.connection_strings.0.standard_srv }
output "ip_access_list"    { value = mongodbatlas_project_ip_access_list.ip.ip_address }
output "project_name"      { value = mongodbatlas_project.atlas-project.name }
output "username"          { value = mongodbatlas_database_user.db-user.username } 
output "user_password"     { 
  sensitive = true
  value = mongodbatlas_database_user.db-user.password 
}
#  output "privatelink_connection_string" {
# #     // servless
# #   value = mongodbatlas_serverless_instance.atlas-cluster.connection_strings_private_endpoint_srv
#      // free tier
#    value = mongodbatlas_advanced_cluster.atlas-cluster.connection_strings[0].private
#    //value = mongodbatlas_advanced_cluster.atlas-cluster.connection_strings[0].private_srv
#  }