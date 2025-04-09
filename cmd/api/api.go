package main

import (
	"os"

	"shopi-api/docs"
	"shopi-api/internal/api"
	"shopi-api/internal/config"
	"shopi-api/pkg/validate"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	echoSwagger "github.com/swaggo/echo-swagger"
)

// @title		Shopi API
// @version		1.0
// @description	Experimental e-commerce API
//
// @contact.name	Ali Hashemi
// @contact.url		http://haashemi.dev
// @contact.email	contact@haashemi.dev
func RunAPI(conf *config.Config, apiConf *api.APIConfig) {
	docs.SwaggerInfo.Host = conf.SwaggerHost
	docs.SwaggerInfo.BasePath = "/api"
	docs.SwaggerInfo.Schemes = []string{"https"}

	a := api.GetAPI(apiConf)
	e := echo.New()
	e.Validator = validate.NewEchoValidator()

	if os.Getenv("DEBUG") != "" {
		e.Logger.SetLevel(1)
		docs.SwaggerInfo.Schemes = append(docs.SwaggerInfo.Schemes, "http")
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
		publicG.GET("/categories", a.ListCategories)

		publicG.GET("/hero-sliders", a.ListHeroSliders)

		publicG.GET("/products", a.ListProducts)
		publicG.GET("/products/:id", a.GetProduct)
	}

	// As it's just an experimental API, I don't really care about using basic auth here.
	e.GET(
		"/swagger/*",
		echoSwagger.WrapHandler,
		middleware.BasicAuth(func(username, password string, c echo.Context) (bool, error) {
			if username == conf.SwaggerUser && password == conf.SwaggerPass {
				return true, nil
			}
			return false, nil
		}),
	)

	e.Logger.Fatal(e.Start(conf.APIAddr))
}
