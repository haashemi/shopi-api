-- name: ListProducts :many
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
    case when @order_by::text = 'name'          then name_fa end asc,
    case when @order_by::text = 'price_highest' then price end desc,
    case when @order_by::text = 'price_lowest'  then price_off end asc;

-- name: GetProduct :one
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
where p.id = @id;