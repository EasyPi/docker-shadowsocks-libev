#
# Dockerfile for shadowsocks-libev
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG SS_VERSION=3.3.6
ARG SS_URL=https://github.com/shadowsocks/shadowsocks-libev/archive/v${SS_VERSION}.tar.gz
ARG SS_DIR=shadowsocks-libev-${SS_VERSION}

RUN set -ex \
    && apk add --no-cache c-ares \
                          libcrypto3 \
                          libev \
                          libsodium \
                          mbedtls \
                          pcre \
    && apk add --no-cache \
               --virtual TMP autoconf \
                             automake \
                             build-base \
                             c-ares-dev \
                             cmake \
                             coreutils \
                             curl \
                             gettext-dev \
                             libev-dev \
                             libsodium-dev \
                             libtool \
                             linux-headers \
                             mbedtls-dev \
                             openssl-dev \
                             pcre-dev \
                             tar \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
        && curl -sSL https://github.com/shadowsocks/ipset/archive/shadowsocks.tar.gz | tar xz --strip 1 -C libipset \
        && curl -sSL https://github.com/shadowsocks/libcork/archive/shadowsocks.tar.gz | tar xz --strip 1 -C libcork \
        && curl -sSL https://github.com/shadowsocks/libbloom/archive/master.tar.gz | tar xz --strip 1 -C libbloom \
        && mkdir -p build && cd build \
        && cmake .. -DCMAKE_BUILD_TYPE=Release \
        && jobs="$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)" \
        && make -j"$jobs" \
        && make install \
        && cd ../.. \
        && rm -rf $SS_DIR \
    && apk del TMP

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV METHOD=chacha20-ietf-poly1305
ENV PASSWORD=
ENV TIMEOUT=60
ENV DNS_ADDR=8.8.8.8

EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp

CMD ss-server -s "$SERVER_ADDR" \
              -p "$SERVER_PORT" \
              -m "$METHOD"      \
              -k "$PASSWORD"    \
              -t "$TIMEOUT"     \
              -d "$DNS_ADDR"    \
              -u                \
              --fast-open $OPTIONS
