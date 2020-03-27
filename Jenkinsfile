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
    stage('Lint Dockerfile'){
      steps{
        sh 'hadolint Dockerfile'
      }
    }

     stage('Upload to AWS'){
        steps{
          withAWS(region:'us-west-2',credentials:'aws-static'){
            s3Upload(file:'index.html', bucket:'this-is-really-unique-name-bucket', path:'index.html')
          }
        }
     }
  }
}

