pipeline {

      environment {
        imagename = "nahimana/my-image-python"
        registryCredential = 'docker'
      }

      agent any
      stages {
        stage('Clone sources') {
            steps {
                git url: 'https://github.com/vanessakovalsky/python-api-handle-it.git'
            }
        }
        stage('continuous integration') { // Compile and do unit testing
             tools {
               Gradle 'installGradle'
             }
             steps {
                 parallel (
                 // run Gradle to execute compile and unit testing
                    pylint: {
                        sh 'gradle lint'
                    },
                    pycode: {
                        sh 'gradle pycode'
                    }
                )
             }
           }    
      }
 }
