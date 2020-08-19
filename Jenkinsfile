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
			
	}
}




stage('Checkout'){
steps{



kubernetesDeploy configs: 'dpl.yaml', kubeConfig: [path: ''], kubeconfigId: 'mykubeconfig', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']

}
}



}
}