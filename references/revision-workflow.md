# Revision Workflow

## Goal

Revise an existing Wuhan Donghu College thesis draft without losing user edits or expanding beyond the requested feedback.

## Inputs To Collect

- Original draft `.docx`
- Latest revised draft, if any
- Teacher modification notes `.docx`
- Annotated screenshots or red-circle images
- New/latest modification notes
- Previous agent summaries
- Source code, SQL schema, models, routes, frontend views
- System function screenshots
- Figure/table/formula style references
- Existing project `AGENTS.md` and task-local `AGENT.md`

## Work Products

Create or maintain:

- `backup/`: original draft backup
- `output/revised_paper_working.docx`
- `output/revised_paper_final.docx`
- `work/revision_issue_matrix.md`
- `work/task_checklist.md`
- `output/modification_report.md`
- `output/final_check_report.md`
- Rendered PDF/page images for visual checks

## Revision Order

1. Evidence intake and issue matrix.
2. Backup and workspace creation.
3. Protected-object list. Include user-edited figures/tables/sections.
4. Structural edits: headings, section deletion/insertion, outline order.
5. Content edits from evidence: source-backed text, tests, screenshots.
6. Figure repairs: module diagrams, ER diagrams, entity diagrams, flowcharts.
7. Table repairs: three-line style, widths, OpenXML schema, run-level text properties.
8. Code figure repairs: IDE-like screenshots, CJK font fallback, manifest.
9. Screenshot insertion and captions.
10. TOC/page number update with Word COM.
11. Postprocessing after TOC: figure/table layout, cover tabs/fields.
12. Full verification, PDF render, page-image inspection, final/working hash sync.

## Revision Discipline

- Keep edits object-scoped. Do not apply a global format brush.
- For each issue, record evidence and final verification.
- Do not trust Word visual preview alone; export PDF and render critical pages.
- If verification fails because of a locked file, close OfficeCLI resident and hidden Word COM processes before retrying.
- If later feedback conflicts with earlier work, newest user instruction wins.

## Fresh Verification Rule

Never say the revision is complete without fresh evidence from commands run after the last edit.
