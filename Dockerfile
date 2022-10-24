FROM registry.redhat.io/ubi7/ubi:latest
RUN rm /etc/rhsm-host
RUN yum search kernel-devel --showduplicates && \
    yum install -y kernel-devel && \
    yum install -y sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
CMD [ "/usr/bin/sleep","3600" ]