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
