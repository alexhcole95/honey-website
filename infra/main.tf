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

    hcp = {
      source = "hashicorp/hcp"
      version = "0.93.0"
    }
  }
}

provider "google" {
  project = "ac-personal-websites"
  region  = "us-central1"
  zone    = "us-central1-c"
}

provider "github" {}

provider "hcp" {}