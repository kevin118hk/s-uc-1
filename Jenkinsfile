node {
    def app

    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("dstubked/orders-nginx")
    }
    
    stage ('Aqua Scanner') {
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'dstubked/orders-nginx', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: true, registry: 'Docker Hub', showNegligible: false
    }
    stage('Push into Prod Registry') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            /* Push into prod namespace 
            sh "docker push dstubked-docker.jfrog.io/orders-nginx-prod:good" */
            app.push ("${env.BUILD_NUMBER}")
            app.push ("latest")
        }
    }
}
