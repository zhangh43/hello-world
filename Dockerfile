FROM centos:centos6

## Install some basic utilities and build tools
RUN yum -y install epel-release && yum -y update && \
    yum -y install createrepo httpd openssh-server perl rsync rpm-build sudo vim wget && \
    yum -y install gcc-c++ git python-setuptools python-devel java-1.7.0-openjdk-devel && \
    yum -y install https://s3-us-west-2.amazonaws.com/pivotal-public/apache-maven-3.3.9-1.el6.noarch.rpm && \
    yum clean all

## Set the ENV variables
ENV JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64 \
    M2_HOME=/usr/share/apache-maven \
    MAVEN_OPTS="-Xmx2048m"
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$M2_HOME/bin:$JAVA_HOME/bin
