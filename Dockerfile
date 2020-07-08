ARG TERRAFORM_VERSION

FROM hashicorp/terraform:$TERRAFORM_VERSION

# FROM wipes out the ARGs so you gotta redeclare it here.
ARG TERRAFORM_VERSION
ARG ALKS_VERSION


MAINTAINER David Kolb <david.kolb@coxautoinc.com>

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

RUN addgroup -g 1000 jenkins && \
      adduser -u 1000 -D -G jenkins -G wheel jenkins

RUN echo "Building using tf ${TERRAFORM_VERSION} and alks ${ALKS_VERSION}?" && \
    wget -q -O /tmp/tfalks.tar.gz https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${ALKS_VERSION}/terraform-provider-alks-linux-amd64.tar.gz && \
    tar -zxvf /tmp/tfalks.tar.gz -C /bin/ && \
    rm /tmp/tfalks.tar.gz && \
    chmod a+x /bin/terraform-provider-alks*

ENTRYPOINT ["terraform"]
CMD ["version"]

