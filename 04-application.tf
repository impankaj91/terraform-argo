resource "argocd_application" "nginx" {
  depends_on = [argocd_project.project]
  metadata {
    name      = var.application_name
    namespace = var.argo_namespace
  }

  spec {
    project = var.project_name

    destination {
      server    = var.destionation_cluster
      namespace = var.project_namespace
    }

    source {
      repo_url        = var.repo_url
      path            = var.repo_path
      target_revision = var.repo_branch
    }
    sync_policy {
      sync_options = ["CreateNamespace=true"]
      automated {
        prune     = true
        self_heal = true
      }

    }
  }

}