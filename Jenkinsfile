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
			sh 'docker tag jenkins-demo:${BUILD_NUMBER} jenkins-demo:latest'
			sh 'docker tag jenkins-demo:${BUILD_NUMBER} 192.168.0.173:32138/jenkins-demo:latest '
			sh 'docker push 192.168.0.173:32138/jenkins-demo:latest'

			variables = [ "job": currentBuild.rawBuild.getFullDisplayName() ]
template = libraryResource('report.txt.groovy')
output = helpers.renderTemplate(template, variables)

sh 'echo ''{output}'''
			
	}
}




stage('Kube'){
	input{
	message "continue to prod?"
	}
	steps{
	sh 'ls'
	sh 'cat dpl.yaml'
	sh 'kubectl apply -f dpl.yaml'

	}
}



}
}