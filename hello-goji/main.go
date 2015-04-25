package main

import (
	"net/http"
    "encoding/json"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
    "app/boltlib"
)

func apiExampleHandler(context web.C, resp http.ResponseWriter, req *http.Request) {
    p , _ := boltlib.GetPerson("101")
    encoder := json.NewEncoder(resp)
	encoder.Encode(p)
}

type Hello struct {
	Name string
	Msg  string
}

func person(c web.C, w http.ResponseWriter, r *http.Request) {
	id := c.URLParams["id"]
	if id == "" {
		id = "101"
	}
    p , _ := boltlib.GetPerson(id)
	encoder := json.NewEncoder(w)
	encoder.Encode(p)
}

func hello(c web.C, w http.ResponseWriter, r *http.Request) {
	name := c.URLParams["name"]
	if name == "" {
		name = "gopher"
	}

	hello := &Hello{
		Name: name,
		Msg:  "Hello",
	}

	encoder := json.NewEncoder(w)
	encoder.Encode(hello)
}

func main() {

    boltlib.Open()
    defer boltlib.Close()
    boltlib.Initial()

	goji.Handle("/api", apiExampleHandler)
    goji.Get("/person/:id", person)
    goji.Get("/hello/:name", hello)

	goji.Handle("/*", http.FileServer(http.Dir("./static")))

	goji.Serve()
}
