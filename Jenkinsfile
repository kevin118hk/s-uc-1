node {
    def app

    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("dstubked-docker.jfrog.io/orders-nginx:1")
    }
    
    stage ('Aqua Scanner') {
        sh "pwd"
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'dstubked-docker.jfrog.io/orders-nginx:1', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: false, registry: '', showNegligible: false
    }
