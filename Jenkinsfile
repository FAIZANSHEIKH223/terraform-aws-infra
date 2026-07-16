pipeline {

    agent any

    parameters {

        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'qa', 'prod'],
            description: 'Select Environment'
        )
    }

    environment {

        AWS_DEFAULT_REGION = "ap-south-1"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }
        }

        stage('Terraform Version') {

            steps {

                sh 'terraform version'

            }
        }

        stage('Terraform Format') {

            steps {

                sh 'terraform fmt -recursive -check'

            }
        }

        stage('Terraform Init') {

            steps {

                sh 'terraform init'

            }
        }

        stage('Terraform Validate') {

            steps {

                sh 'terraform validate'

            }
        }

        stage('Terraform Plan') {

            steps {

                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-creds'
                    ]
                ]) {

                    sh """
                    terraform plan \
                    -var-file=environments/${ENVIRONMENT}/terraform.tfvars
                    """

                }
            }
        }

        stage('Approval') {

            steps {

                input "Apply Terraform?"

            }
        }

        stage('Terraform Apply') {

            steps {

                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-creds'
                    ]
                ]) {

                    sh """
                    terraform apply \
                    -auto-approve \
                    -var-file=environments/${ENVIRONMENT}/terraform.tfvars
                    """

                }
            }
        }

    }

}
