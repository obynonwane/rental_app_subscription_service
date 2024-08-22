package main

import (
	"net/http"
)

func (app *Config) Subscription(w http.ResponseWriter, r *http.Request) {
	payload := jsonResponse{
		Error:   false,
		Message: "hit the subscription change",
		Data:    nil,
	}

	_ = app.writeJSON(w, http.StatusOK, payload)
}
