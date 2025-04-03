package postgres

import (
	"context"
	"embed"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/jackc/pgx/v5/stdlib"
	"github.com/pressly/goose/v3"
)

//go:embed migrations/*.sql
var migrations embed.FS

type Connection struct {
	Conn *pgxpool.Pool
}

func Connect(connString string) (*Connection, error) {
	conn, err := pgxpool.New(context.Background(), connString)
	if err != nil {
		return nil, err
	}

	return &Connection{Conn: conn}, nil
}

func (q *Connection) Migrate() error {
	goose.SetBaseFS(migrations)

	if err := goose.SetDialect("postgres"); err != nil {
		return err
	}

	db := stdlib.OpenDBFromPool(q.Conn)

	if err := goose.Up(db, "migrations"); err != nil {
		return err
	}

	return nil
}
