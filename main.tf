terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.15.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = "./keys/key_gcp.json"
  project     = "terraform-demo-484216"
  region      = "us-central1"

}

resource "google_storage_bucket" "demo_bucket" {
  name          = "terraform-demo-484216"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}