#!/bin/bash

# Start Docker Desktop if not running
if ! pgrep -f "Docker Desktop" > /dev/null; then
  echo "Starting Docker Desktop..."
  open -a Docker
fi

# Wait for Docker daemon
echo "Waiting for Docker to be ready..."
until docker info > /dev/null 2>&1; do
  sleep 2
done

echo "Docker is running"

# Start services
docker compose up -d

