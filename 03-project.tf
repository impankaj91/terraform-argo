resource "argocd_project" "project" {
  metadata {
    name      = var.project_name
    namespace = var.argo_namespace
  }
  spec {
    description = var.project_description
    destination {
      server    = var.destionation_cluster
      namespace = "*"
    }
    source_repos = ["*"]

    cluster_resource_blacklist {
      group = "*"
      kind  = "*"
    }

    #namespace_resource_whitelist {
    #  kind = ""
    #  group = "Service"
    #}

    #namespace_resource_whitelist {
    #  kind = "apps"
    #  group = "Deployment"
    #}

    dynamic "namespace_resource_whitelist" {
      for_each = var.whitelist_objects
      iterator = whitelist_object

      content {
        kind  = whitelist_object.value["kind"]
        group = whitelist_object.value["group"]
      }
    }

    role {
      name = "readonly"
      policies = [
        "p, proj:${var.project_name}:readonly, applications, override, ${var.project_name}/*, allow"
      ]
    }

  }
}

resource "argocd_project_token" "secret" {

  depends_on = [argocd_project.project]

  project      = var.project_name
  role         = "readonly"
  description  = "short lived token"
  expires_in   = "1h"
  renew_before = "30m"
}