package config

import (
	"github.com/caarlos0/env"
	_ "github.com/joho/godotenv/autoload"
)

type Config struct {
	APIAddr     string `env:"API_ADDR"`
	PostgresURL string `env:"POSTGRES_URL"`
}

func Load() (*Config, error) {
	config := &Config{}
	return config, env.Parse(config)
}
