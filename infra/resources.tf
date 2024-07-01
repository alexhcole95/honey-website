data "hcp_vault_secrets_app" "honey_website" {
  app_name = "honey-website"
}

data "google_project" "website_project" {
  project_id = data.hcp_vault_secrets_app.honey_website.secrets.GCP_PROJECT
}

data "google_service_account" "terraform_service_account" {
  account_id = data.hcp_vault_secrets_app.honey_website.secrets.TF_SA
}