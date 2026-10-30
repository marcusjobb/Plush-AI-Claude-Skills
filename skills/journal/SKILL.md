---
name: journal
description: Automatically maintain a living development journal. Trigger at the END of any conversation where something happened — code written, decisions made, problems solved, plans changed. Also trigger on /journal, /journal ask me, /journal interview, /journal reflect.
---

# Journal

A living logbook that writes itself — and opens up when you want to reflect.

## Layer 1 — Automatic Journaling

### When to trigger

End of any conversation where something happened: code written, architecture decisions made,
a problem solved, a project started or abandoned, something learned, plans changed.

**When NOT to trigger:** purely factual Q&A, small talk.

### What to write

One to four sentences. Past tense. Human voice.

> Worked on the mail aggregator today — got the IMAP polling working but ran into OAuth token
> refresh issues. Decided to shelve the Gmail integration for now and focus on local IMAP first.
> Also realised the queue module needs its own retry logic.

### How to write the entry

```bash
python3 path/to/skills/journal/journal.py "Your entry text here."
```

Replace `path/to/skills/journal/` with wherever you placed this skill's folder.
The script handles date, time, file path and formatting automatically.

After running the script, say one line only: `📓 *Logged to journal.*`  
Do not summarise what you wrote. Do not ask if it's okay.

---

## Layer 2 — Interactive Commands

### `/journal`
Ask "What do you want to log?" → format as journal entry → append.

### `/journal ask me` or `/journal interview`
3–5 conversational questions. Open with:
"Let's capture the day. I'll ask a few questions — answer as much or as little as you like."
Synthesise into a journal entry with a **Reflections** subsection.

### `/journal show` / `/journal today` / `/journal week`
Read and display recent entries cleanly (not a raw markdown dump).

### `/journal search [term]`
Search across all journal files and show matching entries with context.

---

## Tone

Write for one reader: the person who wrote it, six months from now. Not for a standup or a
manager. Honest, brief, human. If something was frustrating, say so. If something finally
clicked, let that show.

---

## Privacy

Entirely local markdown files at `~/Documents/journal/`. Nothing is transmitted.

---

## Installation

1. Copy this folder (`journal/`) into your `.claude/skills/` directory.
2. Update the `python3 path/to/...` line above to match your actual path.
3. Optional: install the `journal-reminder` hook from `hooks/` to get periodic nudges.
