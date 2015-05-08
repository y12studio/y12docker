build y12docker/varnish:4.0.3
------------

[Installing Varnish — Varnish version 4.0.3-rc1 documentation](https://www.varnish-cache.org/docs/4.0/installation/install.html)

[mattiasgeniar/varnish-4.0-configuration-templates](https://github.com/mattiasgeniar/varnish-4.0-configuration-templates)

[larsks/dockerize](https://github.com/larsks/dockerize)

```
$ wget -qO- https://repo.varnish-cache.org/source/varnish-4.0.3.tar.gz | tar xvz -C ~/tmp
$ cd ~/tmp/varnish-4.0.3/
$ cat configure.ac | grep AM_INIT
AM_INIT_AUTOMAKE([1.11 foreign color-tests parallel-tests subdir-objects])

$ ./autogen.sh
$ ./configure
$ make
$ sudo make install-strip
$ ldd /usr/local/sbin/varnishd
        linux-vdso.so.1 =>  (0x00007fff3adfe000)
        libvarnish.so => /usr/local/lib/varnish/libvarnish.so (0x00007fd6e048d000)
        libvcc.so => /usr/local/lib/varnish/libvcc.so (0x00007fd6e026d000)
        libvgz.so => /usr/local/lib/varnish/libvgz.so (0x00007fd6e0059000)
        libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007fd6dfe0e000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fd6dfc0a000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fd6df903000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fd6df6e5000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fd6df320000)
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fd6df117000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fd6e06a5000)


$ cd ~/git/y12docker/varnish
$ wget https://raw.githubusercontent.com/mattiasgeniar/varnish-4.0-configuration-templates/master/default.vcl
$ chmod +x start.sh
$ dockerize -t y12docker/varnish:4.0.3 \
    -a /usr/local/sbin/varnishd /usr/local/sbin/varnishd \
    -a /usr/local/sbin/varnishlog /usr/local/sbin/varnishlog \
    -a /usr/local/sbin/varnishncsa /usr/local/sbin/varnishncsa \
    -a /usr/local/sbin/varnishstat /usr/local/sbin/varnishstat \
    -a default.vcl /usr/local/etc/varnish/default.vcl \
    -a start.sh /start.sh \
    -a /bin/bash /bin/bash \
    -a /bin/echo /bin/echo \
    -a /usr/bin/env /usr/bin/env \
    -a /usr/bin/head /usr/bin/head \
    -a /usr/bin/cut /usr/bin/cut \
    -c /start.sh --filetools

$ ldd /usr/local/bin/varnishlog
        linux-vdso.so.1 =>  (0x00007fff4e7e6000)
        libvarnishapi.so.1 => not found
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fde5adaf000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fde5ab90000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fde5a7cb000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fde5afc6000)

```
