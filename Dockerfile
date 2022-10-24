FROM registry.redhat.io/ubi7/ubi:latest
RUN rm /etc/rhsm-host
RUN dnf search kernel-devel --showduplicates && \
    dnf install -y kernel-devel
CMD [ "/usr/bin/sleep 3600" ]