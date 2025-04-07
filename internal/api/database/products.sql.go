// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0
// source: products.sql

package database

import (
	"context"
)

const listCategories = `-- name: ListCategories :many
select id, image, name_fa, name_en from categories
`

func (q *Queries) ListCategories(ctx context.Context) ([]Category, error) {
	rows, err := q.db.Query(ctx, listCategories)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Category{}
	for rows.Next() {
		var i Category
		if err := rows.Scan(
			&i.ID,
			&i.Image,
			&i.NameFa,
			&i.NameEn,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const listProducts = `-- name: ListProducts :many
select
    name_fa as name,
    images[1]::text as image,
    price,
    price_off,
    discount,
    quantity = 0 as out_of_stock
from products
`

type ListProductsRow struct {
	Name       string `json:"name"`
	Image      string `json:"image"`
	Price      int64  `json:"price"`
	PriceOff   *int64 `json:"priceOff"`
	Discount   *int16 `json:"discount"`
	OutOfStock bool   `json:"outOfStock"`
}

func (q *Queries) ListProducts(ctx context.Context) ([]ListProductsRow, error) {
	rows, err := q.db.Query(ctx, listProducts)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []ListProductsRow{}
	for rows.Next() {
		var i ListProductsRow
		if err := rows.Scan(
			&i.Name,
			&i.Image,
			&i.Price,
			&i.PriceOff,
			&i.Discount,
			&i.OutOfStock,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
