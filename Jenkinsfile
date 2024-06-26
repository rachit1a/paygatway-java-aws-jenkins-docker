pipeline{
    agent any
    tools{
        maven 'MAVEN3'
    }
    stages{
        stage('Checkout Code from GIT'){
            steps{
                git branch: 'main', credentialsId: 'GIT-Creds', url: 'https://github.com/rachit1a/paygatway-java-aws-jenkins-docker.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t rachit01/paygetway .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]){
                        sh 'docker login -u rachit1a -p ${dockerpwd}'
                        sh 'docker push rachit01/paygetway'
                    }
                }
            }
        }
    }
}
