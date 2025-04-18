-- +goose Up
-- +goose StatementBegin
create extension if not exists hstore;

create table categories (
    id      bigint          primary key generated always as identity,
    image   text            not null,
    name_fa varchar(256)    not null    unique,
    name_en varchar(256)    not null    unique
);

create table products (
    id          bigint          primary key generated always as identity,
    category_id bigint          not null    references categories(id),
    images      text[]          not null    check (array_length(images, 1) > 0),
    name_fa     varchar(2048)   not null    unique,
    name_en     varchar(2048)   not null    unique,
    description text            not null,
    attributes  hstore          not null,
    price       bigint          not null    check (price > 0),
    price_off   bigint                      check (price_off is null or (price_off > 0 and price_off < price)),
    discount    smallint                    check (discount is null or (discount >= 0 and discount <= 100))
                                                generated always as (case when price_off is null or price_off = 0 then ceil(1::numeric  / (price - price_off) * 100) else null end) stored,
    quantity    bigint          not null  check (quantity >= 0)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table products;
drop table categories;
-- +goose StatementEnd
