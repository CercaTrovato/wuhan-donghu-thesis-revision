# Issue Localization

## Purpose

Teacher feedback is often oral, partial, or attached to screenshots. Convert it into exact, testable revision targets before editing.

## Procedure

1. Extract text from modification notes.
2. List every annotated image. Record image filename, red-circle target, visible caption/table/section, and inferred requirement.
3. Read draft outline and nearby text with `officecli view`.
4. Map each feedback item to:
   - chapter/section
   - paragraph/table/figure caption
   - current problem
   - required change
   - evidence source
   - verification method
5. Compare with any previous agent summary. Record missing or over-broad items.
6. Mark protected objects from user messages, such as "do not touch 图3-1 and 图3-2".

## Issue Matrix Columns

Use this schema in `work/revision_issue_matrix.md`:

| ID | Evidence | Draft Location | Object | Problem | Required Fix | Protected? | Verification |
|---|---|---|---|---|---|---|---|

## Common Localization Traps

- Written note says "表格有问题", but screenshot shows a specific Word rendering defect.
- A red circle around a screenshot may mean "replace with flowchart", not "improve screenshot".
- "All entity diagrams" means inspect every entity diagram, not only the named example.
- "Latest version" means identify the newest DOCX by user instruction and modification time, not the most obvious filename.
- If the user says "everything else is fine", do not rework unrelated content.

## Useful Commands

```powershell
officecli view "draft.docx" outline
officecli view "draft.docx" text --max-lines 300
officecli view "draft.docx" stats
```

For DOCX internals:

```powershell
officecli validate "draft.docx"
```

If using Python to inspect DOCX XML, set UTF-8 environment variables first on Windows.
