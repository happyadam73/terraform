resource "azuredevops_project" "project" {
  name               = var.project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
  features = {
    "testplans" = "disabled"
  }
}

resource "azuredevops_git_repository" "repo" {
  project_id     = azuredevops_project.project.id
  name           = var.repo_name
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to initialization to support importing existing repositories
      # Given that a repo now exists, either imported into terraform state or created by terraform,
      # we don't care for the configuration of initialization against the existing resource
      initialization,
    ]
  }
}

// This section configures variable groups and a build definition
resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = "Sample Build Definition"
  path       = "\\ExampleFolder"

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repo.id
    branch_name = azuredevops_git_repository.repo.default_branch
    yml_path    = "azure-pipelines.yml"
  }

  variable_groups = [azuredevops_variable_group.vg.id]
}

// This section configures an Azure DevOps Variable Group
resource "azuredevops_variable_group" "vg" {
  project_id   = azuredevops_project.project.id
  name         = "Sample VG 1"
  description  = "A sample variable group."
  allow_access = true

  variable {
    name      = "key1"
    value     = "value1"
    is_secret = true
  }

  variable {
    name  = "key2"
    value = "value2"
  }

  variable {
    name = "key3"
  }
}
