# docker-mule-example

DIY Docker container running Mule's container with their sample bookstore application running on RHEL 7. The bookstore app is documented here:
https://docs.mulesoft.com/mule-user-guide/v/3.3/bookstore-example

Prerequisites
-----------------------------

1. Red Hat Enterprise Linux (RHEL) requires a subscription. However, when building container, Red Hat Subscription Manager will defer to the host for the subscription. Building this Docker container requires it to be built on a subscribed RHEL Host. You can also defer to the host for the repositories, however I enabled them in the dockerfile with yum-config-manager

Run from DockerHub
-----------------------------

1. Type this command to run the docker image: 
        docker run -it -p 8888:8083 johnfosborneiii/docker-mule-example

2. The application will be running at the following URLs:
</br>
<http://localhost:8888/bookstore/>
</br>
<http://localhost:8888/bookstore-admin/>

Build and Deploy locally
-----------------------------

1. Open a command prompt and navigate to the this locally cloned github repo.

2. Type this command to build the docker image: 
        docker build -t=docker-mule-example . 
 
3. Type this command to run the docker image: 
        docker run -it -p 8888:8083 docker-mule-example 
 
4. The application will be running at the following URLs:
</br>
<http://localhost:8888/bookstore/>
</br>
<http://localhost:8888/bookstore-admin/>

Run on OpenShift
-----------------------------

1. oc new-app johnfosborneiii/docker-mule-example
