-- name: ListCategories :many
select
    image,
    name_fa,
    name_en
from
    categories;
