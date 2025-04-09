-- +goose Up
-- +goose StatementBegin
alter table products
  drop discount;

alter table products
  add discount smallint generated always as (case when price_off is null or price_off = 0 then null else ceil(1::numeric  / (price - price_off) * 100) end) stored;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
alter table products
  drop discount;

alter table products
  add discount smallint generated always as (case when price_off is null or price_off = 0 then ceil(1::numeric  / (price - price_off) * 100) else null end) stored;
-- +goose StatementEnd
