Build log

```
$ date
Fri Sep 26 10:13:07 CST 2014
$ sudo docker build -t y12docker/java8 .
$ sudo docker run y12docker/java8 java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)

$ sudo docker run y12docker/java8 javac -version
javac 1.8.0_20
```