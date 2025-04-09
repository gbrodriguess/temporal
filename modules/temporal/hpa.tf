resource "kubernetes_horizontal_pod_autoscaler_v2" "temporal_frontend_hpa" {
  count = var.enable_hpa ? 1 : 0

  metadata {
    name      = "temporal-frontend-hpa"
    namespace = var.namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = var.hpa_target_deployment
    }

    min_replicas = var.hpa_min_replicas
    max_replicas = var.hpa_max_replicas

    metric {
      type = "Resource"

      resource {
        name = var.hpa_metric_resource

        target {
          type                = "Utilization"
          average_utilization = var.hpa_target_utilization
        }
      }
    }
  }
}