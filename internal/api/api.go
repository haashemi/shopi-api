package api

import (
	"net/http"

	"shopi-api/internal/api/database"
	"shopi-api/internal/config"
	"shopi-api/internal/postgres"

	"github.com/labstack/echo/v4"
)

// TODO: Complete its implementation
type HTTPError struct {
	// Code    string `json:"code"`

	Message string `json:"message"`
}

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
		return echo.NewHTTPError(http.StatusBadRequest, "خطا در پردازش درخواست.")
	}

	err = c.Validate(body)
	if err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, "اطلاعات ورودی نامعتبر است.")
	}

	return nil
}
