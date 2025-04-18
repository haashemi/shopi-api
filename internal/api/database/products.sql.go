// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0
// source: products.sql

package database

import (
	"context"

	"github.com/jackc/pgx/v5/pgtype"
)

const getProduct = `-- name: GetProduct :one
select
    p.images,
    p.name_fa,
    p.name_en,
    p.description,
    p.attributes,
    p.price, -- known as priceWithDiscount
    p.price_off, -- known as priceWithoutDiscount
    p.discount, 
    p.quantity,
    c.id      as category_id,
    c.name_fa as category_name,
    c.image   as category_image
from products p 
join categories c on c.id = p.category_id
where p.id = $1
`

type GetProductRow struct {
	Images        []string      `json:"images"`
	NameFa        string        `json:"nameFa"`
	NameEn        string        `json:"nameEn"`
	Description   string        `json:"description"`
	Attributes    pgtype.Hstore `json:"attributes"`
	Price         int64         `json:"price"`
	PriceOff      *int64        `json:"priceOff"`
	Discount      *int16        `json:"discount"`
	Quantity      int64         `json:"quantity"`
	CategoryID    int64         `json:"categoryId"`
	CategoryName  string        `json:"categoryName"`
	CategoryImage string        `json:"categoryImage"`
}

func (q *Queries) GetProduct(ctx context.Context, id int64) (GetProductRow, error) {
	row := q.db.QueryRow(ctx, getProduct, id)
	var i GetProductRow
	err := row.Scan(
		&i.Images,
		&i.NameFa,
		&i.NameEn,
		&i.Description,
		&i.Attributes,
		&i.Price,
		&i.PriceOff,
		&i.Discount,
		&i.Quantity,
		&i.CategoryID,
		&i.CategoryName,
		&i.CategoryImage,
	)
	return i, err
}

const listProducts = `-- name: ListProducts :many
select
    id,
    name_fa as name,
    images[1]::text as image,
    price,
    price_off,
    discount,
    quantity = 0 as out_of_stock
from products
order by
    quantity = 0,
    case when $1::text = 'name'          then name_fa end asc,
    case when $1::text = 'price_highest' then price end desc,
    case when $1::text = 'price_lowest'  then price end asc
`

type ListProductsRow struct {
	ID         int64  `json:"id"`
	Name       string `json:"name"`
	Image      string `json:"image"`
	Price      int64  `json:"price"`
	PriceOff   *int64 `json:"priceOff"`
	Discount   *int16 `json:"discount"`
	OutOfStock bool   `json:"outOfStock"`
}

func (q *Queries) ListProducts(ctx context.Context, orderBy string) ([]ListProductsRow, error) {
	rows, err := q.db.Query(ctx, listProducts, orderBy)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []ListProductsRow{}
	for rows.Next() {
		var i ListProductsRow
		if err := rows.Scan(
			&i.ID,
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
