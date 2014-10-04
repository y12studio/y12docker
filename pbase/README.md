Build log

Sat Oct  4 16:04:11 CST 2014

```
$ sudo docker build -t y12docker/pbase .

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