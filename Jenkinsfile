pipeline {
/*
      environment {
        imagename = "nahimana/my-image-python"
        registryCredential = 'docker'
      }
*/
      agent any
      options {
        skipStagesAfterUnstable()
    }
    environment {
          DOCKER_ACCOUNT = credentials('docker')
          imagename = "hizzo/my-image-python"
        }
      stages {
        stage('Clone sources') {
            steps {
                git branch: 'main', url:'https://github.com/Herve-NAHIMANA/TP3-Mise-en-place-pour-une-application-python-d-une-chaine-CI.git'
            }
        }
        stage('Prerequis') { // Compile and do unit testing
             steps {
                sh 'cd ./app'
                sh 'apt update'
                sh 'apt install -y python3'
                sh 'apt install -y python3-pip'
                sh 'apt install -y python3.8-venv'
                sh 'python3 -m venv venv'                  // Créer l'environnement virtuel
                sh '. venv/bin/activate'
                sh 'pip install pylint --break-system-packages'
                sh 'pip install pylint-json2html --break-system-packages'
                sh 'pip install radon --break-system-packages'
                sh 'pip install json2tree --break-system-packages'
                sh 'pip install html-testRunner --break-system-packages'
                sh ' if [ ! -d "./app/reports" ]; then mkdir ./app/reports/; fi'
           }
      }
      stage('linter'){
        steps {
            sh 'if [ ! -d "./app/reports/pylint" ]; then  mkdir ./app/reports/pylint; fi'
            sh 'pylint ./app/ --output-format=json:./app/reports/pylint/report.json || exit 0'
            sh 'pylint-json2html -o ./app/reports/pylint/report.html ./app/reports/pylint/report.json'
        }
      }
      stage('Verification des copier-coller'){
        steps {
            sh 'if [ ! -d "./app/reports/raw" ]; then mkdir ./app/reports/raw/ ; fi'
            sh 'radon raw  -j ./app/ > ./app/reports/raw/report.json'
            sh 'json2tree -j ./app/reports/raw/report.json -o ./app/reports/raw/report.html'
        }
      }
      stage('Analyse de la complexité cyclomatique'){
        steps {
          sh 'if [ ! -d "./app/reports/cc" ]; then mkdir ./app/reports/cc/ ; fi'
          sh 'radon cc -j ./app/ > ./app/reports/cc/report.json'
          sh 'json2tree -j ./app/reports/cc/report.json -o ./app/reports/cc/report.html -t 1'
        }
      }
      stage('Test unitaire'){
        steps{
          sh 'python3 -m unittest ./app/test/unit/test.py || exit 0'
        }
      }
      stage('Build Images'){
        steps{
          script {
                    //dockerImage = docker.build("herve/mypythonapp:latest", "-f docker-app/python/Dockerfile .")
                    sh 'docker build --no-cache -t $imagename:latest ./app/'
                }
        }
      }
      stage('login'){
        steps{
          sh 'echo $DOCKER_ACCOUNT_PSW | docker login -u $DOCKER_ACCOUNT_USR --password-stdin'
        }
      }
      stage('Push Images'){
         steps {
                script {
                    sh 'docker push $imagename:latest'
                }
            }
      }
 }
 post {
  always {
    sh 'docker logout'
  }
 }
}
