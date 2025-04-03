FROM golang:1.23.0-alpine3.20 AS build-stage

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code.
COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /shopi-api ./cmd/api

# Deploy
FROM alpine:3.20
LABEL org.opencontainers.image.source=https://github.com/haashemi/shopi-api

WORKDIR /

COPY --from=build-stage /shopi-api /shopi-api

EXPOSE 8080

# Run
CMD ["/shopi-api"]
