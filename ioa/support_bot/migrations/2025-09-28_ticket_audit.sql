-- Migration: create ticket_audit table

CREATE TABLE IF NOT EXISTS ticket_audit (
    id BIGSERIAL PRIMARY KEY,
    ticket_id BIGINT,
    correlation_id UUID NOT NULL,
    action TEXT NOT NULL,        -- approve | reject | expired | invalid | update
    new_status TEXT,
    actor_chat_id TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
