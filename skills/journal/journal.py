#!/usr/bin/env python3
"""Append a timestamped entry to the monthly journal file.

Works on Linux, macOS and Windows.

Usage:
    python3 journal.py "Entry text here"
    echo "Entry text" | python3 journal.py
"""

import sys
from datetime import datetime
from pathlib import Path

JOURNAL_DIR = Path.home() / "Documents" / "journal"


def append_entry(text: str) -> None:
    text = text.replace("\\n", "\n").strip()
    if not text:
        print("No entry text provided.", file=sys.stderr)
        sys.exit(1)

    now = datetime.now()
    date_str = now.strftime("%Y-%m-%d")
    time_str = now.strftime("%H:%M")
    month_str = now.strftime("%Y-%m")
    month_name = now.strftime("%B %Y")

    JOURNAL_DIR.mkdir(parents=True, exist_ok=True)
    journal_file = JOURNAL_DIR / f"{month_str}.md"

    if not journal_file.exists():
        journal_file.write_text(f"# Journal — {month_name}\n\n---\n\n", encoding="utf-8")

    first_line = text.splitlines()[0][:60]
    entry = f"### {date_str} {time_str} — {first_line}\n\n{text}\n\n---\n\n"

    with journal_file.open("a", encoding="utf-8") as f:
        f.write(entry)

    print(f"📓 Logged to {journal_file}")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        append_entry(" ".join(sys.argv[1:]))
    else:
        append_entry(sys.stdin.read())
