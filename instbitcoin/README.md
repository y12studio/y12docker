build docker image
```
$ docker build -t y12docker/instbitcoin:0.11.0.a .
$ docker run y12docker/instbitcoin:0.11.0.a bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951
$ docker push y12docker/instbitcoin:0.11.0.a

```
