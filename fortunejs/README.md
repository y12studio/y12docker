Thu Apr 23 12:41:47 CST 2015
----------------------------
[Fortune.js - a framework for prototyping hypermedia APIs](http://fortunejs.com/)
```
$ docker-compose build
$ docker-compose up -d
$ docker-compose ps
        Name             Command    State           Ports
------------------------------------------------------------------
fortunejs_fortunejs_1   npm start   Up      0.0.0.0:8080->8080/tcp
$ docker-compose logs
Creating fortunejs_fortunejs_1...
Attaching to fortunejs_fortunejs_1
fortunejs_1 |
fortunejs_1 | > fortunejs-app@0.0.1 start /usr/src/app
fortunejs_1 | > node app.js
fortunejs_1 |
fortunejs_1 | A fortune is available on port 8080...
$ curl http://localhost:8080/people
{
  "people": [],
  "links": {
    "people.pets": {
      "href": "/pets/{people.pets}",
      "type": "pets"
    }
  }
}
$ curl http://localhost:8080/pets
{
  "pets": [],
  "links": {
    "pets.owner": {
      "href": "/people/{pets.owner}",
      "type": "people"
    }
  }
}
$ curl -H "Content-Type: application/vnd.api+json" -X POST -d '{"people":[{"name":"alice","age":19}]}' http://localhost:8080/people
{
  "error": "Request was malformed.",
  "detail": "TypeError: Cannot read property 'forEach' of undefined"
}

```

[Assert "Cannot call method 'forEach' of undefined" · Issue #58 · fortunejs/fortune](https://github.com/fortunejs/fortune/issues/58)
