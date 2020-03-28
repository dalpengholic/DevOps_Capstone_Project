pipeline{
  agent any
  environment {
    registry = "dalpengholic/devops_capstone_project"
    registryCredential = 'dockerhub'
    docker_tag = getDockerTag()
  }
  stages{
    stage('Lint HTML'){
      steps{
          dir('Blue'){
            sh 'tidy -q -e index.html'
		                 }
          dir('Green'){
            sh 'tidy -q -e index.html'}
      }
    }
    stage ("Lint Dockerfile") {
      agent {
          docker {
              image 'hadolint/hadolint:latest-debian'
          }
        }
      steps {
          sh 'hadolint Dockerfile | tee -a hadolint_lint.txt'
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
    stage('Build Docker Image'){
      steps{
        sh "docker build . -t ${registry}:${docker_tag}"
      }
    }  
  }
}
def getDockerTag() {  
  def tag = sh script: 'git rev-parse --short=8 HEAD', returnStdout: true
  return tag
  }
