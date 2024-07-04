data "hcp_vault_secrets_app" "honey_website" {
  app_name = "honey-website"
}

data "google_project" "website_project" {
  project_id = data.hcp_vault_secrets_app.honey_website.secrets.GCP_PROJECT
}

data "google_service_account" "terraform_service_account" {
  account_id = data.hcp_vault_secrets_app.honey_website.secrets.TF_SA
}

resource "google_artifact_registry_repository" "website_repository" {
  location      = "us-central1"
  repository_id = "website-repository"
  description   = "This is a repository that holds container images for my websites."
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "artifact_perms_to_sa" {
  member     = "serviceAccount:${data.google_project.website_project.number}-compute@developer.gserviceaccount.com"
  location   = google_artifact_registry_repository.website_repository.location
  repository = google_artifact_registry_repository.website_repository.name
  role       = "roles/artifactregistry.reader"
}

resource "google_container_cluster" "website_cluster" {
  name     = "website-cluster"
  location = "us-central1"
}