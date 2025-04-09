provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "temporal" {
  source = "../../modules/temporal"

  elasticsearch_enabled     = true
  elasticsearch_replicas    = 1

  server_resources_cpu      = "200m"
  server_resources_memory   = "300Mi"

  num_history_shards        = 300

  postgres_host             = "postgres.temporal-system"
  postgres_user             = "admin"
  postgres_secret           = "postgres"
  temporal_db_name          = "temporal"
  visibility_db_name        = "temporal_visibility"

  prometheus_enabled        = true
  grafana_enabled           = true

  enable_hpa                = true
  hpa_target_deployment     = "temporal-frontend"
  hpa_min_replicas          = 2
  hpa_max_replicas          = 5
  hpa_metric_resource       = "cpu"
  hpa_target_utilization    = 70
}