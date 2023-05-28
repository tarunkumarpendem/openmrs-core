// pipeline{
//     agent {
//         label 'node-1'
//     }
//     /*parameters{
//         choice(name: 'Branch_to_build', choices: ['main', 'REL_1.0'], description: 'selecting branch to build')
//     }*/
//     /*triggers{
//         pollSCM('* * * * *')
//     }*/
//     post{
//         always{
//             echo 'build completed'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is completed for $env.BUILD_URL"""
//         }
//         failure{
//             echo 'build failed'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is failed for $env.BUILD_NUMBER
//                           $env.BUILD_URL
//                           $env.BUILD_ID"""
//         }
//         success{
//             echo 'build is success'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is successfully completed for $env.BUILD_NUMBER
//                           $env.BUILD_URL"""
//         }
//     }
//     stages{
//         stage(clone){
//             steps{
//                 git url: 'https://github.com/openmrs/openmrs-core.git',
//                     branch: "master"
//             }
//         }    
//         /*stage(build){
//           steps
//             {
//                 withSonarQubeEnv('sonarqube') {
//                      sh "mvn clean install sonar:sonar"
//                }
//             }
//         }*/
//           stage ('Artifactory configuration') {
//             steps {
//                 rtMavenDeployer (
//                     id: "jfrog",
//                     serverId: "jfrog",
//                     releaseRepo: 'libs-release-local',
//                     snapshotRepo: 'libs-snapshot-local'
//                 )
//             }
//         }
//         stage ('Exec Maven') {
//             steps {
//                 rtMavenRun (
//                     tool: 'mvn-ubuntu', // Tool name from Jenkins configuration
//                     pom: 'pom.xml',
//                     goals: 'clean install',
//                     deployerId: "jfrog"
//                 )
//             }
//         }
//         stage ('Publish build info') {
//             steps {
//                 rtPublishBuildInfo (
//                     serverId: "jfrog"
//                 )
//             }
//         }
//     }
// }


// pipeline{
//     agent {
//         label 'node-1'
//     }
//     parameters{
//         choice(name: 'Branch_name', choices: ['master', 'openmrs', 'dev', 'qa', 'uat', 'prod'], description: 'selecting branch')
//     }
//     stages{
//         stage('build'){
//             steps {
//                 script{
//                     def REG = "tarunkumarpendem"
//                     def default_image_name = "openmrs"
//                     def default_image_tag = "1.0"
//                     if (params['Branch_name'] == "master"){
//                         sh """ 
//                             echo build is not appplicable
//                               """
//                     }
//                     else if (params['Branch_name'] == "openmrs"){
//                         sh """ 
//                               docker image build -t ${default_image_name}:${default_image_tag} .
//                               docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
//                               echo image build is completed in ${params.Branch_name}
//                               """
//                     }
//                     else if (params['Branch_name'] == "dev"){
//                         sh """ 
//                               docker image build -t ${default_image_name}:${default_image_tag} .
//                               docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
//                               echo image build is completed in ${params.Branch_name}
//                               """
//                     }
//                     else if (params['Branch_name'] == "qa"){
//                         sh """ 
//                               docker image build -t ${default_image_name}:${default_image_tag} .
//                               docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
//                               echo image build is completed in ${params.Branch_name}
//                               """
//                     }
//                     else if (params['Branch_name'] == "uat"){
//                         sh """ 
//                               docker image build -t ${default_image_name}:${default_image_tag} .
//                               docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:${BUILD_NUMBER}
//                               echo image build is completed in ${params.Branch_name}
//                               """
//                     }
//                     else if (params['Branch_name'] == "prod"){
//                         sh """ 
//                               docker image build -t ${default_image_name}:${default_image_tag} .
//                               docker image tag ${default_image_name}:${default_image_tag} ${REG}/${params.Branch_name}:V-${BUILD_NUMBER}
//                               echo image build is completed in ${params.Branch_name}
//                               """
//                     }
//                     else {
//                         sh """
//                              echo image build is failed
//                              """
//                     }
//                 }
//             }
//         }
//     }
//     post{
//         always{
//             echo 'build completed'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is completed for $env.BUILD_URL"""
//         }
//         failure{
//             echo 'build failed'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is failed for $env.BUILD_NUMBER
//                           $env.BUILD_URL
//                           $env.BUILD_ID"""
//         }
//         success{
//             //junit '**/surefire-reports/*.xml'
//             echo 'build is success'
//             mail to: 'tarunkumarpendem22@gmail.com',
//                  subject: 'Job summary',
//                  body: """Build is successfully completed for $env.BUILD_NUMBER
//                           $env.BUILD_URL"""
//         }
//     }
// }

