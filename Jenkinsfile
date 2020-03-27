pipeline{
  agent any
  stages{
    stage('Lint HTML'){
      steps{
        parallel(
          dir('blue'){
            sh 'tidy -q -e index.html'
		                 }
          dir('green'){
            sh 'tidy -q -e index.html'
                      }	
         ) }
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
}
