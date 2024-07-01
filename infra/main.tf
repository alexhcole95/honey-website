terraform {
  cloud {
    organization = "alexhcole"

    workspaces {
      name = "honey-website"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.2"
    }

    google = {
      source = "hashicorp/google"
      version = "5.35.0"
    }
  }
}