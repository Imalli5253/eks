resource "kubernetes_deployment" "example" {
  metadata {
    name = "myFirst"
    labels = {
      test = "myFirst"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "myFirst"
      }
    }

    template {
      metadata {
        labels = {
          test = "myFirst"
        }
      }

      spec {
        container {
          image = "${aws_ecr_repository.myapp.name}:latest"
          name  = "myapp"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}