# Local Dev Stack

A containerized local development stack — fully dockerized, modular, and always ready.

Each service lives in its own directory with an isolated Docker network, `.env` config, and a Prometheus exporter where applicable.

---

## Services

| Service | Port | UI |
|---|---|---|
| PostgreSQL | `5432` | — |
| pgAdmin | `5050` | http://localhost:5050 |
| postgres-exporter | `9187` | — |
| MySQL | `3306` | — |
| phpMyAdmin | `8088` | http://localhost:8088 |
| mysql-exporter | `9104` | — |
| Redis | `6379` | — |
| RedisInsight | `5540` | http://localhost:5540 |
| redis-exporter | `9121` | — |
| RustFS (S3-compatible) | `8080` / `9090` | http://localhost:8080 |

---

## Structure

```
backend-stack/
├── db/
│   ├── postgres/          # PostgreSQL + pgAdmin + exporter
│   └── mysql/             # MySQL + phpMyAdmin + exporter
├── redis/                 # Redis + RedisInsight + exporter
├── rustfs/                # RustFS object storage
├── start-all.sh
└── stop-all.sh
```

---

## Setup

1. Copy each service's env template and fill in your values:

```bash
cp db/postgres/.env.example db/postgres/.env
cp db/mysql/.env.example     db/mysql/.env
cp redis/.env.example        redis/.env
cp rustfs/.env.example       rustfs/.env
```

2. Start the stack:

```bash
./start-all.sh
```

3. Stop everything:

```bash
./stop-all.sh
```

---

## Notes

- `.env` files are gitignored — never commit secrets.
- `*-data/` directories are gitignored — volume data stays local.
- Each service uses an external Docker network created automatically by `start-all.sh`.
- To manage a single service, `cd` into its directory and run `docker compose up -d` / `docker compose down`.
