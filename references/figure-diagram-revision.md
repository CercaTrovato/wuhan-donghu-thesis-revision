# Figure and Diagram Revision

## General Diagram Rules

Use white background, black text, black lines. Avoid gray fill, accent colors, dark themes, grid backgrounds, and mixed fonts unless a protected user image must be preserved.

## Entity Attribute Diagrams / 实体属性图

Common defect: lines connect center-to-center and pass through the entity block. In Chinese thesis feedback this often appears as "所有实体属性图都有问题", "连接线穿过中间块", "线没有连到边上", or "不允许出现英文".

Correct geometry:

1. Compute the source point on the entity rectangle boundary.
2. Compute the target point on the attribute ellipse boundary.
3. Draw only between those two boundary points.
4. Verify sampled line points do not enter the entity rectangle interior.

Text rule: entity and attribute labels should be Chinese. Do not leave database field names such as `username`, `addtime`, `id` unless the teacher explicitly wants physical fields.

Recommended manifest:

```text
output/figures/entity_attribute_layouts.json
```

Required checks:

- `NO_ASCII_LABELS=PASS`
- `CENTER_CONNECTORS=PASS`

## Total ER Diagrams

Do not draw a trivial left-to-right list. Build from source-backed entities and relations:

- SQL schema
- ORM/model files
- routes/controllers
- frontend views
- system screenshots

Use logical/business themes when the source has no explicit foreign key, but explain the distinction nearby. Emit `er_layout.json` and validate:

```powershell
python wuhan-donghu-thesis\scripts\verify_er_layout_geometry.py output\figures\er_layout.json
```

Reject layouts with:

- tangled lines
- relation diamonds overlapping boxes
- shared ports for unrelated relationships
- connector crossings where avoidable
- `1/n` labels inside boxes

## Flowcharts and Module Diagrams

For revisions that replace screenshots with flowcharts:

- Preserve the functional sequence described by source code and UI.
- Use short Chinese action labels.
- Keep start/end and decision nodes readable.
- Insert figure paragraph with `ImageParagraph`.
- Caption with `ThesisCaption`.

## Protected Figures

If the user says a figure was manually revised, mark it protected and exclude it from rewrite scripts. If needed, pass an exclusion pattern to validators, such as:

```powershell
--exclude-caption-pattern "图3-1|图3-2"
```
