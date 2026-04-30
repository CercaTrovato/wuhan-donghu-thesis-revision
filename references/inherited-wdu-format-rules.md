# Inherited Wuhan Donghu Format Rules

This revision skill inherits `wuhan-donghu-thesis`. Do not duplicate the whole generation skill in context; read the relevant upstream reference when needed.

## When To Read Upstream References

- Global Word rules: `wuhan-donghu-thesis/references/word-format.md`
- Cover pages: `wuhan-donghu-thesis/references/cover-pages.md`
- TOC/page numbers: `wuhan-donghu-thesis/references/toc-page.md`
- Word COM/OpenXML: `wuhan-donghu-thesis/references/automation.md`
- Platform constraints: `wuhan-donghu-thesis/references/platform-compatibility.md`
- Generation evidence ledger: `wuhan-donghu-thesis/references/generation-workflow.md`

## Rules To Preserve During Revision

- Cover pages are template-level content; do not rebuild them as normal paragraphs.
- TOC must be a Word field or frozen field result from Word update, not handwritten dot leaders.
- Body length is counted from `1 绪论` through the last body chapter before `参考文献`; target at least 22000 non-space visible characters for robust revisions.
- Figure captions use `图N-N`.
- Table captions use `表N-N`.
- Structural diagrams, flowcharts, module diagrams, ER diagrams, and entity diagrams use white background, black text, black lines.
- Code figures should look like clean light IDE/editor screenshots and must support Chinese text.
- Tables should be three-line tables unless the school sample explicitly requires otherwise.
- Validate OpenXML schema, outline, TOC, figures, tables, diagrams, code figures, project coverage, and PDF rendering before completion.

## Revision-Specific Rule

If a school-format repair would overwrite a user-protected object, stop and preserve the protected object. Record the skipped check or use an explicit exclusion pattern, for example excluding user-edited `图3-1|图3-2` from monochrome checks.
