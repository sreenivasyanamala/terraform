module "aws_es" {

  source = "./terraform-es"

  domain_name           = var.domain_name
  elasticsearch_version = var.elasticsearch_version

  cluster_config_dedicated_master_enabled = true
  cluster_config_instance_count           = var.instance_count
  cluster_config_dedicated_master_type    =  var.master_instance_type
  cluster_config_instance_type            = var.instance_type
  cluster_config_zone_awareness_enabled   = "true"
  cluster_config_availability_zone_count  = "2"

  ebs_options_volume_size = var.volume_size

  encrypt_at_rest_enabled    = true
  encrypt_at_rest_kms_key_id = "alias/aws/es"

  log_publishing_options_enabled  = true
  log_publishing_options_log_type = "INDEX_SLOW_LOGS"

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
  
vpc_options = {
    subnet_ids = [var.subnetid_1, var.subnetid_2]
    security_group_ids = [var.security_group_id]
  }

  
  node_to_node_encryption_enabled                = "true"
  snapshot_options_automated_snapshot_start_hour = "23"

  tags = {
    Owner = "Mohan"
    env   = "production"
 }
}
