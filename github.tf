# ---- Provider ----

# GitHub provider setup
provider "github" {
  token = var.github_token
}

# ---- Repositories ----

resource "github_repository" "demo_iac" {
  name        = "opentofu-demo-iac"
  description = "Infrastructure for 'Infrastructure as Code ... Vegan-style' demo"

  # Visibility settings
  visibility = "private"

  # General settings
  has_issues      = false
  has_projects    = false
  has_discussions = false
  has_wiki        = false
  has_downloads   = false

  # PR settings
  allow_rebase_merge     = true
  allow_merge_commit     = false
  allow_squash_merge     = false
  allow_update_branch    = true
  delete_branch_on_merge = true
}

resource "github_repository" "demo_webapp" {
  name        = "opentofu-demo-webapp"
  description = "Webapp for 'Infrastructure as Code ... Vegan-style' demo"

  # Visibility settings
  visibility = "private"

  # General settings
  has_issues      = false
  has_projects    = false
  has_discussions = false
  has_wiki        = false
  has_downloads   = false

  # PR settings
  allow_rebase_merge     = true
  allow_merge_commit     = false
  allow_squash_merge     = false
  allow_update_branch    = true
  delete_branch_on_merge = true
}

# ---- Outputs ----

output "demo_iac_git_url" {
  value = github_repository.demo_iac.git_clone_url
}

output "demo_webapp_git_url" {
  value = github_repository.demo_webapp.git_clone_url
}
