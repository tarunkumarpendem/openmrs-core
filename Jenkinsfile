pipeline{
    agent {
        label 'node-1'
    }
    parameters{
        choice(name: 'Branch_name', choices: ['master', 'openmrs', 'dev', 'qa', 'uat', 'prod'], description: 'selecting branch')
    }
    stages{
        stage('build'){
            steps {
                script{
                    def REG = "tarunkumarpendem"
                    def default_image_name = "openmrs"
                    def default_image_tag = "1.0"
                    if (params['Branch_name'] == "master"){
                        sh """ 
                            echo build is not appplicable
                              """
                    }
                    else if (params['Branch_name'] == "openmrs"){
                        sh """ 
                              docker image build -t ${default_image_name}:${default_image_tag} .
                              docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
                              echo image build is completed in ${params.Branch_name}
                              """
                    }
                    else if (params['Branch_name'] == "dev"){
                        sh """ 
                              docker image build -t ${default_image_name}:${default_image_tag} .
                              docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
                              echo image build is completed in ${params.Branch_name}
                              """
                    }
                    else if (params['Branch_name'] == "qa"){
                        sh """ 
                              docker image build -t ${default_image_name}:${default_image_tag} .
                              docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
                              echo image build is completed in ${params.Branch_name}
                              """
                    }
                    else if (params['Branch_name'] == "uat"){
                        sh """ 
                              docker image build -t ${default_image_name}:${default_image_tag} .
                              docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
                              echo image build is completed in ${params.Branch_name}
                              """
                    }
                    else if (params['Branch_name'] == "prod"){
                        sh """ 
                              docker image build -t ${default_image_name}:${default_image_tag} .
                              docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:V-${BUILD_NUMBER}
                              echo image build is completed in ${params.Branch_name}
                              """
                    }
                    else {
                        sh """
                             echo image build is failed
                             """
                    }
                }
            }
        }
    }
    post{
        always{
            echo 'build completed'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is completed for $env.BUILD_URL"""
        }
        failure{
            echo 'build failed'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is failed for $env.BUILD_NUMBER
                          $env.BUILD_URL
                          $env.BUILD_ID"""
        }
        success{
            //junit '**/surefire-reports/*.xml'
            echo 'build is success'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is successfully completed for $env.BUILD_NUMBER
                          $env.BUILD_URL"""
        }
    }
}