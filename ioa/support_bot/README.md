# IOA Support Bot Workflows

## Workflows
- **O1 Ticket Intake (v2)** — Telegram intake, ticket DB upserts, approval request generation.
- **O3 Approval Pipeline (v1)** — Webhook endpoint, signature + TTL check, DB updates, audit, notifications.
- **Support Bot v1** — baseline version.

## DB Migrations
See `migrations/`. Required tables:
- `tickets`
- `ticket_audit`
- `workflow_errors`
- function `upsert_ticket`

## Environment Variables
See `.env.example`. Must set:
- `SECRET_KEY` (used in O1/O3 HMAC)
- `MANAGER_CHAT_ID` (for approval messages)
- `TELEGRAM_BOT_TOKEN`
- Postgres connection vars

## Usage
1. Import workflow JSON from `workflows/` into n8n (self-hosted).
2. Configure Postgres + Telegram credentials.
3. Apply migrations in `migrations/` to DB.
4. Test flow:
   - `/new` → creates ticket
   - `/update <id> resolved` → triggers approval link → approve/reject via O3.
