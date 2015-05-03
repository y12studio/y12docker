Sun May  3 18:07:07 CST 2015
```
$ docker-compose build
$ docker-compose up -d
Creating goecho_echo_1...

$ docker-compose ps
    Name           Command       State           Ports
---------------------------------------------------------------
goecho_echo_1   go-wrapper run   Up      0.0.0.0:8080->8000/tcp

$ curl http://localhost:8080/
<!doctype html>
<html>
<body>
        Hello Echo.
</body>
</html>
$ curl http://localhost:8080/hello
Hello, World!

$ curl http://localhost:8080/users
{"1":{"id":"1","name":"HelloEchoUserName"}}

$ curl http://localhost:8080/users/1
{"id":"1","name":"HelloEchoUserName"}

$ curl -H "Content-Type: application/json" -X POST -d '{"id":"2","name":"PostEcho"}' http://localhost:8080/users

$ curl http://localhost:8080/users
{"1":{"id":"1","name":"HelloEchoUserName"},"2":{"id":"2","name":"PostEcho"}}

```

gofmt
-----
```
$ gvm use go1.4.2
Now using version go1.4.2
$ go version
go version go1.4.2 linux/amd64
$ gofmt -w .

```
