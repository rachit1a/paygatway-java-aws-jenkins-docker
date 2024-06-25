pipeline{
    agent any
    tools{
        maven 'MAVEN3'
    }
    stages{
        stage('Checkout Code from GIT'){
            steps{
                git branch: 'main', credentialsId: 'GIT-Creds', url: 'https://github.com/Aravind-pendyala24/MySpringbootapp.git'
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
                    sh 'docker build -t aravinduser12/simpleapp .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]){
                        sh 'docker login -u aravinduser12 -p ${dockerpwd}'
                        sh 'docker push aravinduser12/simpleapp'
                    }
                }
            }
        }
    }
}
