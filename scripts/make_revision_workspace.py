#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import annotations

import argparse
import shutil
from datetime import datetime
from pathlib import Path


AGENT_TEMPLATE = """# Thesis Revision AGENT

## Scope

Revise only issues listed in `work/revision_issue_matrix.md` or explicitly requested by the user. Do not overwrite the original draft. Preserve user-protected objects.

## Files

- Original draft: `{draft}`
- Backup: `{backup}`
- Working DOCX: `output/revised_paper_working.docx`
- Final DOCX: `output/revised_paper_final.docx`

## Required Reads Each Session

- `work/revision_issue_matrix.md`
- `work/task_checklist.md`
- `output/modification_report.md`
- `output/final_check_report.md`

## Verification Discipline

Run fresh verification after the last edit. Update TOC with Word, then rerun layout and cover postprocessing before final validation.
"""


def main() -> int:
    parser = argparse.ArgumentParser(description="Create a safe workspace for Wuhan Donghu thesis revision.")
    parser.add_argument("project_root", type=Path)
    parser.add_argument("draft_docx", type=Path)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    root = args.project_root.resolve()
    draft = args.draft_docx.resolve()
    if not draft.exists():
        raise SystemExit(f"Draft DOCX not found: {draft}")

    backup_dir = root / "backup"
    output_dir = root / "output"
    work_dir = root / "work"
    for directory in (backup_dir, output_dir, work_dir):
        directory.mkdir(parents=True, exist_ok=True)

    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup = backup_dir / f"{draft.stem}_revision_backup_{stamp}.docx"
    working = output_dir / "revised_paper_working.docx"
    final = output_dir / "revised_paper_final.docx"

    if (working.exists() or final.exists()) and not args.force:
        raise SystemExit("Working/final DOCX already exists. Use --force to overwrite workspace copies.")

    shutil.copy2(draft, backup)
    shutil.copy2(draft, working)
    shutil.copy2(draft, final)

    issue_matrix = work_dir / "revision_issue_matrix.md"
    checklist = work_dir / "task_checklist.md"
    if not issue_matrix.exists():
        issue_matrix.write_text(
            "| ID | Evidence | Draft Location | Object | Problem | Required Fix | Protected? | Verification |\n"
            "|---|---|---|---|---|---|---|---|\n",
            encoding="utf-8",
        )
    if not checklist.exists():
        checklist.write_text("- [ ] Build issue matrix\n- [ ] Apply scoped revisions\n- [ ] Run final verification\n", encoding="utf-8")

    agent = root / "AGENT.md"
    if not agent.exists() or args.force:
        agent.write_text(AGENT_TEMPLATE.format(draft=draft, backup=backup), encoding="utf-8")

    print("REVISION_WORKSPACE=PASS")
    print(f"BACKUP={backup}")
    print(f"WORKING={working}")
    print(f"FINAL={final}")
    print(f"AGENT={agent}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
