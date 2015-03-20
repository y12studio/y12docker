Fri Mar 20 09:47:40 CST 2015

```
$ docker build --no-cache=true -t y12docker/bitcoind:0.10.0 .
$ docker images | grep bitcoind
y12docker/bitcoind         0.10.0              cd50608b7bb5        About a minute ago   467.8 MB
$ alias dr='docker run y12docker/bitcoind:0.10.0'
$ dr bitcoin-cli --version
Bitcoin Core RPC client version v0.10.0.0-g047a898
$ dr which bitcoind
/usr/bin/bitcoind

$ dr ldd /usr/bin/bitcoind
        linux-vdso.so.1 =>  (0x00007fff871fe000)
        libboost_system.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_system.so.1.54.0 (0x00007f57bc8c4000)
        libboost_filesystem.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.54.0 (0x00007f57bc6ae000)
        libboost_program_options.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.54.0 (0x00007f57bc43f000)
        libboost_thread.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.54.0 (0x00007f57bc229000)
        libdb_cxx-4.8.so => /usr/lib/libdb_cxx-4.8.so (0x00007f57bbe8f000)
        libssl.so.1.0.0 => /lib/x86_64-linux-gnu/libssl.so.1.0.0 (0x00007f57bbc30000)
        libcrypto.so.1.0.0 => /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 (0x00007f57bb856000)
        libminiupnpc.so.8 => /usr/lib/libminiupnpc.so.8 (0x00007f57bb64b000)
        libanl.so.1 => /lib/x86_64-linux-gnu/libanl.so.1 (0x00007f57bb446000)
        libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f57bb142000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f57bae3c000)
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f57bac25000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f57baa07000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f57ba642000)
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f57ba439000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f57ba235000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f57bd131000)

$ docker push y12docker/bitcoind:0.10.0

Pushing tag for rev [cd50608b7bb5] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/bitcoind/tags/0.10.0}

```
