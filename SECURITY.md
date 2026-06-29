# Security Policy

## Credential Handling

This stack uses `.env` files for credentials. These are gitignored and must never be committed.
Always copy `.env.example` to `.env` and fill in your own values before running any service.

The default credentials in `.env.example` files are placeholders for local development only.
Do not use them in any internet-facing environment.

## Reporting a Vulnerability

If you discover a security issue in this project, please report it privately by opening a
[GitHub Security Advisory](../../security/advisories/new) rather than a public issue.

Provide a description of the issue, steps to reproduce, and potential impact.
You can expect an acknowledgement within 72 hours.
