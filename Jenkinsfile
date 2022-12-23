pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git credentialsId: 'GitCredentials', url: 'https://github.com/rajeshkit/customer-service-repo.git'
                bat 'mvn clean install'
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
                bat 'docker run --name customer-service-container --network customer-mysql-network -itd -p 8181:9001 9894851315/customer-service'
                bat 'docker run -d --name mysqldbcontainer --network customer-mysql-network -e MYSQL_DATABASE=customerdb -e MYSQL_ROOT_PASSWORD=root@123 mysql'
              
                echo 'docker container is created'
            }
        }
    }
}