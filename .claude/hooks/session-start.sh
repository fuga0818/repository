#!/bin/bash
set -euo pipefail

# Only run in remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Copy CLAUDE.md and skills to global ~/.claude/
mkdir -p ~/.claude/skills
cp "$CLAUDE_PROJECT_DIR/CLAUDE.md" ~/.claude/CLAUDE.md
cp -r "$CLAUDE_PROJECT_DIR/.claude/skills/." ~/.claude/skills/
echo "[$(date '+%Y-%m-%d %H:%M:%S')] CLAUDE.md + skills synced (session: ${CLAUDE_SESSION_ID:-unknown})" >> ~/claude-hook.log
