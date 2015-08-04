build docker image
```
$ docker build -t y12docker/instbitcoin:0.11.0.a .
$ docker run y12docker/instbitcoin:0.11.0.a bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951

$ docker run -p 80:8080 y12docker/instbitcoin:0.11.0.a

[Passcode Taichung Bitcoin UserGroup 2009] address = moboPUAXkmD5EhfUbEP9CVPhy6a3KNa3Du
[Passcode Taichung Bitcoin UserGroup 2010] address = mmb3jmD7i5oiEWztzDf9FMmbqEirHpr8wq
[Passcode Taichung Bitcoin UserGroup 2011] address = mhg5zYV8K53YdDjTCcujL8xJvhgb5wQfs3
[Passcode Taichung Bitcoin UserGroup 2012] address = muTYW4jCsx8E1afR3hwDKAConxxbm9JUJj
[Passcode Taichung Bitcoin UserGroup 2013] address = msBGC5Lw6krXvErrUi4ax2G9sW2SUMqgbs
[Passcode Taichung Bitcoin UserGroup 2014] address = msDhQCLP37X3tzj9SjuKSn6a9e7LWJU9Rq
[Passcode Taichung Bitcoin UserGroup 2015] address = mumzYWEoXRwPpWrfGTQdKJEDHFfcyLdSf9

$ docker push y12docker/instbitcoin:0.11.0.a
```
