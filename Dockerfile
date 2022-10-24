FROM registry.redhat.io/ubi7/ubi:latest
RUN rm /etc/rhsm-host
RUN yum search kernel-devel --showduplicates && \
    yum install -y kernel-devel
CMD [ "/usr/bin/sleep 3600" ]