pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git credentialsId: 'GitCredentials', url: 'https://github.com/rajeshkit/customer-service-repo.git'
                bat 'mvn clean install -DskipTests=true'
                echo 'build is done'
            }
        }
        stage('docker image'){
            steps{
                bat 'docker build -t 9894851315/customer-service .'
                echo 'docker image is created'
            }
        }
        stage('docker deploy'){
            steps{
                bat 'docker container rm -f customer-service-container'
                bat 'docker run --name customer-service-container --network customerservicenetwork -itd -p 8282:9001 9894851315/customer-service'
                echo 'docker container is created'
                echo 'docker container is running'
            }
        }
    }
}