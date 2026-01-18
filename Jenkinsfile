pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/nikhilkohlide/java-shopping-app'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t java-shopping-app:1.0 .'
            }
        }
    }
}




