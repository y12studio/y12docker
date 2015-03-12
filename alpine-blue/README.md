[gliderlabs/docker-alpine](https://github.com/gliderlabs/docker-alpine)

Thu Mar 12 12:38:15 CST 2015
```
$ docker build -f Dockerfile.pbase -t y12docker/apbase .
$ docker images | grep pbase
y12docker/apbase            latest              eb174ab451ce        16 seconds ago      50.63 MB
y12docker/pbase             15.03               62555e92c9e6        6 days ago          435 MB
y12docker/pbase             14.12               c1cdef513948        11 weeks ago        403.7 MB
y12docker/pbase             latest              c1cdef513948        11 weeks ago        403.7 MB
$ docker run -i -t y12docker/apbase python --version
Python 2.7.9
$ docker run -i -t y12docker/apbase pip --version
pip 1.5.6 from /usr/lib/python2.7/site-packages (python 2.7)

$ docker build -f Dockerfile.papp -t y12docker/apapp .
$ docker run -i -t y12docker/apapp nosetests --version
nosetests version 1.3.4

$ docker build -f Dockerfile.pbit -t y12docker/pbit .
$ docker run -i -t y12docker/pbit bitcoin-cli --version
Bitcoin Core RPC client version v0.10.99.0-e1528cc
```
