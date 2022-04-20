variable "token" {
  description   = "Github token"
}

variable "owner" {
  description   = "Github organisation"
}

variable "repo_name" {
  description   = "Repo name"
}

variable "repo_description" {
  description   = "Repo description"
}

variable "repo_visibility" {
  description   = "Repo visibility (public or private)"
  default = "private"
}

variable "default_branch_name" {
  description   = "Default branch name"
  default = "develop"
}
