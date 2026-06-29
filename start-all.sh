#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define ANSI colors for pretty logging
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# 1. Ensure required external Docker networks exist
log "Checking and preparing internal Docker networks..."
docker network inspect psql-db >/dev/null 2>&1 || (log "Creating network: psql-db" && docker network create psql-db)
docker network inspect cache-net >/dev/null 2>&1 || (log "Creating network: cache-net" && docker network create cache-net)
docker network inspect store-net >/dev/null 2>&1 || (log "Creating network: store-net" && docker network create store-net)
docker network inspect mysql-net >/dev/null 2>&1 || (log "Creating network: mysql-net" && docker network create mysql-net)

# 2. Spin up Postgres Stack
log "Starting PostgreSQL Stack..."
cd db/postgres
docker compose up -d
cd ../../
success "PostgreSQL stack is up."

# 3. Spin up MySQL Stack
log "Starting MySQL Stack..."
cd db/mysql
docker compose up -d
cd ../../
success "MySQL stack is up."

# 4. Spin up Redis Stack
log "Starting Redis Stack..."
cd redis
docker compose up -d
cd ..
success "Redis stack is up."

# 5. Spin up RustFS Stack
log "Starting RustFS Stack..."
cd rustfs
docker compose up -d
cd ..
success "RustFS stack is up."

echo "--------------------------------------------"
success "All application stacks are up and running!"
echo "--------------------------------------------"
