# Contributing

## Adding a New Service

Each service follows the same structure. To add one:

1. Create a directory under the relevant category (e.g. `db/`, or a new top-level dir)
2. Add `docker-compose.yml`, `.env`, and `.env.example` inside it
3. Use an external Docker network (named consistently with the service)
4. Add a Prometheus exporter service where one exists for the technology
5. Register the network and startup in `start-all.sh` and `stop-all.sh`

## Pull Requests

- Keep PRs scoped to one service or one concern
- Include a brief description of what the service does and why it's useful
- Test that `./start-all.sh` and `./stop-all.sh` work end-to-end before submitting

## Reporting Issues

Use the GitHub issue templates for bug reports and feature requests.
