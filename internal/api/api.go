package api

import (
	"net/http"

	"shopi-api/internal/api/database"
	"shopi-api/internal/config"
	"shopi-api/internal/postgres"

	"github.com/labstack/echo/v4"
)

type API struct {
	*APIConfig
	DB *database.Queries
}

type APIConfig struct {
	*config.Config
	DB *postgres.Connection
}

func GetAPI(conf *APIConfig) *API {
	return &API{
		APIConfig: conf,
		DB:        database.New(conf.DB.Conn),
	}
}

func bind(c echo.Context, body any) *echo.HTTPError {
	err := c.Bind(body)
	if err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, "Request binding failed.")
	}

	err = c.Validate(body)
	if err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, "Request validation failed.")
	}

	return nil
}
