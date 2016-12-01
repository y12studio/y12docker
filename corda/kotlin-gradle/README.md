
https://hub.docker.com/r/y12docker/kotlin-gradle/

https://hub.docker.com/r/takitake/gradle-alpine/

https://hub.docker.com/r/supermina999/alpine-kotlin/

```
$ date && docker -v
Thu Dec  1 16:07:58 CST 2016
Docker version 1.12.3, build 6b644ec
$ docker build -t kotlin-gradle .
$ docker run -it --rm kotlin-gradle gradle -v
------------------------------------------------------------
Gradle 3.2.1
------------------------------------------------------------

Build time:   2016-11-22 15:19:54 UTC
Revision:     83b485b914fd4f335ad0e66af9d14aad458d2cc5

Groovy:       2.4.7
Ant:          Apache Ant(TM) version 1.9.6 compiled on June 29 2015
JVM:          1.8.0_112 (Oracle Corporation 25.112-b15)
OS:           Linux 3.13.0-100-generic amd64

$ docker run -it --rm kotlin-gradle env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/gradle/gradle-3.2.1/bin
HOSTNAME=680201d32d55
LANG=C.UTF-8
JAVA_VERSION=8
JAVA_UPDATE=112
JAVA_BUILD=15
JAVA_HOME=/usr/lib/jvm/default-jvm
KOTLIN_VERSION=1.0.5
KOTLIN_HOME=/usr/share/kotlin
GRADLE_VERSION=3.2.1
GRADLE_HOME=/usr/lib/gradle/gradle-3.2.1
HOME=/root

$ docker build -t y12docker/kotlin-gradle:3.2.1 .
$ docker push y12docker/kotlin-gradle:3.2.1
```
