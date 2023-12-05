FROM tomcat:8
MAINTAINER RSI3
COPY $(Build.SourcesDirectory)/webapp/target/webapp.war  /usr/local/tomcat/webapps
