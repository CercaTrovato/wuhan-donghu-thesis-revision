---
name: wuhan-donghu-thesis-revision
description: Use when revising an existing Wuhan Donghu College undergraduate thesis draft from teacher feedback, modification notes, annotated screenshots, previous agent summaries, source code, system screenshots, or DOCX/PDF rendering defects.
---

# Wuhan Donghu Thesis Revision

## Purpose

Use this skill for modifying an existing Wuhan Donghu College undergraduate thesis `.docx`. It is not a generation workflow. It is for scoped, evidence-backed revision from teacher feedback, annotated screenshots, new modification notes, and prior agent work.

This skill inherits formatting and content standards from `wuhan-donghu-thesis`. When a task touches cover pages, front matter, TOC, body length, headings, figures, tables, formulas, references, page numbers, or school-specific Word rules, read the relevant `wuhan-donghu-thesis` reference first and then apply this revision workflow.

## First Steps

1. Read project `AGENTS.md` and any task-local `AGENT.md`.
2. Read `references/revision-workflow.md`.
3. Read `references/issue-localization.md` before editing.
4. If required materials are missing or unclear, read `references/materials-needed.md`.
5. Read `references/inherited-wdu-format-rules.md` before touching formatting.
6. Before using OfficeCLI for non-trivial `.docx` structure or formatting, search `references/officecli-1.0.72-full-reference.md` for the exact command/element schema. This includes headers/footers, sections, TOC, fields, page numbers, indentation, tables, numbering, images, raw XML, validation, and HTML previews.
7. Read only the object-specific reference needed next:
   - Tables/OpenXML: `references/table-revision.md` and `references/docx-openxml-repair.md`
   - Diagrams/ER/entity/flowcharts: `references/figure-diagram-revision.md`
   - Code figures: `references/code-figure-revision.md`
   - TOC/cover/page numbers: `references/toc-cover-page-revision.md`
   - Final validation: `references/verification-checklist.md`
8. If making the skill itself better, use `references/pressure-tests.md` as evaluation scenarios.

## Non-Negotiables

- Do not overwrite the original draft. Create backups and work in `output/`.
- Do not broaden the task beyond the modification notes unless the user explicitly asks.
- If the user says they manually changed a figure/table/section, mark it protected and do not overwrite it.
- Treat annotated screenshots as first-class evidence; teacher comments are often incomplete without them.
- Use source code, SQL, screenshots, and manifests as evidence before rewriting technical content.
- Update TOC with Microsoft Word, then rerun OpenXML/layout postprocessing.
- Verify with DOCX XML checks and PDF/page-image rendering before claiming completion.

## Core Workflow

1. Build a revision evidence ledger from modification notes, annotated images, draft outline, previous agent summaries, source code, database/schema, system screenshots, and style references.
2. Convert feedback into a scoped issue matrix: evidence, draft location, target object, required edit, protected objects, verification.
3. Create a task-local `AGENT.md` and checklist for long revisions.
4. Patch only the requested sections/objects. Prefer deterministic scripts for Word/OpenXML, diagrams, tables, screenshots, and code figures.
5. Rebuild or repair object classes in this order: structure, content, figures, tables, code figures, screenshots, TOC, cover, final sync.
6. Refresh TOC/page numbers with Word COM, freeze TOC XML, rerun figure/table and cover postprocessing, then validate.
7. Export PDF and render high-risk pages. XML passing is not enough for Word layout defects.
8. Sync final and working copies and compare SHA256.

## Common Failure Modes

- Revision agent regenerates the whole paper and destroys user edits.
- Teacher's red-circle screenshot points to a different problem than the written note.
- Tables look fine in Word but contain invalid OpenXML or run-level text scaling.
- Word updates TOC and reintroduces layout changes.
- Code figures render Chinese as boxes because only English monospace fonts were used.
- ER diagrams are visually clean but too simple because they ignore source-backed business relations.
- OfficeCLI or Word COM leaves the DOCX locked before validation/rendering.

## Bundled Scripts

- `scripts/make_revision_workspace.py`: create backup, `output/`, working/final copies, and a starter `AGENT.md`.
- `scripts/clean_table_run_properties.py`: remove table text run properties such as `w:spacing` and `w:w` that cause stretched characters.
- `scripts/verify_revision_scope.py`: lightweight must-contain/must-not-contain checks for scoped revisions.
- `scripts/render_docx_pages.ps1`: export DOCX to PDF with Word COM and render selected pages with Poppler.

For school-wide validators, use `wuhan-donghu-thesis/scripts/verify_*.py` rather than duplicating them here.
