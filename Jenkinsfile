pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-web-app'
        CONTAINER_PORT = '8080'
        IMAGE_PORT = '80'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Repository cloned automatically by Jenkins."
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    if (isUnix()) {
                        sh "docker build -t ${IMAGE_NAME} ."
                    } else {
                        bat "docker build -t ${IMAGE_NAME} ."
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container, if any
                    try {
                        if (isUnix()) {
                            sh "docker stop ${IMAGE_NAME} || true"
                            sh "docker rm ${IMAGE_NAME} || true"
                        } else {
                            bat "docker stop ${IMAGE_NAME} || true"
                            bat "docker rm ${IMAGE_NAME} || true"
                        }
                    } catch (Exception e) {
                        echo "No existing container to stop."
                    }

                    // Run Docker container
                    if (isUnix()) {
                        sh "docker run -d -p ${CONTAINER_PORT}:${IMAGE_PORT} --name ${IMAGE_NAME} ${IMAGE_NAME}"
                    } else {
                        bat "docker run -d -p ${CONTAINER_PORT}:${IMAGE_PORT} --name ${IMAGE_NAME} ${IMAGE_NAME}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Docker container '${IMAGE_NAME}' is running on port ${CONTAINER_PORT}."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
