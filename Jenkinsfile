pipeline{
agent { label 'my-defined-label' }
stages{
stage('Build'){
steps{
        
		sh 'docker build -t jenkins-demo:${BUILD_NUMBER} . '
}
}
}
}