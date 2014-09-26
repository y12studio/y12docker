Build log

move to y12docker/pbase

```
$ date
Fri Sep 26 10:13:07 CST 2014
$ sudo docker build -t y12docker/java7 .

```

-----------------------

```
$ sudo docker build -t y12docker/java7 .
$ sudo docker run y12docker/java7 java -version
java version "1.7.0_65"
OpenJDK Runtime Environment (IcedTea 2.5.2) (7u65-2.5.2-3~14.04)
OpenJDK 64-Bit Server VM (build 24.65-b04, mixed mode)
$ sudo docker push y12docker/java7
....
05c093ce3b62: Image successfully pushed
Pushing tag for rev [05c093ce3b62] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/java7/tags/latest}
```