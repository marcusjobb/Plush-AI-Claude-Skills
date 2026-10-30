---
name: session-reminder
description: Reminds Claude (and the user) to start a fresh session when the conversation drifts to a new topic, project, or context. One topic per session keeps context clean and responses sharp.
---

# Session Reminder

One topic per session. This skill helps enforce that boundary.

## Why it matters

Language models degrade as context grows. A session that started on one project and drifted
into three others will produce worse answers for all of them — old decisions become invisible,
earlier constraints get forgotten, and mistakes follow.

A fresh session with good context files is faster and more reliable than continuing a
bloated conversation.

## When Claude should suggest a new session

- The user starts asking about a different project or codebase
- The topic shifts from code to planning, or from one language to another
- The user mentions "while I have you" and introduces something unrelated
- The session has been going for 2–3 hours or 10+ significant exchanges

## How to suggest it

Brief and practical, not ceremonial:

> That looks like a separate track — want to open a new session for it?

Give a suggested starting prompt for the new session:

> New session starting prompt: "Review the auth middleware in /src/auth.ts — focus on the token refresh flow."

Write it so the new session can start without any context from this one.

## After suggesting

Wait for the user's answer. Do not start answering the new question until they confirm
or decline. If they decline, continue in the current session.

## At the end of a session

Before the user leaves, prompt them to:

1. Commit any open work
2. Note the exact next step somewhere (a file, a comment, a task)
3. Save any decisions that the next session will need

Do not frame this as an ending. Frame it as setup for the next session:

> Before we wrap — want to note the next step somewhere so the new session picks up clean?

---

## Hook (optional)

The `hooks/` folder contains a shell script that nudges the user every 20 minutes to
consider a mental check-in or session switch. See `hooks/session-reminder.sh`.

---

## Installation

Copy this folder (`session-reminder/`) into your `.claude/skills/` directory.
To install the hook, see `hooks/session-reminder.sh` and your platform's hook setup instructions.
