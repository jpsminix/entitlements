FROM registry.redhat.io/ubi7/ubi:latest

# Entitlement test
RUN rm /etc/rhsm-host
RUN yum search kernel-devel --showduplicates && \
    yum install -y kernel-devel && \
    yum install -y sudo

# Sudo access
RUN useradd -m test
RUN echo "test:1234" | chpasswd
RUN usermod -aG wheel test
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Maintain the pod alive
USER docker
CMD [ "/usr/bin/sleep","3600" ]