pipeline {
    agent any
    /*environment{
        
    }*/
    stages {
        /*stage(list){
            steps{
                sh '$GCLOUD_PATH auth activate-service-account --key-file /var/cache/jenkins/gcp-jenkins-project.json'
            }
        }*/
       stage(test) {
           steps {
               sh 'terraform init'
               sh 'terraform plan'
           }
       }
    }
 }