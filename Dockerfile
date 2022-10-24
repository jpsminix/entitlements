FROM registry.redhat.io/ubi8/ubi:latest

# Entitlement test
RUN rm /etc/rhsm-host
RUN dnf search kernel-devel --showduplicates && \
    dnf install -y kernel-devel && \

# Maintain the pod alive
CMD [ "/usr/bin/sleep","3600" ]