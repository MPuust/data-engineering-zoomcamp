variable "bq_dataset_name" {
  description = "Name of the BigQuery dataset"
  default     = "demo_dataset"
}

variable "gcs_storage_class" {
  description = "Storage class for GCS bucket"
  default     = "STANDARD"
}

variable "credentials" {
  description = "Path to Google Cloud credentials JSON file"
  default     = "../../keys.ignore/terraform-service-account.json"
}