output "helm_release_name" {
  description = "Name of the Helm release for Temporal"
  value       = helm_release.temporal.name
}

output "namespace" {
  description = "Namespace where Temporal is installed"
  value       = helm_release.temporal.namespace
}

output "helm_release_status" {
  description = "Status of the Helm release"
  value       = helm_release.temporal.status
}


output "temporal_chart_version" {
  description = "The chart version used for the Helm release"
  value       = helm_release.temporal.chart
}

output "temporal_hpa_name" {
  description = "The name of the HPA if enabled"
  value       = var.enable_hpa ? kubernetes_horizontal_pod_autoscaler_v2.temporal_frontend_hpa[0].metadata[0].name : null
}