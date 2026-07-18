pipeline {

    agent any

    options {
        timestamps()
        ansiColor('xterm')
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'qa', 'prod'],
            description: 'Select Terraform Environment'
        )
    }

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
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

                sh """
                terraform init \
                -reconfigure \
                -backend-config=backend-${ENVIRONMENT}.conf
                """

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
                    -out=tfplan \
                    -var-file=environments/${ENVIRONMENT}/terraform.tfvars
                    """
                }
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: 'tfplan', fingerprint: true
            }
        }

        stage('Approval') {
            when {
                expression {
                    params.ENVIRONMENT == 'qa' || params.ENVIRONMENT == 'prod'
                }
            }

            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    input message: "Approve Terraform Apply for ${params.ENVIRONMENT}?"
                }
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

                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Terraform Output') {
            steps {
                sh 'terraform output'
            }
        }

    }

    post {

        success {
            echo 'Terraform deployment completed successfully.'
        }

        failure {
            echo 'Terraform deployment failed.'
        }

        always {
            cleanWs()
        }
    }
}
