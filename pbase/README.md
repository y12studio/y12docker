Build log

Fri Mar  6 11:58:04 CST 2015

```
$ docker build --no-cache=true -t y12docker/pbase:15.03 .
$ alias pb='docker run y12docker/pbase:15.03'
$ pb uname -a
Linux 8c708efd6e14 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
$ pb python --version
Python 2.7.6
$ pb pip --version
pip 6.0.8 from /usr/local/lib/python2.7/dist-packages (python 2.7)
$ pb node -v
v0.10.36
$ pb npm -v
1.4.28

$ docker images | grep pbase
y12docker/pbase             15.03               62555e92c9e6        34 seconds ago      435 MB
y12docker/pbase             14.12               c1cdef513948        10 weeks ago        403.7 MB
y12docker/pbase             latest              c1cdef513948        10 weeks ago        403.7 MB

$ docker push y12docker/pbase:15.03
```


Thu Dec 25 11:39:37 CST 2014

```
$ docker build --no-cache=true -t y12docker/pbase .

```

Sat Oct  4 16:04:11 CST 2014

```
$ sudo docker build -t y12docker/pbase:14.12 .
lin@ubuntu73:~/git/y12docker/pbase$ docker images | grep pbase
y12docker/pbase             latest              c1cdef513948        2 minutes ago       403.7 MB
y12docker/pbase             14.12               c1cdef513948        2 minutes ago       403.7 MB
$ docker push y12docker/pbase:14.12

```



Fri Oct  3 12:34:43 CST 2014

```
$ sudo docker build -t y12docker/pbase .

Step 0 : FROM phusion/baseimage:0.9.14
Pulling repository phusion/baseimage
e74fe19c755c: Pulling dependent layers
$ alias pbase='sudo docker run y12docker/pbase'
$ pbase uname -a
Linux 4560795c6980 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

$ pbase python --version
Python 2.7.6

$ pbase pip --version
pip 1.5.6 from /usr/local/lib/python2.7/dist-packages (python 2.7)
```


```
$ date
Fri Sep 26 09:49:17 CST 2014
$ sudo docker build -t y12docker/pbase .
$ sudo docker run y12docker/pbase uname -a
Linux 0a79fd195b2c 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:30:00 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
$ sudo docker run y12docker/pbase python --version
Python 2.7.6
$ sudo docker run y12docker/pbase pip --version
pip 1.5.6 from /usr/local/lib/python2.7/dist-packages (python 2.7)
```
