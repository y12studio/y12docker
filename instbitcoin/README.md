build docker image
```
$ docker build -t y12docker/instbitcoin:0.11.0.a .
$ docker run y12docker/instbitcoin:0.11.0.a bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951

$ docker run -p 80:8080 y12docker/instbitcoin:0.11.0.a

[passcode taichung bitcoin taiwan alice] address = mjTSzbt1xPNa5J73XZHyrBpoe7G6beG5F6
[passcode taichung bitcoin taiwan bob] address = mnkErHL6vpxAqzmeBguNxeGeF5NS33vY4t
[passcode taichung bitcoin taiwan charlie] address = mqW91m89sWBo35z94Sg5RtPBgkssgL3pDd

$ docker push y12docker/instbitcoin:0.11.0.a
```
