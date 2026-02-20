pipeline {
	agent {label 'docker-agent'}
	tools {
		jdk 'Java17'
		maven 'maven3'
	}
	stages{
		stage("Cleanup Workspace"){
			steps {
				cleanWs()
			}
		}
		stage("Checkout from SCM"){
			steps {
				git branch: 'main', credentialsID: 'github', url: 'https://github.com/AmolJadhav97/register-app'
			}
		}
		stage("Build Application"){
			steps {
				sh "mvn clean package"
			}
		}
		stage("Test Application"){
			steps {
				sh "mvn test"
			}
		}
			
	}
}
