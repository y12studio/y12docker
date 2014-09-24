Build log

```
$ sudo docker build -t y12docker/redis .
$ sudo docker run -d -p 6379:6379 y12docker/redis
$ redis-cli -h 192.168.99.33 ping
PONG
$ sudo docker push y12docker/redis
....
Pushing tag for rev [66b782a3ba97] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/redis/tags/latest}

```