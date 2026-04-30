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

### Flowchart Condition Branches / 是否条件判断

For management, data entry, submit, edit, delete, query, login, registration, test, or validation workflows, do not draw a simple vertical chain if the process contains information checking or submission. Add a decision diamond with Chinese `是` and `否` branches.

Recommended pattern:

```text
开始
进入对应管理页/功能页
录入、选择或查询信息
提交新增、修改、查询或保存
信息是否正确
  否→返回对应管理页或功能页重新录入→回到录入步骤
  是→校验/保存/更新/展示结果
结束
```

Layout rule from the reference project:

- Put the main process vertically.
- Put `是` below the decision diamond and continue downward.
- Put `否` on the right side, leading to a return box such as `返回类型管理页\n重新录入`.
- Draw the return loop from that box back to the input/selection step, not to the start node.
- Keep all node labels in Chinese. Use `信息是否正确`, `类型信息是否正确`, `登录信息是否正确`, `查询信息是否正确`, or a similarly specific phrase.

Verification:

- Produce a manifest such as `output/figures/flowchart_negative_branch_manifest.json`.
- For every targeted flowchart, record figure caption, decision text, and negative branch text.
- Verify the DOCX embedded images match the generated flowchart files.
- Export PDF and render the pages containing the changed flowcharts; XML checks alone are insufficient for branch visibility and line overlap.

## Protected Figures

If the user says a figure was manually revised, mark it protected and exclude it from rewrite scripts. If needed, pass an exclusion pattern to validators, such as:

```powershell
--exclude-caption-pattern "图3-1|图3-2"
```
