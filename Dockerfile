ARG TERRAFORM_VERSION=0.12.26

FROM hashicorp/terraform:$TERRAFORM_VERSION

ENV TERRAFORM_VERSION=$TERRAFORM_VERSION
ENV TF_ALKS_PROVIDER_VERSION=1.3.4
MAINTAINER David Kolb <david.kolb@coxautoinc.com>

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

RUN addgroup -g 1000 jenkins && \
      adduser -u 1000 -D -G jenkins -G wheel jenkins

RUN wget -q -O /tmp/tfalks.tar.gz https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${TF_ALKS_PROVIDER_VERSION}/terraform-provider-alks-linux-amd64.tar.gz && \
    tar -zxvf /tmp/tfalks.tar.gz -C /bin/ && \
    rm /tmp/tfalks.tar.gz && \
    chmod a+x /bin/terraform-provider-alks*

ENTRYPOINT ["terraform"]
CMD ["version"]
