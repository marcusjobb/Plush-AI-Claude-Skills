#!/usr/bin/env bash
# Git post-commit hook — logs each commit to the journal automatically.
#
# Works on: Linux, macOS
# Requires: Python 3, journal.py
#
# Installation (per repo):
#   cp hooks/post-commit.sh /path/to/your/repo/.git/hooks/post-commit
#   chmod +x /path/to/your/repo/.git/hooks/post-commit
#
# Update JOURNAL_SCRIPT below to match where you placed journal.py.

JOURNAL_SCRIPT="$HOME/.claude/skills/journal/journal.py"

if [ ! -f "$JOURNAL_SCRIPT" ]; then
  echo "post-commit: journal.py not found at $JOURNAL_SCRIPT — skipping." >&2
  exit 0
fi

msg=$(git log -1 --pretty=%B | head -5 | tr '\n' ' ' | sed 's/[[:space:]]*$//')
repo=$(basename "$(git rev-parse --show-toplevel)")

python3 "$JOURNAL_SCRIPT" "Committed in $repo: $msg"
