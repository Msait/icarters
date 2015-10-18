#! /bin/bash

apt-get update && apt-get upgrade -y && apt-get install wget -y

# install java 8
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz" \
&& tar -xzf jdk-8u60-linux-x64.tar.gz \
&& mkdir -p /usr/lib/jvm \
&& mv ./jdk1.8.0_60 /usr/lib/jvm \
&& update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_60/bin/java 0 \
&& update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_60/bin/javac 0 \
&& update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.8.0_60/bin/javaws 0

# maybe maven will also usefull here?

# install jenkins
cp /vagrant/home/provision/jenkins/jenkins.list /etc/apt/sources.list.d/
# echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - \
&& apt-get update \
&& apt-get install jenkins -y

# setup port
cp -f /vagrant/home/provision/jenkins/jenkins /etc/default/
# restore data
cp -f -r /vagrant/home/provision/jenkins/jobs /var/lib/jenkins/jobs
cp -f -r /vagrant/home/provision/jenkins/plugins /var/lib/jenkins/jobs/plugins
cp -f -r /vagrant/home/provision/jenkins/userContent /var/lib/jenkins/jobs/userContent

service jenkins restart