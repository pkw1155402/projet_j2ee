node {
  
    stage('Clone') {
        git credentialsId: 'jenkins', url: 'https://github.com/EmnaNet/projet_j2ee.git'

    }
    stage('SonarQube analysis') {
        withSonarQubeEnv {
            def mavenHome = tool name: "Maven", type: "maven"
            def mavenCMD = "${mavenHome}/bin/mvn"
            sh "${mavenCMD} clean package sonar:sonar"
        }
    }

    stage('Quality Gate') {
        waitForQualityGate abortPipeline: true

    }
    stage('Build') {
        def mavenHome = tool name: "Maven", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    
    stage('deploy')
        deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '', url: 'http://localhost:8080/')], contextPath: null, war: '**/*.war'
    

}
