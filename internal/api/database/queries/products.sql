-- name: ListProducts :many
select
    name_fa as name,
    images[1]::text as image,
    price,
    price_off,
    discount,
    quantity = 0 as out_of_stock
from products;

-- name: ListCategories :many
select * from categories;
