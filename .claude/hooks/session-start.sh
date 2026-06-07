#!/bin/bash
set -euo pipefail

# Only run in remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Copy project CLAUDE.md to global ~/.claude/CLAUDE.md
mkdir -p ~/.claude
cp "$CLAUDE_PROJECT_DIR/CLAUDE.md" ~/.claude/CLAUDE.md
echo "[$(date '+%Y-%m-%d %H:%M:%S')] CLAUDE.md synced (session: ${CLAUDE_SESSION_ID:-unknown})" >> ~/claude-hook.log
