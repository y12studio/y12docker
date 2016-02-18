build docker image
```
$ docker version
Client:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79
 Built:        Thu Aug 13 02:35:49 UTC 2015
 OS/Arch:      linux/amd64

Server:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79
 Built:        Thu Aug 13 02:35:49 UTC 2015
 OS/Arch:      linux/amd64

$ docker build -t y12docker/instbitcoin:0.11.0.a .
$ docker run y12docker/instbitcoin:0.11.0.a bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951

$ docker run -p 80:8080 y12docker/instbitcoin:0.11.0.a
[ { name: 'alice',
    passcode: 'passcode taichung bitcoin 2015 alice',
    wif: 'cVG8qWpmp9Eg3iNhesdMuHCSQ3EtgaBQwD7UDxG18gcYhWTPNXrP',
    address: 'mvhs893NaYf8bu7btybhEvzyVJ4tSUgQPV' },
  { name: 'bob',
    passcode: 'passcode taichung bitcoin 2015 bob',
    wif: 'cMmHKEMgMJXaqd7KbWK7woAEpHq92Fx8AFPnPbeRxDkk9KD6smF4',
    address: 'mz6km2YGPmjaPdg4iYD129661B2q7bcn5q' },
  { name: 'carol',
    passcode: 'passcode taichung bitcoin 2015 carol',
    wif: 'cRxhe8AzUMja2VdCBCCmbagS5HdAJLD4oqJZP1HXr991Anq3AXUd',
    address: 'mtYJ5CeVJKU429PxKEd1MXeutDG1LrXBhd' },
  { name: 'dave',
    passcode: 'passcode taichung bitcoin 2015 dave',
    wif: 'cVtiwAEGgZgfC5b4GXyC5FoELs1fFjfQxuoGs5tgDVWnMLYn8E6q',
    address: 'mqzMNgQSXeTEsZCxT9hT5u73qnBCTmwunx' },
  { name: 'eve',
    passcode: 'passcode taichung bitcoin 2015 eve',
    wif: 'cN2sjx1UXoE6yw7o119yqak399gksYqiGn3Tfr7FRgb7hoZB3dNb',
    address: 'mscSQJkYKCRCcBeKzHan1qVH1CLkFewR8z' } ]

$ docker push y12docker/instbitcoin:0.11.0.a
```
