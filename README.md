docker-shadowsocks-libev
========================

[![](https://github.com/easypi/docker-shadowsocks-libev/actions/workflows/build-libev.yaml/badge.svg)](https://github.com/EasyPi/docker-shadowsocks-libev)
[![release](https://img.shields.io/github/release/EasyPi/docker-shadowsocks-libev.svg)](https://github.com/EasyPi/docker-shadowsocks-libev/releases/latest)

[![](http://dockeri.co/image/easypi/shadowsocks-libev)][11]
[![](http://dockeri.co/image/easypi/shadowsocks-rust)][12]

> 我们中国人需要管的
>> ——— [Jackie Chan](https://zh.wikipedia.org/wiki/%E6%88%90%E9%BE%8D#%E6%94%BF%E6%B2%BB%E7%AB%8B%E5%9C%BA)

> 不需要政府造墙，网民也会自发造墙
>> ——— [clowwindy](https://zh.wikiquote.org/wiki/%E7%A5%9D%E5%8D%9A%E9%9F%AC)

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

- Set socks5 proxy in your favorite web browser.

## Deploy without docker

```bash
sudo apt-get update
sudo apt-get install shadowsocks-libev
```

> Config file format: [config.json](https://shadowsocks.org/guide/configs.html)

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
[11]: https://hub.docker.com/r/easypi/shadowsocks-libev/
[12]: https://hub.docker.com/r/easypi/shadowsocks-rust/
