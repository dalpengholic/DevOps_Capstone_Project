pipeline{
  agent any
  environment {
    registryBrue = "dalpengholic/devops_capstone_blue"
    registryGreen = "dalpengholic/devops_capstone_green"
    registryCredential = 'dockerhub'
    dockertag = getDockerTag()
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
    stage('Build Docker Image'){
      steps{
        sh "docker build -f Blue/Dockerfile.blue Blue -t ${registryBrue}:${dockertag}"
        sh "docker build -f Green/Dockerfile.green Green -t ${registryGreen}:${dockertag}"
      }
    }
    stage('Push Docker Image'){
      steps{
        script{
          docker.withRegistry('', registryCredential) {
            sh "docker push ${registryBrue}:${dockertag}"
            sh "docker tag ${registryBrue}:${dockertag} ${registryBrue}:latest"
            sh "docker push ${registryBrue}:latest"
            sh "docker push ${registryGreen}:${dockertag}"
            sh "docker tag ${registryGreen}:${dockertag} ${registryGreen}:latest"
            sh "docker push ${registryGreen}:latest"
          }
        }
      }
    }

    stage('Deploying to EKS'){
      steps{
        withAWS(credentials: 'aws-creds', region: 'us-west-2') {
          sh "aws eks --region us-west-2 update-kubeconfig --name Capstone"
          sh "kubectl apply -f myapp-blue.yml"
          sh "kubectl apply -f myapp-green.yml"
        }
      }
    }
  }    
}


def getDockerTag() {  
  def tag = sh script: 'git rev-parse --short=7 HEAD', returnStdout: true
  return tag.trim()
  }
