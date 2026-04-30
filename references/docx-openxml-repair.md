# DOCX and OpenXML Repair

## Why This Matters

Word often displays a document even when its XML is invalid or contains hidden layout properties. Revision work must treat DOCX as OpenXML, not plain text.

## Safe Editing Principles

- Use `python-docx` for normal paragraph/table/image edits.
- Use OpenXML directly for fragile properties: TOC, table borders, run fonts, tabs, cell widths, fields.
- Preserve schema order when inserting children into `tblPr`, `tcPr`, `tblBorders`, `tcBorders`, `pPr`, and `rPr`.
- After Word updates TOC, rerun OpenXML postprocessing.

## Table XML Ordering

Common valid order groups:

- `tblPr`: `tblStyle`, `tblW`, `jc`, `tblBorders`, `tblLayout`
- `tcPr`: `tcW`, `tcBorders`, `noWrap`
- `tblBorders` and `tcBorders`: `top`, `left`, `bottom`, `right`, `insideH`, `insideV`

If `officecli validate` reports schema errors after table edits, inspect element order before changing visual properties.

## Run-Level Text Stretching

If table text renders stretched, scattered, or compressed, inspect run properties inside table cells. Remove:

- `w:spacing`
- `w:w`
- `w:kern`
- `w:position`
- `w:fitText`

These are character-level properties. Changing font size, font family, paragraph spacing, or column width alone may not fix the PDF rendering.

Use bundled script:

```powershell
python scripts\clean_table_run_properties.py input.docx --output output.docx
```

## Locked DOCX Recovery

If validation or rendering fails with permission errors:

```powershell
officecli close "output\revised_paper_final.docx"
Get-Process WINWORD -ErrorAction SilentlyContinue |
  Select-Object Id,ProcessName,MainWindowTitle,StartTime
```

Only stop hidden Word processes that clearly belong to the current failed automation. Do not close a user's visible editing window without permission. If `WINWORD` appears immediately after export, wait briefly and recheck because Word COM can exit asynchronously.

## Word COM Path Rule

Pass absolute DOCX paths to Word COM scripts. Relative paths may be resolved under `C:\WINDOWS\...` and fail with "file not found".
