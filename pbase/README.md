Build log

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