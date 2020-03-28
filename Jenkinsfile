pipeline{
  agent any
  environment {
    registry_brue = "dalpengholic/devops_capstone_blue"
    registry_green = "dalpengholic/devops_capstone_green"
    registryCredential = 'dockerhub'
    docker_tag = getDockerTag()

  }
  stages{
    stage('Lint HTML'){
      steps{
            sh 'tidy -q -e Blue/index.html'
            sh 'tidy -q -e Green/index.html'
      }
    }
    stage("Lint Dockerfile"){
      agent{
          docker{
              image 'hadolint/hadolint:latest-debian'
          }
        }
      steps {
          sh 'hadolint /Blue/Dockerfile.blue | tee -a hadolint_lint.txt'
          sh '''
              lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
              if [ "$lintErrors" -gt "0" ]; then
                  echo "Check Error"
                  cat hadolint_lint.txt
                  exit 1
              else
                  echo "No Error"
              fi
          '''
          sh 'hadolint /Green/Dockerfile.green | tee -a hadolint_lint.txt'
          sh '''
              lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
              if [ "$lintErrors" -gt "0" ]; then
                  echo "Check Error"
                  cat hadolint_lint.txt
                  exit 1
              else
                  echo "No Error"
              fi
          '''
          }
        }
    // stage('Build Docker Image'){
    //   steps{
    //     sh "docker build -f Blue/Dockerfile.blue Blue -t ${registry_brue}:${docker_tag}"
    //     sh "docker build -f Green/Dockerfile.green Green -t ${registry_green}:${docker_tag}"
    //   }
    stage('Build & Push Docker Image'){
      steps{
        script{
          def dockerBlue = 'Blue/Dockerfile.blue'
          def dockerGreen = 'Green/Dockerfile.green'
          dockerBlueImage = docker.build("${registry_brue}:${docker_tag}","-f ${dockerBlue} Blue")
          docker.withRegistry('', registryCredential) {
            dockerBlueImage.push()
          dockerGreenImage = docker.build("${registry_green}:${docker_tag}","-f ${dockerGreen} Green")
          docker.withRegistry('', registryCredential) {
            dockerGreenImage.push()
            }
          } 
        }
      }
    }
  }
}


def getDockerTag() {  
  def tag = sh script: 'git rev-parse --short=7 HEAD', returnStdout: true
  return tag
  }
