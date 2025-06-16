pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "yassineamri/test-image"
  }

  stages {
    stage('Build Image') {
      steps {
        sh "docker build -t ${DOCKER_IMAGE}:latest ."
      }
    }

    stage('Login & Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh "echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin"
          sh "docker push ${DOCKER_IMAGE}:latest"
        }
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
