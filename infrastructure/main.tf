terraform {
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "~> 0.2"
    }
  }
}

provider "b2" {}

data "b2_bucket" "data" {
  bucket_name = "rtv-lakehouse-raw"
}

# National Panel Survey
resource "b2_bucket_file_version" "nps" {
  bucket_id = data.b2_bucket.data.bucket_id
  file_name = "raw/UGA_2019_UNPS_v03_M_CSV.zip"
  source    = "../ingestion/data/UGA_2019_UNPS_v03_M_CSV.zip"
}

# FAOSTAT
resource "b2_bucket_file_version" "faostat" {
  bucket_id = data.b2_bucket.data.bucket_id
  file_name = "raw/Production_Crops_Livestock_E_Africa.zip"
  source    = "../ingestion/data/Production_Crops_Livestock_E_Africa.zip"
}

# CHIRPS
resource "b2_bucket_file_version" "chirps" {
  bucket_id = data.b2_bucket.data.bucket_id
  file_name = "raw/chirps_uganda.zip"
  source    = "../ingestion/data/chirps_uganda.zip"
}