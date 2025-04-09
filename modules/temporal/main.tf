resource "helm_release" "temporal" {
  depends_on = [kubernetes_deployment.postgres]
  name             = "temporal"
  chart            = "temporal"
  repository       = "https://temporalio.github.io/helm-charts"
  namespace        = var.namespace
  create_namespace = true

  dynamic "set" {
    for_each = local.temporal_values
    content {
      name  = set.key
      value = set.value
    }
  }
}