variable "argo_username" {}
variable "argo_password" {}
variable "project_name" {}
variable "project_description" {}
variable "whitelist_objects" {
  type = list(object({
    kind  = string,
    group = string
  }))
}
variable "cluster_endpoint" {}
variable "destionation_cluster" {}
variable "argo_namespace" {}
variable "project_namespace" {}
variable "application_name" {}
variable "repo_url" {}
variable "repo_path" {}
variable "repo_branch" {}
variable "git_username" {}
variable "git_token" {}