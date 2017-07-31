#
# Dockerfile for shadowsocks-libev:debian
#

FROM debian:stretch
MAINTAINER EasyPi Software Foundation

ENV SS_VER 3.0.8
ENV SS_DIR shadowsocks-libev-${SS_VER}
ENV SS_DEB shadowsocks-libev_${SS_VER}-1_amd64.deb
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v${SS_VER}.tar.gz

RUN set -xe \
    && echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get update \
    && apt-get install -y -t jessie-backports debhelper \
    && apt-get install -y apg \
                          asciidoc \
                          autoconf \
                          build-essential \
                          curl \
                          dh-systemd \
                          gawk \
                          gettext \
                          init-system-helpers \
                          libev4 \
                          libev-dev \
                          libpcre3 \
                          libpcre3-dev \
                          libssl1.0.0 \
                          libssl-dev \
                          libtool \
                          libudns0 \
                          libudns-dev \
                          pkg-config \
                          xmlto \
                          zlib1g \
                          zlib1g-dev \
    && curl -sSL ${SS_URL} | tar xz \
    && cd ${SS_DIR} \
        && curl -sSL https://download.libsodium.org/libsodium/releases/libsodium-1.0.11.tar.gz | tar xz \
        && cd libsodium-1.0.11 \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && curl -sSL https://tls.mbed.org/download/mbedtls-2.4.0-gpl.tgz | tar xz \
        && cd mbedtls-2.4.0 \
        && make SHARED=1 CFLAGS=-fPIC \
        && make install \
        && cd .. \
        && curl -sSL https://github.com/shadowsocks/ipset/archive/shadowsocks.tar.gz | tar xz --strip 1 -C libipset \
        && curl -sSL https://github.com/shadowsocks/libcork/archive/shadowsocks.tar.gz | tar xz --strip 1 -C libcork \
        && curl -sSL https://github.com/shadowsocks/libbloom/archive/master.tar.gz | tar xz --strip 1 -C libbloom \
        && ./autogen.sh \
        && dpkg-buildpackage -b -us -uc -i \
        && cd .. \
        && rm -rf ${SS_DIR} \
    && dpkg -i ${SS_DEB} \
    && apt-get remove -y asciidoc \
                         autoconf \
                         build-essential \
                         dh-systemd \
                         gawk \
                         gettext \
                         init-system-helpers \
                         libev-dev \
                         libpcre3-dev \
                         libssl-dev \
                         libtool \
                         libudns-dev \
                         pkg-config \
                         xmlto \
                         zlib1g-dev \
    && apt-get remove -y -t jessie-backports debhelper \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8388/tcp 8388/udp

ENTRYPOINT ["/usr/bin/ss-server"]
CMD ["-c", "/etc/shadowsocks-libev/config.json", "-u"]
