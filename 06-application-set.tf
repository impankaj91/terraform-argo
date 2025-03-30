resource "argocd_application_set" "application_set" {

 depends_on = [ argocd_project.project ]

  metadata {
    name = "list"
  }  
  spec {
    generator {
      list {
        elements = [ 
            {
               url = var.destionation_cluster
               namespace = "${var.project_name}-development"
               branch = "dev" 
            },
            {
               url = var.destionation_cluster
               namespace = "${var.project_name}-production"
               branch = "master" 
            }
         ]
      }
    }
    template {
      metadata {
        name = "{{namespace}}-app"
      }
      spec {
        project = var.project_name

        source {
          repo_url = var.repo_url
          target_revision = "{{branch}}"
          path = var.repo_path
        }
        destination {
          server = "{{url}}"
          namespace = "{{namespace}}"
        }
        sync_policy {
          sync_options = ["CreateNamespace=true","ApplyOutOfSyncOnly=true"]
          automated {
            prune = true
            self_heal = true
          }
        }
      }

    }
  }

}