pipeline {
    agent any
    stages {
        stage('clone') {
            steps {
                echo 'Start cloning from github ................................................'
                git branch: 'main', url: 'https://github.com/mazenn99/jenkins'
            }
        }
        stage('building') {
            steps {
                echo 'starting build from docker-compose.yml ...................................'
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: true])
            }
        }
//         stage('push') {
//             steps {
//                 echo 'push all service into container registry .................................'
//             }
//         }
//
//         stage('running') {
//             steps {
//                 echo 'running the container .........................................'
//
//             }
//         }
    }
}

