resource "argocd_repository" "repo" {
  repo     = ""
  name     = ""
  username = ""
  password = ""
}

resource "argocd_repository" "repo_ssh" {
  repo            = ""
  name            = ""
  username        = ""
  ssh_private_key = ""
}