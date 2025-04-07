package config

import (
	"github.com/caarlos0/env"
	_ "github.com/joho/godotenv/autoload"
)

type Config struct {
	APIAddr     string `env:"API_ADDR"`
	PostgresURL string `env:"POSTGRES_URL"`

	SwaggerHost string `env:"SWAGGER_HOST" envDefault:"localhost"`
	SwaggerUser string `env:"SWAGGER_USER" envDefault:"developer"`
	SwaggerPass string `env:"SWAGGER_PASS" envDefault:"developer"`
}

func Load() (*Config, error) {
	config := &Config{}
	return config, env.Parse(config)
}
