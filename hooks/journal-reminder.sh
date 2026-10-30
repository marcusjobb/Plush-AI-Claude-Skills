#!/usr/bin/env bash
# UserPromptSubmit hook — nudges Claude to offer /journal ask me
# every INTERVAL seconds. The first prompt of a session only starts the clock.
#
# Compatible with: Linux, macOS
# Requires: jq
#
# Install: add this as a UserPromptSubmit hook in your .claude/settings.json
# See: https://docs.anthropic.com/en/docs/claude-code/hooks
#
# Example settings.json entry:
#   "hooks": {
#     "UserPromptSubmit": [
#       {
#         "matcher": "",
#         "hooks": [{ "type": "command", "command": "~/.claude/hooks/journal-reminder.sh" }]
#       }
#     ]
#   }

INTERVAL=1200  # seconds (20 minutes)

sid=$(jq -r '.session_id // empty')
[ -z "$sid" ] && exit 0

state_dir="$HOME/.claude/state"
mkdir -p "$state_dir"
state_file="$state_dir/journal-reminder-$sid"

now=$(date +%s)

if [ ! -f "$state_file" ]; then
  echo "$now" > "$state_file"
  exit 0
fi

last=$(cat "$state_file")
[ $((now - last)) -lt $INTERVAL ] && exit 0

echo "$now" > "$state_file"

jq -nc '{
  hookSpecificOutput: {
    hookEventName: "UserPromptSubmit",
    additionalContext: "20+ minutes since the last check-in. At a natural pause in your reply, offer once, in one short friendly line, to run /journal ask me for a quick mental offload. Do not insist; if declined, drop it."
  }
}'
