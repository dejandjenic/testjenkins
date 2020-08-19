pipeline{
agent { label 'docker-agent' }
stages{

stage('Checkout'){
steps{
        
		git 'https://github.com/dejandjenic/testjenkins.git'
}
}


stage('Build'){
steps{
        
		sh 'docker build -t jenkins-demo:${BUILD_NUMBER} . '
}
}



}
}