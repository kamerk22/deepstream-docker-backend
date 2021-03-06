# Pull base image.
FROM centos:7

MAINTAINER Kashyap Merai | kashyapk62@gmail.com

# Clean and Install wget
RUN yum clean all
RUN yum install -y wget

RUN wget https://bintray.com/deepstreamio/rpm/rpm -O /etc/yum.repos.d/bintray-deepstreamio-rpm.repo

 # Insttall Deepstream.io
RUN yum install -y deepstream.io-2.3.2-1

# Installing Plugins
RUN deepstream install storage rethinkdb && \
    deepstream install cache redis && \
    deepstream install msg redis

# Set Workdir
WORKDIR /etc/deepstream


# Remove Old files and add new /conf files
RUN rm config.yml permissions.yml users.yml
ADD ./conf ./

# Expose Port 
EXPOSE 6020
EXPOSE 6021

# Define default command.
CMD [ "deepstream" ]