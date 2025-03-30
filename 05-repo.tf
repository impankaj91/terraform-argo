resource "argocd_repository" "repo" {
  repo     = var.repo_url
  name     = "private_repo"
  username = var.git_username
  password = var.git_token
}


#resource "argocd_repository" "repo_ssh" {
#  repo            = ""
#  name            = ""
#  username        = ""
#  ssh_private_key = ""
#}