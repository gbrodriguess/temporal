variable "elasticsearch_enabled" {
  type    = bool
  default = true
}

variable "elasticsearch_replicas" {
  type    = number
  default = 1
}

variable "server_resources_cpu" {
  type    = string
  default = "200m"
}

variable "server_resources_memory" {
  type    = string
  default = "300Mi"
}


variable "num_history_shards" {
  type    = number
  default = 300
}

variable "postgres_host" {
  type    = string
  default = "postgres.temporal-system"
}

variable "postgres_user" {
  type    = string
  default = "admin"
}

variable "postgres_name" {
  type    = string
  default = "admin"
}

variable "postgres_secret" {
  type    = string
  default = "postgres"
}

variable "postgres_password" {
  type    = string
  default = "postgres"
  sensitive = true
}

variable "temporal_db_name" {
  type    = string
  default = "temporal"
}

variable "visibility_db_name" {
  type    = string
  default = "temporal_visibility"
}

variable "prometheus_enabled" {
  type    = bool
  default = true
}

variable "grafana_enabled" {
  type    = bool
  default = true
}


variable "enable_hpa" {
  description = "Enable Horizontal Pod Autoscaler"
  type        = bool
  default     = false
}

variable "hpa_target_deployment" {
  description = "Name of the target deployment for HPA"
  type        = string
  default     = "temporal-frontend"
}

variable "hpa_min_replicas" {
  description = "Minimum number of pod replicas"
  type        = number
  default     = 2
}

variable "hpa_max_replicas" {
  description = "Maximum number of pod replicas"
  type        = number
  default     = 5
}

variable "hpa_metric_resource" {
  description = "Resource type to monitor (cpu or memory)"
  type        = string
  default     = "cpu"
}

variable "hpa_target_utilization" {
  description = "Target average utilization for the resource"
  type        = number
  default     = 70
}

variable "namespace" {
  type     = string
  default  = "temporal"
}


variable "dev_mode" {
  type     = bool
  default  = false
}


