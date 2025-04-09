package api

import (
	"net/http"
	"shopi-api/internal/api/database"

	"github.com/jackc/pgx/v5"
	"github.com/labstack/echo/v4"
)

type ListProductsRequest struct {
	OrderBy string `query:"orderBy" validation:"omitempty,oneof=name price_highest price_lowest"`
}

type ListProductsRow = database.ListProductsRow

type ListProductsResponse []ListProductsRow

// @Summary		Lists the products
// @Produce		json
// @Tags		Public
// @Param		orderBy	query		string	false	"Product list order"	Enums(name, price_highest, price_lowest)
// @Success		200		{array}		ListProductsRow
// @Failure		400		{object}	HTTPError
// @Failure		500		{object}	HTTPError
// @Router		/public/products [get]
func (a *API) ListProducts(c echo.Context) error {
	var body ListProductsRequest
	if err := bind(c, &body); err != nil {
		return err
	}

	products, err := a.DB.ListProducts(c.Request().Context(), body.OrderBy)
	if err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError, "خطایی در لیست کردن محصولات رخ داده است.")
	}

	return c.JSON(http.StatusOK, ListProductsResponse(products))
}

type GetProductRequest struct {
	ID int64 `param:"id" validation:"required,gt=0"`
}

type GetProductResponse database.GetProductRow

// @Summary		Fetches a product info
// @Produce		json
// @Tags		Public
// @Param		id	    path		int	true	"Product ID"
// @Success		200		{object}	GetProductResponse
// @Failure		400		{object}	HTTPError
// @Failure		404		{object}	HTTPError
// @Failure		500		{object}	HTTPError
// @Router		/public/products/{id} [get]
func (a *API) GetProduct(c echo.Context) error {
	var body GetProductRequest
	if err := bind(c, &body); err != nil {
		return err
	}

	product, err := a.DB.GetProduct(c.Request().Context(), body.ID)
	if err != nil {
		if err == pgx.ErrNoRows {
			return echo.NewHTTPError(http.StatusNotFound, "محصولی با این شناسه پیدا نشد.")
		}
		return echo.NewHTTPError(http.StatusInternalServerError, "خطایی در هنگام یافتن محصول رخ داد.")
	}

	return c.JSON(http.StatusOK, GetProductResponse(product))
}
