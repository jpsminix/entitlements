FROM registry.redhat.io/ubi8/ubi:latest

# Entitlement test
RUN rm /etc/rhsm-host
RUN DNF search kernel-devel --showduplicates && \
    DNF install -y kernel-devel && \

# Maintain the pod alive
CMD [ "/usr/bin/sleep","3600" ]