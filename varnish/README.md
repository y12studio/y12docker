run test
--------

```
$ source alias.sh
$ dcup
```

build y12docker/varnish:4.0.3
------------

```
$ cd varnish
$ docker build -t y12docker/varnish:4.0.3 .
$ docker run y12docker/varnish:4.0.3 varnishd -V
varnishd (varnish-4.0.3 revision b8c4a34)
Copyright (c) 2006 Verdens Gang AS
Copyright (c) 2006-2014 Varnish Software AS
$ docker images | grep y12docker/varnish
y12docker/varnish        4.0.3               3e50cc1ac357        4 minutes ago       314.1 MB

$ docker push y12docker/varnish:4.0.3
```
