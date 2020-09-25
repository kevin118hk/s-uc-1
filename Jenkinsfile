node {
    def app

    stage('Clone repository') {
        /* Clone repository to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("orders-nginx:1.0")
    }
    
    stage ('Aqua Scanner') {
        aqua customFlags: '--layer-vulnerabilities', hideBase: false, hostedImage: '', localImage: 'orders-nginx:1.0', locationType: 'local', notCompliesCmd: '', onDisallowed: 'fail', policies: '', register: false, registry: '', showNegligible: false
    }
}
