package api

import (
	"net/http"

	_ "shopi-api/internal/api/database"

	"github.com/labstack/echo/v4"
)

// @Summary		Lists the products
// @Description	List all products in any amount or filter depending on the query params.
// @Tags			products
// @Produce		json
// @Success		200	{object}	database.ListProductsRow
// @Failure		400	{object}	echo.HTTPError
// @Failure		500	{object}	echo.HTTPError
// @Router			/public/products [get]
func (a *API) ListProducts(c echo.Context) error {
	products, err := a.DB.ListProducts(c.Request().Context())
	if err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError, "خطایی در لیست کردن محصولات رخ داده است.")
	}

	return c.JSON(http.StatusOK, products)
}
