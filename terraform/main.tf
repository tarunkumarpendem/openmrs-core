resource "aws_ecr_repository" "openmrs_ecr" {
    count = "${terraform.workspace == "dev" ? 1 : 0}" 
    name = var.ecr_details.registry_name
    image_tag_mutability = "IMMUTABLE"
    image_scanning_configuration {
      scan_on_push = true
    }
    tags = {
      "Name" = var.ecr_details.registry_tags[0]
      "Environment"  = var.ecr_details.registry_tags[1]
    }
}