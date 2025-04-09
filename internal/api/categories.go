package api

import (
	"net/http"
	"shopi-api/internal/api/database"

	"github.com/labstack/echo/v4"
)

type ListCategoriesRow = database.ListCategoriesRow

type ListCategoriesResponse []ListCategoriesRow

// @Summary		Lists the categories
// @Produce		json
// @Tags		Public
// @Success		200		{array}		ListCategoriesRow
// @Failure		500		{object}	HTTPError
// @Router		/public/categories [get]
func (a *API) ListCategories(c echo.Context) error {
	categories, err := a.DB.ListCategories(c.Request().Context())
	if err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError, "خطایی در لیست کردن دسته‌بندی‌ها رخ داده است.")
	}

	return c.JSON(http.StatusOK, ListCategoriesResponse(categories))
}
