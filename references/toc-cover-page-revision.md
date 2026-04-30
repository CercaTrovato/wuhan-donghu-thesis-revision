# TOC, Cover, and Page Revision

## TOC Repair

Use Microsoft Word to update TOC and page numbers, then freeze/postprocess TOC XML. Do not handwrite TOC dot leaders or page numbers.

Use absolute paths. For the upstream TOC script, nested `powershell -File` is acceptable because it has been validated with Word COM. For this revision skill's render helper, prefer direct `& script.ps1` invocation from the active PowerShell session; see `verification-checklist.md`.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "...\wuhan-donghu-thesis\scripts\update_toc_and_freeze.ps1" `
  -DocxPath "E:\absolute\path\output\revised_paper_final.docx" `
  -PythonExe "python"
```

After TOC update:

1. rerun figure/table layout fixer
2. rerun cover identifier/tab fixer
3. rerun TOC validator
4. export PDF and confirm no `错误!未定义书签。`

## Cover Preservation

Cover pages are fragile. Prefer the upstream `wuhan-donghu-thesis` cover scripts and rules.

If touching only revision content, do not rebuild the cover. If Word update changes cover field positioning, repair 学号/档号 tabs/fields after TOC update.

## Common Failure

Relative paths in Word COM can resolve under `C:\WINDOWS`. Always pass absolute `DocxPath`.

## Validation

```powershell
python wuhan-donghu-thesis\scripts\verify_toc_xml.py revised.docx
python wuhan-donghu-thesis\scripts\verify_cover_identifiers_and_length.py revised.docx --student-id <id> --min-nonspace-chars 22000
```

If first pages were modified, render cover pages and visually compare with the school sample.
