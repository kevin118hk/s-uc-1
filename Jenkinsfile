node {
    def app

    stage('Initialize'){
        def dockerHome = tool 'docker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
        sh "gpasswd -a jenkins docker"

    }    
    
    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }
     stage('Scan Source Code') {
        /* Clone repository to our workspace */

        sh "echo 'Code Scan in Progress'"
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("dstubked/orders-nginx:${env.BUILD_NUMBER}").withRun('--privileged -v /var/run/docker.sock:/var/run/docker.sock')
    }
    
    stage ('Aqua Scanner') {
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: 'dstubked/orders-nginx:60', localImage: '', locationType: 'hosted', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: true, registry: 'Docker Hub', showNegligible: false
    }
    /*stage ('Aqua Scanner') {
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'dstubked/orders-nginx:$BUILD_NUMBER', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: true, registry: 'Docker Hub', showNegligible: false
    }*/
    stage('Push into Prod Registry') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            /* Push into prod namespace
            app.push ("latest")
            sh "docker push dstubked-docker.jfrog.io/orders-nginx-prod:good" */
            app.push ("${env.BUILD_NUMBER}")
        }
    }
}
