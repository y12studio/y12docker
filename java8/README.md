## y12docker/java8 Build log

Thu Dec 25 12:08:38 CST 2014

```
$ docker build --no-cache=true -t y12docker/java8:14.12 .
$ docker run y12docker/java8:14.12 java -version
java version "1.8.0_25"
Java(TM) SE Runtime Environment (build 1.8.0_25-b17)
Java HotSpot(TM) 64-Bit Server VM (build 25.25-b02, mixed mode)
docker images | grep java8
y12docker/java8             14.12               e030fa61ba48        About a minute ago   934 MB
y12docker/java8             latest              9b2495cf736e        11 weeks ago         884.8 MB

```

Sat Oct  4 16:29:04 CST 2014

```
$ sudo docker build -t y12docker/java8 .
$ sudo docker run y12docker/java8 java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)
$ sudo docker images | grep java8
y12docker/java8             latest              9b2495cf736e        9 minutes ago       884.8 MB

```

Fri Oct  3 21:15:06 CST 2014

```
$ sudo docker build -t y12docker/java8 .
$ sudo docker run y12docker/java8 java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)
```


Fri Sep 26 10:13:07 CST 2014

```
$ sudo docker build -t y12docker/java8 .
$ sudo docker run y12docker/java8 java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)

$ sudo docker run y12docker/java8 javac -version
javac 1.8.0_20
```
