[golang Repository | Docker Hub Registry - Repositories of Docker Images](https://registry.hub.docker.com/_/golang/)
```
i$ docker-compose up -d
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
```
