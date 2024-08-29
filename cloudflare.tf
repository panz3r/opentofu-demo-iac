# ---- Provider ----

# Cloudflare provider setup
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# ---- Resources ----

# D1 Database
resource "cloudflare_d1_database" "voting_app_database" {
  account_id = var.cloudflare_account_id

  name = "voting-app-sample-database"
}

# Turnstile Widget
resource "cloudflare_turnstile_widget" "voting_app_captcha" {
  account_id = var.cloudflare_account_id
  name       = "voting-app-captcha"

  domains = ["pages.dev"]
  mode    = "invisible"
  region  = "world"
}

# Pages Project
resource "cloudflare_pages_project" "voting_app" {
  account_id = var.cloudflare_account_id

  name = "voting-app"

  source {
    type = "github"

    config {
      owner     = split("/", github_repository.demo_webapp.full_name)[0]
      repo_name = split("/", github_repository.demo_webapp.full_name)[1]

      pr_comments_enabled = true
      deployments_enabled = true

      production_deployment_enabled = true
      production_branch             = "main"

      preview_deployment_setting = "none"
    }
  }

  production_branch = "main"

  build_config {
    build_command   = "npm run build"
    destination_dir = "dist"
  }

  deployment_configs {
    preview {
      environment_variables = {
        VITE_TURNSTILE_SITEKEY = cloudflare_turnstile_widget.voting_app_captcha.id
      }

      secrets = {
        TURNSTILE_SECRET = cloudflare_turnstile_widget.voting_app_captcha.secret
      }

      d1_databases = {
        DB = cloudflare_d1_database.voting_app_database.id
      }

      compatibility_flags = ["nodejs_compat"]
    }

    production {
      environment_variables = {
        VITE_TURNSTILE_SITEKEY = cloudflare_turnstile_widget.voting_app_captcha.id
      }

      secrets = {
        TURNSTILE_SECRET = cloudflare_turnstile_widget.voting_app_captcha.secret
      }

      d1_databases = {
        DB = cloudflare_d1_database.voting_app_database.id
      }

      compatibility_flags = ["nodejs_compat"]
    }
  }
}

# ---- Outputs ----

output "voting_app_url" {
  value = cloudflare_pages_project.voting_app.subdomain
}
