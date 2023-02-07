pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('vcs') {
            steps {
                git branch: 'main', url: 'https://github.com/Pkvaram9909/ecs-for-mee.git'
            }
        }
        stage('create terraform infrastructre') {
            steps {
                sh 'terraform init && terraform plan && terraform apply -auto-approve'
            }
        }
    }
}
