FROM hashicorp/terraform:0.12.26
MAINTAINER David Kolb <david.kolb@coxautoinc.com>

ENV TERRAFORM_VERSION=0.12.26
ENV TF_ALKS_PROVIDER_VERSION=1.3.2

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

RUN wget -q -O /tmp/tfalks.tar.gz https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${TF_ALKS_PROVIDER_VERSION}/terraform-provider-alks-linux-amd64.tar.gz && \
    mkdir -p ~/.terraform.d/plugins/ && \
    tar -zxvf /tmp/tfalks.tar.gz -C ~/.terraform.d/plugins/ && \
    rm /tmp/tfalks.tar.gz && \
    chmod a+x ~/.terraform.d/plugins/terraform-provider-alks*

ENTRYPOINT ["terraform"]
CMD ["version"]
