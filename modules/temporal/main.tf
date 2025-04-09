resource "helm_release" "temporal" {
  name             = "temporal"
  chart            = "temporal"
  repository       = "https://charts.temporal.io"
  version          = "0.41.2"
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