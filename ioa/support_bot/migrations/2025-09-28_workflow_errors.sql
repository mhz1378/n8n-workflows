-- Migration: create workflow_errors table

CREATE TABLE IF NOT EXISTS workflow_errors (
    id BIGSERIAL PRIMARY KEY,
    workflow_id BIGINT,
    workflow_name TEXT,
    execution_id BIGINT,
    last_node_executed TEXT,
    error_message TEXT,
    json_payload JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Ensure columns exist (for idempotency)
ALTER TABLE workflow_errors
  ADD COLUMN IF NOT EXISTS workflow_id BIGINT,
  ADD COLUMN IF NOT EXISTS workflow_name TEXT,
  ADD COLUMN IF NOT EXISTS execution_id BIGINT,
  ADD COLUMN IF NOT EXISTS last_node_executed TEXT,
  ADD COLUMN IF NOT EXISTS error_message TEXT,
  ADD COLUMN IF NOT EXISTS json_payload JSONB,
  ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();
