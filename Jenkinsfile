pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "yassineamri/test-image"
    DOCKERHUB_USERNAME = credentials('dockerhub-username')
    DOCKERHUB_PASSWORD = credentials('dockerhub-password')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/yassineamri722/jenkines_test.git'
      }
    }

    stage('Build Image') {
      steps {
        sh "docker build -t ${DOCKER_IMAGE}:latest ."
      }
    }

    stage('Login & Push') {
      steps {
        sh "echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin"
        sh "docker push ${DOCKER_IMAGE}:latest"
      }
    }

    stage('Pull & Run') {
      steps {
        sh "docker pull ${DOCKER_IMAGE}:latest"
        sh "docker run --rm ${DOCKER_IMAGE}:latest"
      }
    }
  }
}
