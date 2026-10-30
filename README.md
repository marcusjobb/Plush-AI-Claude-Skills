# Plush AI Claude Skills

> **Author:** [Marcus Ackre Medina](https://www.linkedin.com/in/marcusmedina/) — AI & programming teacher  
> Created during the AI course at Plushögskolan, together with students.

A small collection of AI assistant skills — prompts, hooks, and scripts — built to make
daily developer workflows a little more humane.

They started as Claude Code skills but the underlying ideas work in any AI assistant
that supports custom instructions or system prompts.

---

## What's here

| Skill | What it does |
|-------|-------------|
| [`skills/journal/`](#journal) | Keeps a living development logbook — automatically |
| [`skills/session-reminder/`](#session-reminder) | Reminds you (and the AI) when it's time to start fresh |
| [`opencode/codecheck/`](#codecheck) | Nine-point quality gate before commit or submission |

---

## Installation by AI assistant

### Claude Code

1. Copy the skill folder into your `.claude/skills/` directory:
   ```
   ~/.claude/skills/journal/
   ~/.claude/skills/session-reminder/
   ```
2. The skill is available automatically — invoke with `/journal` or `/session-reminder`.
3. For hooks, copy the `.sh` file to `~/.claude/hooks/` and register it in
   `~/.claude/settings.json` (see each skill's own README for the exact snippet).

### Cursor

1. Copy the `SKILL.md` content into `.cursor/rules/<skill-name>.mdc` in your project,
   or into the global rules at `~/.cursor/rules/`.
2. Cursor picks up `.mdc` files automatically and applies them as context.

For the journal Python script, keep it anywhere on disk and update the path in the rule.

### Windsurf

1. Copy the `SKILL.md` content into `.windsurfrules` at the project root,
   or into the global `~/.codeium/windsurf/memories/global_rules.md`.
2. Windsurf reads these files as persistent instructions for Cascade.

### GitHub Copilot (VS Code / JetBrains)

1. Copy the `SKILL.md` content into `.github/copilot-instructions.md` in your repo.
2. Copilot reads this file as custom instructions for the whole repository.

For personal (cross-repo) instructions, add the content to Copilot's custom instructions
in VS Code settings: **GitHub Copilot → Custom Instructions**.

### Any AI with a system prompt

If your assistant supports a system prompt or custom instructions field, paste the
contents of the relevant `SKILL.md` directly into it. The skills are plain markdown —
no tool-specific syntax required.

---

## Skills

### Journal

`skills/journal/`

Keeps a living development logbook in `~/Documents/journal/YYYY-MM.md`.

- Triggers automatically at the end of productive sessions
- Interactive mode with `/journal ask me` for reflective prompts
- Entries are local markdown — nothing is transmitted anywhere
- Cross-platform: works on Linux, macOS, Windows (Python 3.8+)

**Quick start:**
```bash
python3 skills/journal/journal.py "Fixed the auth token refresh bug. Took way longer than expected — the issue was a race condition in the refresh lock."
```

See [`skills/journal/SKILL.md`](skills/journal/SKILL.md) for the full skill definition.

---

### Session Reminder

`skills/session-reminder/`

Teaches the AI to notice when the conversation has drifted into a new topic and suggest
opening a fresh session — before context bloat degrades the quality of responses.

Also includes an optional hook (`hooks/session-reminder.sh`) that nudges you every
20 minutes to check in or consider switching sessions.

See [`skills/session-reminder/SKILL.md`](skills/session-reminder/SKILL.md) for details.

---

### Codecheck

`opencode/codecheck/`

A nine-point quality gate before a commit, PR or assignment submission.

Covers: build, tests, coverage, security, and the design principles
**SoC → S → O → L → I → D → DRY → KISS → YAGNI**.

Every check requires evidence. No green tick without proof.

> Created live during the AI course at Plushögskolan.

See [`opencode/codecheck/codecheck.md`](opencode/codecheck/codecheck.md) for the full prompt.

---

## Hooks

`hooks/journal-reminder.sh` — a `UserPromptSubmit` hook that nudges the AI to offer
`/journal ask me` every 20 minutes. Linux/macOS only. Requires `jq`.

---

## License

MIT — use, adapt, and share freely. A mention is always appreciated.
