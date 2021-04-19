FROM debian
LABEL maintainer="andrew.lunde@sap.com"
LABEL distro="debian/10"
LABEL version="10"
#LABEL description="This is OpenSuSE the way I like it."

RUN apt-get update
RUN apt-get -y install openssh-server jq apt-rdepends git-core

RUN mkdir /var/run/sshd; chmod 755 /var/run/sshd
RUN mkdir /root/.ssh; chown root. /root/.ssh; chmod 700 /root/.ssh
RUN ssh-keygen -A

COPY id_rsa.pub /root/.ssh/authorized_keys

RUN useradd -m user -s /bin/bash

EXPOSE 22
