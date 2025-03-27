output "jwt_project" {
  value = nonsensitive(argocd_project_token.secret.jwt)
}