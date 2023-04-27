output "ecr_id" {
    value = aws_ecr_repository.openmrs_ecr[0].registry_id
}