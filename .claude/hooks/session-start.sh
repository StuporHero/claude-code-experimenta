#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install dependencies if package.json exists
if [ -f "$CLAUDE_PROJECT_DIR/package.json" ]; then
  npm install --prefix "$CLAUDE_PROJECT_DIR"
fi

# Install Python dependencies if requirements.txt exists
if [ -f "$CLAUDE_PROJECT_DIR/requirements.txt" ]; then
  pip install -r "$CLAUDE_PROJECT_DIR/requirements.txt"
fi

# Install Python dependencies if pyproject.toml exists
if [ -f "$CLAUDE_PROJECT_DIR/pyproject.toml" ]; then
  pip install -e "$CLAUDE_PROJECT_DIR"
fi
