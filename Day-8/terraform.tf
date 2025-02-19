pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/pravallika-star/terraform-zero-to-hero.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                sh 'terraform --version'
            }
        }

        stage('Initialize Terraform') {
            steps {
                withAWS(credentials: 'aws-cred', region: "${AWS_REGION}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'aws-cred', region: "${AWS_REGION}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'aws-cred', region: "${AWS_REGION}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
