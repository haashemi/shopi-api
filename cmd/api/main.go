package main

import (
	"log"

	"shopi-api/internal/api"
	"shopi-api/internal/config"
	"shopi-api/internal/postgres"
)

func main() {
	conf, err := config.Load()
	if err != nil {
		log.Fatalln("Failed to load the config", err.Error())
		return
	}

	db, err := postgres.Connect(conf.PostgresURL)
	if err != nil {
		log.Fatalln("Failed to connect to the database", err.Error())
		return
	}

	if err = db.Migrate(); err != nil {
		log.Fatalln("Failed to do the migrations", err.Error())
		return
	}

	apiConf := &api.APIConfig{
		Config: conf,
		DB:     db,
	}

	RunAPI(conf, apiConf)
}
