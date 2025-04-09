package api

import (
	"net/http"
	"shopi-api/internal/api/database"

	"github.com/labstack/echo/v4"
)

type ListHeroSlidersRow = database.ListHeroSlidersRow

type ListHeroSlidersResponse []ListHeroSlidersRow

// @Summary		Lists the hero sliders
// @Produce		json
// @Tags		Public
// @Success		200		{array}		ListHeroSlidersRow
// @Failure		500		{object}	HTTPError
// @Router		/public/hero-sliders [get]
func (a *API) ListHeroSliders(c echo.Context) error {
	categories, err := a.DB.ListHeroSliders(c.Request().Context())
	if err != nil {
		return echo.NewHTTPError(http.StatusInternalServerError, "خطایی در لیست کردن اسلایدرها رخ داده است.")
	}

	return c.JSON(http.StatusOK, ListHeroSlidersResponse(categories))
}
