pipeline {
    agent any

    environment {
        IMAGE_NAME = "capstone-webapp"
        CONTAINER_NAME = "capstone-prod"
        PROD_SERVER = "ubuntu@3.7.70.251"
    }

    stages {
        stage('job1-build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('job2-test') {
            steps {
                sh 'docker run -d --name test-$BUILD_NUMBER -p 8081:80 $IMAGE_NAME:$BUILD_NUMBER'
                sh 'sleep 5'
                sh 'curl -I http://localhost:8081'
                sh 'docker stop test-$BUILD_NUMBER'
                sh 'docker rm test-$BUILD_NUMBER'
            }
        }

        stage('job3-prod') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                docker save $IMAGE_NAME:$BUILD_NUMBER | ssh -o StrictHostKeyChecking=no $PROD_SERVER "docker load"
                ssh -o StrictHostKeyChecking=no $PROD_SERVER "docker stop $CONTAINER_NAME || true"
                ssh -o StrictHostKeyChecking=no $PROD_SERVER "docker rm $CONTAINER_NAME || true"
                ssh -o StrictHostKeyChecking=no $PROD_SERVER "docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME:$BUILD_NUMBER"
                '''
            }
        }
    }
}