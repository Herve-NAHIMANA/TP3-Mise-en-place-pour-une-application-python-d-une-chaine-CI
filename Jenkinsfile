pipeline {
    agent any
    /*environment{
        
    }*/
    stages {
        stage('Clone repository') {
            steps {
                git credentialsId: 'git', url: 'https://github.com/vanessakovalsky/python-api-handle-it'
            }
        }
       stage(test) {
           steps {
               sh 'tree'
           }
       }
    }
 }
