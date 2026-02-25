pipeline {
	agent any
	tools {
		jdk 'Java17'
		maven 'maven3'
	    }
    environment {
	    APP_NAME = "register-app-pipeline"
            RELEASE = "1.0.0"
            DOCKER_USER = "amoljadhav1997"
            DOCKER_PASS = 'dockerhub'
            IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
            IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }
	stages{
		stage("Cleanup Workspace"){
			steps {
				cleanWs()
			}
		}
		stage("Checkout from SCM"){
			steps {
				git branch: 'main', credentialsId: 'github', url: 'https://github.com/AmolJadhav97/register-app'
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
		stage("SonarQube Analysis"){
			steps {
				script {
					withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
						sh "mvn sonar:sonar"
					}
				}
			}
		}
		stage("Quality Gate"){
			steps {
				script  {
					waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
				}
			}
		}
		stage("Build and Push Docker image") {
		    steps {
		        script {
		            def versionedImage = "${IMAGE_NAME}:${IMAGE_TAG}"
		            def latestImage = "${IMAGE_NAME}:latest"
		
		            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
		
		                sh "docker build -t ${versionedImage} ."
		                sh "docker tag ${versionedImage} ${latestImage}"
		                sh "docker push ${versionedImage}"
		                sh "docker push ${latestImage}"
		            }
		        }
		    }
		}
		stage("Trivy Scan") {
			steps {
				script {
					sh ('docker run -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image amoljadhav1997/register-app-pipeline:latest --no-progress --scanners vuln  --exit-code 0 --severity HIGH,CRITICAL --format table')
				}
			}
		}
		stage ("Cleanup artifact") {
			steps {
				script {
					def versionedImage = "${IMAGE_NAME}:${IMAGE_TAG}"
		            def latestImage = "${IMAGE_NAME}:latest" 
					
		                sh "docker rmi ${versionedImage}"
		                sh "docker rmi ${latestImage}"
		            }
				}
			}
		stage("Trigger CD Pipeline") {
		    steps {
		        script {
		            sh """
		            curl -v -k --user admin:${JENKINS_API_TOKEN} \
		            -X POST \
		            -H 'cache-control: no-cache' \
		            -H 'content-type: application/x-www-form-urlencoded' \
		            --data 'IMAGE_TAG=${IMAGE_TAG}' \
		            'http://localhost:8080/job/register-app-cd/buildWithParameters?token=gitops-token'
		            """
		        }
		    }
		}
	}
}
