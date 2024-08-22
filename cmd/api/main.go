package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/obynonwane/subscription-service/data"
)

const webPort = "80"

type Config struct {
	DB     *sql.DB
	Models data.Models
}

func main() {
	app := Config{}

	log.Printf("starting subscription service on port %s\n", webPort)
	//define http server
	srv := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: app.routes(),
	}

	//start the server
	err := srv.ListenAndServe()
	if err != nil {
		log.Panic(err)
	}
}
