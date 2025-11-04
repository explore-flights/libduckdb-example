package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os/signal"
	"syscall"

	"github.com/duckdb/duckdb-go/v2"
)

func main() {
	ctx, cancel := signal.NotifyContext(context.Background(), syscall.SIGINT, syscall.SIGTERM)
	defer cancel()

	if err := run(ctx); err != nil {
		log.Fatal(err)
	}
}

func run(ctx context.Context) error {
	connector, err := duckdb.NewConnector("", nil)
	if err != nil {
		return fmt.Errorf("failed to connect to duckdb: %w", err)
	}
	defer connector.Close()

	database := sql.OpenDB(connector)
	defer database.Close()

	conn, err := database.Conn(ctx)
	if err != nil {
		return fmt.Errorf("failed to connect to database: %w", err)
	}
	defer conn.Close()

	rows, err := conn.QueryContext(ctx, "SELECT extension_name FROM duckdb_extensions() WHERE install_path = '(BUILT-IN)'")
	if err != nil {
		return fmt.Errorf("failed to query duckdb_extensions: %w", err)
	}
	defer rows.Close()

	var extensionName string
	for rows.Next() {
		if err = rows.Scan(&extensionName); err != nil {
			return fmt.Errorf("failed to scan: %w", err)
		}

		fmt.Println(extensionName)
	}

	return nil
}
