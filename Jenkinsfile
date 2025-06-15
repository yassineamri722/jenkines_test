pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "yassineamri/test-image"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/yassineamri722/jenkines_test.git'
      }
    }

    stage('Build Image') {
      steps {
        script {
          docker.build("${DOCKER_IMAGE}:latest")
        }
      }
    }

    stage('Login & Push') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-user') {
            docker.image("${DOCKER_IMAGE}:latest").push()
          }
        }
      }
    }

    stage('Pull & Run') {
      steps {
        script {
          sh "docker pull ${DOCKER_IMAGE}:latest"
          sh "docker run --rm ${DOCKER_IMAGE}:latest"
        }
      }
    }
  }
}
