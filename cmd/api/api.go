package main

import (
	"os"

	"github.com/haashemi/shopi-api/internal/api"
	"github.com/haashemi/shopi-api/pkg/validate"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func RunAPI(addr string, apiConf *api.APIConfig) {
	// TODO:
	// a := api.GetAPI(apiConf)

	e := echo.New()
	e.Validator = validate.NewEchoValidator()

	if os.Getenv("DEBUG") != "" {
		e.Logger.SetLevel(1)
	} else {
		e.Logger.SetLevel(3)
		e.HidePort = true
		e.HideBanner = true
	}

	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.Secure())
	e.Use(middleware.CORS())
	e.Use(middleware.Gzip())

	publicG := e.Group("/api/public")
	{
		// TODO:
		publicG.GET("/banners", func(c echo.Context) error { return echo.ErrNotImplemented })
	}

	e.Logger.Fatal(e.Start(addr))
}
