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
        stage('Prerequis') { // Compile and do unit testing
             steps {
                sh 'cd ./app'
                sh 'apt update'
                sh 'apt install -y python3'
                sh 'apt install -y python3-pip'
                sh 'apt install -y python3.11-venv'
                sh 'python3 -m venv venv'                  // Créer l'environnement virtuel
                sh '. venv/bin/activate'
                sh 'pip install pylint --break-system-packages'
                sh 'pip install pylint-json2html --break-system-packages'
                sh 'pip install radon --break-system-packages'
                sh 'pip install robotframework --break-system-packages'
                sh 'pip install robotframework-requests --break-system-packages'
                sh 'pip install json2tree --break-system-packages'
                sh 'pip install html-testRunner --break-system-packages'
           }
      }
      stage('linter'){
        steps {
            sh 'mkdir ./app/reports/'
            sh 'mkdir ./app/reports/pylint'
            sh 'pylint ./app/ || exit 0'
            sh 'pylint-json2html -o ./app/reports/pylint/report.html ./app/reports/pylint/report.json'
        }
      }
      stage('Verification des copier-coller'){
        steps {
            /* sh 'mkdir ./app/reports' */
            /* sh 'mkdir ./app/reports/pylint' */
            sh 'radon raw ./app/'
            /* sh 'pylint-json2html -o ./app/reports/pylint/report.html ./app/reports/pylint/report.json' */
        }
      }
      stage('Analyse de la complexité cyclomatique'){
        steps {
          sh 'radon cc ./app/'
        }
      }
      stage('Test unitaire'){
        steps{
          sh 'python3 -m unittest ./app/test/unit/test.py || exit 0'
        }
      }
      stage('Build Images'){
        steps{
          sh 'echo build images docker de l\'app'
        }
      }
 }
}
