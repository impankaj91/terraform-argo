terraform {
  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.5.0"
    }
  }
}

provider "argocd" {
  # Configuration options
  server_addr = var.cluster_endpoint
  username = var.argo_username
  password = var.argo_password
  insecure = true
}