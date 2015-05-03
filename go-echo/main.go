package main

import (
	"app/boltlib"
	"github.com/labstack/echo"
	mw "github.com/labstack/echo/middleware"
	"net/http"
)

type (
	user struct {
		ID   string `json:"id"`
		Name string `json:"name"`
	}
)

var (
	users map[string]user
)

func createUser(c *echo.Context) error {
	u := new(user)
	if err := c.Bind(u); err != nil {
		return err
	}
	users[u.ID] = *u
	return c.JSON(http.StatusCreated, u)
}

func getUsers(c *echo.Context) error {
	return c.JSON(http.StatusOK, users)
}

func getUser(c *echo.Context) error {
	return c.JSON(http.StatusOK, users[c.P(0)])
}

// Handler
func hello(c *echo.Context) {
	c.String(http.StatusOK, "Hello, World!\n")
}

func main() {

	boltlib.Open()
	defer boltlib.Close()
	boltlib.Initial()

	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(mw.Logger)

	e.Post("/users", createUser)
	e.Get("/users", getUsers)
	e.Get("/users/:id", getUser)

	// Routes
	e.Get("/hello", hello)

	// Serve index file
	e.Index("public/index.html")

	// Start server
	e.Run(":8000")
}

func init() {
	users = map[string]user{
		"1": user{
			ID:   "1",
			Name: "HelloEchoUserName",
		},
	}
}
