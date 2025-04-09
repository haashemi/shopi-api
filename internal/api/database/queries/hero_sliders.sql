-- name: ListHeroSliders :many
select 
    url,
    image
from
    hero_sliders
order by
    priority desc;
