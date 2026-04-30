# Verification Checklist

Run fresh verification after the last edit. Do not rely on earlier passes.

## Minimum Commands

```powershell
python wuhan-donghu-thesis\scripts\verify_figure_table_layout.py output\revised_paper_final.docx
python wuhan-donghu-thesis\scripts\verify_toc_xml.py output\revised_paper_final.docx
python wuhan-donghu-thesis\scripts\verify_cover_identifiers_and_length.py output\revised_paper_final.docx --student-id <id> --min-nonspace-chars 22000
python wuhan-donghu-thesis\scripts\verify_body_text_length.py output\revised_paper_final.docx --min 22000
python wuhan-donghu-thesis\scripts\verify_project_content_completeness.py output\revised_paper_final.docx --requirements work\project_requirements.json
python wuhan-donghu-thesis\scripts\verify_monochrome_diagrams.py output\revised_paper_final.docx
officecli validate output\revised_paper_final.docx
officecli view output\revised_paper_final.docx outline
```

Run object-specific checks when applicable:

```powershell
python wuhan-donghu-thesis\scripts\verify_er_layout_geometry.py output\figures\er_layout.json
python wuhan-donghu-thesis\scripts\verify_code_figure_text.py output\figures\code_figures_manifest.json
```

Use exclusion patterns only for user-protected figures and record why.

## PDF Visual Checks

Export DOCX to PDF with Word COM and render high-risk pages:

- cover pages if cover/front matter changed
- TOC pages after heading changes
- pages containing repaired tables
- pages containing repaired diagrams
- pages containing code figures
- pages containing newly inserted screenshots

Use `scripts/render_docx_pages.ps1` or equivalent. In an existing PowerShell session, prefer direct invocation with `&`:

```powershell
& "...\wuhan-donghu-thesis-revision\scripts\render_docx_pages.ps1" `
  -DocxPath "E:\absolute\path\output\revised_paper_final.docx" `
  -OutputDir "E:\absolute\path\output\rendered_check" `
  -FromPage 29 -ToPage 35 -Resolution 160
```

Avoid launching a nested `powershell -File` from inside another PowerShell session for this render helper; Word COM automation may hang in that nested invocation on some Windows hosts. If a nested call was used and hangs, close hidden `WINWORD` processes before retrying.

After a Word COM export, a `WINWORD` process may remain briefly while COM releases. Recheck after a short delay before killing anything. Only terminate hidden/no-window processes that clearly came from the current automation run; never kill a visible user Word window.

## Final Sync

```powershell
Copy-Item output\revised_paper_final.docx output\revised_paper_working.docx -Force
Get-FileHash output\revised_paper_final.docx -Algorithm SHA256
Get-FileHash output\revised_paper_working.docx -Algorithm SHA256
```

Hashes must match.

## Report

Update:

- `output/modification_report.md`
- `output/final_check_report.md`

Report known exclusions, rendered page ranges, final PDF page count, and final/working SHA256.
