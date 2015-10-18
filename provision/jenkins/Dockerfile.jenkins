FROM jenkins

MAINTAINER Kostiantyn Bondar

USER root
RUN mkdir /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chmod -R 666 /var/jenkins_home
USER jenkins

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"
