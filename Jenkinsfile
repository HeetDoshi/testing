pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-html-app"
        CONTAINER_NAME = "web-container"
        PORT = "4000"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Lint') {
            steps {
                script {
                    echo "Checking HTML syntax..."
                    // Using a simple find command to ensure index.html exists
                    sh "test -f index.html || (echo 'Error: index.html missing'; exit 1)"
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo "Building Docker Image..."
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running Container Sanity Test..."
                    // Start a temporary container to check if Nginx starts
                    sh "docker run -d --name test-container ${IMAGE_NAME}:latest"
                    sleep 5
                    sh "docker exec test-container nginx -t"
                    sh "docker rm -f test-container"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying to Local Environment..."
                    // Remove old container if it exists
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    // Run the new container
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful! Access at http://your-ec2-ip:${PORT}"
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
    }
}
