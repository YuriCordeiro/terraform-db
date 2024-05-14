# ### Serverless Tier
# resource "mongodbatlas_privatelink_endpoint_serverless" "atlaspl" {
#     project_id   = mongodbatlas_project.atlas-project.id
#     instance_name = mongodbatlas_serverless_instance.atlas-cluster.name
#     provider_name = var.cloud_provider
# }

# resource "aws_vpc_endpoint" "ptfe_service" {
#   vpc_id             = var.vpc_id
#   service_name       = mongodbatlas_privatelink_endpoint_serverless.atlaspl.endpoint_service_name
#   vpc_endpoint_type  = "Interface"
#   subnet_ids         = [var.subnetA, var.subnetB, var.subnetC]
#   security_group_ids = [aws_security_group.atlasdb-sg.id]
# }

# ## Integration between serverless private link with aws private endpoint
# resource "mongodbatlas_privatelink_endpoint_service_serverless" "atlaseplink" {
#     project_id   = mongodbatlas_project.atlas-project.id
#     instance_name = mongodbatlas_serverless_instance.atlas-cluster.name
#     endpoint_id = mongodbatlas_privatelink_endpoint_serverless.atlaspl.endpoint_id
#     cloud_provider_endpoint_id = aws_vpc_endpoint.ptfe_service.id
#     provider_name = var.cloud_provider
#     comment = "New serverless endpoint"
# }



## Free Tier
# resource "mongodbatlas_privatelink_endpoint" "atlaspl" {
#   project_id    = mongodbatlas_project.atlas-project.id
#   provider_name = var.cloud_provider
#   region        = var.aws_region
# }

# resource "aws_vpc_endpoint" "ptfe_service" {
#   vpc_id             = var.vpc_id
#   service_name       = mongodbatlas_privatelink_endpoint.atlaspl.endpoint_service_name
#   vpc_endpoint_type  = "Interface"
#   subnet_ids         = [var.subnetA, var.subnetB, var.subnetC]
#   security_group_ids = [aws_security_group.atlasdb-sg.id]
# }

# resource "mongodbatlas_privatelink_endpoint_service" "atlaseplink" {
#   project_id          = mongodbatlas_privatelink_endpoint.atlaspl.project_id
#   endpoint_service_id = aws_vpc_endpoint.ptfe_service.id
#   private_link_id     = mongodbatlas_privatelink_endpoint.atlaspl.id
#   provider_name       = var.cloud_provider
# }