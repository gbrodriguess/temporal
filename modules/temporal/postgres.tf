resource "kubernetes_secret" "postgres" {
  count = var.dev_mode ? 1 : 0
  metadata {
    name      = var.postgres_secret
    namespace = var.namespace
  }

  data = {
    password = var.postgres_password
  }

  type = "Opaque"
}

resource "kubernetes_service" "postgres" {
  count = var.dev_mode ? 1 : 0
  metadata {
    name      = var.postgres_name
    namespace = var.namespace
  }

  spec {
    selector = {
      app = var.postgres_name
    }

    port {
      port        = 5432
      target_port = 5432
      protocol    = "TCP"
    }
  }
}



resource "kubernetes_deployment" "postgres" {
  count = var.dev_mode ? 1 : 0
  metadata {
    name      = var.postgres_name
    namespace = var.namespace
    labels = {
      app = var.postgres_name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.postgres_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.postgres_name
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:15"

          port {
            container_port = 5432
          }

          env {
            name  = "POSTGRES_USER"
            value = "admin"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }

          env {
            name  = "POSTGRES_DB"
            value = "mydatabase"
          }
        }
      }
    }
  }
}