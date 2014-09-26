Build log

```
$ date
Fri Sep 26 12:06:42 CST 2014
$ sudo docker build --no-cache -t y12docker/redis redis
$ sudo docker run y12docker/redis java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)

$ sudo docker run y12docker/redis redis-cli -v
redis-cli 2.8.13
```


```
$ sudo docker build -t y12docker/redis .
$ sudo docker run -d -p 6379:6379 y12docker/redis
$ redis-cli -h 192.168.99.33 ping
PONG
$ sudo docker push y12docker/redis
....
Pushing tag for rev [66b782a3ba97] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/redis/tags/latest}

```