-- +goose Up
-- +goose StatementBegin
create table hero_sliders (
    id          bigint      primary key generated always as identity,
    url         text        not null unique,
    image       text        not null,
    priority    smallint    not null
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table hero_sliders;
-- +goose StatementEnd
