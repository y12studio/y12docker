[golang Repository | Docker Hub Registry - Repositories of Docker Images](https://registry.hub.docker.com/_/golang/)

[zenazn/goji](https://github.com/zenazn/goji)

[avelino/awesome-go](https://github.com/avelino/awesome-go#web-frameworks)

[boltdb demo](https://gist.github.com/joyrexus/22c3ef0984ed957f54b9)

[boltdb/bolt](https://github.com/boltdb/bolt)

hello goji
----------

```
$ docker-compose up -d
Recreating hellogoji_goji_1...
$ curl http://localhost:8080/
<!doctype html>
<html>
<body>
        This is the html page.
</body>
</html>
$ curl http://localhost:8080/api
{"ID":"101","Name":"Peter Norvig","Age":"58","Job":"Programmer"}
$ curl http://localhost:8080/hello/y12studio
{"Name":"y12studio","Msg":"Hello"}
$ curl http://localhost:8080/person/102
{"ID":"102","Name":"Donald Knuth","Age":"77","Job":"Programmer"}
# formats Go programs
$ gofmt -w .
```

install gvm/go1.4.2 in Ubuntu 14.04
-------
[7 Easy Steps to Install Go (Golang) on Ubuntu - HostingAdvice.com](http://www.hostingadvice.com/how-to/install-golang-on-ubuntu/)

```
$ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
$ exit
$ gvm install go1.4.2 && gvm use go1.4.2
$ go version
go version go1.4.2 linux/amd64
```
