pipeline {
    agent any

    environment {
        IMAGE_NAME = "nikhil1n/java-shopping-app"
        IMAGE_TAG  = "1.0.${BUILD_NUMBER}"
        DOCKERHUB_CREDS = "dckr_pat_DTkzV64j64faOG2gMSWhVNx5INc"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build & Unit Test') {
            steps {
                sh '''
                  mvn clean test
                '''
            }
        }

        stage('Package Artifact') {
            steps {
                sh '''
                  mvn clean package -DskipTests
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Image Security Scan') {
            steps {
                sh '''
                  trivy image $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDS,
                                                 usernameVariable: 'DOCKER_USER',
                                                 passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                      echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                  docker push $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }

    post {
        success {
            echo "CI completed: $IMAGE_NAME:$IMAGE_TAG"
        }
        failure {
            echo "CI failed"
        }
    }
}

