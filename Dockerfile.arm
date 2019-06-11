#
# Dockerfile for shadowsocks-libev-arm
#

FROM easypi/alpine-arm:build
MAINTAINER EasyPi Software Foundation

ENV SS_VER 3.3.0
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER

RUN set -ex \
    && apk add --no-cache c-ares \
                          libcrypto1.0 \
                          libev \
                          libsodium \
                          mbedtls \
                          pcre \
    && apk add --no-cache \
               --virtual TMP autoconf \
                             automake \
                             build-base \
                             c-ares-dev \
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
        && ./autogen.sh \
        && ./configure --disable-documentation \
        && make install \
        && cd .. \
        && rm -rf $SS_DIR \
    && apk del TMP

ENV SERVER_ADDR=
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV LOCAL_ADDR  0.0.0.0
ENV LOCAL_PORT  1080
ENV TIMEOUT     60

EXPOSE $LOCAL_PORT

CMD ss-local -s "$SERVER_ADDR" \
             -p "$SERVER_PORT" \
             -m "$METHOD"      \
             -k "$PASSWORD"    \
             -b "$LOCAL_ADDR"  \
             -l "$LOCAL_PORT"  \
             -t "$TIMEOUT"     \
             --fast-open $OPTIONS
