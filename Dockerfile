FROM registry.access.redhat.com/rhel7:latest
MAINTAINER John Osborne <johnfosborneiii@gmail.com>

RUN yum -y install yum-utils
RUN yum install yum-utils -y && yum clean all
RUN yum-config-manager --enable rhel-6-server-rpms rhel-server-rhscl-7-rpms rhel-6-server-supplementary-rpms &> /dev/null

RUN yum -y install java-1.8.0-openjdk-devel wget unzip tar update;yum clean all

ARG WORKDIR=/opt
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
RUN groupadd -r mule -g 1000 && useradd -u 1000 -r -g mule -m -d /home/mule -s /sbin/nologin -c "Mule user" mule 

# Set the working directory to jboss' user home directory
WORKDIR ${WORKDIR}
RUN wget https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.8.0/mule-standalone-3.8.0.tar.gz

# Copy the files I need
#COPY resources/mule-standalone-3.8.0.tar.gz .
COPY resources/mule-example-bookstore-3.3.1.zip .

#Set the ownership and permissions of the directory
RUN chmod 755 ${WORKDIR}
RUN chown mule:mule -R ${WORKDIR}

# Specify the user which should be used to execute all commands below
USER mule 
RUN tar xvzf mule-standalone-3.8.0.tar.gz
RUN rm mule-standalone-3.8.0.tar.gz
RUN ln -s /opt/mule-standalone-3.8.0 /opt/mule 

RUN mv mule-example-bookstore-3.3.1.zip /opt/mule/apps/

CMD [ "/opt/mule/bin/mule" ]
