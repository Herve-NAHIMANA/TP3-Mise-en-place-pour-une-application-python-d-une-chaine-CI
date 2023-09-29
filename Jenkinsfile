pipeline {
/*
      environment {
        imagename = "nahimana/my-image-python"
        registryCredential = 'docker'
      }
*/
      agent any
      stages {
        stage('Clone sources') {
            steps {
                git url: 'https://github.com/vanessakovalsky/python-api-handle-it.git'
            }
        }
        stage('continuous integration') { // Compile and do unit testing
             steps {
                sh 'cd ./app'
                sh 'apt update'
                sh 'apt install python3'
                sh 'apt install -y python3-pip'
                sh 'pip install pylint'
           }    
      }
 }
}
