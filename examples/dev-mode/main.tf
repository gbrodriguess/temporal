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

  elasticsearch_enabled     = false

  postgres_user             = "admin"
  postgres_name             = "postgres"
  postgres_password         = "password" 
  dev_mode                  = true  
  temporal_db_name          = "temporal"

  prometheus_enabled        = false
  grafana_enabled           = false

  enable_hpa                = false
}