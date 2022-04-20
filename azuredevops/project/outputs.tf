output "project" {
  value = azuredevops_project.project
}

output "repo_url" {
  value = azuredevops_git_repository.repo.remote_url
}
