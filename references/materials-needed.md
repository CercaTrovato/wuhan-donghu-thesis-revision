# Materials Needed

## Minimum Viable Inputs

A revision can start with:

- existing thesis draft `.docx`
- teacher modification notes or user message
- latest target output path or instruction about which DOCX is current

If only these exist, first build a limited issue matrix and state any unverified assumptions in the report.

## Strongly Recommended Inputs

Ask for or discover these before major edits:

- annotated screenshots/red-circle images
- previous agent summary or previous modification report
- source code archive or extracted source directory
- database SQL/schema/model files
- system function screenshots
- school sample/template `范本.docx`
- school writing/format requirements
- figure/table/formula style references
- known protected user edits

## Evidence Mapping

Use each material for the right task:

| Material | Use |
|---|---|
| Modification DOCX | Teacher's written requirements and screenshots embedded in the notes |
| Red-circle images | Exact visual target and object location |
| Draft DOCX | Current structure, captions, tables, images, TOC, cover state |
| Source code / SQL | Entity lists, ER relations, routes, implemented features, code snippets |
| System screenshots | UI evidence for function sections and tests |
| School template | Cover, front matter, TOC, font, page number expectations |
| Previous reports | Avoid duplicated work and identify unresolved gaps |

## When To Proceed Without Asking

Proceed if missing material can be derived from local files. Examples:

- Source code is available as a `.zip`; extract and inspect it.
- Modification notes are a DOCX with embedded images; extract text and media.
- A prior report exists in `output/`; use it as history.

Ask only when the material cannot be found locally and making an assumption would risk overwriting user edits or fabricating source-backed content.
