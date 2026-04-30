# wuhan-donghu-thesis-revision

武汉东湖学院本科毕业论文初稿修改专用 Codex skill。适用于从教师修改说明、红圈截图、源码、系统截图、历史修改报告和 Word/PDF 渲染缺陷出发，对已有 `.docx` 论文进行证据化、范围受控的修订。

This repository is a standalone Codex skill. The repository root is the skill directory: it contains `SKILL.md`, `references/`, `scripts/`, and `agents/`.

## Quick Install

### Windows PowerShell

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -UseBasicParsing https://raw.githubusercontent.com/CercaTrovato/wuhan-donghu-thesis-revision/main/install.ps1 | iex"
```

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/CercaTrovato/wuhan-donghu-thesis-revision/main/install.sh | bash
```

By default, both commands install to:

```text
~/.agents/skills/wuhan-donghu-thesis-revision
```

Restart Codex after installation so the skill list is refreshed.

## Claude Code Target

If you want to install the same skill into Claude Code's local skills directory, set `WDU_THESIS_REVISION_TARGET=claude`.

Windows PowerShell:

```powershell
$env:WDU_THESIS_REVISION_TARGET="claude"; powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -UseBasicParsing https://raw.githubusercontent.com/CercaTrovato/wuhan-donghu-thesis-revision/main/install.ps1 | iex"
```

macOS / Linux:

```bash
WDU_THESIS_REVISION_TARGET=claude curl -fsSL https://raw.githubusercontent.com/CercaTrovato/wuhan-donghu-thesis-revision/main/install.sh | bash
```

Claude target installs to:

```text
~/.claude/skills/wuhan-donghu-thesis-revision
```

## Update

Run the same one-line install command again. If the skill was installed by Git, the installer performs a fast-forward pull. If a non-Git directory already exists, it is moved to a timestamped backup before cloning.

## Custom Skill Root

For testing or nonstandard agent setups, set `WDU_THESIS_REVISION_SKILL_ROOT` to override the install root. The skill will be installed under:

```text
<WDU_THESIS_REVISION_SKILL_ROOT>/wuhan-donghu-thesis-revision
```

## Manual Install

Codex:

```bash
git clone https://github.com/CercaTrovato/wuhan-donghu-thesis-revision.git ~/.agents/skills/wuhan-donghu-thesis-revision
```

Claude Code:

```bash
git clone https://github.com/CercaTrovato/wuhan-donghu-thesis-revision.git ~/.claude/skills/wuhan-donghu-thesis-revision
```

Windows users can use the same repository URL with `git clone` into `%USERPROFILE%\.agents\skills\wuhan-donghu-thesis-revision`.

## What This Skill Covers

- 读取口述式修改说明、红圈截图和历史 agent 总结，定位初稿中的具体问题。
- 建立长任务 `AGENT.md`、问题矩阵、任务清单、修改记录和最终验收记录。
- 保护用户已手工修改的图、表、章节，避免后续脚本覆盖。
- 修复章节结构、图表编号、实体属性图、总 ER 图、数据库表格、功能测试表、代码图、系统截图、目录、封面、PDF 渲染和文件锁问题。
- 继承 `wuhan-donghu-thesis` 对武汉东湖学院论文格式和内容规范的要求。

## Included Tools

- `scripts/make_revision_workspace.py`
- `scripts/clean_table_run_properties.py`
- `scripts/verify_revision_scope.py`
- `scripts/render_docx_pages.ps1`

## Verification Status

The current release was tested with both simulated DOCX cases and a real Wuhan Donghu thesis revision project.

Key checks:

```text
STATIC_REGRESSION_CHECK=PASS
SCRIPT_HELP_REGRESSION=PASS
PY_COMPILE_REGRESSION=PASS
PYCACHE_CLEANUP_AFTER_COMPILE=PASS
REAL_CASE_AFTER_PATCH=PASS
FINAL_REAL_CASE_RULE_COVERAGE=PASS
FINAL_WINWORD_RESIDUAL_CHECK=NONE
```

## Requirements

- Git for one-line installation.
- Python for bundled Python helper scripts.
- Microsoft Word on Windows for Word COM based DOCX-to-PDF rendering.
- Poppler `pdftoppm` is optional; without it, the render helper still exports PDF but skips page PNG rendering.

## Use

In Codex, ask for `wuhan-donghu-thesis-revision` when revising an existing Wuhan Donghu College undergraduate thesis from teacher feedback, modification notes, screenshots, source code, or DOCX/PDF defects.
