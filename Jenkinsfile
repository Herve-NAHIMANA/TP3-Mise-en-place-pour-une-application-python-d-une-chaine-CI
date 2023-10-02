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
                sh 'apt install -y python3'
                sh 'apt install -y python3-pip'
                sh 'apt install -y python3.11-venv'
                sh 'python3 -m venv venv'                  // Créer l'environnement virtuel
                sh '. venv/bin/activate'
                sh 'python3 -m pip install pylint'
           }    
      }
 }
}
