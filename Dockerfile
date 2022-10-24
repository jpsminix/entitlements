FROM registry.redhat.io/ubi7/ubi:latest
RUN rm /etc/rhsm-host
RUN yum search kernel-devel --showduplicates && \
    yum install -y kernel-devel && \
    yum install -y sudo

# Sudo access
RUN useradd -m docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

USER docker
CMD [ "/usr/bin/sleep","3600" ]