FROM hashicorp/terraform:0.12.26
MAINTAINER David Kolb <david.kolb@coxautoinc.com>

ENV TERRAFORM_VERSION=0.12.26
ENV TF_ALKS_PROVIDER_VERSION=1.3.4

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

RUN wget -q -O /tmp/tfalks.tar.gz https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${TF_ALKS_PROVIDER_VERSION}/terraform-provider-alks-linux-amd64.tar.gz && \
    tar -zxvf /tmp/tfalks.tar.gz -C /bin/ && \
    rm /tmp/tfalks.tar.gz && \
    chmod a+x /bin/terraform-provider-alks*

ENTRYPOINT ["terraform"]
CMD ["version"]
