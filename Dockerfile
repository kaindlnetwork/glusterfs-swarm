FROM lsiobase/ubuntu:jammy

MAINTAINER Fabian Kaindl <gitlab-docker@fabiankaindl.de>

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

# Dependencies for installing PPA repository and packages
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    wget \
    tzdata && rm -rf /var/lib/apt/lists/*    

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Add Current Glusterfs repository
RUN wget -O - https://download.gluster.org/pub/gluster/glusterfs/9/rsa.pub | apt-key add -


RUN apt-get update && \
    apt-get install -y glusterfs-server && rm -rf /var/lib/apt/lists/*

COPY /root /

#VOLUME $MEDIA_DIR
EXPOSE 24007-24008
