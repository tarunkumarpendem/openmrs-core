variable "region" {
    type = string
    description = "Selecting region in AWS to create resources"
    default = "us-east-1"
}

variable "ecr_details" {
    type = object({
        registry_name = string
        registry_tags = list(string)
    })
    description = "Selecting Name for ECR Repository"
    default = {
      registry_name = "openmrs_ecr_repo"
      registry_tags = [ "openmrs_ecr_pvt_repo", "dev" ]
    }
}