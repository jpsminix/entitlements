FROM registry.redhat.io/ubi8/ubi:latest
RUN dnf search kernel-devel --showduplicates && \
    dnf install -y kernel-devel
CMD [ "/usr/bin/sleep 3600" ]