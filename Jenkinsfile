pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/koteshwar111/project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-web-app")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerImage.run("-p 8080:80")
                }
            }
        }
    }
}
