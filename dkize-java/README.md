
Sat Apr  4 16:19:01 CST 2015

```
$ which java
/usr/bin/java
$ java -version
java version "1.8.0_40"
Java(TM) SE Runtime Environment (build 1.8.0_40-b25)
Java HotSpot(TM) 64-Bit Server VM (build 25.40-b25, mixed mode)
$ ldd /usr/bin/java
        linux-vdso.so.1 =>  (0x00007fff1c3fe000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f83b1c82000)
        libjli.so => not found
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f83b1a7d000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f83b16b8000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f83b1eaf000)

$ find /usr/lib -name libjli.so
/usr/lib/jvm/java-7-openjdk-amd64/lib/amd64/jli/libjli.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/jli/libjli.so
/usr/lib/jvm/java-8-oracle/lib/amd64/jli/libjli.so
/usr/lib/jvm/java-8-oracle/jre/lib/amd64/jli/libjli.so

$ cat /etc/ld.so.conf.d/java-jli.conf
/usr/lib/jvm/java-8-oracle/lib/amd64/jli/

$ sudo ldconfig
$ ldd `which java`
linux-vdso.so.1 =>  (0x00007fff4a5fe000)
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f1f5c820000)
libjli.so => /usr/lib/jvm/java-8-oracle/lib/amd64/jli/libjli.so (0x00007f1f5c60a000)
libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f1f5c405000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1f5c040000)
/lib64/ld-linux-x86-64.so.2 (0x00007f1f5ca4d000)

$ dockerize -t foo \
  -a /bin/bash /bin/sh -c /bin/sh --filetools /usr/bin/java

$ docker run foo java -version
  /usr/bin/java: error while loading shared libraries: libjli.so: cannot open shared object file: No such file or directory

$ docker run java:8 java -version

openjdk version "1.8.0_40-internal"
OpenJDK Runtime Environment (build 1.8.0_40-internal-b27)
OpenJDK 64-Bit Server VM (build 25.40-b25, mixed mode)

$ docker run elasticsearch:1.5.0 java -version

java version "1.7.0_75"
OpenJDK Runtime Environment (IcedTea 2.5.4) (7u75-2.5.4-2)
OpenJDK 64-Bit Server VM (build 24.75-b04, mixed mode)

$ docker images | grep elastic
elasticsearch       1.5.0               d6b582feb9ec        4 days ago          366.2 MB
elasticsearch       1.4.4               abed8deb3ba5        4 days ago          365.8 MB

$ docker images | grep java
java                8                   478dd73b9c9a        4 days ago          815.5 MB


```
