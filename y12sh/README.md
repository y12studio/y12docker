Build log

support the [weave-elkr](https://github.com/y12studio/y12docker/tree/master/y12sh/app/weave-elkr)

```
$ date
Fri Sep 26 12:19:54 CST 2014
$ sudo docker build --no-cache -t y12docker/y12sh y12sh
$ sudo docker run y12docker/y12sh ls /opt/app
weave-elkr
$ sudo docker run y12docker/y12sh > /tmp/y12.sh
$ bash /tmp/y12.sh -x
$ bash /tmp/y12.sh -c "weave-elkr /tmp/y12sh"
$ cd /tmp/y12sh/weave-elkr
$ bash elkr.sh -b
$ bash elkr.sh -r
$ bash elkr.sh -s
```

base version

```
$ sudo docker build -t y12docker/y12sh .
$ sudo docker run y12docker/y12sh git --version
git version 2.1.0
```