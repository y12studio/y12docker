Install
------
```
# su - xuser
$ docker run -v $(pwd)/pbnet:/pbnet y12docker/pbnet:0.10.1
$ cd pbnet && . ./post.sh
```
Run the pbnet
-----

[Developer Examples - Bitcoin](https://bitcoin.org/en/developer-examples#simple-spending)

Unlike mainnet, in regtest mode only the first 150 blocks pay a reward of 50 bitcoins. However, a block must have 100 confirmations before that reward can be spent, so we generate 101 blocks to get access to the coinbase transaction from block 1.
```
$ cd pbnet && source alias.sh
$ dcup
$ dc ps
$ alice setgenerate true 101
$ alice getbalance
$ bob setgenerate true 10
$ bob getbalance
$ bob getpeerinfo
$ alice sendtoaddress $(bob getnewaddress) 10.0
$ alice getbalance
$ bob getbalance
539.99999808
0.00000000
$ bob setgenerate true 6 && bob getbalance
```

build y12docker/pbnet
---
```
$ docker build -t y12docker/pbnet:0.10.1 .
$ docker push y12docker/pbnet:0.10.1
```

Install on new DigitalOcean/Ubuntu 14.04 x64
-----------
```
# adduser xuser
# adduser xuser sudo
# su - xuser
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker xuser
$ exit
# su - xuser
$ docker run -v $(pwd)/pbnet:/pbnet y12docker/pbnet:0.10.1
$ cd pbnet && . ./post.sh
$ absh/setup_swap.sh && absh/setup_dc.sh
$ sudo reboot now
```

Two users
-------
```
# su - user1
$ docker run -v $(pwd)/pbnet:/pbnet y12docker/pbnet:0.10.1
$ cd pbnet && . ./post.sh
$ sed -i 's|DCP=pbnet|DC=pbnet1|g' alias.sh
$ source alias.sh
$ dcup
$ seed2sh cat /etc/hosts
172.17.42.48    bbcbe1ece747

# su - user2
$ docker run -v $(pwd)/pbnet:/pbnet y12docker/pbnet:0.10.1
$ cd pbnet && . ./post.sh
$ sed -i 's|DCP=pbnet|DC=pbnet2|g' alias.sh
$ source alias.sh
$ dcup
$ alice addnode 172.17.42.48:18333 onetry
$ alice getinfo
```

Ref Service
----
[celery Repository | Docker Hub Registry - Repositories of Docker Images](https://registry.hub.docker.com/_/celery/)

[Homepage | Celery: Distributed Task Queue](http://www.celeryproject.org/)

[bitcoin-abe/bitcoin-abe](https://github.com/bitcoin-abe/bitcoin-abe)

[c0achmcguirk/docker-bitcoin-abe](https://github.com/c0achmcguirk/docker-bitcoin-abe)
