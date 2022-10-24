FROM registry.redhat.io/ubi7/ubi:latest

# Sudo access
RUN useradd -m docker
RUN echo "1234:1234" | chpasswd
RUN usermod -G sudo docker

# Entitlement test
RUN rm /etc/rhsm-host
RUN yum search kernel-devel --showduplicates && \
    yum install -y kernel-devel && \
    yum install -y sudo

# Maintain the pod alive
USER docker
CMD [ "/usr/bin/sleep","3600" ]