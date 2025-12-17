output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.app_cluster.name
}

output "rds_endpoint" {
  value = aws_rds_instance.app_db[0].endpoint
}