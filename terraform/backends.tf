terraform {
  backend "s3" {
    bucket = "openmrs-terraform-statefile"
    key = "openmrs"
    dynamodb_table = "openmrs-db"
    region = "us-east-1"
  }
}