pipeline{
    agent any
    triggers{
        pollSCM('* * * * *')
    }
    parameters{
        choice(name: 'Branch_Name', choices: ['dev', 'qa', 'openmrs', 'master'], description: 'Selecting branch to build')
        choice(name: 'Image_tag_poc', choices: ['1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9', '1.10'], description: 'Image tag for dev, qa brancges')
        choice(name: 'Image_tag_openmrs', choices: ['uat-1.0', 'uat-1.1', 'uat-1.2', 'uat-1.3', 'uat-1.4', 'uat-1.5', 'uat-1.6', 'uat-1.7', 'uat-1.8', 'uat-1.9', 'uat-1.10'], description: 'Image tag for uat')
        choice(name: 'Image_tag_prod', choices: ['v1.0', 'v-1.1', 'v-1.2', 'v-1.3', 'v-1.4', 'v-1.5', 'v-1.6', 'v-1.7', 'v-1.8', 'v-1.9', 'v-1.10'], description: 'Image tag for prod')
    }
    stages{
        stage('vcs'){
            agent{
                label 'docker_agent'
            }
            steps{
                git url: 'https://github.com/tarunkumarpendem/openmrs-core.git',
                    branch: "${params.Branch_Name}"
            }
        }
        stage('docker'){
            agent{
                label 'docker_agent'
            }
            steps{
                script{
                    def ECR_OPENMRS_REPO = "116710275660.dkr.ecr.us-east-1.amazonaws.com/openmrs_ecr_repo"
                    def default_image_name_poc = "openmrs-poc"
                    def default_image_name_openmrs = "openmrs-uat"
                    def default_image_name_master = "openmrs-prod"
                    def default_image_tag = "1.0"
                    if ( params[ 'Branch_Name' ] == 'dev' ){
                        sh """
                              docker build -t ${default_image_name_poc}:${default_image_tag} .
                              docker tag ${default_image_name_poc}:${default_image_tag} ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_poc}
                              docker push ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_poc}
                              docker image rm -f ${default_image_name_poc}:${default_image_tag}
                              docker image rm -f ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_poc}
                              docker image ls
                              echo image build, push and delete is completed successfully in ${params.Branch_Name}
                        """
                    }
                    else if ( params[ 'Branch_Name' ] == 'qa' ){
                        sh """
                              docker build -t ${default_image_name_poc}:${default_image_tag} .
                              docker tag ${default_image_name_poc}:${default_image_tag} ${ECR_OPENMRS_REPO}:${params.Branch_Name}-qa-${BUILD_ID}-${params.Image_tag_poc}
                              docker push ${ECR_OPENMRS_REPO}:${params.Branch_Name}-qa-${BUILD_ID}-${params.Image_tag_poc}
                              docker image rm -f ${default_image_name_poc}:${default_image_tag}
                              docker image rm -f ${ECR_OPENMRS_REPO}:${params.Branch_Name}-qa-${BUILD_ID}-${params.Image_tag_poc}
                              docker image ls
                              echo image build, push and delete is completed successfully in ${params.Branch_Name}
                        """
                    }
                    else if ( params[ 'Branch_Name' ] == 'openmrs' ){
                        sh """
                              docker build -t ${default_image_name_openmrs}:${default_image_tag} .
                              docker tag ${default_image_name_openmrs}:${default_image_tag} ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_openmrs}
                              docker push ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_openmrs}
                              docker image rm -f ${default_image_name_openmrs}:${default_image_tag}
                              docker image rm -f ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_openmrs}
                              docker image ls
                              echo image build, push and delete is completed successfully in ${params.Branch_Name}
                        """
                    }
                    else if ( params[ 'Branch_Name' ] == 'master' ){
                        sh """
                              docker build -t ${default_image_name_master}:${default_image_tag} .
                              docker tag ${default_image_name_master}:${default_image_tag} ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_prod}
                              docker push ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_prod}
                              docker image rm -f ${default_image_name_master}:${default_image_tag}
                              docker image rm -f ${ECR_OPENMRS_REPO}:${params.Branch_Name}-${BUILD_ID}-${params.Image_tag_prod}
                              docker image ls
                              echo image build, push and delete is completed successfully in ${params.Branch_Name}
                        """
                    }
                    else{
                        sh "echo image is build is failed"
                    }
                }
            }
        }
        stage('terraform_vcs'){
            agent{
                label 'terraform_agent'
            }
            steps{
                git url: 'https://github.com/tarunkumarpendem/openmrs-core.git',
                    branch: 'openmrs'
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
                    terraform apply -auto-approve
                """
            }
        } 
        // stage('k8s_vcs'){
        //     agent{
        //         label 'kubectl_agent'
        //     }
        //     steps{
        //         git url: 'https://github.com/tarunkumarpendem/openmrs-core.git',
        //             branch: 'openmrs'
        //     }
        // } 
        // stage('deploy'){
        //     agent{
        //         label 'kubectl_agent'
        //     } 
        //     steps{
        //         sh """
        //             cd Manifests
        //             kubectl apply -f .
        //         """  
        //     }  
        // }
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