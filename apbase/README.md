Wed May  6 11:54:41 CST 2015
```
$ docker build -t y12docker/apbase:1505 .
$ docker run y12docker/apbase:1505 drill blog.y12.tw @8.8.8.8
;; ->>HEADER<<- opcode: QUERY, rcode: NOERROR, id: 8179
;; flags: qr rd ra ; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
;; QUESTION SECTION:
;; blog.y12.tw. IN      A

;; ANSWER SECTION:
blog.y12.tw.    14399   IN      A       67.205.56.153

;; AUTHORITY SECTION:

;; ADDITIONAL SECTION:

;; Query time: 163 msec
;; SERVER: 8.8.8.8
;; WHEN: Wed May  6 04:04:48 2015
;; MSG SIZE  rcvd: 45

docker push y12docker/apbase:1505

```
Sun Apr  5 16:05:27 CST 2015
```
$ docker build -t y12docker/apbase:1504 .
$ docker images | grep apbase
y12docker/apbase    1504                09e73697260a        11 seconds ago      54.01 MB

$ docker run y12docker/apbase:1504 pip --version
pip 1.5.6 from /usr/lib/python2.7/site-packages (python 2.7)

$ docker run y12docker/apbase:1504 pip list
nose (1.3.6)
pip (1.5.6)
requests (2.6.0)
setuptools (1.1.7)
wsgiref (0.1.2)
$ docker push y12docker/apbase:1504
The push refers to a repository [y12docker/apbase] (len: 1)
Sending image list
Pushing repository y12docker/apbase (1 tags)
511136ea3c5a: Image already pushed, skipping
...
09e73697260a: Image successfully pushed
Pushing tag for rev [09e73697260a] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/apbase/tags/1504}

```
