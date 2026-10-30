#!/usr/bin/env bash
# UserPromptSubmit hook — nudges Claude to offer a session check-in or switch
# every INTERVAL seconds. The first prompt only starts the clock; no reminder then.
#
# Compatible with: Linux, macOS
# Requires: jq
#
# Install: add this as a UserPromptSubmit hook in your .claude/settings.json
# See: https://docs.anthropic.com/en/docs/claude-code/hooks

INTERVAL=1200  # seconds (20 minutes)

sid=$(jq -r '.session_id // empty')
[ -z "$sid" ] && exit 0

state_dir="$HOME/.claude/state"
mkdir -p "$state_dir"
state_file="$state_dir/session-reminder-$sid"

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
    additionalContext: "20+ minutes have passed in this session. At a natural pause, briefly ask the user if they want to do a quick check-in (/journal ask me) or whether this is turning into a new topic that deserves its own session. One sentence only. Do not insist."
  }
}'
