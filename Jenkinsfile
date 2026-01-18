pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'git@github.com:nikhilmustur/java-shopping-app.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t java-shopping-app:1.0 .'
            }
        }
    }
}




