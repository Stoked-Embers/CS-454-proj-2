terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

# Connect Terraform to your k3d cluster
provider "kubernetes" {
  config_path = "~/.kube/config"
}


# 1. Namespace
resource "kubernetes_namespace" "app" {
  metadata {
    name = "demo-app"
  }
}


# 2. Deployment
# Enhancement replicas = 2
resource "kubernetes_deployment" "backend" {
  metadata {
    name      = "backend"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2    # ENHANCEMENT

    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          name  = "backend"
          image = "my-backend:local"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}



# 3. Service
resource "kubernetes_service" "backend" {
  metadata {
    name      = "backend"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    selector = {
      app = "backend"
    }

    port {
      port        = 5000
      target_port = 5000
      node_port	  = 30000
    }

    type = "NodePort"
  }
}
