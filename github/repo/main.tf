resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.repo_description
  visibility = var.repo_visibility
  auto_init   = true
}

resource "github_branch" "branch" {
  repository = github_repository.repo.name
  branch     = var.default_branch_name
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = github_branch.branch.branch
}
