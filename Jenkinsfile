pipeline{
    agent any
    stages {
        stage('download'){
            steps{
                git branch: '$BRANCH', credentialsId: 'GitUserPass', url: 'https://github.com/luishernandez25/easyTest'
            }
        }
        stage('test'){
            steps{
                script{
                    sh "mvn test"
                }
            }
        }
    }
}