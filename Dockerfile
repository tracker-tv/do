FROM alpine:3.21.0 AS builder

RUN apk add --no-cache \
    bash \
    curl \
    tar \
    jq

RUN curl -fsSLO https://github.com/digitalocean/doctl/releases/download/v1.120.0/doctl-1.120.0-linux-amd64.tar.gz && \
    tar -xf doctl-1.120.0-linux-amd64.tar.gz && \
    mv doctl /usr/local/bin

FROM alpine:3.21.0

RUN apk add --no-cache \
    bash \
    curl \
    jq

COPY --from=builder /usr/local/bin/doctl /usr/local/bin/doctl
