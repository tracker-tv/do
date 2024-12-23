FROM ubuntu:22.04 AS builder

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl

RUN curl -fsSLO https://github.com/digitalocean/doctl/releases/download/v1.120.0/doctl-1.120.0-linux-amd64.tar.gz && \
    tar -xf doctl-1.120.0-linux-amd64.tar.gz && \
    chmod +x doctl && \
    mv doctl /tmp/doctl

RUN curl -fsSL -o helm.tar.gz https://get.helm.sh/helm-v3.16.4-linux-amd64.tar.gz && \
    tar -xf helm.tar.gz && \
    chmod +x linux-amd64/helm && \
    mv linux-amd64/helm /tmp/helm

COPY ./entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    curl \
    jq \
    docker.io

COPY --from=builder /tmp/doctl /usr/local/bin/doctl
COPY --from=builder /tmp/helm /usr/local/bin/helm
COPY --from=builder /tmp/entrypoint.sh /entrypoint.sh

RUN touch /etc/tracker-tv-do.conf
ENTRYPOINT ["/entrypoint.sh"]
