Build log

```
$ sudo docker build -t y12docker/jdev .
$ sudo docker run y12docker/jdev mvn -version
Apache Maven 3.2.3 (33f8c3e1027c3ddde99d3cdebad2656a31e8fdf4; 2014-08-11T20:58:10+00:00)
Maven home: /opt/maven
Java version: 1.7.0_65, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-7-openjdk-amd64/jre
Default locale: zh_TW, platform encoding: UTF-8
OS name: "linux", version: "3.13.0-24-generic", arch: "amd64", family: "unix"

$ sudo docker run y12docker/jdev gradle -v

------------------------------------------------------------
Gradle 2.1
------------------------------------------------------------

Build time:   2014-09-08 10:40:39 UTC
Build number: none
Revision:     e6cf70745ac11fa943e19294d19a2c527a669a53

Groovy:       2.3.6
Ant:          Apache Ant(TM) version 1.9.3 compiled on December 23 2013
JVM:          1.7.0_65 (Oracle Corporation 24.65-b04)
OS:           Linux 3.13.0-24-generic amd64

$ sudo docker run y12docker/jdev protoc --version
libprotoc 2.6.0


$ sudo docker run y12docker/jdev node -v
v0.10.32

$ sudo docker run y12docker/jdev npm -v
1.4.28

$ sudo docker run y12docker/jdev grunt --version
grunt-cli v0.1.13
```