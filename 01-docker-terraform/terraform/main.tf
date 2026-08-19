terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.45.0"
    }
  }
}

provider "google" {
  project     = "powerful-rhino-506007-t7"
  region      = "us-central1"
  credentials = file(var.credentials)
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "powerful-rhino-506007-t7-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id = var.bq_dataset_name
}