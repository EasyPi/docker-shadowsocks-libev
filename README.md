docker-shadowsocks-libev
========================

![build](https://github.com/easypi/docker-shadowsocks-libev/actions/workflows/build.yaml/badge.svg)
[![release](https://img.shields.io/github/release/EasyPi/docker-shadowsocks-libev.svg)](https://github.com/EasyPi/docker-shadowsocks-libev/releases/latest)

[![](http://dockeri.co/image/vimagick/shadowsocks-libev)][11]

## What is shadowsocks-libev

[Shadowsocks-libev][1] is a lightweight secured SOCKS5 proxy for embedded devices
and low-end boxes.

It is a port of [Shadowsocks][2] created by [@clowwindy][3], which is maintained by
[@madeye][4] and [@linusyang][5].

Current version: [![release](https://img.shields.io/github/release/shadowsocks/shadowsocks-libev.svg)][6]

## How to use these images

- Get [docker-compose.yml][7], then change `SERVER_ADDR` and `PASSWORD`.

- Run these commands:

        # On server (1.2.3.4)
        $ docker-compose up -d server

        # On client (192.168.1.234)
        $ docker-compose up -d client

        # On any LAN PC (192.168.1.XXX)
        $ curl -x socks5h://192.168.1.234:1080 https://www.youtube.com/
        $ curl -x socks5h://192.168.1.254:1080 https://www.youtube.com/

- Set socks5 proxy in your favorite web browser.

## Deploy without docker

You can update your system with unsupported packages from this untrusted PPA by
adding [ppa:liamwong/shadowsocks-libev][12] to your system's Software Sources.

```bash
sudo add-apt-repository ppa:liamwong/shadowsocks-libev
sudo apt-get update
sudo apt-get install shadowsocks-libev
```

> Config file format: [config.json](https://shadowsocks.org/en/config/quick-guide.html)

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
[6]: https://github.com/shadowsocks/shadowsocks-libev/releases/latest
[7]: https://github.com/EasyPi/docker-shadowsocks-libev/raw/master/docker-compose.yml
[8]: https://duckduckgo.com/?q=password+12&t=ffsb&ia=answer
[9]: https://github.com/shadowsocks/shadowsocks-libev#license
[10]: https://github.com/EasyPi/docker-shadowsocks-libev/issues
[11]: https://hub.docker.com/r/vimagick/shadowsocks-libev/
[12]: https://launchpad.net/~liamwong/+archive/ubuntu/shadowsocks-libev
