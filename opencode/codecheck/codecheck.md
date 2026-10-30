---
description: "Quality gate before commit/PR/submission — nine checks in a result table, including code coverage and the design principles SoC, SOLID, DRY, KISS, YAGNI. Usage: /codecheck or /codecheck <file|folder|commit-range>"
---

# Codecheck

> This command was created together, live, during the AI course at Plushögskolan.
> It is a starting point — adapt the checks and principles to your own stack and standards.

A quality gate you run before committing, opening a PR, or handing in an assignment.
Nine checks. Evidence required. No green tick without proof.

---

## Scope

`$ARGUMENTS` if provided, otherwise: unstaged + staged changes  
(`git status --short`, `git diff`, `git diff --staged`).

---

## The nine checks

Run them in order. For each check: show the evidence, then fill in the table.

| # | Check | OK? | Comment |
|---|-------|-----|---------|
| 1 | **Builds without errors** | | |
| 2 | **Tests pass** | | |
| 3 | **Code coverage** | | |
| 4 | **No obvious security issues** | | |
| 5 | **SoC — Separation of Concerns** | | |
| 6 | **SOLID** (one row per letter) | | |
| 7 | **DRY** | | |
| 8 | **KISS** | | |
| 9 | **YAGNI** | | |

---

## Final verdict

🟢 **Ready** — all checks pass, no blockers  
🟡 **Fix first** — minor issues, list them  
🔴 **Not ready** — blocking issues, list them

End with: **"Fix first:"** followed by the single most important thing to address.

---

## Two checks that need extra care

### Code coverage

Use the tool that is already in the project. **Never install `pytest-cov`, `coverage`,
or similar without asking first.** If no coverage tool is set up, write:
`⚠️ Cannot verify — suggest: <command to set it up>`

### SOLID + DRY / KISS / YAGNI / SoC

Assess each principle with a concrete example from the code, in this order:
**SoC → S → O → L → I → D → DRY → KISS → YAGNI**

Flag over-engineering just as fast as violations:
- An interface with only one implementation (probably unnecessary)
- An abstraction that adds indirection without adding clarity
- Code golf that sacrifices readability for brevity

The goal is balance, not compliance theatre.

---

## What "evidence" means

- **Builds:** paste the last line of the build output
- **Tests:** paste the test summary line (`5 passed`, `3 failed`, etc.)
- **Coverage:** paste the coverage percentage
- **Design principles:** quote a specific function, class, or file and explain what you see

A green tick without a quote, a line number, or a command output is not evidence.
