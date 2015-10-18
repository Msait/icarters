FROM ubuntu:wily

MAINTAINER Kostiantyn Bondar

# USER root
# RUN apt-get update && apt-get upgrade -y && apt-get install wget -y

# install jdk
# RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz" \
# && tar -xzf jdk-8u60-linux-x64.tar.gz \
# && mkdir -p /usr/lib/jvm \
# && mv ./jdk1.8.0_60 /usr/lib/jvm \
# && update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_60/bin/java 0 \
# && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_60/bin/javac 0 \
# && update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.8.0_60/bin/javaws 0

# install jenkins
# COPY jenkins.list /etc/apt/sources.list.d/
# RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - \
# && echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list \
# && apt-get update \
# && apt-get install jenkins -y


# VOLUME ["/var/lib/jenkins/jobs","/var/lib/jenkins/plugins" ]

EXPOSE 8080
# RUN chown -R jenkins:jenkins /var/log/jenkins
# RUN chmod -R 666 /var/jenkins_home
# USER jenkins

# ENV JAVA_OPTS="-Xmx8192m"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"
