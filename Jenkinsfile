pipeline{
  agent any
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
  stage ("lint dockerfile") {
    agent {
        docker {
            image 'hadolint/hadolint:latest-debian'
        }
    }
    steps {
        sh 'hadolint Dockerfile | tee -a hadolint_lint.txt'
    }
    post {
        always {
            archiveArtifacts 'hadolint_lint.txt'
        }
    }
}  
    // stage('Lint Dockerfile'){
    //   steps{
    //     script{
    //       docker.image('hadolint/hadolint:latest-debian').inside(){
    //         sh 'hadolint ./Dockerfile | tee -a hadolint_lint.txt'
    //         sh '''
    //            lintErrors=$(stat --printf="%s"  hadolint_lint.txt)

    //           '''
    //               }
    //             }
    //         }
    //     }

     stage('Upload to AWS'){
        steps{
          withAWS(region:'us-west-2',credentials:'aws-static'){
            s3Upload(file:'index.html', bucket:'this-is-really-unique-name-bucket', path:'index.html')
          }
        }
     }
  }
}

