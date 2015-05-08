build y12docker/varnish:4.0.2
------------

```
$ wget https://raw.githubusercontent.com/mattiasgeniar/varnish-4.0-configuration-templates/master/default.vcl
$ docker build -t y12docker/varnish:4.0.2 .
$ docker run y12docker/varnish:4.0.2 varnishd -V
varnishd (varnish-4.0.2 revision bfe7cd1)
Copyright (c) 2006 Verdens Gang AS
Copyright (c) 2006-2014 Varnish Software AS
```
