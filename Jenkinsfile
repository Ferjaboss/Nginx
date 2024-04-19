def node = '18'
pipeline {
    agent any
    environment {
        scannerHome = tool 'Sonar';
    }
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage ('Unit Test') {
            steps {
                sh 'echo "Unit Test"'
            }
        }
        stage('SonarQube analysis') {
            steps {
                script {
                    sh '''
                    ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=tunartisan -Dsonar.java.binaries=. -Dsonar.host.url=http://master:9000 -Dsonar.login=squ_a918939eb419f31cbdd274d2d03830fa34d3ee8c
                    '''
                }
            }
        }
        stage ('Build Artefact') {
            steps {
                sh 'npm run build'
            }
        }
        
        stage ('Build Docker Image') {
            steps {
                sh 'docker build -t angular:1.0 .'
            }
        }
        stage ('Push Docker Image to Nexus') {
            steps {
                sh 'docker login -u devops -p devops http://master:9001'
                sh 'docker tag angular:1.0 master:9001/angular:1'
                sh 'docker push master:9001/angular:1'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                    sh 'kubectl apply -f Deployment.yaml'
                    }
        }
    }
}
