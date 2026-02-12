#!/bin/bash

set -e

CONTAINER_NAME="my-postgres"
PG_USER="postgres"

usage() {
  echo "Usage: $0 <database_name>"
  echo "  Creates the given database in the Postgres container if it does not exist."
  echo "  Example: $0 todos"
  exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

DB_NAME="$1"

# Allow only alphanumeric and underscore (safe for SQL identifiers)
if ! [[ "$DB_NAME" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
  echo "Error: database name must be a valid identifier (letters, numbers, underscore)."
  exit 1
fi

# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Error: Postgres container '${CONTAINER_NAME}' is not running."
  echo "Start it with: ./start.sh"
  exit 1
fi

# Create database only if it doesn't exist
EXISTS=$(docker exec "$CONTAINER_NAME" psql -U "$PG_USER" -tAc "SELECT 1 FROM pg_database WHERE datname = '$DB_NAME'")

if [ "$EXISTS" = "1" ]; then
  echo "Database '$DB_NAME' already exists."
else
  docker exec "$CONTAINER_NAME" psql -U "$PG_USER" -c "CREATE DATABASE \"$DB_NAME\""
  echo "Database '$DB_NAME' created."
fi
