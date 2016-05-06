docker-shadowsocks-libev
========================

![](https://travis-ci.org/EasyPi/docker-shadowsocks-libev.svg)

name                               | size
---------------------------------- | ---------------------------------------------------------------------------
[easypi/shadowsocks-libev][11]     | ![](https://badge.imagelayers.io/easypi/shadowsocks-libev:latest.svg)
[easypi/shadowsocks-libev-arm][12] | ![](https://badge.imagelayers.io/easypi/shadowsocks-libev-arm:latest.svg)

## What is shadowsocks-libev

[Shadowsocks-libev][1] is a lightweight secured SOCKS5 proxy for embedded devices
and low-end boxes.

It is a port of [Shadowsocks][2] created by [@clowwindy][3], which is maintained by
[@madeye][4] and [@linusyang][5].

Current version: [2.4.6][6]

## How to use these images

- Get [docker-compose.yml][7], then change `SERVER_ADDR` and `PASSWORD`.

- Run these commands:

        # On x86 server (1.2.3.4)
        $ docker-compose up -d server

        # On x86 client (192.168.1.234)
        $ docker-compose up -d client

        # On arm client (192.168.1.254)
        $ docker-compose up -d client-arm

        # On any LAN PC (192.168.1.XXX)
        $ curl -x socks5h://192.168.1.234:1080 https://www.youtube.com/
        $ curl -x socks5h://192.168.1.254:1080 https://www.youtube.com/

- Set socks5 proxy in your favorite web browser.

## License

View [license information][9] for the software contained in this image.

## User Feedback

If you find a bug, please create an [issue][10].
Feel free to send me pull requests. Thank you!

[1]: http://shadowsocks.org/
[2]: https://github.com/shadowsocks/shadowsocks
[3]: https://github.com/clowwindy
[4]: https://github.com/madeye
[5]: https://github.com/linusyang
[6]: https://github.com/shadowsocks/shadowsocks-libev/releases/tag/v2.4.6
[7]: https://github.com/EasyPi/docker-shadowsocks-libev/raw/master/docker-compose.yml
[8]: https://duckduckgo.com/?q=password+12&t=ffsb&ia=answer
[9]: https://github.com/shadowsocks/shadowsocks-libev#license
[10]: https://github.com/EasyPi/docker-shadowsocks-libev/issues
[11]: https://hub.docker.com/r/easypi/shadowsocks-libev/
[12]: https://hub.docker.com/r/easypi/shadowsocks-libev-arm/
