#
# Dockerfile for shadowsocks-rust
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG SS_RUST_VERSION=1.16.0

RUN set -ex \
    && SS_RUST_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/amd64@x86_64-unknown-linux-musl@' \
                                                 -e 's@linux/arm64@aarch64-unknown-linux-musl@' \
                                                 -e 's@linux/arm/v7@armv7-unknown-linux-musleabihf@') \
    && SS_RUST_FILE=shadowsocks-v${SS_RUST_VERSION}.${SS_RUST_ARCH}.tar.xz \
    && SS_RUST_URL=https://github.com/shadowsocks/shadowsocks-rust/releases/download/v${SS_RUST_VERSION}/${SS_RUST_FILE} \
    && apk add --no-cache curl \
    && curl -sSL ${SS_RUST_URL} | tar xJ ssservice -C /usr/bin/ \
    && apk del curl

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV METHOD=chacha20-ietf-poly1305
ENV PASSWORD=
ENV DNS=8.8.8.8,8.8.4.4
ENV TIMEOUT=300
ENV WORKERS=4

EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp

CMD ssservice server -s "$SERVER_ADDR:$SERVER_PORT" \
                     -k "${PASSWORD:-$(hostname)}"  \
                     -m "$METHOD"                   \
                     --dns "$DNS"                   \
                     --timeout "$TIMEOUT"           \
                     --worker-threads "$WORKERS"    \
                     --tcp-fast-open --tcp-no-delay \
                     -U

