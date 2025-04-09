locals {
  temporal_values = {
    for k, v in local.temporal_values_raw : k => tostring(v)
  }

  temporal_values_raw = {
    "elasticsearch.enabled"                = var.elasticsearch_enabled
    "elasticsearch.replicas"               = var.elasticsearch_replicas

    # Flattened labels (maps aren't supported in Helm `set`)
    "server.labels.app.kubernetes.io/name"         = "temporal"
    "server.frontend.labels.app.kubernetes.io/name" = "temporal"
    "server.history.labels.app.kubernetes.io/name"  = "temporal"
    "server.matching.labels.app.kubernetes.io/name" = "temporal"

    "server.matching.resources.requests.cpu"     = var.server_resources_cpu
    "server.matching.resources.requests.memory"  = var.server_resources_memory
    "server.history.resources.requests.cpu"      = var.server_resources_cpu
    "server.history.resources.requests.memory"   = var.server_resources_memory
    "server.frontend.resources.requests.cpu"     = var.server_resources_cpu
    "server.frontend.resources.requests.memory"  = var.server_resources_memory
    "server.resources.requests.cpu"              = var.server_resources_cpu
    "server.resources.requests.memory"           = var.server_resources_memory

    "server.config.numHistoryShards"             = var.num_history_shards

    "server.config.persistence.default.driver"               = "sql"
    "server.config.persistence.default.sql.driver"           = "postgres12"
    "server.config.persistence.default.sql.host"             = var.postgres_host
    "server.config.persistence.default.sql.port"             = "5432"
    "server.config.persistence.default.sql.database"         = var.temporal_db_name
    "server.config.persistence.default.sql.user"             = var.postgres_user
    "server.config.persistence.default.sql.existingSecret"   = var.postgres_secret
    "server.config.persistence.default.sql.maxConns"         = "20"
    "server.config.persistence.default.sql.maxConnLifetime"  = "1h"

    "server.config.persistence.visibility.driver"            = "sql"
    "server.config.persistence.visibility.sql.driver"        = "postgres12"
    "server.config.persistence.visibility.sql.host"          = var.postgres_host
    "server.config.persistence.visibility.sql.port"          = "5432"
    "server.config.persistence.visibility.sql.database"      = var.visibility_db_name
    "server.config.persistence.visibility.sql.user"          = var.postgres_user
    "server.config.persistence.visibility.sql.existingSecret" = var.postgres_secret
    "server.config.persistence.visibility.sql.maxConns"      = "20"
    "server.config.persistence.visibility.sql.maxConnLifetime" = "1h"

    "schema.createDatabase.enabled" = "true"
    "schema.setup.enabled"          = "true"
    "schema.update.enabled"         = "true"

    "cassandra.enabled"            = "false"
    "mysql.enabled"                = "false"
    "postgresql.enabled"           = "false"

    "prometheus.enabled"           = var.prometheus_enabled
    "grafana.enabled"              = var.grafana_enabled
  }
}