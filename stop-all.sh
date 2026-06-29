#!/usr/bin/env bash

# Define ANSI colors for logging
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

warn() {
    echo -e "${RED}[WARN]${NC} $1"
}

# 1. Stop RustFS Stack
log "Stopping RustFS Stack..."
if [ -d "rustfs" ]; then
    cd rustfs && docker compose down && cd ..
else
    warn "Directory 'rustfs' not found. Skipping."
fi

# 2. Stop Redis Stack
log "Stopping Redis Stack..."
if [ -d "redis" ]; then
    cd redis && docker compose down && cd ..
else
    warn "Directory 'redis' not found. Skipping."
fi

# 3. Stop MySQL Stack
log "Stopping MySQL Stack..."
if [ -d "db/mysql" ]; then
    cd db/mysql && docker compose down && cd ../../
else
    warn "Directory 'db/mysql' not found. Skipping."
fi

# 4. Stop Postgres Stack
log "Stopping PostgreSQL Stack..."
if [ -d "db/postgres" ]; then
    cd db/postgres && docker compose down && cd ../../
else
    warn "Directory 'db/postgres' not found. Skipping."
fi

echo "--------------------------------------------"
log "All application stacks have been stopped."
echo "--------------------------------------------"
