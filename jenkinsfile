pipeline{
  agent any
  stages{
    stage('Lint HTML'){
			steps{
				sh 'tidy -q -e *.html'
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
