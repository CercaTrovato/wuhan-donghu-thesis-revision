# Pressure Tests

Use these scenarios to evaluate whether an agent follows the revision skill. A good agent should ask for missing local files only when they cannot be discovered, protect user edits, and verify with fresh evidence.

## Scenario 1: Oral Note Plus Red-Circle Images

Input: "修改说明.docx is oral, images are in 修改说明 folder. Summarize exact problems."

Expected:

- Reads both DOCX and images.
- Builds issue matrix.
- Does not invent unrelated problems.

## Scenario 2: Protected User Figures

Input: "I changed 图3-1 and 图3-2 myself. Fix all code figures."

Expected:

- Does not overwrite 图3-1 or 图3-2.
- Uses exclusion pattern for validators if needed.

## Scenario 3: Table Text Scattered In PDF

Input: "表3-1到表3-12文字被拉散，表5很好."

Expected:

- Inspects run-level properties.
- Removes `w:spacing`, `w:w`, `w:kern`, `w:position`, `w:fitText`.
- Keeps a separate grid for 表5.
- Exports PDF and renders table pages.

## Scenario 4: Total ER Too Simple

Input: "总ER图太简单，检查源码画正确ER图."

Expected:

- Reads SQL/model/source evidence.
- Produces source-backed relationship network.
- Emits and validates `er_layout.json`.

## Scenario 5: Code Figure Mojibake

Input: "所有代码图乱码，要像IDE截图."

Expected:

- Uses real source snippets.
- Uses CJK font fallback.
- Emits `code_figures_manifest.json`.
- Validates text and checks PDF render.

## Scenario 6: New Feedback After Earlier Fix

Input: "其他都没有问题，只有系统功能截图太少."

Expected:

- Adds screenshot section and descriptions.
- Does not redo unrelated diagrams/tables.

## Scenario 7: TOC Bookmark Error

Input: "目录出现错误!未定义书签."

Expected:

- Updates TOC with Word COM absolute path.
- Freezes/postprocesses TOC XML.
- Revalidates TOC and exports PDF.

## Scenario 8: DOCX Locked

Input: validation fails with PermissionError.

Expected:

- Closes OfficeCLI resident.
- Checks hidden WINWORD processes.
- Retries validation after lock release.

## Scenario 9: Flowcharts Missing No Branches

Input: "图4-11到图4-53流程图都没有否的判断流程，参考图4-9修改."

Expected:

- Only changes the requested flowcharts; does not touch code figures, screenshots, or protected figures.
- Adds a decision diamond with `是` and `否`.
- Routes `否→返回对应管理页或功能页重新录入→回到录入步骤`.
- Keeps all labels Chinese and visually similar to the provided reference.
- Emits a flowchart manifest and verifies DOCX embedded images, PDF-rendered pages, and target flowchart black/white style.
