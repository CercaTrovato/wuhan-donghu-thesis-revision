# Table Revision

## Common Table Problems

- Wrong count or sequence of database tables.
- Table caption uses `表3.1` instead of `表3-1`.
- Table does not match entity diagram order.
- Cell text wraps vertically or is squeezed.
- Table looks correct but OpenXML schema is invalid.
- Run-level properties cause stretched characters in PDF.

## Three-Line Table Baseline

Use these defaults unless the local sample requires otherwise:

- Total width: `8720` dxa.
- Fixed layout: `w:tblLayout type="fixed"`.
- Outer top/bottom border: `single`, size `8`.
- Left/right/inside borders: explicit `none`.
- Header bottom border: `single`, size `6`.
- First body row top border: `single`, size `6`.
- Cell paragraph: centered, no first-line indent, zero before/after, single line spacing.
- Cell font: 10.5pt, `w:sz="21"`, Chinese Songti, English Times New Roman.
- Header should not be bold unless the school sample says otherwise.

## Column Width Patterns

Database schema tables with columns `字段名称、类型、长度、约束、字段说明`:

```python
DB_TABLE_GRID = [2200, 1600, 1250, 2150, 1520]
```

Functional test tables such as `表5-1 管理员登录功能测试表` through later chapter-5 function tests, with columns `功能、操作、预期、实际、通过`:

```python
TEST_TABLE_GRID = [1400, 2100, 2010, 2010, 1200]
```

If a project uses different content, adjust only after PDF rendering. The widths must sum to `8720`.

## Run Property Cleanup

For all text runs in table cells, remove:

```python
("w:spacing", "w:w", "w:kern", "w:position", "w:fitText")
```

For header rows that should be regular Songti, also remove:

```python
("w:b", "w:bCs")
```

## Validation

Minimum:

```powershell
python wuhan-donghu-thesis\scripts\verify_figure_table_layout.py revised.docx
officecli validate revised.docx
```

If the issue was visual, export PDF and render the pages containing the tables. XML checks alone are insufficient.
