pipeline{
    agent{
        label 'terraform_agent'
    }
    parameters{
        choice(name: 'Branch_Name', choices: ['openmrs', 'dev', 'master'], description: 'Selecting branch to create cluster')
    }
    stages{
        stage('terraform_vcs'){
            agent{
                label 'terraform_agent'
            }
            steps{
                git url: 'https://github.com/tarunkumarpendem/openmrs-core.git',
                    branch: "${params.Branch_Name}"
            }
        }
        stage('eks_cluster'){
            agent{
                label 'terraform_agent'
            }
            steps{
                sh """
                    cd terraform
                    terraform init
                    terraform fmt
                    terraform validate
                    terraform plan
                    terraform apply -auto-approve
                """
            }
        } 
    }
}