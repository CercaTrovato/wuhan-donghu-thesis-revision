# OfficeCLI 1.0.66 Full Reference

Generated: 2026-05-01 02:07:51 +08:00

This file is generated from the installed officecli binary. Regenerate it after upgrading OfficeCLI.

Regenerate command:

```powershell
.\generate-officecli-reference.ps1
```

## Global Help

```text
Description:
  officecli: AI-friendly CLI for Office documents (.docx, .xlsx, .pptx)
  
  Run 'officecli help' for the schema-driven capability reference (formats, elements, properties).
  See the Commands section below for the full list of subcommands.

用法:
  officecli [command] [options]

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
  --version       显示版本信息

命令: 
  open <file>                                Start a resident process to keep the document in memory for faster subsequent commands
  close <file>                               Stop the resident process for the document
  watch <file>                               Start a live preview server that refreshes when officecli modifies the document (external edits are not detected)
  unwatch <file>                             Stop the watch preview server for the document
  mark <file> <path>                         Attach an in-memory advisory mark to a document element via the watch process. Path must be in data-path format (e.g. /body/p[1]); 'selected' marks all selected elements.
  unmark <file>                              Remove marks from the watch process. Specify --path <data-path> or --all.
  get-marks <file>                           List all marks currently held by the watch process.
  goto <file> <path>                         Scroll the running watch viewer(s) to the given element. Path resolves to an HTML anchor; broadcast to all SSE clients of the file. Word: paragraph, table, table row, table cell.
  view <file> <mode>                         View document in different modes
  get <file> <path>                          Get a document node by path [default: /]
  query <file> <selector>                    Query document elements with CSS-like selectors
  set <file> <path>                          Modify a document node's properties
  add <file> <parent>                        Add a new element to the document
  remove <file> <path>                       Remove an element from the document
  move <file> <path>                         Move an element to a new position or parent
  swap <file> <path1> <path2>                Swap two elements in the document
  raw <file> <part>                          View raw XML of a document part [default: /document]
  raw-set <file> <part>                      Modify raw XML in a document part (universal fallback for any OpenXML operation)
  add-part <file> <parent>                   Create a new document part and return its relationship ID for use with raw-set
  validate <file>                            Validate document against OpenXML schema
  batch <file>                               Execute multiple commands from a JSON array (one open/save cycle)
  import <file> <parent-path> <source-file>  Import CSV/TSV data into an Excel sheet
  create, new <file>                         Create a blank Office document
  merge <template> <output>                  Merge template with JSON data, replacing {{key}} placeholders
  mcp                                        Start the MCP stdio server, or register/unregister officecli with an MCP client. Run 'officecli help mcp' for full usage.
  skills                                     Install agent skill definitions (Claude Code, Cursor, Copilot, ...). Run 'officecli help skills' for full usage.
  install                                    One-step setup: install binary + skills + MCP for detected agents. Run 'officecli help install' for full usage.
  help <format> <verb-or-element> <element>  Show schema-driven capability reference for officecli.


Schema Reference (docx/xlsx/pptx):
  officecli help <format>                         List all elements
  officecli help <format> <verb>                  Elements supporting the verb
  officecli help <format> <element>               Full element detail
  officecli help <format> <verb> <element>        Verb-filtered element detail
  officecli help <format> <element> --json        Raw schema JSON

  Formats: docx, xlsx, pptx
  Verbs:   add, set, get, query, remove
  Aliases: word→docx, excel→xlsx, ppt/powerpoint→pptx

Tip: most shells expand [brackets] — quote paths: officecli get doc.docx "/body/p[1]"
```

## Command: open

```text
Description:
  Start a resident process to keep the document in memory for faster subsequent commands

用法:
  officecli open <file> [options]

参数:
  <file>  Office document path (required even with open/close mode)

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: close

```text
Description:
  Stop the resident process for the document

用法:
  officecli close <file> [options]

参数:
  <file>  Office document path (required even with open/close mode)

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: watch

```text
Description:
  Start a live preview server that refreshes when officecli modifies the document (external edits are not detected)

用法:
  officecli watch <file> [options]

参数:
  <file>  Office document path (.pptx, .xlsx, .docx)

选项:
  --port <port>   HTTP port for preview server [default: 18080]
  -?, -h, --help  Show help and usage information
```

## Command: unwatch

```text
Description:
  Stop the watch preview server for the document

用法:
  officecli unwatch <file> [options]

参数:
  <file>  Office document path (.pptx, .xlsx, .docx)

选项:
  -?, -h, --help  Show help and usage information
```

## Command: mark

```text
Description:
  Attach an in-memory advisory mark to a document element via the watch process. Path must be in data-path format (e.g. /body/p[1]); 'selected' marks all selected elements.

用法:
  officecli mark <file> <path> [options]

参数:
  <file>  Office document path (.pptx, .xlsx, .docx)
  <path>  DOM path to the element to mark

选项:
  --prop <prop>   Mark property: find=..., color=..., note=..., tofix=..., regex=true
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: unmark

```text
Description:
  Remove marks from the watch process. Specify --path <data-path> or --all.

用法:
  officecli unmark <file> [options]

参数:
  <file>  Office document path

选项:
  --path <path>   Element path to unmark
  --all           Remove all marks for this file
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: get-marks

```text
Description:
  List all marks currently held by the watch process.

用法:
  officecli get-marks <file> [options]

参数:
  <file>  Office document path

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: goto

```text
Description:
  Scroll the running watch viewer(s) to the given element. Path resolves to an HTML anchor; broadcast to all SSE clients of the file. Word: paragraph, table, table row, table cell.

用法:
  officecli goto <file> <path> [options]

参数:
  <file>  Office document path (.docx)
  <path>  Element path to scroll to (e.g. /body/p[5], /body/table[1], /body/table[1]/tr[2]/tc[3])

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: view

```text
Description:
  View document in different modes

用法:
  officecli view <file> <mode> [options]

参数:
  <file>  Office document path (.docx, .xlsx, .pptx)
  <mode>  View mode: text, annotated, outline, stats, issues, html, svg, forms

选项:
  --start <start>          Start line/paragraph number
  --end <end>              End line/paragraph number
  --max-lines <max-lines>  Maximum number of lines/rows/slides to output (truncates with total count)
  --type <type>            Issue type filter: format, content, structure
  --limit <limit>          Limit number of results
  --cols <cols>            Column filter, comma-separated (Excel only, e.g. A,B,C)
  --page <page>            Page filter for html mode (e.g. 1, 2-5, 1,3,5)
  --browser                Open HTML output in browser (html mode only)
  --json                   Output as JSON (AI-friendly)
  -?, -h, --help           Show help and usage information
```

## Command: get

```text
Description:
  Get a document node by path

用法:
  officecli get <file> [<path>] [options]

参数:
  <file>  Office document path (required even with open/close mode)
  <path>  DOM path (e.g. /body/p[1]) or 'selected' to read the current watch selection [default: /]

选项:
  --depth <depth>  Depth of child nodes to include [default: 1]
  --save <save>    Extract the backing binary payload (picture/ole/media) to this file path
  --json           Output as JSON (AI-friendly)
  -?, -h, --help   Show help and usage information
```

## Command: query

```text
Description:
  Query document elements with CSS-like selectors

用法:
  officecli query <file> <selector> [options]

参数:
  <file>      Office document path (required even with open/close mode)
  <selector>  CSS-like selector (e.g. paragraph[style=Normal] > run[font!=Arial])

选项:
  --json          Output as JSON (AI-friendly)
  --text <text>   Filter results to elements containing this text (case-insensitive)
  -?, -h, --help  Show help and usage information
```

## Command: set

```text
Description:
  Modify a document node's properties

用法:
  officecli set <file> <path> [options] [[--] <additional arguments>...]]

参数:
  <file>  Office document path (required even with open/close mode)
  <path>  DOM path to the element

选项:
  --prop <prop>   Property to set (key=value)
  --json          Output as JSON (AI-friendly)
  --force         Force write even if document is protected
  -?, -h, --help  Show help and usage information

附加参数: 
  Arguments passed to the application that is being run.
```

## Command: add

```text
Description:
  Add a new element to the document

用法:
  officecli add <file> <parent> [options] [[--] <additional arguments>...]]

参数:
  <file>    Office document path (required even with open/close mode)
  <parent>  Parent DOM path (e.g. /body, /Sheet1, /slide[1])

选项:
  --type <type>      Element type to add (e.g. paragraph, run, table, sheet, row, cell, slide, shape, picture, ole, video)
  --from <from>      Copy from an existing element path (e.g. /slide[1]/shape[2])
  --index <index>    Insert position (0-based). If omitted, appends to end
  --after <after>    Insert after the element at this path (e.g. p[@paraId=1A2B3C4D])
  --before <before>  Insert before the element at this path
  --prop <prop>      Property to set (key=value, e.g. --prop src=image.png --prop width=6in)
  --json             Output as JSON (AI-friendly)
  --force            Force write even if document is protected
  -?, -h, --help     Show help and usage information

附加参数: 
  Arguments passed to the application that is being run.
```

## Command: remove

```text
Description:
  Remove an element from the document

用法:
  officecli remove <file> <path> [options]

参数:
  <file>  Office document path (required even with open/close mode)
  <path>  DOM path of the element to remove

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: move

```text
Description:
  Move an element to a new position or parent

用法:
  officecli move <file> <path> [options]

参数:
  <file>  Office document path (required even with open/close mode)
  <path>  DOM path of the element to move

选项:
  --to <to>          Target parent path. If omitted, reorders within the current parent
  --index <index>    Insert position (0-based). If omitted, appends to end
  --after <after>    Move after the element at this path
  --before <before>  Move before the element at this path
  --json             Output as JSON (AI-friendly)
  -?, -h, --help     Show help and usage information
```

## Command: swap

```text
Description:
  Swap two elements in the document

用法:
  officecli swap <file> <path1> <path2> [options]

参数:
  <file>   Office document path
  <path1>  DOM path of the first element
  <path2>  DOM path of the second element

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: raw

```text
Description:
  View raw XML of a document part

用法:
  officecli raw <file> [<part>] [options]

参数:
  <file>  Office document path (required even with open/close mode)
  <part>  Part path (e.g. /document, /styles, /header[1]) [default: /document]

选项:
  --start <start>  Start row number (Excel sheets only)
  --end <end>      End row number (Excel sheets only)
  --cols <cols>    Column filter, comma-separated (Excel only, e.g. A,B,C)
  --json           Output as JSON (AI-friendly)
  -?, -h, --help   Show help and usage information
```

## Command: raw-set

```text
Description:
  Modify raw XML in a document part (universal fallback for any OpenXML operation)

用法:
  officecli raw-set <file> <part> [options]

参数:
  <file>  Office document path (required even with open/close mode)
  <part>  Part path (e.g. /document, /styles, /Sheet1, /slide[1])

选项:
  --xpath <xpath> (REQUIRED)    XPath to target element(s)
  --action <action> (REQUIRED)  Action: append, prepend, insertbefore, insertafter, replace, remove, setattr
  --xml <xml>                   XML fragment or attr=value for setattr
  --json                        Output as JSON (AI-friendly)
  -?, -h, --help                Show help and usage information
```

## Command: add-part

```text
Description:
  Create a new document part and return its relationship ID for use with raw-set

用法:
  officecli add-part <file> <parent> [options]

参数:
  <file>    Document file path
  <parent>  Parent part path (e.g. / for document root, /Sheet1 for Excel sheet, /slide[0] for PPT slide)

选项:
  --type <type> (REQUIRED)  Part type to create (chart, header, footer)
  --json                    Output as JSON (AI-friendly)
  -?, -h, --help            Show help and usage information
```

## Command: validate

```text
Description:
  Validate document against OpenXML schema

用法:
  officecli validate <file> [options]

参数:
  <file>  Office document path (required even with open/close mode)

选项:
  --json          Output as JSON (AI-friendly)
  -?, -h, --help  Show help and usage information
```

## Command: batch

```text
Description:
  Execute multiple commands from a JSON array (one open/save cycle)

用法:
  officecli batch <file> [options]

参数:
  <file>  Office document path

选项:
  --input <input>        JSON file containing batch commands. If omitted, reads from stdin
  --commands <commands>  Inline JSON array of batch commands (alternative to --input or stdin)
  --force                Continue execution even if a command fails (default: stop on first error)
  --json                 Output as JSON (AI-friendly)
  -?, -h, --help         Show help and usage information
```

## Command: import

```text
Description:
  Import CSV/TSV data into an Excel sheet

用法:
  officecli import <file> <parent-path> [<source-file>] [options]

参数:
  <file>         Target Excel file (.xlsx)
  <parent-path>  Sheet path (e.g. /Sheet1)
  <source-file>  Source CSV/TSV file to import (positional, alternative to --file)

选项:
  --file <file>              Source CSV/TSV file to import
  --stdin                    Read CSV/TSV data from stdin
  --format <format>          Data format: csv or tsv (default: inferred from file extension, or csv)
  --header                   First row is header: set AutoFilter and freeze pane
  --start-cell <start-cell>  Starting cell (default: A1) [default: A1]
  --json                     Output as JSON (AI-friendly)
  -?, -h, --help             Show help and usage information
```

## Command: create

```text
Description:
  Create a blank Office document

用法:
  officecli create <file> [options]

参数:
  <file>  Output file path (.docx, .xlsx, .pptx)

选项:
  --type <type>      Document type (docx, xlsx, pptx) — optional, inferred from file extension
  --force            Overwrite an existing file.
  --locale <locale>  Locale tag (e.g. zh-CN, ja, ko, ar, he) — sets per-script default fonts in docDefaults. Without it, host application's UI-locale fallback applies. Currently only honored for .docx.
  --json             Output as JSON (AI-friendly)
  -?, -h, --help     Show help and usage information
```

## Command: new

```text
Error: error: unknown format 'new'.
Use: officecli help
```

## Command: merge

```text
Description:
  Merge template with JSON data, replacing {{key}} placeholders

用法:
  officecli merge <template> <output> [options]

参数:
  <template>  Template file path (.docx, .xlsx, .pptx) with {{key}} placeholders
  <output>    Output file path

选项:
  --data <data> (REQUIRED)  JSON data or path to .json file
  --json                    Output as JSON (AI-friendly)
  -?, -h, --help            Show help and usage information
```

## Command: mcp

```text
Usage:
  officecli mcp                    Start MCP stdio server (for AI agents)
  officecli mcp <target>           Register officecli with an MCP client
  officecli mcp uninstall <target> Unregister officecli from an MCP client
  officecli mcp list               Show registration status across all clients

Targets: lms (LM Studio), claude (Claude Code), cursor, vscode (Copilot)
```

## Command: skills

```text
Usage:
  officecli skills install                Install base SKILL.md to all detected agents
  officecli skills install <skill-name>   Install a specific skill to all detected agents
  officecli skills <agent>                Install base SKILL.md to a specific agent
  officecli skills list                   List all available skills

Skills: pptx, word, excel, morph-ppt, pitch-deck, academic-paper, data-dashboard, financial-model
Agents: claude, copilot, codex, cursor, windsurf, minimax, openclaw, nanobot, zeroclaw, all
```

## Command: install

```text
Usage:
  officecli install           One-step setup: install binary + skills + MCP to all detected agents
  officecli install <target>  Install to a specific agent (claude, copilot, cursor, vscode, ...)

Equivalent to: installing the binary, then `officecli skills install` and `officecli mcp <target>`.
Targets: claude, copilot, codex, cursor, windsurf, vscode, minimax, openclaw, nanobot, zeroclaw, all
```

## Command: help

```text
Error: error: unknown format 'help'.
Use: officecli help
```

## Format: docx Elements

```text
Elements for docx:
  body
  document
  footer
  header
  numbering
  paragraph
    bookmark
    chart
      chart-axis
      chart-series
    comment
    endnote
    equation
    field
    fieldchar
    footnote
    formfield
    hyperlink
    instrtext
    ole
    pagebreak
    picture
    ptab
    run
    sdt
    toc
    trackedchange
  section
  style
  styles
  table
    table-row
      table-cell
  watermark

Run 'officecli help docx <element>' for detail.
```

## docx Element: body

```text
docx body
--------------
Read-only container (never created or removed via CLI).
Parent: document
Paths: /body
Operations: get query

Usage:
  officecli get <file> /body
  officecli query <file> body

Children:
  paragraph  (0..n)  /p
  table  (0..n)  /tbl
  section  (0..n)  /section
  sdt  (0..n)  /sdt

Note: Main content container. Get returns the ordered stream of paragraphs, tables, sections. Mutate via child paths (/body/p[N], /body/tbl[N], /body/section[N]).
```

## docx Element: document

```text
docx document
--------------
Read-only container (never created or removed via CLI).
Paths: /
Operations: set get query

Usage:
  officecli get <file> /
  officecli query <file> document

Properties:
  author   string   [get]   aliases: creator
    example: --prop author="Alice"
    readback: author string
  title   string   [get]
    example: --prop title="Report"
    readback: title string
  subject   string   [get]
    example: --prop subject=Finance
    readback: subject string
  keywords   string   [get]
    example: --prop keywords="tag1,tag2"
    readback: keywords string
  description   string   [get]
    example: --prop description="Abstract"
    readback: description string
  lastModifiedBy   string   [get]   aliases: lastmodifiedby
    example: --prop lastModifiedBy="Bob"
    readback: last-modified author

Children:
  body  (1)  /body
  styles  (1)  /styles
  numbering  (0..1)  /numbering

Note: Root container. Get returns top-level children (body, styles, numbering, headers, footers, etc.). Set exposes core document properties (author/title/subject/keywords/description).
```

## docx Element: footer

```text
docx footer
--------------
Parent: /
Paths: /footer[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type footer [--prop key=val ...]
  officecli set <file> /footer[N] --prop key=val ...
  officecli get <file> /footer[N]
  officecli query <file> footer
  officecli remove <file> /footer[N]

Properties:
  type   enum   [add/set/get]   aliases: kind, ref
    values: default, first, even
    example: --prop type=default
    readback: innerText of HeaderFooterValues
  text   string   [add/set/get]
    example: --prop text="My Footer"
    readback: concatenated Text.Descendants
  alignment   enum   [add/set/get]   aliases: align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=center
    readback: first-paragraph Justification.Val.InnerText
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the footer paragraph and cascades <w:rtl/> to the paragraph mark so later runs inherit RTL.
    values: rtl, ltr
    example: --prop direction=rtl
  font   string   [add/set/get]
    example: --prop font="Arial"
    readback: Ascii or HighAnsi font name
  size   length   [add/set/get]
    example: --prop size=12
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true when bold, key absent otherwise
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true when italic, key absent otherwise
  color   color   [add/set/get]
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex
  field   enum   [add]
    values: page, pagenum, pagenumber, numpages, date, author, title, time, filename
    example: --prop field=page
    readback: not surfaced as a distinct key

Note: Mirror of header.json — same surface, stored in FooterParts. Duplicate type per section rejected at Add. A single Add supports at most one text + one field pair. For composite footers like 'Page X of Y' (two fields + literal text), create the footer first, then Add additional runs/fields to its paragraph (/footer[N]/p[1]) one by one — see examples.

Examples:
  Simple page-number footer: officecli add file.docx / --type footer --prop field=page --prop alignment=center
  'Page X of Y' — must be built in steps after creating the footer:
    1) officecli add file.docx / --type footer --prop text="Page " --prop alignment=center
    2) officecli add file.docx "/footer[1]/p[1]" --type field --prop fieldType=page
    3) officecli add file.docx "/footer[1]/p[1]" --type run --prop text=" of "
    4) officecli add file.docx "/footer[1]/p[1]" --type field --prop fieldType=numpages
```

## docx Element: header

```text
docx header
--------------
Parent: /
Paths: /header[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type header [--prop key=val ...]
  officecli set <file> /header[N] --prop key=val ...
  officecli get <file> /header[N]
  officecli query <file> header
  officecli remove <file> /header[N]

Properties:
  type   enum   [add/set/get]   aliases: kind, ref
    description: header scope.
    values: default, first, even
    example: --prop type=default
    readback: innerText of HeaderFooterValues
  text   string   [add/set/get]
    description: header text (single run).
    example: --prop text="My Header"
    readback: concatenated Text.Descendants
  alignment   enum   [add/set/get]   aliases: align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=center
    readback: first-paragraph Justification.Val.InnerText
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the header paragraph and cascades <w:rtl/> to the paragraph mark so later runs inherit RTL.
    values: rtl, ltr
    example: --prop direction=rtl
  font   string   [add/set/get]
    example: --prop font="Arial"
    readback: Ascii or HighAnsi font name
  size   length   [add/set/get]
    description: font size. Accepts bare number or pt-suffixed.
    example: --prop size=12
    readback: unit-qualified pt (e.g. "12pt")
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true when bold, key absent otherwise
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true when italic, key absent otherwise
  color   color   [add/set/get]
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex
  field   enum   [add]
    description: complex field to insert (page/numpages/date/author/title/time/filename, or an arbitrary field name).
    values: page, pagenum, pagenumber, numpages, date, author, title, time, filename
    example: --prop field=page
    readback: not surfaced as a distinct key

Note: Headers are stored in HeaderParts and referenced by the last sectPr. Duplicate type rejected at Add. 'first' type auto-enables TitlePage. Field insertion uses complex fldChar (begin/instr/separate/result/end). A single Add supports at most one text + one field pair; composite headers like 'Page X of Y' must be built in steps by adding additional runs/fields to the header's paragraph (/header[N]/p[1]) after creation — see examples.

Examples:
  Simple page-number header: officecli add file.docx / --type header --prop field=page --prop alignment=right
  'Page X of Y' — build in steps after creating the header:
    1) officecli add file.docx / --type header --prop text="Page " --prop alignment=right
    2) officecli add file.docx "/header[1]/p[1]" --type field --prop fieldType=page
    3) officecli add file.docx "/header[1]/p[1]" --type run --prop text=" of "
    4) officecli add file.docx "/header[1]/p[1]" --type field --prop fieldType=numpages
```

## docx Element: numbering

```text
docx numbering
--------------
Read-only container (never created or removed via CLI).
Parent: document
Paths: /numbering
Operations: get query

Usage:
  officecli get <file> /numbering
  officecli query <file> numbering

Children:
  abstractNum  (0..n)  /abstractNum
  num  (0..n)  /num

Note: NumberingDefinitionsPart container — bullet / numbered list definitions. Currently read-only; lists are applied at paragraph level via the 'numid' / 'ilvl' / 'liststyle' props (see docx/paragraph.json).
```

## docx Element: paragraph

```text
docx paragraph
--------------
Paths: /body/p[@paraId=ID]  /body/p[N]
Operations: add set get query remove

Usage:
  officecli add <file> /body --type paragraph [--prop key=val ...]
  officecli set <file> /body/p[N] --prop key=val ...
  officecli get <file> /body/p[N]
  officecli query <file> paragraph
  officecli remove <file> /body/p[N]

Properties:
  text   string   [add/set/get]
    description: Sets plain text on the paragraph by creating an implicit single run. Do not also add a 'run' child with text on the same paragraph — they will duplicate.
    example: --prop text="Hello world"
    readback: plain text content of paragraph
  alignment   enum   [add/set/get]   aliases: halign, align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=center
    readback: one of values
  style   string   [add/set/get]   aliases: styleId, styleid, styleName, stylename
    description: paragraph styleId (e.g. Heading1, Normal, Quote). Must reference an existing style or one of the built-in style aliases. Aliases mirror the canonical readback keys exposed by Get: styleId targets the OOXML styleId; styleName resolves the display name through the styles part (lenient, falls back to verbatim if no match).
    example: --prop style=Heading1
    example: --prop styleId=Heading1
    example: --prop styleName="Heading 1"
    readback: styleId as stored on the paragraph
  spaceBefore   length   [add/set/get]   aliases: spacebefore
    example: --prop spaceBefore=12pt
    readback: unit-qualified, e.g. "12pt"
  spaceAfter   length   [add/set/get]   aliases: spaceafter
    example: --prop spaceAfter=6pt
    readback: unit-qualified, e.g. "6pt"
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: multiplier (e.g. 1.5x, 150%) or fixed length (e.g. 18pt)
    example: --prop lineSpacing=1.5x
    example: --prop lineSpacing=18pt
    readback: "<N>x" for multiplier or "<N>pt" for fixed
  indent   length   [add/set/get]   aliases: leftindent, leftIndent
    description: left indentation. Routed through SpacingConverter — accepts twips int or unit-qualified (2cm/0.5in/24pt). Aliases: leftindent/leftIndent. Get canonical key is 'leftIndent'.
    example: --prop indent=2cm
    readback: under canonical key 'leftIndent'
  listStyle   enum   [add/set/get]   aliases: liststyle
    description: high-level list type. 'bullet' (aliases: unordered, ul) creates a bulleted list; 'ordered' (or any other non-bullet value, e.g. 'decimal') creates a numbered list; 'none'/'remove'/'clear' strips list formatting. Preferred over raw numId. Continues a preceding list of the same type automatically unless 'start' is also given.
    values: bullet, ordered, none
    example: --prop listStyle=bullet --prop text="item"
    example: --prop listStyle=ordered --prop text="step 1"
    readback: 'bullet' or 'ordered' (normalized from the numbering format)
  numId   int   [add/set/get]   aliases: numid
    description: numbering definition id (w:numId). Low-level entry point — prefer 'listStyle' unless you specifically need to reference an existing numbering instance.
    example: --prop numId=1
    readback: numbering id as stored on the paragraph
  numLevel   int   [add/set/get]   aliases: numlevel, ilvl, listLevel, listlevel, level
    description: list indent level (w:ilvl), 0..8. Requires numId or listStyle to be effective; Get only surfaces numLevel when numId is present on the paragraph.
    example: --prop numLevel=1 --prop numId=1
    example: --prop ilvl=1 --prop numId=1
    readback: integer level as stored on the paragraph (only when numId is set)
  start   int   [add/set]
    description: starting number for an ordered list (w:start on level 0 of the numbering definition). Only meaningful together with liststyle=ordered or an existing numid. Readback not implemented — w:start lives in the separate numbering part and cross-part traversal is fragile; query the numbering directly if you need it.
    example: --prop liststyle=ordered --prop start=5 --prop text="item"
    readback: n/a (write-only via paragraph; query numbering part)
  bold   bool   [add/set]
    description: run-level bold. On Add, applied to the implicit run created by 'text'. On Set, applied to all runs in the paragraph and to the paragraph-mark run properties so subsequent runs inherit.
    example: --prop bold=true --prop text="Hi"
  italic   bool   [add/set]
    description: run-level italic. Same scope as 'bold'.
    example: --prop italic=true --prop text="Hi"
  font   string   [add/set]
    description: run-level font family (applied to Ascii/HighAnsi/EastAsia). On Add, applied to the implicit run created by 'text'. On Set, applied to all runs in the paragraph.
    example: --prop font="Times New Roman" --prop text="Hi"
  size   font-size   [add/set]   aliases: fontsize
    description: run-level font size. Accepts bare number (pt), '14pt', '10.5pt'.
    example: --prop size=14 --prop text="Hi"
    example: --prop size=10.5pt --prop text="Hi"
  color   color   [add/set]
    description: run-level text color. Accepts #RRGGBB, RRGGBB, named colors (e.g. red), rgb(r,g,b).
    example: --prop color=red --prop text="Hi"
    example: --prop color=#FF0000 --prop text="Hi"
  underline   string   [add/set]
    description: run-level underline. Accepts 'true'/'false' or an underline style (single, double, thick, dotted, dash, wavy, etc.).
    example: --prop underline=true --prop text="Hi"
    example: --prop underline=double --prop text="Hi"
  strike   bool   [add/set]   aliases: strikethrough
    description: run-level single strikethrough.
    example: --prop strike=true --prop text="Hi"
  highlight   string   [add/set]
    description: run-level highlight color (w:highlight values: yellow, green, cyan, magenta, blue, red, darkBlue, darkCyan, darkGreen, darkMagenta, darkRed, darkYellow, darkGray, lightGray, black, white, none).
    example: --prop highlight=yellow --prop text="Hi"
  caps   bool   [add]   aliases: allCaps
    description: run-level all caps. On Add only (no paragraph-level Set wrapper).
    example: --prop caps=true --prop text="Hi"
  smallcaps   bool   [add]   aliases: smallCaps
    description: run-level small caps. On Add only.
    example: --prop smallcaps=true --prop text="Hi"
  dstrike   bool   [add]
    description: run-level double strikethrough. On Add only.
    example: --prop dstrike=true --prop text="Hi"
  vanish   bool   [add]
    description: run-level hidden text. On Add only.
    example: --prop vanish=true --prop text="Hi"
  outline   bool   [add]
    description: run-level outline text effect. On Add only.
    example: --prop outline=true --prop text="Hi"
  shadow   bool   [add]
    description: run-level shadow text effect. On Add only.
    example: --prop shadow=true --prop text="Hi"
  emboss   bool   [add]
    description: run-level emboss text effect. On Add only.
    example: --prop emboss=true --prop text="Hi"
  imprint   bool   [add]
    description: run-level imprint (engrave) text effect. On Add only.
    example: --prop imprint=true --prop text="Hi"
  noproof   bool   [add]
    description: run-level no-proofing flag. On Add only.
    example: --prop noproof=true --prop text="Hi"
  superscript   bool   [add]
    description: run-level superscript vertical alignment. On Add only (use vertAlign for Set).
    example: --prop superscript=true --prop text="x^2"
  subscript   bool   [add]
    description: run-level subscript vertical alignment. On Add only (use vertAlign for Set).
    example: --prop subscript=true --prop text="H2O"
  vertAlign   enum   [add]   aliases: vertalign
    description: run-level vertical text alignment. On Add only.
    values: superscript, subscript, baseline, super, sub
    example: --prop vertAlign=superscript --prop text="x^2"
  charspacing   length   [add]   aliases: charSpacing, letterspacing, letterSpacing
    description: run-level character spacing in points (bare number = pt, or 'Xpt'). Stored as twips. On Add only.
    example: --prop charspacing=2 --prop text="Hi"
  rtl   bool   [add]
    description: run-level right-to-left text flag. On Add only.
    example: --prop rtl=true --prop text="Hi"
  direction   enum   [add/set/get]   aliases: dir, bidi
    description: paragraph reading direction. 'rtl' enables <w:bidi/> for Arabic / Hebrew layouts; 'ltr' clears it.
    values: ltr, rtl
    example: --prop direction=rtl
    readback: rtl | ltr (only emitted when explicitly set)
  font.cs   string   [add/set/get]   aliases: font.complexscript, font.complex
    description: Complex-script font slot (rFonts/cs) — Arabic / Hebrew / Thai typefaces.
    example: --prop font.cs="Arabic Typesetting"
  font.ea   string   [add/set/get]   aliases: font.eastasia, font.eastasian
    description: East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.
    example: --prop font.ea="メイリオ"
  font.latin   string   [add/set/get]
    description: Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.
    example: --prop font.latin=Calibri
  bold.cs   bool   [add/set/get]   aliases: font.bold.cs, boldcs
    description: complex-script bold for the paragraph's runs (<w:bCs/>). Required for Arabic / Hebrew bold rendering.
    example: --prop bold.cs=true
    readback: true | false
  italic.cs   bool   [add/set/get]   aliases: font.italic.cs, italiccs
    description: complex-script italic (<w:iCs/>) for the paragraph's runs.
    example: --prop italic.cs=true
    readback: true | false
  size.cs   font-size   [add/set/get]   aliases: font.size.cs, sizecs
    description: complex-script font size (<w:szCs/>) for the paragraph's runs.
    example: --prop size.cs=14pt
    readback: unit-qualified, e.g. "14pt"
  shd   string   [add]   aliases: shading
    description: shading. Format: 'fill' or 'val;fill' or 'val;fill;color'. Applied at paragraph level on Add (pPr/shd).
    example: --prop shd=FFFF00
    example: --prop shd=clear;FFFF00
  firstLineIndent   length   [add/set/get]   aliases: firstlineindent
    description: first-line indent. Routed through SpacingConverter.
    example: --prop firstLineIndent=2cm
  rightIndent   length   [add/set/get]   aliases: rightindent, indentright
    description: right indentation. Routed through SpacingConverter.
    example: --prop rightIndent=1cm
  hangingIndent   length   [add/set]   aliases: hangingindent, hanging
    description: hanging indent (pairs with left indent). Routed through SpacingConverter.
    example: --prop hangingIndent=0.5cm
  keepNext   bool   [add/set]   aliases: keepnext
    description: keep paragraph with the next paragraph (no page break between).
    example: --prop keepNext=true
  keepLines   bool   [add/set]   aliases: keeplines, keeptogether, keepTogether
    description: keep all lines of the paragraph together (no page break within).
    example: --prop keepLines=true
  pageBreakBefore   bool   [add/set]   aliases: pagebreakbefore, break
    description: force a page break before this paragraph.
    example: --prop pageBreakBefore=true
    example: --prop break=newPage
  widowControl   bool   [add/set]   aliases: widowcontrol
    description: widow/orphan control.
    example: --prop widowControl=true
  wordWrap   bool   [add/set]   aliases: wordwrap
    description: Latin-word break behaviour in CJK paragraphs. Set false to allow ASCII text/whitespace to participate in CJK character flow — required for right-aligned CJK lines that rely on trailing underlined whitespace to align with adjacent lines.
    example: --prop wordWrap=false
  contextualSpacing   bool   [add/set/get]   aliases: contextualspacing
    description: suppress space between paragraphs of the same style. Applied on Add/Set to paragraph pPr; also valid on Style.
    example: --prop contextualSpacing=true

Children:
  run  (0..n)  /r

Note: Canonical keys per CLAUDE.md: spaceBefore/spaceAfter/lineSpacing/alignment. Legacy aliases (spacebefore, linespacing, halign) are still accepted on Add/Set but Get normalizes to canonical.
```

## docx Element: bookmark

```text
docx bookmark
--------------
Parent: body|paragraph
Paths: /bookmark[@name=NAME]  /bookmark[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type bookmark [--prop key=val ...]
  officecli set <file> /bookmark[N] --prop key=val ...
  officecli get <file> /bookmark[N]
  officecli query <file> bookmark
  officecli remove <file> /bookmark[N]

Properties:
  name   string   [add/set/get]
    description: bookmark name (required). Letters, digits, '.', '_', '-' only.
    example: --prop name=chapter1
    readback: name as stored on BookmarkStart
  text   string   [add]
    description: optional bookmark-covered text. Without this, only an empty Start/End pair is inserted.
    example: --prop text="Chapter 1 title"
    readback: not a distinct key — lives on wrapped runs

Note: Bookmarks are BookmarkStart/End pairs. Name must be addressable: no whitespace, no '/[]"', no leading '@' or single quote. Duplicate names rejected at Add.
```

## docx Element: chart

```text
docx chart
--------------
Parent: paragraph|body
Paths: /body/p[N]/chart[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type chart [--prop key=val ...]
  officecli set <file> /body/p[N]/chart[M] --prop key=val ...
  officecli get <file> /body/p[N]/chart[M]
  officecli query <file> chart
  officecli remove <file> /body/p[N]/chart[M]

Properties:
  chartType   enum   [add/set/get]   aliases: type, charttype
    values: column, bar, line, pie, doughnut, area, scatter, radar, stock, bubble, surface, funnel, treemap, sunburst, boxWhisker, histogram
    example: --prop chartType=column
    readback: chart type name
  title   string   [add/set/get]
    example: --prop title="Q1"
    readback: chart title
  data   string   [add]
    description: inline series spec 'S1:1,2,3;S2:4,5,6'.
    example: --prop data="Sales:10,20,30"
    readback: n/a
  categories   string   [add]
    example: --prop categories=A,B,C
    readback: n/a
  width   length   [add/set/get]
    example: --prop width=15cm
    readback: EMU / unit-qualified
  height   length   [add/set/get]
    example: --prop height=10cm
    readback: EMU / unit-qualified
  preset   string   [add/set]   aliases: theme, style.preset
  style   number   [add/set]   aliases: styleid
  colors   string   [add/set]
  dataRange   string   [add]   aliases: datarange, range
  legend   string   [add/set]
  legendfont   string   [add/set]   aliases: legend.font
  legendoverlay   bool   [add/set]   aliases: legend.overlay
  datalabels   string   [add/set]   aliases: labels
  labelpos   string   [add/set]   aliases: labelposition
  labelfont   string   [add/set]
  labeloffset   number   [add/set]
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
  leaderlines   bool   [add/set]   aliases: showleaderlines
  axistitle   string   [add/set]   aliases: vtitle
  cattitle   string   [add/set]   aliases: htitle
  axismin   number   [add/set]   aliases: min
  axismax   number   [add/set]   aliases: max
  majorunit   number   [add/set]
  minorunit   number   [add/set]
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
  axisfont   string   [add/set]   aliases: axis.font
  majortickmark   string   [add/set]   aliases: majortick
  minortickmark   string   [add/set]   aliases: minortick
  ticklabelpos   string   [add/set]   aliases: ticklabelposition
  ticklabelskip   number   [add/set]   aliases: tickskip
  axisposition   string   [add/set]   aliases: axispos
  axisorientation   string   [add/set]   aliases: axisreverse
  axisline   string   [add/set]   aliases: axis.line
  cataxisline   string   [add/set]   aliases: cataxis.line
  valaxisline   string   [add/set]   aliases: valaxis.line
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
  cataxisvisible   bool   [add/set]   aliases: cataxis.visible
  valaxisvisible   bool   [add/set]   aliases: valaxis.visible
  logbase   number   [add/set]   aliases: logscale, yaxisscale
  crosses   string   [add/set]
  crossesat   number   [add/set]
  crossbetween   string   [add/set]
  dispunits   string   [add/set]   aliases: displayunits
  gridlines   bool   [add/set]   aliases: majorgridlines
  minorgridlines   bool   [add/set]
  plotareafill   string   [add/set]   aliases: plotfill
  chartareafill   string   [add/set]   aliases: chartfill
  plotborder   string   [add/set]   aliases: plotarea.border
  chartborder   string   [add/set]   aliases: chartarea.border
  areafill   string   [add/set]   aliases: area.fill
  linewidth   number   [add/set]
  linedash   string   [add/set]   aliases: dash
  marker   string   [add/set]   aliases: markers
  markersize   number   [add/set]
  showmarker   bool   [add/set]   aliases: showmarkers
  transparency   number   [add/set]   aliases: opacity, alpha
  gradient   string   [add/set]   aliases: gradientfill
  gradients   string   [add/set]
  view3d   string   [add/set]   aliases: camera, perspective
  smooth   bool   [add/set]
  trendline   string   [add/set]
  secondaryaxis   string   [add/set]   aliases: secondary
  referenceline   string   [add/set]   aliases: refline, targetline
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
  combotypes   string   [add/set]   aliases: combo.types
  scatterstyle   string   [add/set]
  radarstyle   string   [add/set]
  varycolors   bool   [add/set]
  dispblanksas   string   [add/set]   aliases: blanksas
  roundedcorners   bool   [add/set]
  autotitledeleted   bool   [add/set]
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
  gapwidth   number   [add/set]   aliases: gap
  overlap   number   [add/set]
  gapdepth   number   [add/set]
  shape   string   [add/set]   aliases: barshape
  explosion   number   [add/set]   aliases: explode
  invertifneg   bool   [add/set]   aliases: invertifnegative
  errbars   string   [add/set]   aliases: errorbars
  seriesshadow   string   [add/set]   aliases: series.shadow
  seriesoutline   string   [add/set]   aliases: series.outline
  holesize   number   [add/set]
  firstsliceangle   number   [add/set]   aliases: sliceangle
  bubblescale   number   [add/set]
  shownegbubbles   bool   [add/set]
  sizerepresents   string   [add/set]
  datatable   bool   [add/set]
  droplines   string   [add/set]
  hilowlines   string   [add/set]
  updownbars   string   [add/set]
  serlines   string   [add/set]   aliases: serieslines
  increaseColor   color   [add]
  decreaseColor   color   [add]
  totalColor   color   [add]
  combosplit   number   [add]

Note: Embedded as inline DrawingML chart (c:chart) or extended chart (cx:chart) depending on chartType. Data via inline spec or per-series props. Mirrors pptx/chart surface.
```

## docx Element: chart-axis

```text
docx chart-axis
---------------
Parent: chart
Addressing: /chart[N]/axis[@role=ROLE]
Operations: set get

Properties:
  title   string   [set/get]
    example: --prop title="Quarter"
  visible   bool   [set/get]
    example: --prop visible=false
  min   number   [set/get]
    example: --prop min=0
  max   number   [set/get]
    example: --prop max=250
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  majorGridlines   bool   [set/get]
    example: --prop majorGridlines=true
  minorGridlines   bool   [set/get]
    example: --prop minorGridlines=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Mirror of pptx/chart-axis.json surface.
```

## docx Element: chart-series

```text
docx chart-series
-----------------
Parent: chart
Paths: /chart[N]/series[K]  /body/p[N]/chart[M]/series[K]
Operations: add set get remove

Usage:
  officecli add <file> /chart[N] --type chart-series [--prop key=val ...]
  officecli set <file> /chart[N]/series[K] --prop key=val ...
  officecli get <file> /chart[N]/series[K]
  officecli remove <file> /chart[N]/series[K]

Properties:
  name   string   [add/set/get]   aliases: title
    example: --prop name="Revenue"
    example: --prop series1.name="Revenue"
  values   string   [add/set/get]
    description: comma-separated numbers, OR cell range reference.
    example: --prop series1.values="120,150,180"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
  categories   string   [add/set]
    description: per-series category override; range reference only.
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
  color   color   [add/set/get]
    description: series fill color.
    example: --prop series1.color=#4472C4
    readback: #-prefixed uppercase hex
  smooth   bool   [set/get]
    example: --prop smooth=true

Note: Mirror of pptx/chart-series. At Add time, series pass as dotted props on the parent chart (series1.name, series1.values, series1.color, series1.categories). This schema represents per-series Set/Get after creation. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type.
```

## docx Element: comment

```text
docx comment
--------------
Parent: paragraph|run
Paths: /comments/comment[N]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type comment [--prop key=val ...]
  officecli add <file> /body/p[N]/r[M] --type comment [--prop key=val ...]
  officecli set <file> /comments/comment[N] --prop key=val ...
  officecli get <file> /comments/comment[N]
  officecli query <file> comment
  officecli remove <file> /comments/comment[N]

Properties:
  text   string   [add/set/get]
    description: comment body. Required.
    example: --prop text="Review this"
    readback: concatenated text
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: Author attribute
  initials   string   [add/set/get]
    description: author initials. Defaults to first char of author.
    example: --prop initials=AW
    readback: Initials attribute
  date   string   [add/set/get]
    description: ISO-8601 timestamp. Defaults to DateTime.UtcNow.
    example: --prop date=2025-01-15T10:00:00Z
    readback: Date attribute

Note: Comments live in WordprocessingCommentsPart. Anchor: CommentRangeStart/End surround the target run or paragraph; CommentReference marks the inline anchor.
```

## docx Element: endnote

```text
docx endnote
--------------
Parent: paragraph|body
Paths: /endnotes/endnote[N]
Operations: add set get query remove

Usage:
  officecli add <file> /endnotes --type endnote [--prop key=val ...]
  officecli set <file> /endnotes/endnote[N] --prop key=val ...
  officecli get <file> /endnotes/endnote[N]
  officecli query <file> endnote
  officecli remove <file> /endnotes/endnote[N]

Properties:
  text   string   [add/set/get]
    example: --prop text="End-of-doc reference"
    readback: concatenated text
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the endnote content paragraph and cascades <w:rtl/> to the paragraph mark.
    values: rtl, ltr
    example: --prop direction=rtl
  alignment   enum   [add/set]   aliases: align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=right
  font.cs   string   [add/set]   aliases: font.complexscript, font.complex
    description: Complex-script font (rFonts/cs).
    example: --prop font.cs="Arabic Typesetting"
  font.ea   string   [add/set]   aliases: font.eastasia, font.eastasian
    example: --prop font.ea="メイリオ"
  font.latin   string   [add/set]
    example: --prop font.latin=Calibri
  bold.cs   bool   [add/set]   aliases: font.bold.cs, boldcs
    example: --prop bold.cs=true
  italic.cs   bool   [add/set]   aliases: font.italic.cs, italiccs
    example: --prop italic.cs=true
  size.cs   font-size   [add/set]   aliases: font.size.cs, sizecs
    example: --prop size.cs=14pt

Note: Endnotes live in EndnotesPart. Semantics mirror footnote.json.
```

## docx Element: equation

```text
docx equation
--------------
Parent: body|paragraph
Paths: /body/oMathPara[N]  /body/p[N]/oMath[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body --type equation [--prop key=val ...]
  officecli set <file> /body/oMathPara[N] --prop key=val ...
  officecli get <file> /body/oMathPara[N]
  officecli query <file> equation
  officecli remove <file> /body/oMathPara[N]

Properties:
  formula   string   [add/set/get]   aliases: text
    description: math expression. Aliases: text.
    example: --prop formula="x^2 + y^2 = z^2"
    readback: source formula when round-trippable
  mode   enum   [add]
    values: display, inline
    example: --prop mode=inline
    readback: determined by parent element type

Note: Aliases: formula, math. formula input is parsed by FormulaParser (LaTeX-ish). Display mode wraps in oMathPara; inline mode appends oMath to the parent paragraph.
```

## docx Element: field

```text
docx field
--------------
Parent: paragraph|body
Paths: /body/p[N]/r[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type field [--prop key=val ...]
  officecli set <file> /body/p[N]/r[M] --prop key=val ...
  officecli get <file> /body/p[N]/r[M]
  officecli query <file> field
  officecli remove <file> /body/p[N]/r[M]

Properties:
  fieldType   enum   [add/set/get]   aliases: fieldtype, type
    values: page, pagenum, pagenumber, numpages, date, author, title, time, filename, section, sectionpages, mergefield, ref, pageref, noteref, seq, styleref, docproperty, if, createdate, savedate, printdate, edittime, lastsavedby, subject, numwords, numchars, revnum, template, comments, doccomments, keywords
    example: --prop fieldType=page
    readback: resolved instruction
  name   string   [add/set/get]   aliases: fieldName, fieldname, bookmarkName, bookmarkname, bookmark, styleName, stylename, propertyName, propertyname
    description: Per-type identifier: mergefield → field name (e.g. CustomerName); ref/pageref/noteref → target bookmark name; styleref → style name; docproperty → property name. Aliases preserve historical naming differences (e.g. ref docs called this 'bookmarkName').
    example: --prop name=CustomerName
    example: --prop bookmarkName=Section1
    example: --prop styleName="Heading 1"
    readback: n/a (embedded in instruction)
  identifier   string   [add/set/get]   aliases: id
    description: SEQ field's identifier (sequence label). Defaults to 'name' when 'identifier' is not supplied — alias accepted on input.
    example: --prop identifier=Figure
    readback: n/a (embedded in instruction)
  expression   string   [add/set/get]   aliases: condition
    description: IF field's logical expression (e.g. 'MERGEFIELD Gender = "Male"').
    example: --prop expression='{ MERGEFIELD Gender } = "Male"'
    readback: n/a (embedded in instruction)
  trueText   string   [add/set/get]   aliases: truetext
    description: IF field's text shown when expression evaluates true.
    example: --prop trueText="Mr."
    readback: n/a (embedded in instruction)
  falseText   string   [add/set/get]   aliases: falsetext
    description: IF field's text shown when expression evaluates false.
    example: --prop falseText="Ms."
    readback: n/a (embedded in instruction)
  hyperlink   boolean   [add/set/get]
    description: REF field: append \h switch so the inserted reference becomes a clickable hyperlink to the bookmark target.
    example: --prop hyperlink=true
    readback: instruction switches
  format   string   [add/set/get]
    description: switch-style format (e.g. '\@ "yyyy-MM-dd"' for date).
    example: --prop format="yyyy-MM-dd"
    readback: instruction switches
  instr   string   [add/set/get]   aliases: instruction, code
    description: Raw field instruction text. Bypasses fieldType-specific helpers — useful for arbitrary fields not covered by the typed shortcuts.
    example: --prop instr=' DATE \@ "yyyy年MM月" '
    readback: instrText element text content

Note: Complex field (fldChar: begin/instr/separate/result/end). Field instruction selected by 'fieldType' or the element-type alias (pagenum, numpages, date, author, title, time, filename, section, sectionpages, mergefield, ref, if, seq, styleref, docproperty). Per-type required parameters: mergefield/ref need 'name' (aka fieldName, bookmarkName); seq needs 'identifier'; styleref needs 'styleName'; docproperty needs 'propertyName'; if needs 'expression' (+ optional 'trueText' / 'falseText'); date/time accept optional 'format'.
```

## docx Element: fieldchar

```text
docx fieldChar
--------------
Parent: paragraph
Paths: /body/p[@paraId=X]/r[N]  /header[N]/p[M]/r[K]  /footer[N]/p[M]/r[K]
Operations: set get query remove

Usage:
  officecli set <file> /body/p[@paraId=X]/r[N] --prop key=val ...
  officecli get <file> /body/p[@paraId=X]/r[N]
  officecli query <file> fieldChar
  officecli remove <file> /body/p[@paraId=X]/r[N]

Properties:
  fieldCharType   enum   [set/get]   aliases: fieldchartype
    values: begin, separate, end
    example: --prop fieldCharType=separate
    readback: fldChar fldCharType attribute

Note: Field-character marker (w:fldChar) — inline atom that delimits a complex field's begin / separate / end boundaries. Atomic add is intentionally NOT supported because a fldChar in isolation is invalid OOXML; use --type field to insert a complete begin+instrText+separate+cached+end sequence as one unit. Get/Set on individual fldChars allows audit→fix workflows to inspect and adjust an existing field's structure.
```

## docx Element: footnote

```text
docx footnote
--------------
Parent: paragraph|body
Paths: /footnotes/footnote[N]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type footnote [--prop key=val ...]
  officecli set <file> /footnotes/footnote[N] --prop key=val ...
  officecli get <file> /footnotes/footnote[N]
  officecli query <file> footnote
  officecli remove <file> /footnotes/footnote[N]

Properties:
  text   string   [add/set/get]
    description: footnote text. Required.
    example: --prop text="See ref [1]"
    readback: concatenated text
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the footnote content paragraph and cascades <w:rtl/> to the paragraph mark.
    values: rtl, ltr
    example: --prop direction=rtl
  alignment   enum   [add/set]   aliases: align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=right
  font.cs   string   [add/set]   aliases: font.complexscript, font.complex
    description: Complex-script font (rFonts/cs) — Arabic / Hebrew typeface.
    example: --prop font.cs="Arabic Typesetting"
  font.ea   string   [add/set]   aliases: font.eastasia, font.eastasian
    description: East-Asian font (rFonts/eastAsia).
    example: --prop font.ea="メイリオ"
  font.latin   string   [add/set]
    description: Latin font slot (rFonts/ascii + hAnsi).
    example: --prop font.latin=Calibri
  bold.cs   bool   [add/set]   aliases: font.bold.cs, boldcs
    description: complex-script bold (<w:bCs/>). Required for Arabic / Hebrew bold rendering.
    example: --prop bold.cs=true
  italic.cs   bool   [add/set]   aliases: font.italic.cs, italiccs
    example: --prop italic.cs=true
  size.cs   font-size   [add/set]   aliases: font.size.cs, sizecs
    example: --prop size.cs=14pt

Note: Footnotes live in FootnotesPart. A FootnoteReference run is inserted at the anchor point; the note body is appended to footnotes.xml. Parent must be a paragraph path (/body/p[N]); use --index N to control position within the paragraph. Run-level parent (/body/p[N]/r[M]) is not accepted -- the footnote reference is inserted as a new run.
```

## docx Element: formfield

```text
docx formfield
--------------
Parent: paragraph|body
Paths: /formfield[@name=NAME]  /formfield[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type formfield [--prop key=val ...]
  officecli set <file> /formfield[N] --prop key=val ...
  officecli get <file> /formfield[N]
  officecli query <file> formfield
  officecli remove <file> /formfield[N]

Properties:
  type   enum   [add/set/get]   aliases: formfieldtype
    description: form field type.
    values: text, checkbox, check, dropdown
    example: --prop type=text
    readback: one of values
  name   string   [add/set/get]
    description: form field name (required for stable addressing). Same constraints as bookmark name.
    example: --prop name=email
    readback: name as stored
  text   string   [add/set/get]   aliases: value
    description: initial text value (text fields only). Alias: value.
    example: --prop text=default
    readback: initial text for text type
  checked   bool   [add/set/get]
    description: default state (checkbox only).
    example: --prop checked=true
    readback: true/false

Note: Form fields embed a BookmarkStart/End so names share the bookmark namespace and validation rules. Three kinds: text (default), checkbox, dropdown.
```

## docx Element: hyperlink

```text
docx hyperlink
--------------
Parent: paragraph
Paths: /body/p[N]/hyperlink[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type hyperlink [--prop key=val ...]
  officecli set <file> /body/p[N]/hyperlink[M] --prop key=val ...
  officecli get <file> /body/p[N]/hyperlink[M]
  officecli query <file> hyperlink
  officecli remove <file> /body/p[N]/hyperlink[M]

Properties:
  url   string   [add/set/get]   aliases: href, link
    description: absolute external URL. Parsed as Uri.TryCreate(UriKind.Absolute).
    example: --prop url=https://example.com
    readback: target URL for external links
  anchor   string   [add/get]   aliases: bookmark
    description: bookmark name for internal links. Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop anchor=section1
    readback: anchor name for internal links
  text   string   [add/set/get]
    description: display text. Defaults to url or anchor value if omitted.
    example: --prop text="click here"
    readback: concatenated run text
  color   color   [add/get]
    description: override link color (default: theme Hyperlink or 0563C1). Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop color=#0000FF
    readback: #-prefixed uppercase hex
  font   string   [add/get]
    description:  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop font="Calibri"
    readback: font name
  size   length   [add/get]
    description:  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop size=11
    readback: unit-qualified pt
  bold   bool   [add/get]
    description:  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop bold=true
    readback: true/false
  italic   bool   [add/get]
    description:  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).
    example: --prop italic=true
    readback: true/false

Note: Aliases: link. Exactly one of 'url' (external) or 'anchor' (internal bookmark ref) is required. Colors default to theme Hyperlink (or 0563C1 fallback) with single underline.
```

## docx Element: instrtext

```text
docx instrText
--------------
Parent: paragraph
Paths: /body/p[@paraId=X]/r[N]  /header[N]/p[M]/r[K]  /footer[N]/p[M]/r[K]
Operations: set get query remove

Usage:
  officecli set <file> /body/p[@paraId=X]/r[N] --prop key=val ...
  officecli get <file> /body/p[@paraId=X]/r[N]
  officecli query <file> instrText
  officecli remove <file> /body/p[@paraId=X]/r[N]

Properties:
  instr   string   [set/get]
    description: The Word field instruction. Leading/trailing spaces inside the value are significant — they form the OOXML separator between switches.
    example: --prop 'instr= PAGE \\* MERGEFORMAT '
    example: --prop 'instr= DATE \\@ "yyyy-MM-dd" '
    readback: instrText element text content

Note: Field-instruction text (w:instrText) — the body of a complex field that holds the instruction string (e.g. 'PAGE \\* MERGEFORMAT', 'DATE \\@ "yyyy-MM-dd"'). Atomic add is intentionally NOT supported because instrText outside a field is invalid; use --type field to insert a complete sequence. Set is supported so audit→fix workflows can rewrite a field's instruction (e.g. PAGE → DATE) without touching the surrounding fldChar markers.
```

## docx Element: ole

```text
docx ole
--------------
Parent: paragraph|body
Paths: /body/p[N]/ole[M]  /header[N]/ole[M]  /footer[N]/ole[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type ole [--prop key=val ...]
  officecli set <file> /body/p[N]/ole[M] --prop key=val ...
  officecli get <file> /body/p[N]/ole[M]
  officecli query <file> ole
  officecli remove <file> /body/p[N]/ole[M]

Properties:
  src   string   [add/set/get]   aliases: path
    description: embedded object source. Alias: path.
    example: --prop src=/path/to/data.xlsx
    readback: object rel id
  progId   string   [add/set/get]   aliases: progid
    description: OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.
    example: --prop progId=Excel.Sheet.12
    readback: ProgID string
  preview   string   [add/set]
    description: preview image path. Auto-generated from ext if omitted.
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  width   length   [add/set/get]
    example: --prop width=3in
    readback: EMU / unit-qualified
  height   length   [add/set/get]
    example: --prop height=2in
    readback: EMU / unit-qualified

Note: Aliases: oleobject, object, embed. Embeds a binary package plus a preview image. Source accepted as file path, URL, or data-URI.
```

## docx Element: pagebreak

```text
docx pagebreak
--------------
Parent: paragraph|body
Paths: /body/p[@paraId=X]/r[N]  /header[N]/p[M]/r[K]  /footer[N]/p[M]/r[K]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[@paraId=X] --type pagebreak [--prop key=val ...]
  officecli set <file> /body/p[@paraId=X]/r[N] --prop key=val ...
  officecli get <file> /body/p[@paraId=X]/r[N]
  officecli query <file> pagebreak
  officecli remove <file> /body/p[@paraId=X]/r[N]

Properties:
  type   enum   [add/get]
    description: Add-only alias; Get surfaces this as 'breakType', and Set requires 'breakType'.
    values: page, column, textWrapping, line
    example: --prop type=page
    example: --prop type=column
    readback: n/a (use 'breakType' on Get / Set)
  breakType   enum   [set/get]   aliases: breaktype
    description: Canonical key on Get/Set. Add accepts 'type' as a parallel synonym for symmetry with the historical alias.
    values: page, column, textWrapping, line
    example: --prop breakType=column
    readback: br type attribute

Note: Inline w:br element wrapped in a run. Aliases: columnbreak, break. type=column → column break; type=page (default) → page break; type=line/textWrapping → soft line break. Surfaced by Get as type=break (when the run carries no <w:t> alongside the <w:br>).
```

## docx Element: picture

```text
docx picture
--------------
Parent: paragraph
Paths: /body/p[N]/pic[M]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type picture [--prop key=val ...]
  officecli set <file> /body/p[N]/pic[M] --prop key=val ...
  officecli get <file> /body/p[N]/pic[M]
  officecli query <file> picture
  officecli remove <file> /body/p[N]/pic[M]

Properties:
  src   string   [add/set/get]   aliases: path
    description: image source (file path, URL, data-URI).
    example: --prop src=/path/to/image.png
    readback: not surfaced directly
  width   length   [add/set/get]
    description: EMU-parseable. If omitted, derived from height + native aspect ratio or defaults to 6in.
    example: --prop width=3in
    readback: unit-qualified length
  height   length   [add/set/get]
    description: EMU-parseable. If omitted, derived from width + native aspect ratio or defaults to 4in.
    example: --prop height=2in
    readback: unit-qualified length
  fallback   string   [add]
    description: optional PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is generated.
    example: --prop fallback=/path/to/fallback.png
    readback: n/a (SVG-only)
  alt   string   [add/set/get]   aliases: alttext, description
    description: alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.
    example: --prop alt="Company logo"
    readback: string

Note: Aliases: image, img. 'src' is required (alias 'path'). Image source resolved via ImageSource — accepts file path, URL, data-URI, or raw bytes. SVGs auto-generate a PNG fallback.
```

## docx Element: ptab

```text
docx ptab
--------------
Parent: paragraph
Paths: /body/p[@paraId=X]/r[N]  /header[N]/p[M]/r[K]  /footer[N]/p[M]/r[K]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[@paraId=X] --type ptab [--prop key=val ...]
  officecli set <file> /body/p[@paraId=X]/r[N] --prop key=val ...
  officecli get <file> /body/p[@paraId=X]/r[N]
  officecli query <file> ptab
  officecli remove <file> /body/p[@paraId=X]/r[N]

Properties:
  alignment   enum   [add/set/get]
    values: left, center, right
    example: --prop alignment=center
    example: --prop alignment=right
    readback: ptab alignment attribute
  relativeTo   enum   [add/set/get]   aliases: relativeto
    values: margin, indent
    example: --prop relativeTo=margin
    readback: ptab relativeTo attribute
  leader   enum   [add/set/get]
    values: none, dot, hyphen, middleDot, underscore
    example: --prop leader=dot
    readback: ptab leader attribute

Note: Inline positional tab (w:ptab, Word 2007+). Anchors left/center/right alignment regions in headers/footers. Inserted as <w:r><w:ptab/></w:r>; surfaced by Get as type=ptab. Aliases: positionaltab.
```

## docx Element: run

```text
docx run
--------------
Parent: paragraph
Paths: /body/p[@paraId=ID]/r[N]  /body/p[N]/r[N]
Operations: add set get remove

Usage:
  officecli add <file> /body/p[N] --type run [--prop key=val ...]
  officecli set <file> /body/p[N]/r[N] --prop key=val ...
  officecli get <file> /body/p[N]/r[N]
  officecli remove <file> /body/p[N]/r[N]

Properties:
  text   string   [add/set/get]
    example: --prop text="run content"
    readback: plain text of run
  bold   bool   [add/set/get]   aliases: font.bold
    example: --prop bold=true
    readback: true | false
  italic   bool   [add/set/get]   aliases: font.italic
    example: --prop italic=true
    readback: true | false
  font   string   [add/set/get]   aliases: fontname, fontFamily, font.name
    description: font family (e.g. "Times New Roman", "SimSun")
    example: --prop font="Times New Roman"
  size   font-size   [add/set/get]   aliases: fontsize, font.size
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified, e.g. "14pt"
  color   color   [add/set/get]   aliases: font.color
    example: --prop color=FF0000
    example: --prop color=#FF0000
    example: --prop color=red
    readback: #RRGGBB uppercase
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style. Common values: single, double, dotted, dash, wave, none.
    values: single, double, dotted, dash, wave, none, thick, dottedHeavy, dashLong, dashLongHeavy, dashDotHeavy, wavyHeavy, wavyDouble
    example: --prop underline=single
    example: --prop underline=double
    readback: underline style name
  highlight   color   [add/set/get]
    description: Word built-in highlight color. Accepts named colors (yellow, green, cyan, magenta, blue, red, ...).
    example: --prop highlight=yellow
    readback: highlight color name
  strike   bool   [add/set/get]   aliases: strikethrough, font.strike, font.strikethrough
    description: single strikethrough.
    example: --prop strike=true
    readback: true | false
  dstrike   bool   [add/set/get]   aliases: doublestrike, doubleStrike
    description: double strikethrough.
    example: --prop dstrike=true
    readback: true | false
  caps   bool   [add/set/get]   aliases: allCaps
    description: render text in all caps (display only; underlying text unchanged).
    example: --prop caps=true
    readback: true | false
  smallcaps   bool   [add/set/get]   aliases: smallCaps
    description: render lowercase as small caps.
    example: --prop smallcaps=true
    readback: true | false
  vanish   bool   [add/set/get]
    description: hidden text (not rendered, but present in the file).
    example: --prop vanish=true
    readback: true | false
  outline   bool   [add/set/get]
    description: outline (text effect).
    example: --prop outline=true
    readback: true | false
  shadow   bool   [add/set/get]
    description: shadow (text effect).
    example: --prop shadow=true
    readback: true | false
  emboss   bool   [add/set/get]
    description: emboss (text effect).
    example: --prop emboss=true
    readback: true | false
  imprint   bool   [add/set/get]
    description: imprint / engrave (text effect).
    example: --prop imprint=true
    readback: true | false
  noproof   bool   [add/set/get]   aliases: noProof
    description: exclude this run from spell/grammar checking.
    example: --prop noproof=true
    readback: true | false
  rtl   bool   [add/set/get]
    description: right-to-left text.
    example: --prop rtl=true
    readback: true | false
  direction   enum   [add/set]   aliases: dir
    description: run reading direction (alias of rtl). Use 'rtl' for Arabic / Hebrew, 'ltr' to clear. Get exposes the canonical 'rtl=true|false' readback for run direction.
    values: ltr, rtl
    example: --prop direction=rtl
  font.cs   string   [add/set/get]   aliases: font.complexscript, font.complex
    description: Complex-script font slot (rFonts/cs) — Arabic / Hebrew / Thai typefaces.
    example: --prop font.cs="Arabic Typesetting"
  font.ea   string   [add/set/get]   aliases: font.eastasia, font.eastasian
    description: East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.
    example: --prop font.ea="メイリオ"
  font.latin   string   [add/set/get]
    description: Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.
    example: --prop font.latin=Calibri
  bold.cs   bool   [add/set/get]   aliases: font.bold.cs, boldcs
    description: complex-script bold (<w:bCs/>). Word renders Arabic / Hebrew bold via this flag, NOT <w:b/>. Required for Arabic bold to actually render.
    example: --prop bold.cs=true
    readback: true | false
  italic.cs   bool   [add/set/get]   aliases: font.italic.cs, italiccs
    description: complex-script italic (<w:iCs/>). Same role as bold.cs for italic styling on Arabic / Hebrew text.
    example: --prop italic.cs=true
    readback: true | false
  size.cs   font-size   [add/set/get]   aliases: font.size.cs, sizecs
    description: complex-script font size (<w:szCs/>). Independent from the bare 'size' (<w:sz/>) which only sizes Latin text.
    example: --prop size.cs=14pt
    example: --prop size.cs=14
    readback: unit-qualified, e.g. "14pt"
  lang.latin   string   [set/get]   aliases: lang, lang.val
    description: Latin-script language tag (<w:lang w:val=.../>). e.g. en-US, fr-FR.
    example: --prop lang.latin=en-US
    readback: BCP-47 / xml:lang tag, e.g. "en-US"
  lang.ea   string   [set/get]   aliases: lang.eastAsia, lang.eastAsian
    description: EastAsian-script language tag (<w:lang w:eastAsia=.../>). e.g. zh-CN, ja-JP.
    example: --prop lang.ea=zh-CN
    readback: BCP-47 / xml:lang tag
  lang.cs   string   [set/get]   aliases: lang.complexScript, lang.bidi
    description: ComplexScript language tag (<w:lang w:bidi=.../>). e.g. ar-SA, he-IL.
    example: --prop lang.cs=ar-SA
    readback: BCP-47 / xml:lang tag
  superscript   bool   [add/set/get]
    description: vertical alignment = superscript. Mutually exclusive with subscript.
    example: --prop superscript=true
    readback: true | false
  subscript   bool   [add/set/get]
    description: vertical alignment = subscript. Mutually exclusive with superscript.
    example: --prop subscript=true
    readback: true | false
  vertAlign   enum   [add/set]   aliases: vertalign
    description: vertical text alignment. Values: superscript|super, subscript|sub, baseline.
    values: superscript, super, subscript, sub, baseline
    example: --prop vertAlign=superscript
    readback: n/a (surfaces as superscript/subscript flag)
  charSpacing   length   [add/set/get]   aliases: charspacing, letterspacing, letterSpacing, spacing
    description: character spacing (letter spacing) in points. Stored as twips × 20.
    example: --prop charSpacing=1pt
    example: --prop charspacing=2
    readback: unit-qualified pt, e.g. "1pt"
  shading   color   [add/set/get]   aliases: shd
    description: background shading color or '<pattern>;<fill>;<color>' triplet.
    example: --prop shading=FFFF00
    example: --prop shd=clear;FFFF00;auto
    readback: fill #RRGGBB
  textOutline   string   [add/set]   aliases: textoutline
    description: w14 text outline 'WIDTHpt-COLOR' (e.g. '1pt-FF0000'). Width first, color second; '-' or ';' separator.
    example: --prop textOutline=1pt-FF0000
    readback: n/a
  textFill   string   [add/set]   aliases: textfill
    description: w14 text fill (color or gradient spec).
    example: --prop textFill=FF0000
    readback: n/a
  w14shadow   string   [add/set]
    description: w14 text shadow effect.
    example: --prop w14shadow=FF0000
    readback: n/a
  w14glow   string   [add/set]
    description: w14 text glow effect.
    example: --prop w14glow=FF0000
    readback: n/a
  w14reflection   string   [add/set]
    description: w14 text reflection effect.
    example: --prop w14reflection=true
    readback: n/a
```

## docx Element: sdt

```text
docx sdt
--------------
Parent: body|paragraph
Paths: /sdt[N]  /body/p[N]/sdt[M]
Operations: add set get query remove

Usage:
  officecli add <file> / --type sdt [--prop key=val ...]
  officecli set <file> /sdt[N] --prop key=val ...
  officecli get <file> /sdt[N]
  officecli query <file> sdt
  officecli remove <file> /sdt[N]

Properties:
  type   enum   [add/get]
    description: SDT variant. Only text/richtext/dropdown/combobox/date are supported at add-time. picture/checkbox are not implemented — create those in Word and edit via CLI. Type cannot be changed after creation.
    values: text, richtext, dropdown, combobox, date
    example: --prop type=text
    example: --prop type=dropdown
    readback: type descriptor
  tag   string   [add/set/get]
    description: machine-readable tag for data-binding.
    example: --prop tag=customerName
    readback: Tag attribute
  alias   string   [add/set/get]
    description: human-readable display name shown in Word.
    example: --prop alias="Customer Name"
    readback: Alias attribute
  text   string   [add/set/get]
    description: placeholder/initial content.
    example: --prop text="[Enter name]"
    readback: concatenated text

Note: Aliases: contentcontrol. Structured document tags — inline or block. Block-level SDT wraps paragraphs; inline SDT wraps runs.
```

## docx Element: toc

```text
docx toc
--------------
Parent: body|paragraph
Paths: /toc  /tableofcontents
Operations: add set get query remove

Usage:
  officecli add <file> / --type toc [--prop key=val ...]
  officecli set <file> /toc --prop key=val ...
  officecli get <file> /toc
  officecli query <file> toc
  officecli remove <file> /toc

Properties:
  levels   string   [add/set/get]
    description: heading range (e.g. '1-3').
    example: --prop levels=1-3
    readback: levels string
  title   string   [add/set/get]
    description: optional caption above the TOC.
    example: --prop title="Contents"
    readback: caption text
  hyperlinks   bool   [add/set/get]
    description: generate clickable links.
    example: --prop hyperlinks=true
    readback: true/false

Note: Aliases: tableofcontents. Inserts a TOC field (complex fldChar). Word rebuilds the rendered entries on open unless 'pre-render' is used.
```

## docx Element: trackedchange

```text
docx trackedchange
------------------
Parent: paragraph|run
Paths: /body/p[N]/ins[M]  /body/p[N]/del[M]
Operations: get query

Usage:
  officecli get <file> /body/p[N]/ins[M]
  officecli query <file> trackedchange

Properties:
  type   enum   [get]
    values: ins, del, moveTo, moveFrom
    example: --prop type=ins
    readback: revision type (read-only)
  text   string   [get]
    description: text content for ins / content marker for del (read-only).
    readback: concatenated text (read-only)
  author   string   [get]
    readback: revision author (read-only)
  date   string   [get]
    description: ISO-8601 timestamp (read-only).
    readback: Date attribute (read-only)

Note: Raw revision element. Type selector routes to w:ins / w:del / w:moveTo / w:moveFrom. Tracked revisions are authored by Word itself (File -> Options -> Track Changes). CLI exposes read-only access: use `query revision` or `get /body/p[N]/ins[M]`. Handler also accepts bulk aliases (trackedchanges, acceptallchanges, rejectallchanges, acceptchanges, rejectchanges) for read/query.
```

## docx Element: section

```text
docx section
--------------
Parent: body
Paths: /section[N]  /body/sectPr[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type section [--prop key=val ...]
  officecli set <file> /section[N] --prop key=val ...
  officecli get <file> /section[N]
  officecli query <file> section
  officecli remove <file> /section[N]

Properties:
  type   enum   [add/set/get]   aliases: nextPage, evenPage, oddPage
    description: section break type. Only applies to mid-document sections at /section[N]; the body-level path / refers to the final section which has no break type, and Set rejects 'type'/'break' there with an actionable error pointing at /section[N].
    values: nextPage, continuous, evenPage, oddPage
    example: --prop type=nextPage
    example: --prop break=newPage
    readback: one of values (innerText)
  pageWidth   length   [add/set/get]   aliases: pagewidth, width
    example: --prop pageWidth=21cm
    readback: unit-qualified cm (e.g. "21cm")
  pageHeight   length   [add/set/get]   aliases: pageheight, height
    example: --prop pageHeight=29.7cm
    readback: unit-qualified cm (e.g. "29.7cm")
  orientation   enum   [add/set/get]
    values: portrait, landscape
    example: --prop orientation=landscape
    readback: innerText of PageOrientationValues
  marginTop   length   [add/set/get]
    example: --prop marginTop=2.5cm
    readback: unit-qualified cm
  marginBottom   length   [add/set/get]
    example: --prop marginBottom=2.5cm
    readback: unit-qualified cm
  marginLeft   length   [add/set/get]
    example: --prop marginLeft=3cm
    readback: unit-qualified cm
  marginRight   length   [add/set/get]
    example: --prop marginRight=3cm
    readback: unit-qualified cm
  columns   int   [add/set/get]   aliases: columns.count
    description: number of text columns. Add accepts combined form "N" or "N,SPACE" (e.g. "2,1cm"); separate space override via alias "columns.space".
    example: --prop columns=2
    example: --prop columns=2,1cm
    readback: integer column count
  columnSpace   length   [add/set/get]   aliases: columns.space
    description: space between columns. Canonical key. Legacy alias 'columns.space' still accepted on Add/Set.
    example: --prop columnSpace=1cm
    readback: unit-qualified cm
  titlePage   bool   [set/get]   aliases: titlepage, titlepg
    description: enable distinct first-page header/footer for the section (writes <w:titlePg/>).
    example: --prop titlePage=true
    readback: true when <w:titlePg/> is present
  pageNumFmt   enum   [set/get]   aliases: pagenumfmt, pagenumberformat, pagenumberfmt
    description: page-number numeric format (writes w:pgNumType/@w:fmt). Common: decimal / lowerRoman / upperRoman / lowerLetter / upperLetter. Locale-specific: hindiNumbers / hindiVowels / arabicAlpha / arabicAbjad / thaiCounting / chineseCounting / japaneseCounting / koreanCounting / ideographDigital. Use 'hindiNumbers' for Indic-Arabic numerals (٠١٢٣) common in Arabic documents.
    values: decimal, lowerRoman, upperRoman, lowerLetter, upperLetter, hindiNumbers, hindiVowels, hindiConsonants, hindiCounting, arabicAlpha, arabicAbjad, thaiNumbers, thaiLetters, thaiCounting, chineseCounting, chineseCountingThousand, chineseLegalSimplified, japaneseCounting, japaneseLegal, japaneseDigitalTen, koreanCounting, koreanLegal, koreanDigital, ideographDigital, ideographTraditional, ideographZodiac, none
    example: --prop pageNumFmt=lowerRoman
    example: --prop pageNumFmt=hindiNumbers
    readback: innerText of NumberFormatValues
  direction   enum   [add/set/get]   aliases: dir, bidi
    description: section reading direction (writes <w:bidi/> on sectPr). Flips page side, header/footer anchors, and gutter for Arabic / Hebrew documents. Apply at section level alongside paragraph-level direction for a fully RTL document.
    values: ltr, rtl
    example: --prop direction=rtl
    readback: rtl (only emitted when sectPr/<w:bidi/> is present)
  pageStart   int   [set/get]   aliases: pagestart, pagenumberstart, pagenumstart
    description: starting page number for the section (writes w:pgNumType/@w:start). Use 'none'/'off' to clear.
    example: --prop pageStart=1
    example: --prop pageStart=none
    readback: integer start value
  lineNumbers   enum   [add/set/get]   aliases: restartPage, restartSection
    values: continuous, restartPage, restartSection
    example: --prop lineNumbers=continuous
    readback: one of values

Note: Sections are section-break paragraphs carrying SectionProperties. Canonical length readback is cm (via FormatTwipsToCm). Lenient length input (twips int, or 2cm/0.5in/24pt via ParseTwips).
```

## docx Element: style

```text
docx style
--------------
Parent: styles
Paths: /styles/StyleId  /style[@name=NAME]  /style[N]
Operations: add set get query remove

Usage:
  officecli add <file> /styles --type style [--prop key=val ...]
  officecli set <file> /style[@name=NAME] --prop key=val ...
  officecli get <file> /style[@name=NAME]
  officecli query <file> style
  officecli remove <file> /style[@name=NAME]

Properties:
  id   string   [add/get]   aliases: styleId, styleid
    description: w:styleId (unique, immutable identity). Aliases fall through to 'name' when 'id' is omitted. Renaming after Add would require rewriting every paragraph/run/basedOn reference in the document; not supported.
    example: --prop id=MyAccent
    example: --prop styleId=MyAccent
    readback: StyleId value
  name   string   [add/set/get]   aliases: styleName, stylename
    description: display name. Defaults to 'id' when omitted.
    example: --prop name="My Accent"
    example: --prop styleName="My Accent"
    readback: StyleName.Val
  type   enum   [add/get]   aliases: character, paragraph
    values: paragraph, character, table, numbering
    example: --prop type=paragraph
    readback: one of values (innerText of StyleValues)
  basedOn   string   [add/set/get]   aliases: basedon
    example: --prop basedOn=Normal
    readback: BasedOn.Val
  next   string   [add/set/get]
    description: next-paragraph style id.
    example: --prop next=Normal
    readback: NextParagraphStyle.Val
  alignment   enum   [add/set/get]   aliases: align
    values: left, center, right, justify, both, distribute
    example: --prop alignment=center
    readback: one of values
  spaceBefore   length   [add/set/get]   aliases: spacebefore
    example: --prop spaceBefore=12pt
    readback: unit-qualified
  spaceAfter   length   [add/set/get]   aliases: spaceafter
    example: --prop spaceAfter=6pt
    readback: unit-qualified
  font   string   [add/set/get]
    example: --prop font="Calibri"
    readback: font name
  size   length   [add/set/get]
    example: --prop size=14
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true/false
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true/false
  color   color   [add/set/get]
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex
  underline   string   [add/set/get]
    description: underline style (true/false, single, double, thick, dotted, dash, wavy, none, ...). Applied to the style's rPr.
    example: --prop underline=single
    example: --prop underline=double
    readback: underline style or true/false
  strike   bool   [add/set/get]   aliases: strikethrough
    description: single-line strikethrough on the style's rPr.
    example: --prop strike=true
    readback: true/false
  dstrike   bool   [add/set/get]   aliases: doublestrike
    description: double-line strikethrough on the style's rPr.
    example: --prop dstrike=true
    readback: true/false
  highlight   string   [add/set/get]
    description: highlight color (yellow, green, cyan, magenta, blue, red, darkBlue, darkCyan, darkGreen, darkMagenta, darkRed, darkYellow, darkGray, lightGray, black, white, none).
    example: --prop highlight=yellow
    readback: highlight color name
  caps   bool   [add/set/get]
    description: all-caps display on the style's rPr.
    example: --prop caps=true
    readback: true/false
  smallCaps   bool   [add/set/get]   aliases: smallcaps
    description: small-caps display on the style's rPr.
    example: --prop smallCaps=true
    readback: true/false
  vanish   bool   [add/set/get]   aliases: hidden
    description: hidden text on the style's rPr.
    example: --prop vanish=true
    readback: true/false
  rtl   bool   [add/set/get]
    description: right-to-left run layout on the style's rPr.
    example: --prop rtl=true
    readback: true/false
  vertAlign   enum   [add/set/get]   aliases: vertalign, verticalAlign
    description: vertical text alignment (superscript/subscript) on the style's rPr.
    values: superscript, subscript, baseline
    example: --prop vertAlign=superscript
    readback: one of values
  charSpacing   length   [add/set/get]   aliases: charspacing, letterSpacing, letterspacing
    description: character spacing (letter-spacing) on the style's rPr.
    example: --prop charSpacing=2pt
    readback: unit-qualified pt
  shading   color   [add/set/get]   aliases: shd
    description: background shading fill color on the style's rPr (or pPr for paragraph styles).
    example: --prop shading=#FFFF00
    readback: #-prefixed uppercase hex
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: line spacing — multiplier (1.5x, 150%) or fixed (18pt). Applied to the style's pPr.
    example: --prop lineSpacing=1.5x
    example: --prop lineSpacing=18pt
    readback: "<N>x" or "<N>pt"
  contextualSpacing   bool   [add/set/get]   aliases: contextualspacing
    description: suppress spacing between paragraphs of the same style.
    example: --prop contextualSpacing=true
    readback: true/false
  outlineLvl   int   [add/set/get]   aliases: outlinelvl, outlineLevel, outlinelevel
    description: outline level (0-9, 0=Heading 1). Drives TOC and Navigator. Applied to the style's pPr.
    example: --prop outlineLvl=0
    readback: integer 0-9
  kinsoku   bool   [add/set/get]
    description: kinsoku (CJK line-break rules) toggle. Applied to the style's pPr.
    example: --prop kinsoku=true
    readback: true/false
  snapToGrid   bool   [add/set/get]   aliases: snaptogrid
    description: snap to document grid for CJK layout. Applied to the style's pPr.
    example: --prop snapToGrid=false
    readback: true/false
  wordWrap   bool   [add/set/get]   aliases: wordwrap
    description: allow word-break for non-CJK text inside CJK lines. Applied to the style's pPr.
    example: --prop wordWrap=true
    readback: true/false
  autoSpaceDE   bool   [add/set/get]   aliases: autospacede
    description: auto spacing between East-Asian and Latin text. Applied to the style's pPr.
    example: --prop autoSpaceDE=true
    readback: true/false
  autoSpaceDN   bool   [add/set/get]   aliases: autospacedn
    description: auto spacing between East-Asian text and numbers. Applied to the style's pPr.
    example: --prop autoSpaceDN=true
    readback: true/false
  bidi   bool   [add/set/get]
    description: right-to-left paragraph direction. Applied to the style's pPr.
    example: --prop bidi=true
    readback: true/false
  direction   enum   [add/set/get]   aliases: dir
    description: Paragraph reading direction (Arabic / Hebrew). 'rtl' writes <w:bidi/> on the style pPr; equivalent to bidi=true in canonical form.
    values: rtl, ltr
    example: --prop direction=rtl
    readback: rtl | ltr
  overflowPunct   bool   [add/set/get]   aliases: overflowpunct
    description: allow punctuation to hang outside the text margin (CJK). Applied to the style's pPr.
    example: --prop overflowPunct=true
    readback: true/false
  topLinePunct   bool   [add/set/get]   aliases: toplinepunct
    description: compress punctuation at the start of a line (CJK). Applied to the style's pPr.
    example: --prop topLinePunct=true
    readback: true/false
  suppressAutoHyphens   bool   [add/set/get]   aliases: suppressautohyphens
    description: disable automatic hyphenation in this style.
    example: --prop suppressAutoHyphens=true
    readback: true/false
  suppressLineNumbers   bool   [add/set/get]   aliases: suppresslinenumbers
    description: exclude this paragraph style from line numbering.
    example: --prop suppressLineNumbers=true
    readback: true/false
  keepNext   bool   [add/set/get]   aliases: keepnext
    description: keep this paragraph on the same page as the next.
    example: --prop keepNext=true
    readback: true/false
  keepLines   bool   [add/set/get]   aliases: keeplines
    description: keep all lines of this paragraph together on one page.
    example: --prop keepLines=true
    readback: true/false
  pageBreakBefore   bool   [add/set/get]   aliases: pagebreakbefore
    description: force a page break before each paragraph using this style.
    example: --prop pageBreakBefore=true
    readback: true/false
  widowControl   bool   [add/set/get]   aliases: widowcontrol
    description: prevent widows and orphans (single isolated lines).
    example: --prop widowControl=true
    readback: true/false
  pbdr   string   [set/get]   aliases: border
    description: paragraph border. Sub-keys: pbdr.top / pbdr.bottom / pbdr.left / pbdr.right / pbdr.between / pbdr.bar / pbdr.all. Value form: 'style:size:color' (e.g. 'single:6:#FF0000').
    example: --prop pbdr.bottom=single:6:#FF0000
    example: --prop pbdr.all=single:4:auto
    readback: style on the bare key, sub-attrs as <key>.sz / <key>.color / <key>.space
  numId   int   [add/set/get]   aliases: numid
    description: numbering instance ID this style references. Paragraphs using --prop style=<id> inherit numbering through ResolveNumPrFromStyle without their own numPr — the canonical multi-level outline pattern (Heading1..9). Requires the numId to already exist in /numbering.
    example: --prop numId=3
    readback: integer numId on style/pPr/numPr
  ilvl   int   [add/set/get]   aliases: numLevel, numlevel
    description: list level (0-8) for the style-borne numPr.
    example: --prop ilvl=0
    readback: integer 0-8

Note: Style type defaults to paragraph. 'id' must be unique in styles.xml; duplicate id rejected if explicit, else auto-suffixed. Built-in ids (Normal, Heading1..9, Title, Subtitle, Quote, IntenseQuote, ListParagraph, NoSpacing, TOCHeading) bypass the customStyle=true flag.
```

## docx Element: styles

```text
docx styles
--------------
Read-only container (never created or removed via CLI).
Parent: document
Paths: /styles
Operations: add get query

Usage:
  officecli get <file> /styles
  officecli query <file> styles

Children:
  style  (0..n)  /{StyleId}

Note: StyleDefinitionsPart container. Add new styles here (see docx/style.json). Individual styles addressed by id: /styles/StyleId.
```

## docx Element: table

```text
docx table
--------------
Parent: body
Paths: /body/tbl[N]
Operations: add set get query remove

Usage:
  officecli add <file> /body --type table [--prop key=val ...]
  officecli set <file> /body/tbl[N] --prop key=val ...
  officecli get <file> /body/tbl[N]
  officecli query <file> table
  officecli remove <file> /body/tbl[N]

Properties:
  rows   int   [add]
    example: --prop rows=3
    readback: n/a (use children count)
  cols   int   [add]
    example: --prop cols=3
    readback: n/a (use tableGrid count)
  data   string   [add]
    description: inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.
    example: --prop data="A,B;1,2"
    readback: n/a (seeds cells at Add time)
  colwidths   string   [add]   aliases: colWidths
    description: comma-separated per-column widths in twips. Aliases: colWidths.
    example: --prop colwidths=3000,2000,5000
    readback: per-column grid widths, not aggregated
  alignment   enum   [add/set/get]
    values: left, center, right
    example: --prop alignment=center
    readback: one of values
  width   string   [add/set/get]
    description: table width in twips (Dxa) or percent ('50%' → Pct).
    example: --prop width=9000
    readback: Dxa twips or pct50ths
  indent   int   [add/set/get]
    description: table indent in twips.
    example: --prop indent=200
    readback: twips
  cellspacing   int   [add/set/get]
    description: space between cells in twips.
    example: --prop cellspacing=40
    readback: twips
  layout   enum   [add/set/get]
    values: fixed, autofit
    example: --prop layout=fixed
    readback: one of values
  padding   int   [add/set/get]
    description: default cell padding (all four sides) in twips.
    example: --prop padding=100
    readback: per-side values on TableCellMarginDefault
  style   string   [add/set/get]
    description: built-in or custom table styleId.
    example: --prop style=TableGrid
    readback: styleId
  border.all   string   [add/set]   aliases: border
    description: set top/bottom/left/right AND inside horizontal/vertical borders at once. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. SIZE is in 1/8 pt units (4 = 0.5pt). Aliases: border.
    example: --prop border.all="single;4;FF0000"
    readback: read per-side under border.top/bottom/left/right/insideH/insideV
  border.top   string   [add/set/get]
    description: outer top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.top="single;4;000000"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.bottom   string   [add/set/get]
    description: outer bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.bottom="double;6;0000FF"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.left   string   [add/set/get]
    description: outer left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.left="single;4"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.right   string   [add/set/get]
    description: outer right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.right="single;4"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.horizontal   string   [add/set/get]   aliases: border.insideh, border.insideH
    description: inside horizontal borders (between rows). Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Alias: border.insideH.
    example: --prop border.horizontal="single;4;CCCCCC"
    readback: under canonical key 'border.insideH'
  border.vertical   string   [add/set/get]   aliases: border.insidev, border.insideV
    description: inside vertical borders (between columns). Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Alias: border.insideV.
    example: --prop border.vertical="single;4;CCCCCC"
    readback: under canonical key 'border.insideV'

Children:
  row  (1..n)  /tr
  cell  (1..n (per row))  /tc

Note: Tables default to Single/Size=4 borders on all sides. Length props use twips (raw int) or unit-qualified. Data can be seeded via 'data' (semicolon rows, comma cells) or per-cell 'r{R}c{C}' props.
```

## docx Element: table-row

```text
docx row
--------------
Parent: table
Paths: /body/tbl[N]/tr[R]
Operations: add set get query remove

Usage:
  officecli add <file> /body/tbl[N] --type row [--prop key=val ...]
  officecli set <file> /body/tbl[N]/tr[R] --prop key=val ...
  officecli get <file> /body/tbl[N]/tr[R]
  officecli query <file> row
  officecli remove <file> /body/tbl[N]/tr[R]

Properties:
  cols   int   [add]
    example: --prop cols=3
    readback: n/a (structural)
  height   length   [add/set/get]
    description: row height in twips or unit-qualified (AtLeast rule).
    example: --prop height=500
    readback: twips
  height.exact   length   [add/set/get]
    description: row height in twips (Exact rule, cannot grow).
    example: --prop height.exact=500
    readback: twips with rule=exact
  header   bool   [add/set/get]
    description: repeat row as table header on every page.
    example: --prop header=true
    readback: true when header, key absent otherwise

Note: Row column count defaults to the parent table grid. height uses AtLeast rule; height.exact forces Exact rule.
```

## docx Element: table-cell

```text
docx cell
--------------
Parent: row
Paths: /body/tbl[N]/tr[R]/tc[C]
Operations: add set get query remove

Usage:
  officecli add <file> /body/tbl[N]/tr[R] --type cell [--prop key=val ...]
  officecli set <file> /body/tbl[N]/tr[R]/tc[C] --prop key=val ...
  officecli get <file> /body/tbl[N]/tr[R]/tc[C]
  officecli query <file> cell
  officecli remove <file> /body/tbl[N]/tr[R]/tc[C]

Properties:
  text   string   [add/set/get]
    description: single-run text content placed in a fresh paragraph.
    example: --prop text="Hello"
    readback: concatenated run text
  width   int   [add/set/get]
    description: cell width in twips (Dxa).
    example: --prop width=2500
    readback: twips
  font   string   [set/get]   aliases: fontname, fontFamily
    description: font family applied to every run in every paragraph in the cell (set-only; apply after add).
    example: --prop font="Times New Roman"
    readback: from first run's RunFonts.Ascii
  size   font-size   [set/get]   aliases: fontsize
    description: font size applied to every run in the cell. Accepts raw number (points), '14pt', '10.5pt' (set-only; apply after add).
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified, e.g. "14pt"
  bold   bool   [set/get]
    description: bold applied to every run in the cell (set-only; apply after add).
    example: --prop bold=true
    readback: true | (absent)
  italic   bool   [set/get]
    description: italic applied to every run in the cell (set-only; apply after add).
    example: --prop italic=true
    readback: true | (absent)
  underline   enum   [set/get]
    description: underline style applied to every run in the cell (set-only; apply after add).
    values: none, single, double, thick, dotted, dash, wave, words
    example: --prop underline=single
    example: --prop underline=double
    readback: one of values
  strike   bool   [set/get]
    description: strike-through applied to every run in the cell (set-only; apply after add).
    example: --prop strike=true
    readback: true | (absent)
  color   color   [set/get]
    description: run text color applied to every run in the cell (set-only; apply after add).
    example: --prop color=FF0000
    example: --prop color=#FF0000
    example: --prop color=red
    readback: #RRGGBB uppercase
  highlight   color   [set/get]
    description: text highlight color. Mapped to Word's named highlight palette (yellow, green, cyan, magenta, blue, red, darkBlue, …) (set-only; apply after add).
    example: --prop highlight=yellow
    readback: highlight palette name
  fill   color   [set/get]   aliases: shd, shading
    description: cell background shading. Also accepts 'gradient;STARTCOLOR;ENDCOLOR[;ANGLE]' for a w14:gradFill gradient (set-only; apply after add).
    example: --prop fill=FFFF00
    example: --prop fill="gradient;FF0000;0000FF;90"
    readback: #RRGGBB uppercase, or 'gradient;#START;#END;ANGLE'
  alignment   enum   [set/get]   aliases: halign, align
    description: horizontal paragraph alignment applied to every paragraph in the cell (set-only; apply after add).
    values: left, center, right, justify, both, distribute
    example: --prop alignment=center
    readback: one of values (from first paragraph)
  valign   enum   [set/get]
    description: vertical alignment of cell contents (set-only; apply after add).
    values: top, center, bottom
    example: --prop valign=center
    readback: one of values
  colspan   int   [set/get]   aliases: gridspan
    description: number of grid columns this cell spans. Aliases: gridspan. Adjusts cell width to the sum of spanned grid columns and removes now-redundant trailing cells in the row (set-only; apply after add).
    example: --prop colspan=2
    readback: under key 'colspan' when > 1
  fitText   bool   [set]   aliases: fittext
    description: enable w:fitText on every run so text is squeezed to the cell width (set-only; apply after add).
    example: --prop fitText=true
    readback: n/a
  textDirection   enum   [set/get]   aliases: textdir
    description: text flow direction inside the cell. Aliases: textdir (set-only; apply after add).
    values: lrtb, btlr, tbrl, horizontal, vertical, vertical-rl, tbrl-r, lrtb-r, tblr-r
    example: --prop textDirection=btlr
    readback: OpenXML enum inner text
  direction   enum   [add/set/get]   aliases: dir, bidi
    description: Reading direction (Arabic / Hebrew). 'rtl' writes <w:bidi/> on the cell paragraph and cascades <w:rtl/> to runs. Distinct from textDirection (which controls vertical/horizontal text flow inside the cell).
    values: rtl, ltr
    example: --prop direction=rtl
    readback: rtl when set, key absent otherwise
  nowrap   bool   [set/get]
    description: disable text wrapping inside the cell (set-only; apply after add).
    example: --prop nowrap=true
    readback: true | (absent)
  padding.top   length   [set/get]
    description: top cell margin. Value is stored as Dxa twips (raw int).
    example: --prop padding.top=100
    readback: twips
  padding.bottom   length   [set/get]
    description: bottom cell margin in twips.
    example: --prop padding.bottom=100
    readback: twips
  padding.left   length   [set/get]
    description: left cell margin in twips.
    example: --prop padding.left=100
    readback: twips
  padding.right   length   [set/get]
    description: right cell margin in twips.
    example: --prop padding.right=100
    readback: twips
  border.all   string   [set]   aliases: border
    description: set top/bottom/left/right cell borders at once. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Style values: single, double, dashed, dotted, thick, none, … SIZE is in 1/8 pt units (4 = 0.5pt). Aliases: border.
    example: --prop border.all="single;4;FF0000"
    readback: read per-side under border.top/bottom/left/right
  border.top   string   [set/get]
    description: top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.top="single;4;000000"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.bottom   string   [set/get]
    description: bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.bottom="double;6;0000FF"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.left   string   [set/get]
    description: left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.left="single;4"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.right   string   [set/get]
    description: right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.right="single;4"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.tl2br   string   [set/get]
    description: top-left to bottom-right diagonal border (cell-only). Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.tl2br="single;4;FF0000"
    readback: STYLE[;SIZE;COLOR[;SPACE]]
  border.tr2bl   string   [set/get]
    description: top-right to bottom-left diagonal border (cell-only). Format: STYLE[;SIZE[;COLOR[;SPACE]]].
    example: --prop border.tr2bl="single;4;FF0000"
    readback: STYLE[;SIZE;COLOR[;SPACE]]

Note: Only 'text' and 'width' are honored at Add time; every other property is applied via Set after the cell exists. Run-level formatting (font/size/bold/italic/color/highlight/underline/strike) is written to every run in every paragraph in the cell — and to ParagraphMarkRunProperties when the cell has no runs yet. Border value format is STYLE[;SIZE[;COLOR[;SPACE]]], e.g. 'single;4;FF0000'.
```

## docx Element: watermark

```text
docx watermark
--------------
Parent: body
Paths: /watermark
Operations: add set get query remove

Usage:
  officecli add <file> / --type watermark [--prop key=val ...]
  officecli set <file> /watermark --prop key=val ...
  officecli get <file> /watermark
  officecli query <file> watermark
  officecli remove <file> /watermark

Properties:
  text   string   [add/set/get]
    description: watermark text (text variant).
    example: --prop text=DRAFT
    readback: text content
  image   string   [add/set]   aliases: src, path
    description: image source for image watermark. Aliases: src, path.
    example: --prop image=/path/to/logo.png
    readback: n/a
  color   color   [add/set/get]
    example: --prop color=#C0C0C0
    readback: #-prefixed hex
  font   string   [add/set/get]
    example: --prop font=Calibri
    readback: font name
  rotation   int   [add/set/get]
    description: degrees. Defaults to -45 for diagonal.
    example: --prop rotation=-45
    readback: rotation degrees
  opacity   string   [add/set/get]
    description: watermark transparency, decimal 0..1 (e.g. .5 for 50%).
    example: --prop opacity=.5
    readback: opacity value
  size   string   [add/set/get]
    description: font size for text watermark (pt). Default 1pt (auto-fit).
    example: --prop size=72pt
    readback: pt-suffixed size
  width   string   [add/set/get]
    description: watermark shape width (pt/in/cm).
    example: --prop width=415pt
    readback: shape width
  height   string   [add/set/get]
    description: watermark shape height (pt/in/cm).
    example: --prop height=207.5pt
    readback: shape height

Note: Watermarks are inserted into the document header as VML/DrawingML shapes. Text or image variants supported.
```

## Format: xlsx Elements

```text
Elements for xlsx:
  autofilter
  cell
    comment
    hyperlink
    run
  chart
    chart-axis
    chart-series
  colbreak
  column
  conditionalformatting
  namedrange
  ole
  pagebreak
  picture
  pivottable
  range
    sort
  row
  rowbreak
  shape
  sheet
  slicer
  sparkline
  table
  validation
  workbook

Run 'officecli help xlsx <element>' for detail.
```

## xlsx Element: autofilter

```text
xlsx autofilter
---------------
Parent: sheet
Paths: /SheetName/autofilter
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type autofilter [--prop key=val ...]
  officecli set <file> /SheetName/autofilter --prop key=val ...
  officecli get <file> /SheetName/autofilter
  officecli query <file> autofilter
  officecli remove <file> /SheetName/autofilter

Properties:
  range   string   [add/set/get]   aliases: ref
    description: cell range the filter applies to. Required.
    example: --prop range=A1:F100
    readback: range reference
  criteria0   string   [add/set/get]
    description: column 0 criterion: 'OP=VAL'. Multi-column via criteria1, criteria2, etc. OP ∈ equals/contains/gt/lt/top/blanks/nonBlanks.
    example: --prop criteria0.equals=Red
    example: --prop criteria2.gt=100
    readback: criterion spec

Note: A sheet has at most one AutoFilter. Per-column criteria via 'criteriaN.OP=VAL' props where N is the 0-based column offset from the filter range and OP ∈ {equals, contains, gt, lt, top, blanks, nonBlanks}. Canonical key matches sheet.autoFilter alias.
```

## xlsx Element: cell

```text
xlsx cell
--------------
Parent: sheet
Paths: /<sheetName>/<A1Ref>  /Sheet1/A1  /Sheet1/B2:C3
Operations: add set get query remove

Usage:
  officecli add <file> /Sheet1 --type cell [--prop key=val ...]
  officecli set <file> /Sheet1/A1 --prop key=val ...
  officecli get <file> /Sheet1/A1
  officecli query <file> cell
  officecli remove <file> /Sheet1/A1

Properties:
  value   string   [add/set/get]
    description: literal cell value — string, number, or date. Numeric strings are stored as numbers. Readback lives in DocumentNode.Text, not Format[].
    example: --prop value="Hello"
    example: --prop value=42
    example: --prop value=3.14
    readback: plain string in DocumentNode.Text
  formula   string   [add/set/get]
    description: cell formula, without leading =
    example: --prop formula="SUM(A1:A10)"
    readback: formula text without leading =
  numberformat   string   [add/set/get]   aliases: format, numfmt
    description: Excel number format string
    example: --prop numberformat="#,##0.00"
    example: --prop numberformat=yyyy-mm-dd
    readback: format string as stored
  font.bold   bool   [add/set/get]   aliases: bold
    example: --prop bold=true
  font.italic   bool   [add/set/get]   aliases: italic
    example: --prop italic=true
  font.name   string   [add/set/get]   aliases: font, fontname
    example: --prop font="Calibri"
  font.size   font-size   [add/set/get]   aliases: size, fontsize
    example: --prop size=11pt
    readback: unit-qualified, e.g. "11pt"
  font.color   color   [add/set/get]   aliases: color
    example: --prop color=FF0000
    readback: #RRGGBB uppercase
  fill   color   [add/set/get]
    description: cell background fill color
    example: --prop fill=FFFF00
    readback: #RRGGBB uppercase
  strike   bool   [add/set/get]   aliases: strikethrough, font.strike
    description: single strikethrough on the cell text.
    example: --prop strike=true
    readback: true | false
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style on the cell text.
    values: single, double, singleAccounting, doubleAccounting, none
    example: --prop underline=single
    readback: underline style name
  locked   bool   [add/set/get]
    description: cell protection: lock the cell against edits when the sheet is protected. Default Excel behavior is locked=true.
    example: --prop locked=false
    readback: true | false
  alignment.horizontal   enum   [add/set/get]   aliases: halign
    values: left, center, right, justify, fill, distributed
    example: --prop alignment.horizontal=center
  alignment.vertical   enum   [add/set/get]   aliases: valign
    values: top, center, bottom
    example: --prop alignment.vertical=center
  alignment.wrapText   bool   [add/set/get]   aliases: wrap, wrapText
    example: --prop alignment.wrapText=true
  alignment.readingOrder   enum   [add/set/get]   aliases: readingorder, readingOrder, direction, dir
    description: cell text reading direction (OOXML 0=context, 1=ltr, 2=rtl). Use 'rtl' for Arabic / Hebrew, 'ltr' to force left-to-right, 'context' (default) to derive from content.
    values: context, ltr, rtl
    example: --prop alignment.readingOrder=rtl
    example: --prop direction=rtl
  merge   string   [add/set]
    description: merge range applied post-cell-creation (parity with `set`). Accepts a single A1 range (A1:C3) or comma-separated ranges (A1:B1,A2:B2). Use merge=false to clear an existing merge anchored at this cell (aliases: unmerge, none, empty).
    example: --prop merge=A1:C3
    example: --prop merge=false
  ref   string   [add]   aliases: address
    description: target A1 cell reference (alternative to encoding the address in the path tail).
    example: --prop ref=B2
  link   string   [add/set/get]
    description: hyperlink target attached to the cell. Accepts external URL (https://, http://, mailto:, file://, onenote:, tel:) or internal anchor (#Sheet!Cell, #NamedRange). Use link=none on Set to remove. Parity with Set.
    example: --prop link=https://example.com
    example: --prop link=mailto:user@example.com
    example: --prop link=#Sheet2!A1
    readback: URL string or internal anchor as stored
  tooltip   string   [add/set]   aliases: screenTip, screentip
    description: ScreenTip text shown on hover for an existing hyperlink. Pair with link= during Add, or apply to a cell that already has a hyperlink during Set.
    example: --prop link=https://example.com --prop tooltip="Open in browser"
  type   enum   [add/set/get]
    description: force a cell type. Normally inferred from value/formula.
    values: string, number, boolean, date, richtext, shared, inline
    example: --prop value=01234 --prop type=string
    readback: type token
  runs   string   [add]
    description: rich-text runs as JSON array (e.g. '[{"text":"Hello","bold":true}]'). Used when type=richtext.
    example: --prop type=richtext --prop runs='[{"text":"Bold","bold":true}]'
    readback: n/a (decomposed into /run[N] subnodes)
  clear   bool   [add/set]
    description: clear the cell value/formula before applying new content.
    example: --prop clear=true
    readback: n/a
  arrayformula   string   [add/set]
    description: dynamic-array formula spilled into ref range (without leading '=').
    example: --prop arrayformula="A1:A10*2" --prop ref=B1:B10
    readback: n/a

Note: Canonical keys per CLAUDE.md: numberformat (not `format`), alignment.horizontal / alignment.vertical / alignment.wrapText. Font properties surface in Get as font.bold / font.italic / font.name / font.size / font.color (readback namespace). Add/Set accept both the short forms (bold, italic, font, size, color) and the font.* forms. Parent path controls placement: `add <file> /Sheet1 --type cell` appends to the next empty cell; use `add <file> /Sheet1/A2 --type cell` to target a specific cell.
```

## xlsx Element: comment

```text
xlsx comment
--------------
Parent: sheet|cell
Paths: /SheetName/comment[N]  /SheetName/CellRef/comment
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type comment [--prop key=val ...]
  officecli set <file> /SheetName/comment[N] --prop key=val ...
  officecli get <file> /SheetName/comment[N]
  officecli query <file> comment
  officecli remove <file> /SheetName/comment[N]

Properties:
  text   string   [add/set/get]
    description: comment body. Required.
    example: --prop text="Check formula"
    readback: concatenated text
  ref   string   [add/set/get]
    description: target cell address (e.g. B2).
    example: --prop ref=B2
    readback: cell reference
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: author string

Note: Aliases: note. Anchored to a cell via 'ref' (or path tail). Modern Excel also supports threaded comments; this handler emits classic comments.
```

## xlsx Element: hyperlink

```text
xlsx hyperlink
--------------
Parent: cell
Paths: /SheetName/CellRef
Operations: get query

Usage:
  officecli get <file> /SheetName/CellRef
  officecli query <file> hyperlink

Properties:
  ref   string   [get]
    description: target cell range. Readback only (from <hyperlink ref=.../>).
    readback: cell reference
  url   string   [get]
    description: external URL. Readback only here; create via cell `link=` property.
    readback: target URL
  location   string   [get]
    description: internal sheet/cell target (Sheet1!A1). Readback only here; create via cell `link=` property.
    readback: internal target
  display   string   [get]
    description: display text. Readback only here; set via cell `display=` property.
    readback: display string
  tooltip   string   [get]
    description: hover tooltip. Readback only here; set via cell `tooltip=` property.
    readback: tooltip text

Note: In Excel, hyperlinks are a cell-level property, not a standalone addressable element. To create or modify one, use `officecli xlsx add cell` / `set` on the owning cell with `--prop link=URL` (optionally `tooltip=`, `display=`). Query returns discoverable hyperlink nodes whose `Path` points at the owning cell (e.g. `/Sheet1/A1`) so agents can Get/Set from there. Removal: Set the cell's `link=none`. Aliases on cell input: link, href.
```

## xlsx Element: run

```text
xlsx run
--------------
Parent: cell
Paths: /SheetName/CellRef/r[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName/CellRef --type run [--prop key=val ...]
  officecli set <file> /SheetName/CellRef/r[N] --prop key=val ...
  officecli get <file> /SheetName/CellRef/r[N]
  officecli query <file> run
  officecli remove <file> /SheetName/CellRef/r[N]

Properties:
  text   string   [add/set/get]
    example: --prop text="bold word"
    readback: run text
  font   string   [add/set/get]
    example: --prop font=Calibri
    readback: font name
  size   length   [add/set/get]
    example: --prop size=11
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true/false
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true/false
  color   color   [add/set/get]
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex

Note: Rich-text run inside an inline-string cell. Adds an rPh/r element with font properties on the run.
```

## xlsx Element: chart

```text
xlsx chart
--------------
Parent: sheet
Paths: /SheetName/chart[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type chart [--prop key=val ...]
  officecli set <file> /SheetName/chart[N] --prop key=val ...
  officecli get <file> /SheetName/chart[N]
  officecli query <file> chart
  officecli remove <file> /SheetName/chart[N]

Properties:
  chartType   enum   [add/set/get]   aliases: type
    values: column, bar, line, pie, doughnut, area, scatter, radar, stock, bubble, surface, waterfall, funnel, treemap, sunburst, boxWhisker, histogram, pareto, combo
    example: --prop chartType=column
    readback: chart type name
  title   string   [add/set/get]
    example: --prop title="Q1"
    readback: chart title
  data   string   [add]
    description: inline series spec 'Name:1,2,3;...'.
    example: --prop data="Sales:10,20,30"
  dataRange   string   [add]   aliases: datarange, range
    example: --prop dataRange=Sheet1!A1:D5
  categories   string   [add/set]
    example: --prop categories=A,B,C
  anchor   string   [add/set/get]
    description: cell range anchor; overrides x/y/width/height.
    example: --prop anchor=D2:J18
  x   length   [add/set/get]
  y   length   [add/set/get]
  width   length   [add/set/get]
  height   length   [add/set/get]
  preset   string   [add/set]   aliases: theme, style.preset
  style   number   [add/set]   aliases: styleid
    description: built-in chart style id 1..48
  colors   string   [add/set]
    description: comma-separated series fill colors.
  legend   enum   [add/set/get]
    values: true, false, none, top, bottom, left, right, topRight, tr
  legendfont   string   [add/set]   aliases: legend.font
  legendoverlay   bool   [add/set]   aliases: legend.overlay
  datalabels   string   [add/set]   aliases: labels
    description: show/hide labels OR comma-separated flags (value,percent,category,series).
  labelpos   string   [add/set]   aliases: labelposition
  labelfont   string   [add/set]
  labeloffset   number   [add/set]
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
  leaderlines   bool   [add/set]   aliases: showleaderlines
  axistitle   string   [add/set]   aliases: vtitle
    description: value axis title.
  cattitle   string   [add/set]   aliases: htitle
    description: category axis title.
  axismin   number   [add/set]   aliases: min
  axismax   number   [add/set]   aliases: max
  majorunit   number   [add/set]
  minorunit   number   [add/set]
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
  axisfont   string   [add/set]   aliases: axis.font
  majortickmark   enum   [add/set]   aliases: majortick
    values: none, in, out, cross
  minortickmark   enum   [add/set]   aliases: minortick
    values: none, in, out, cross
  ticklabelpos   string   [add/set]   aliases: ticklabelposition
  ticklabelskip   number   [add/set]   aliases: tickskip
  axisposition   string   [add/set]   aliases: axispos
  axisorientation   string   [add/set]   aliases: axisreverse
  axisline   string   [add/set]   aliases: axis.line
  cataxisline   string   [add/set]   aliases: cataxis.line
  valaxisline   string   [add/set]   aliases: valaxis.line
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
  cataxisvisible   bool   [add/set]   aliases: cataxis.visible
  valaxisvisible   bool   [add/set]   aliases: valaxis.visible
  logbase   number   [add/set]   aliases: logscale, yaxisscale
  crosses   string   [add/set]
  crossesat   number   [add/set]
  crossbetween   string   [add/set]
  dispunits   string   [add/set]   aliases: displayunits
  gridlines   bool   [add/set]   aliases: majorgridlines
  minorgridlines   bool   [add/set]
  plotareafill   string   [add/set]   aliases: plotfill
  chartareafill   string   [add/set]   aliases: chartfill
  plotborder   string   [add/set]   aliases: plotarea.border
  chartborder   string   [add/set]   aliases: chartarea.border
  areafill   string   [add/set]   aliases: area.fill
  linewidth   number   [add/set]
  linedash   string   [add/set]   aliases: dash
  marker   string   [add/set]   aliases: markers
  markersize   number   [add/set]
  showmarker   bool   [add/set]   aliases: showmarkers
  transparency   number   [add/set]   aliases: opacity, alpha
  gradient   string   [add/set]   aliases: gradientfill
  gradients   string   [add/set]
  view3d   string   [add/set]   aliases: camera, perspective
  smooth   bool   [add/set]
  trendline   string   [add/set]
  secondaryaxis   string   [add/set]   aliases: secondary
  referenceline   string   [add/set]   aliases: refline, targetline
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
  combotypes   string   [add/set]   aliases: combo.types
  scatterstyle   string   [add/set]
  radarstyle   string   [add/set]
  varycolors   bool   [add/set]
  dispblanksas   string   [add/set]   aliases: blanksas
  roundedcorners   bool   [add/set]
  autotitledeleted   bool   [add/set]
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
  gapwidth   number   [add/set]   aliases: gap
  overlap   number   [add/set]
  gapdepth   number   [add/set]
  shape   string   [add/set]   aliases: barshape
  explosion   number   [add/set]   aliases: explode
  invertifneg   bool   [add/set]   aliases: invertifnegative
  errbars   string   [add/set]   aliases: errorbars
  seriesshadow   string   [add/set]   aliases: series.shadow
  seriesoutline   string   [add/set]   aliases: series.outline
  holesize   number   [add/set]
    description: doughnut hole size 10..90.
  firstsliceangle   number   [add/set]   aliases: sliceangle
  bubblescale   number   [add/set]
  shownegbubbles   bool   [add/set]
  sizerepresents   string   [add/set]
  datatable   bool   [add/set]
  droplines   string   [add/set]
  hilowlines   string   [add/set]
  updownbars   string   [add/set]
  serlines   string   [add/set]   aliases: serieslines
  increaseColor   color   [add]
    description: waterfall increase color.
  decreaseColor   color   [add]
    description: waterfall decrease color.
  totalColor   color   [add]
    description: waterfall total color.
  combosplit   number   [add]
    description: combo chart split index.

Note: Source of truth: Core/Chart/ChartHelper.Builder.cs (DeferredAddKeys + DeferredPrefixes) and ChartHelper.Setter.cs (case branches). Adding a new property MUST update both the handler and this file. Validator is also lenient about dotted sub-property namespaces (axis., series., trendline., errbars., datatable., displayunitslabel., trendlinelabel., combo., area., style., title., plotArea., chartArea., legend., datalabels., font., border., fill., shadow., glow., alignment.) and indexed namespaces (series{N}., dataLabel{N}., point{N}., legendEntry{N}.).
```

## xlsx Element: chart-axis

```text
xlsx chart-axis
---------------
Parent: chart
Addressing: /SheetName/chart[N]/axis[@role=ROLE]
Operations: set get

Properties:
  title   string   [set/get]
    example: --prop title="Revenue"
  visible   bool   [set/get]
    example: --prop visible=false
  min   number   [set/get]
    example: --prop min=0
  max   number   [set/get]
    example: --prop max=1000
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  majorGridlines   bool   [set/get]
    example: --prop majorGridlines=true
  minorGridlines   bool   [set/get]
    example: --prop minorGridlines=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Extended charts (funnel/treemap/sunburst/boxWhisker/histogram) reject axis path — use chart-level Set.
```

## xlsx Element: chart-series

```text
xlsx chart-series
-----------------
Parent: chart
Paths: /SheetName/chart[N]/series[K]
Operations: add set get remove

Usage:
  officecli add <file> /SheetName/chart[N] --type chart-series [--prop key=val ...]
  officecli set <file> /SheetName/chart[N]/series[K] --prop key=val ...
  officecli get <file> /SheetName/chart[N]/series[K]
  officecli remove <file> /SheetName/chart[N]/series[K]

Properties:
  name   string   [add/set/get]   aliases: title
    example: --prop name="Q1"
    example: --prop series1.name="Q1"
  values   string   [add/set/get]
    description: comma-separated numbers, OR cell range reference.
    example: --prop series1.values="120,150,180"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
  categories   string   [add/set]
    description: per-series category override; range reference only.
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
  color   color   [add/set/get]
    description: series fill color.
    example: --prop series1.color=#4472C4
    readback: #-prefixed uppercase hex
  smooth   bool   [set/get]
    example: --prop smooth=true

Note: Mirror of pptx/chart-series and docx/chart-series. At Add time, series pass as dotted props on the parent chart (series1.name, series1.values, series1.color, series1.categories). This schema represents per-series Set/Get after creation. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type.
```

## xlsx Element: colbreak

```text
xlsx colbreak
--------------
Parent: sheet
Paths: /SheetName/colbreak[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type colbreak [--prop key=val ...]
  officecli set <file> /SheetName/colbreak[N] --prop key=val ...
  officecli get <file> /SheetName/colbreak[N]
  officecli query <file> colbreak
  officecli remove <file> /SheetName/colbreak[N]

Properties:
  col   string   [add/set/get]   aliases: column, index
    description: column index or letter. Aliases: column, index.
    example: --prop col=F
    readback: column index

Note: Manual page break before the specified column. Accepts numeric index or column letter.
```

## xlsx Element: column

```text
xlsx column
--------------
Parent: sheet
Paths: /SheetName/col[X]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type column [--prop key=val ...]
  officecli set <file> /SheetName/col[X] --prop key=val ...
  officecli get <file> /SheetName/col[X]
  officecli query <file> column
  officecli remove <file> /SheetName/col[X]

Properties:
  name   string   [add]
    description: column letter to insert at (e.g. 'C'). If omitted, uses index position or appends.
    example: --prop name=C
    readback: n/a (used only for addressing)
  width   length   [add/set/get]
    description: column width in Excel character units. Accepts bare number or unit-qualified.
    example: --prop width=20
    readback: raw double (character units)
  hidden   bool   [add/set/get]
    description: hide column.
    example: --prop hidden=true
    readback: true when hidden, key absent otherwise
  outline   int   [set]   aliases: outlinelevel, group
    description: outline/group level 0-7. Currently Set-only. Aliases: outlineLevel, group.
    example: --prop outline=1
    readback: not surfaced by Get
  collapsed   bool   [set]
    description: collapse column group. Currently Set-only.
    example: --prop collapsed=true
    readback: not surfaced by Get
  autofit   bool   [set]
    description: auto-fit width to cell content. Set-only by design (meaningless at Add since new column has no data).
    example: --prop autofit=true
    readback: resolves to width at Set time

Note: X may be a column letter (A,B,...) or a 1-based numeric index. Width is in Excel character units via ParseColWidthChars. Type name 'col' and 'column' are both accepted.
```

## xlsx Element: conditionalformatting

```text
xlsx conditionalformatting
--------------------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type conditionalformatting [--prop key=val ...]
  officecli set <file> /SheetName/cf[N] --prop key=val ...
  officecli get <file> /SheetName/cf[N]
  officecli query <file> conditionalformatting
  officecli remove <file> /SheetName/cf[N]

Properties:
  type   enum   [add/set/get]   aliases: rule
    description: CF rule type.
    values: cellIs, colorScale, dataBar, iconSet, containsText, notContainsText, beginsWith, endsWith, top, topN, top10, topPercent, bottom, bottomN, bottomPercent, aboveAverage, belowAverage, duplicateValues, uniqueValues, containsBlanks, containsErrors, notContainsBlanks, notContainsErrors, formula, dateOccurring, today, yesterday, tomorrow, thisWeek, lastWeek, nextWeek, thisMonth, lastMonth, nextMonth
    example: --prop type=cellIs
    example: --prop rule=top10
    readback: rule type
  ref   string   [add/set/get]   aliases: range, sqref
    description: target cell range.
    example: --prop ref=A1:A10
    example: --prop sqref=A1:A10
    readback: cell range
  fill   color   [add/set/get]
    description: fill (background) color for matched cells.
    example: --prop fill=FFFF00
    readback: #-prefixed hex
  operator   string   [add/set/get]
    description: operator for cellIs/text rules.
    example: --prop operator=greaterThan
    readback: operator
  value   string   [add/set/get]   aliases: formula1, formula
    description: threshold / comparison value.
    example: --prop value=100
    example: --prop formula=$A1>5
    readback: value/formula
  color   color   [add/set/get]
    description: highlight color (cellIs / text rules).
    example: --prop color=#FFFF00
    readback: #-prefixed hex
  value2   string   [add/set/get]   aliases: maxvalue
    description: second threshold for between/notBetween cellIs rules. Alias: maxvalue.
    example: --prop value=10 --prop value2=20
    readback: value/formula
  text   string   [add/set/get]
    description: needle for containsText/notContainsText/beginsWith/endsWith rules.
    example: --prop type=containsText --prop text=ERROR
    readback: needle string
  rank   number   [add/set/get]   aliases: top, bottomN
    description: rank for top/bottom N rules. Aliases: top, bottomN.
    example: --prop type=topN --prop rank=10
    readback: integer rank
  percent   bool   [add/set/get]
    description: treat 'rank' as a percentile rather than count (top/bottom rules).
    example: --prop type=top --prop rank=10 --prop percent=true
    readback: true/false
  bottom   bool   [add/set/get]
    description: select bottom-N instead of top-N (top/bottom rules).
    example: --prop type=bottom --prop rank=5
    readback: true/false
  above   bool   [add/get]   aliases: aboveAverage
    description: aboveAverage rule: true=above, false=below. Alias: aboveAverage.
    example: --prop type=aboveAverage --prop above=true
    readback: true/false
  stdDev   number   [add/get]
    description: stdDev offset for aboveAverage rules (1 = 1σ above mean).
    example: --prop stdDev=1
    readback: number
  equalAverage   bool   [add/get]
    description: include the mean in aboveAverage matching.
    example: --prop equalAverage=true
    readback: true/false
  period   string   [add/get]   aliases: timePeriod, timeperiod
    description: time-period token for dateOccurring rules (today, yesterday, tomorrow, thisWeek, lastWeek, nextWeek, thisMonth, lastMonth, nextMonth). Aliases: timePeriod.
    example: --prop type=dateOccurring --prop period=lastWeek
    readback: period token
  min   string   [add/get]
    description: data-bar minimum value (numeric or 'auto'). Used by dataBar rules.
    example: --prop type=dataBar --prop min=0 --prop max=100
    readback: number or token
  max   string   [add/get]
    description: data-bar maximum value (numeric or 'auto'). Used by dataBar rules.
    example: --prop type=dataBar --prop max=100
    readback: number or token
  showValue   bool   [add/set/get]   aliases: showvalue
    description: show numeric label alongside data bar / icon set. Alias: showvalue.
    example: --prop showValue=false
    readback: true/false
  negativeColor   color   [add/get]
    description: data-bar fill color for negative values.
    example: --prop negativeColor=#FF0000
    readback: #-prefixed hex
  axisColor   color   [add/get]
    description: data-bar axis color (separator between positive and negative bars).
    example: --prop axisColor=#000000
    readback: #-prefixed hex
  axisPosition   enum   [add/get]
    description: data-bar axis position. Default: automatic.
    values: automatic, middle, none
    example: --prop axisPosition=middle
    readback: automatic|middle|none
  minColor   color   [add/set/get]   aliases: mincolor
    description: color-scale color at the minimum stop. Alias: mincolor.
    example: --prop type=colorScale --prop minColor=#F8696B
    readback: #-prefixed hex
  maxColor   color   [add/set/get]   aliases: maxcolor
    description: color-scale color at the maximum stop. Alias: maxcolor.
    example: --prop maxColor=#63BE7B
    readback: #-prefixed hex
  midColor   color   [add/get]   aliases: midcolor
    description: color-scale color at the midpoint stop. Alias: midcolor.
    example: --prop midColor=#FFEB84
    readback: #-prefixed hex
  midPoint   string   [add/get]   aliases: midpoint
    description: color-scale midpoint value (numeric or percentile). Alias: midpoint.
    example: --prop midPoint=50
    readback: midpoint expression
  iconset   string   [add/set/get]   aliases: icons
    description: icon-set name (e.g. 3TrafficLights1, 3Arrows, 5Rating). Alias: icons.
    example: --prop type=iconSet --prop iconset=3TrafficLights1
    readback: icon-set name
  reverse   bool   [add/set/get]
    description: reverse the icon-set ordering.
    example: --prop reverse=true
    readback: true/false
  formula   string   [add/set/get]
    description: formulaCf expression (without leading '=').
    example: --prop type=formula --prop formula=ISERROR(A1)
    readback: formula expression

Note: Aliases: cf, cfextended. Type names map to xlsx CF rules (cellIs, colorScale, dataBar, iconSet, containsText, top/bottom N, etc.).
```

## xlsx Element: namedrange

```text
xlsx namedrange
---------------
Parent: workbook|sheet
Paths: /namedrange[@name=NAME]  /namedrange[NAME]  /namedrange[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type namedrange [--prop key=val ...]
  officecli set <file> /namedrange[N] --prop key=val ...
  officecli get <file> /namedrange[N]
  officecli query <file> namedrange
  officecli remove <file> /namedrange[N]

Properties:
  name   string   [add/set/get]
    description: defined-name identifier. Required (or inferred from path).
    example: --prop name=Revenue
    readback: name
  ref   string   [add/set/get]   aliases: refersTo, formula
    description: refersTo expression. Aliases: refersTo, formula. Do not include leading '='.
    example: --prop ref=Sheet1!$A$1:$C$10
    readback: refersTo content
  scope   string   [add/get]
    description: sheet name for local scope, or 'workbook' (default).
    example: --prop scope=workbook
    readback: scope descriptor
  comment   string   [add/set/get]
    description: free-text description shown in Excel's Name Manager.
    example: --prop comment="Q4 totals"
    readback: comment text
  volatile   boolean   [add/set/get]
    description: force recalculation of the defined name on every workbook change (Excel volatile flag).
    example: --prop volatile=true
    readback: volatile flag

Note: Aliases: definedname. Name rules from ECMA-376 §18.2.5 — start with letter/underscore/backslash, only letters/digits/underscore/period/backslash, must not look like a cell ref. refersTo content must not start with '='.
```

## xlsx Element: ole

```text
xlsx ole
--------------
Parent: sheet
Paths: /SheetName/ole[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type ole [--prop key=val ...]
  officecli set <file> /SheetName/ole[N] --prop key=val ...
  officecli get <file> /SheetName/ole[N]
  officecli query <file> ole
  officecli remove <file> /SheetName/ole[N]

Properties:
  src   string   [add/set/get]   aliases: path
    example: --prop src=/path/to/data.docx
    readback: object rel id
  progId   string   [add/set/get]   aliases: progid
    example: --prop progId=Word.Document.12
    readback: ProgID
  preview   string   [add/set]
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  anchor   string   [add/set/get]   aliases: ref
    example: --prop anchor=B2:F7
    readback: anchor descriptor

Note: Aliases: oleobject, object, embed. Binary package + preview image. Anchor accepts cell range (B2:F7) or x/y/width/height in cell units.
```

## xlsx Element: pagebreak

```text
xlsx pagebreak
--------------
Parent: sheet
Paths: /SheetName/rowbreak[N]  /SheetName/colbreak[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type pagebreak [--prop key=val ...]
  officecli set <file> /SheetName/rowbreak[N] --prop key=val ...
  officecli get <file> /SheetName/rowbreak[N]
  officecli query <file> pagebreak
  officecli remove <file> /SheetName/rowbreak[N]

Properties:
  row   int   [add/set/get]
    description: row index — routes to rowbreak.
    example: --prop row=20
    readback: row index
  col   string   [add/set/get]   aliases: column
    description: column index/letter — routes to colbreak. Alias: column.
    example: --prop col=F
    readback: col index

Note: Dispatcher: routes to rowbreak or colbreak based on which of 'col'/'column' or 'row' is supplied. See xlsx/rowbreak.json and xlsx/colbreak.json for the resolved surfaces.
```

## xlsx Element: picture

```text
xlsx picture
--------------
Parent: sheet
Paths: /SheetName/picture[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type picture [--prop key=val ...]
  officecli set <file> /SheetName/picture[N] --prop key=val ...
  officecli get <file> /SheetName/picture[N]
  officecli query <file> picture
  officecli remove <file> /SheetName/picture[N]

Properties:
  src   string   [add/set/get]   aliases: path
    example: --prop src=/path/to/image.png
    readback: image rel id
  x   length   [add/set/get]
    example: --prop x=0
    readback: anchor col / EMU
  y   length   [add/set/get]
    example: --prop y=0
    readback: anchor row / EMU
  width   length   [add/set/get]
    example: --prop width=5
    readback: cell span / EMU
  height   length   [add/set/get]
    example: --prop height=5
    readback: cell span / EMU
  alt   string   [add/set/get]   aliases: altText, alttext
    description: alt text. Aliases: altText, alttext.
    example: --prop alt="Logo"
    readback: alt text
  title   string   [add]
    description: OOXML @title attribute on cNvPr (distinct from alt).
    example: --prop title="Logo"
  name   string   [add]
    description: Override the auto-generated 'Picture {id}' label on cNvPr @name.
    example: --prop name="hero-image"
  decorative   bool   [add]
    description: Mark the picture as decorative (a16:decorative ext under cNvPr). Excludes it from screen-reader alt-text traversal.
    example: --prop decorative=true
  rotation   string   [add/set]
    description: Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.
    example: --prop rotation=45
  flip   string   [add/set]
    description: Compact flip token: 'h' / 'v' / 'both' / 'hv' / 'vh' / 'horizontal' / 'vertical'.
    example: --prop flip=h
    example: --prop flip=both
  flipH   bool   [add/set]
    description: Flip horizontally (Office-API-style alias of flip=h).
    example: --prop flipH=true
  flipV   bool   [add/set]
    description: Flip vertically (Office-API-style alias of flip=v).
    example: --prop flipV=true
  flipBoth   bool   [add]
    description: Flip both axes (alias of flip=both).
    example: --prop flipBoth=true
  opacity   string   [add]
    description: Picture opacity. Accepts percent (50, '50%') or fraction (0.5). 100 / 100% / 1.0 = fully opaque.
    example: --prop opacity=50
    example: --prop opacity=0.5
  hyperlink   string   [add]   aliases: link
    description: Picture-level hyperlink. External URL (https://...) or in-document jump (#SheetName!A1).
    example: --prop hyperlink=https://example.com
  anchor   string   [add]
    description: Cell-range anchor (e.g. 'B2:E6') or anchorMode token ('oneCell'/'twoCell'/'absolute'). Cell-range form implies twoCell mode.
    example: --prop anchor=B2:E6
    example: --prop anchor=oneCell
  anchorMode   string   [add]
    description: Explicit anchor mode: 'oneCell' / 'twoCell' / 'absolute'. Overrides any anchor= mode token.
    example: --prop anchorMode=oneCell
  fallback   string   [add]
    description: PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is used.
    example: --prop fallback=/path/to/fallback.png
  shadow   string   [set]
    description: Outer shadow effect. 'none' to clear, or a color/spec accepted by DrawingEffectsHelper.
    example: --prop shadow=#808080
  glow   string   [set]
    description: Glow effect color/spec. 'none' to clear.
    example: --prop glow=#4472C4
  reflection   string   [set]
    description: Reflection effect. 'none' to clear.
    example: --prop reflection=true
  softEdge   string   [set]   aliases: softedge
    description: Soft edge effect radius. 'none' to clear.
    example: --prop softEdge=5
  crop.l   string   [add/set]
    description: Crop from left edge as a percentage (e.g. 10 = 10%, '10%' also accepted). Internally stored in 1/1000 percent units.
    example: --prop crop.l=10
    example: --prop crop.l=50%
  crop.r   string   [add/set]
    description: Crop from right edge as a percentage.
    example: --prop crop.r=10
  crop.t   string   [add/set]
    description: Crop from top edge as a percentage.
    example: --prop crop.t=10
  crop.b   string   [add/set]
    description: Crop from bottom edge as a percentage.
    example: --prop crop.b=10
  srcRect   string   [add/set]
    description: Compound crop spec, e.g. 'l=10,r=10,t=5,b=5'. Equivalent to crop.l/crop.r/crop.t/crop.b.
    example: --prop srcRect=l=10,r=10,t=5,b=5
  cropLeft   string   [add/set]
    description: Crop from left as fraction (<=1) or percent (>1). E.g. cropLeft=0.1 or cropLeft=10 both mean 10%.
    example: --prop cropLeft=0.1
    example: --prop cropLeft=10
  cropRight   string   [add/set]
    description: Crop from right as fraction (<=1) or percent (>1).
    example: --prop cropRight=10
  cropTop   string   [add/set]
    description: Crop from top as fraction (<=1) or percent (>1).
    example: --prop cropTop=10
  cropBottom   string   [add/set]
    description: Crop from bottom as fraction (<=1) or percent (>1).
    example: --prop cropBottom=10

Note: Aliases: image, img. Anchor via ParseAnchorBoundsEmu — accepts cell counts or unit-qualified lengths. SVG sources get a PNG fallback.
```

## xlsx Element: pivottable

```text
xlsx pivottable
---------------
Parent: sheet
Paths: /SheetName/pivottable[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type pivottable [--prop key=val ...]
  officecli set <file> /SheetName/pivottable[N] --prop key=val ...
  officecli get <file> /SheetName/pivottable[N]
  officecli query <file> pivottable
  officecli remove <file> /SheetName/pivottable[N]

Properties:
  source   string   [add/set/get]   aliases: src
    description: source range. Alias: src. External workbook refs rejected.
    example: --prop source=Sheet1!A1:D100
    readback: source reference
  position   string   [add]   aliases: pos
    description: anchor cell (e.g. H1). Alias: pos. Auto-placed after source if omitted.
    example: --prop position=H1
    readback: anchor cell
  name   string   [add/set/get]
    description: pivot table name (identifier).
    example: --prop name=RevenueByRegion
    readback: pivot name
  style   string   [add/set/get]
    description: built-in or workbook custom pivot style name (e.g. PivotStyleMedium9).
    example: --prop style=PivotStyleMedium9
    readback: style name
  rows   string   [add/set/get]   aliases: row, rowField, rowFields
    description: row-axis field names, comma-separated (e.g. 'Region,Category'). Aliases: row, rowField, rowFields.
    example: --prop rows=Region,Category
    readback: comma-separated field names
  cols   string   [add/set/get]   aliases: col, column, columns, colField, colFields, columnField, columnFields
    description: column-axis field names, comma-separated. Aliases: col, column, columns, colField, colFields, columnField, columnFields.
    example: --prop cols=Date
    readback: comma-separated field names
  filters   string   [add/set/get]   aliases: filter, filterField, filterFields
    description: page/filter-axis field names, comma-separated. Aliases: filter, filterField, filterFields.
    example: --prop filters=Year
    readback: comma-separated field names
  values   string   [add/set/get]   aliases: value, valueField, valueFields
    description: value-axis fields as 'Field:agg' tuples, comma-separated (e.g. 'Sales:sum,Qty:avg'). agg one of sum, avg, count, max, min, product, stdev, stdevp, var, varp, countNums. Aliases: value, valueField, valueFields.
    example: --prop values=Sales:sum,Qty:avg
    readback: value field tuples
  aggregate   string   [add/set]
    description: default aggregate for value fields when omitted from --prop values. One of sum, avg, count, max, min, product, stdev, stdevp, var, varp, countNums.
    example: --prop aggregate=avg
    readback: n/a (per-value override)
  showDataAs   string   [add/set]   aliases: showdataas
    description: value-field display mode: normal, percentOfTotal, percentOfRow, percentOfCol, percentOfParent, runningTotal, rankAscending, rankDescending, index, difference, percentDifference.
    example: --prop showDataAs=percentOfTotal
    readback: n/a
  topN   string   [add/set]   aliases: topn
    description: keep only top-N row keys ranked by first value field's aggregate. Integer >= 1; filter applied to source rows pre-cache.
    example: --prop topN=10
    readback: n/a (filters source rows)
  sort   enum   [add/set]
    description: axis-label sort. 'none' (or empty) clears sort.
    values: asc, desc, locale, locale-desc, none
    example: --prop sort=desc
    readback: n/a (label order in axis)
  layout   enum   [add/set/get]
    description: report layout mode. Default: compact.
    values: compact, outline, tabular
    example: --prop layout=tabular
    readback: layout name
  labelFilter   string   [add/set]   aliases: labelfilter
    description: row-level pre-cache label filter as 'field:type:value' (e.g. 'Region:beginsWith:N'). Type one of equals, notEquals, beginsWith, endsWith, contains, notContains, greaterThan, greaterThanEqual, lessThan, lessThanEqual, between, notBetween.
    example: --prop labelFilter=Region:beginsWith:N
    readback: n/a (filters source rows)
  calculatedField   string   [add/set]   aliases: calculatedfield, calculatedfields
    description: user-defined formula field as 'Name:=Formula' (e.g. 'Margin:=Sales-Cost'). Use calculatedField1, calculatedField2, ... for multiple. Alias: calculatedFields.
    example: --prop calculatedField=Margin:=Sales-Cost
    example: --prop calculatedField1=Margin:=Sales-Cost --prop calculatedField2=Tax:=Sales*0.1
    readback: n/a
  repeatLabels   bool   [add/set/get]   aliases: repeatlabels, repeatItemLabels, repeatAllLabels, fillDownLabels
    description: repeat outer-axis item labels on every row (fillDown). Aliases: repeatItemLabels, repeatAllLabels, fillDownLabels.
    example: --prop repeatLabels=true
    readback: true/false
  blankRows   bool   [add/set/get]   aliases: blankrows, insertBlankRow, insertBlankRows, blankRow, blankLine, blankLines
    description: insert a blank row after each outer item group. Aliases: insertBlankRow, insertBlankRows, blankRow, blankLine, blankLines.
    example: --prop blankRows=true
    readback: true/false
  grandTotals   enum   [add/set]   aliases: grandtotals
    description: grand-total visibility. 'rows' = show grand-total row only; 'cols' = show grand-total column only; 'both'/'on'/'true' = both; 'none'/'off'/'false' = neither.
    values: both, none, rows, cols, on, off, true, false
    example: --prop grandTotals=both
    readback: n/a (use rowGrandTotals/colGrandTotals on get)
  rowGrandTotals   bool   [add/set/get]   aliases: rowgrandtotals
    description: show row-axis grand totals. Independent of colGrandTotals.
    example: --prop rowGrandTotals=true
    readback: true/false
  colGrandTotals   bool   [add/set/get]   aliases: colgrandtotals, columnGrandTotals
    description: show column-axis grand totals. Alias: columnGrandTotals.
    example: --prop colGrandTotals=true
    readback: true/false
  grandTotalCaption   string   [add/set/get]   aliases: grandtotalcaption
    description: label text for the Grand Total row/column (default 'Grand Total').
    example: --prop grandTotalCaption="Total"
    readback: caption text
  subtotals   enum   [add/set/get]
    description: show/hide outer-level subtotal rows.
    values: on, off, true, false, show, hide, yes, no, 1, 0
    example: --prop subtotals=off
    readback: on/off
  defaultSubtotal   bool   [add/set]   aliases: defaultsubtotal
    description: default-subtotal flag for new pivot fields (per-field <pivotField defaultSubtotal=...>).
    example: --prop defaultSubtotal=true
    readback: n/a (per-field)
  showRowStripes   bool   [add/set/get]   aliases: showrowstripes, bandedRows
    description: banded-row striping in the pivot style. Alias: bandedRows.
    example: --prop showRowStripes=true
    readback: true/false
  showColStripes   bool   [add/set/get]   aliases: showcolstripes, showColumnStripes, bandedCols, bandedColumns
    description: banded-column striping in the pivot style. Aliases: showColumnStripes, bandedCols, bandedColumns.
    example: --prop showColStripes=true
    readback: true/false
  showRowHeaders   bool   [add/set/get]   aliases: showrowheaders
    description: show row-axis header formatting (pivotTableStyleInfo).
    example: --prop showRowHeaders=true
    readback: true/false
  showColHeaders   bool   [add/set/get]   aliases: showcolheaders, showColumnHeaders
    description: show column-axis header formatting. Alias: showColumnHeaders.
    example: --prop showColHeaders=true
    readback: true/false
  showLastColumn   bool   [add/set/get]   aliases: showlastcolumn
    description: highlight the last column in the pivot style.
    example: --prop showLastColumn=true
    readback: true/false
  showDrill   bool   [add/set]   aliases: showdrill
    description: show expand/collapse (+/-) buttons on every pivot field.
    example: --prop showDrill=false
    readback: n/a
  mergeLabels   bool   [add/set]   aliases: mergelabels
    description: merge+center repeated outer-axis item cells (<pivotTableDefinition mergeItem='1'>).
    example: --prop mergeLabels=true
    readback: n/a

Note: Aliases: pivot. 'source' required (e.g. Sheet1!A1:D100). External workbook refs rejected. Position auto-placed after source if omitted. Field axes (rows/cols/filters/values) take comma-separated field names; values use 'Field:agg' tuples.
```

## xlsx Element: range

```text
xlsx range
--------------
Read-only container (never created or removed via CLI).
Parent: sheet
Paths: /SheetName/A1:C10
Operations: set get query

Usage:
  officecli get <file> /SheetName/A1:C10
  officecli query <file> range

Properties:
  merge   bool   [get]
    description: merge all cells in the range into a single cell. Set merge=false to unmerge — the range must exactly match an existing merge, otherwise the call fails with the precise refs to use. Pass merge=sweep to bulk-clear every merge contained in the range (destructive, no precision check).
    example: --prop merge=true
    example: --prop merge=false
    example: --prop merge=sweep
    readback: true/false
  font.bold   bool   [-]
    description: broadcast bold to every cell.
    example: --prop font.bold=true
    readback: n/a (broadcast)
  fill   color   [-]
    description: broadcast fill color.
    example: --prop fill=#FFFF00
    readback: n/a (broadcast)
  numberformat   string   [-]   aliases: format
    description: broadcast number format code.
    example: --prop numberformat="#,##0.00"
    readback: n/a (broadcast)
  alignment.horizontal   enum   [-]   aliases: halign
    values: left, center, right, justify, general, fill, centerContinuous
    example: --prop alignment.horizontal=center
    readback: n/a (broadcast)

Children:
  cell  (1..n)  /{CellRef}

Note: Read-through container for cell ranges. Get returns a range node with cell list / aggregate preview. Set broadcasts formatting props to every cell in the range (font/color/numberformat/alignment/fill). Not an Add target — cells exist implicitly.
```

## xlsx Element: sort

```text
xlsx sort
--------------
Parent: sheet|range
Paths: /SheetName  /SheetName/A1:D50
Operations: set get

Usage:
  officecli set <file> /SheetName --prop key=val ...
  officecli get <file> /SheetName

Properties:
  sort   string   [set/get]
    description: sort spec: 'COL [DIR][, COL [DIR] ...]'. COL is a column letter (A, B, AA..XFD). DIR is asc (default) or desc. Comma-separated for multi-key sort.
    example: --prop sort=B
    example: --prop sort="B desc, C asc"
    readback: SortState description string
  sortHeader   bool   [set]
    description: treat first row as header (excluded from reorder).
    example: --prop sortHeader=true
    readback: n/a

Note: Sort is Set-only — it mutates row order in a sheet or range. Sheet-level Set auto-detects the used range. Range-level Set operates only on the supplied range. SortState persists across save.
```

## xlsx Element: row

```text
xlsx row
--------------
Parent: sheet
Paths: /SheetName/row[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type row [--prop key=val ...]
  officecli set <file> /SheetName/row[N] --prop key=val ...
  officecli get <file> /SheetName/row[N]
  officecli query <file> row
  officecli remove <file> /SheetName/row[N]

Properties:
  cols   int   [add]
    description: number of empty cells to seed in the new row.
    example: --prop cols=5
    readback: n/a (structural only)
  height   length   [add/set/get]
    description: row height in points.
    example: --prop height=24
    readback: numeric points (raw double as stored)
  hidden   bool   [add/set/get]
    description: hide row.
    example: --prop hidden=true
    readback: true when hidden, key absent otherwise
  outline   int   [set]   aliases: outlinelevel, group
    description: outline/group level 0-7. Currently Set-only. Aliases: outlineLevel, group.
    example: --prop outline=1
    readback: not surfaced by Get
  collapsed   bool   [set]
    description: collapse row group. Currently Set-only.
    example: --prop collapsed=true
    readback: not surfaced by Get

Note: Row index N is 1-based. Add creates the row element (optionally seeded with empty cells via 'cols'); all formatting props are currently Set-only — known Add/Set asymmetry.
```

## xlsx Element: rowbreak

```text
xlsx rowbreak
--------------
Parent: sheet
Paths: /SheetName/rowbreak[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type rowbreak [--prop key=val ...]
  officecli set <file> /SheetName/rowbreak[N] --prop key=val ...
  officecli get <file> /SheetName/rowbreak[N]
  officecli query <file> rowbreak
  officecli remove <file> /SheetName/rowbreak[N]

Properties:
  row   int   [add/set/get]   aliases: index
    description: 1-based row index where the break occurs. Alias: index.
    example: --prop row=20
    readback: row index

Note: Manual page break before the specified row. 'pagebreak' with col= routes to colbreak.
```

## xlsx Element: shape

```text
xlsx shape
--------------
Parent: sheet
Paths: /SheetName/shape[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type shape [--prop key=val ...]
  officecli set <file> /SheetName/shape[N] --prop key=val ...
  officecli get <file> /SheetName/shape[N]
  officecli query <file> shape
  officecli remove <file> /SheetName/shape[N]

Properties:
  anchor   string   [add]   aliases: ref
    description: cell range anchor (e.g. B2:F7) — Add-only. Set uses x/y/width/height; Get readback emits x/y/width/height instead of cell-range form (round-trip via numeric position, not anchor string).
    example: --prop anchor=B2:F7
    readback: x/y/width/height (numeric)
  text   string   [add/set/get]
    example: --prop text="Note"
    readback: concatenated run text
  name   string   [add/set]
    description: Override the auto-generated 'Shape {id}' label on cNvPr @name.
    example: --prop name="banner"
  fill   color   [add/set/get]
    description: Solid fill color, or 'none' for no fill (text-only shapes route effects to text-level rPr).
    example: --prop fill=#FFFF00
    example: --prop fill=none
    readback: #-prefixed uppercase hex
  gradientFill   string   [add]
    description: Two/three-stop linear gradient, e.g. 'C1-C2[-C3][:angle]'. Mutually exclusive with fill (gradientFill wins).
    example: --prop gradientFill=FF0000-0000FF:90
  line   string   [add/set/get]   aliases: border
    description: Outline color (or 'none'). Form: 'color[:width[:style]]', e.g. 'FF0000:1.5:dash'. width in points; style: solid|dash|dot|dashdot|longdash.
    example: --prop line=#000000
    example: --prop line=FF0000:1.5
    example: --prop line=none
    readback: color or color:width
  preset   string   [add/set/get]   aliases: shape
    description: geometry preset name (rect, ellipse, roundRect, triangle, rightArrow, etc.). Unknown presets fall back to rect with a stderr warning. Set replaces the existing PresetGeometry preserving fill/line/effects.
    example: --prop preset=ellipse
  x   string   [add/set]
    description: anchor x position in cell units (or unit-qualified size).
    example: --prop x=2
  y   string   [add/set]
    description: anchor y position in cell units (or unit-qualified size).
    example: --prop y=3
  width   string   [add/set]   aliases: w
    description: shape width in cell units (or unit-qualified size like 6cm).
    example: --prop width=4
    example: --prop width=6cm
  height   string   [add/set]   aliases: h
    description: shape height in cell units (or unit-qualified size).
    example: --prop height=3
  rotation   string   [add/set]   aliases: rot
    description: Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.
    example: --prop rotation=45
  flip   string   [add/set]
    description: Compact flip token: 'h' / 'v' / 'both' / 'hv' / 'vh' / 'none'.
    example: --prop flip=h
    example: --prop flip=both
  flipH   bool   [add/set]   aliases: flipHorizontal
    description: Flip horizontally (Office-API alias of flip=h).
    example: --prop flipH=true
  flipV   bool   [add/set]   aliases: flipVertical
    description: Flip vertically (Office-API alias of flip=v).
    example: --prop flipV=true
  flipBoth   bool   [add/set]
    description: Flip both axes.
    example: --prop flipBoth=true
  shadow   string   [add/set]
    description: Outer shadow color/spec, or 'none' to clear. For fill=none shapes, applied to text runs instead.
    example: --prop shadow=#808080
    example: --prop shadow=none
  glow   string   [add/set]
    description: Glow color/spec, or 'none' to clear. For fill=none shapes, applied to text runs instead.
    example: --prop glow=#4472C4
  reflection   string   [add/set]
    description: Reflection effect, or 'none' to clear.
    example: --prop reflection=true
  softEdge   string   [add/set]   aliases: softedge
    description: Soft edge radius, or 'none' to clear.
    example: --prop softEdge=5
  margin   string   [add/set/get]
    description: Inset for all four sides of the text body (points).
    example: --prop margin=4
  size   font-size   [add/set]
    description: Font size (points). Bare alias of font.size.
    example: --prop size=14
  bold   bool   [add/set]
    description: Bold runs. Bare alias of font.bold.
    example: --prop bold=true
  italic   bool   [add/set]
    description: Italic runs. Bare alias of font.italic.
    example: --prop italic=true
  underline   string   [add/set]
    description: Underline style: 'true'/'single'/'sng', 'double'/'dbl', 'none'/'false'. Bare alias of font.underline.
    example: --prop underline=single
  color   color   [add/set]
    description: Text color. Bare alias of font.color.
    example: --prop color=#FF0000
  font   string   [add/set]
    description: Font family. Bare alias of font.name.
    example: --prop font=Arial
  align   string   [add/set/get]
    description: Paragraph alignment: 'left' / 'center' (c/ctr) / 'right' (r) / 'justify'.
    example: --prop align=center
  valign   string   [add/set/get]
    description: Vertical anchor: 'top' (t) / 'center' (ctr/middle/c/m) / 'bottom' (b).
    example: --prop valign=middle

Note: Aliases: textbox. Anchor: 'anchor=B2:F7' (cell range) or x/y/width/height in cell units. 'ref=B2' expands to a 1x1 cell rectangle. Font/text props accept either bare ('size', 'bold', 'color', 'font') or dotted ('font.size', 'font.bold', 'font.color', 'font.name') forms.
```

## xlsx Element: sheet

```text
xlsx sheet
--------------
Paths: /<sheetName>  /Sheet1  /Sheet2
Operations: add set get query remove

Usage:
  officecli add <file> / --type sheet [--prop key=val ...]
  officecli set <file> /Sheet1 --prop key=val ...
  officecli get <file> /Sheet1
  officecli query <file> sheet
  officecli remove <file> /Sheet1

Properties:
  name   string   [add/set/get]
    description: sheet tab name. Returned path is /<name>; readback goes through DocumentNode.Path / .Preview rather than Format[].
    example: --prop name=Summary
  autoFilter   string   [add/set/get]   aliases: autofilter
    description: range to apply AutoFilter on (e.g. A1:D10). `true` enables on used range.
    example: --prop autoFilter=A1:D10
    readback: range string as stored, or boolean true
  tabColor   color   [add/set/get]
    description: sheet tab color.
    example: --prop tabColor=4472C4
    readback: #RRGGBB uppercase
  hidden   bool   [add/set/get]
    description: hide the sheet at creation or after the fact.
    example: --prop hidden=true
  freeze   string   [set/get]
    description: freeze panes anchor (cell ref). A2 freezes row 1; B1 freezes column A; B2 freezes row 1 + column A. `none` / `false` / empty removes the freeze. Set-only on existing sheets.
    example: --prop freeze=A2
    example: --prop freeze=B2
    example: --prop freeze=none
    readback: top-left cell ref of frozen pane (e.g. A2); absent when no freeze
  rightToLeft   bool   [set/get]   aliases: rtl, direction, sheet.direction
    description: RTL sheet layout (Arabic / Hebrew) — column A renders on the right, column scroll direction inverts. Maps to <sheetView rightToLeft=...>.
    example: --prop rightToLeft=true
    example: --prop direction=rtl
    readback: true when set; absent when default (false)

Children:
  cell  (0..n)  /<A1Ref>
  chart  (0..n)  /chart

Note: Add accepts name, position, autoFilter, tabColor, and hidden — these forward to the same code paths Set uses, preserving Add/Set symmetry. `freeze` remains Set-only.
```

## xlsx Element: slicer

```text
xlsx slicer
--------------
Parent: sheet
Paths: /SheetName/slicer[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type slicer [--prop key=val ...]
  officecli set <file> /SheetName/slicer[N] --prop key=val ...
  officecli get <file> /SheetName/slicer[N]
  officecli query <file> slicer
  officecli remove <file> /SheetName/slicer[N]

Properties:
  pivotTable   string   [add/set/get]   aliases: pivot, source, tableName
    description: path or reference to an existing pivot table. Bare names resolve against the host sheet's pivots.
    example: --prop pivotTable=/Sheet1/pivottable[1]
    example: --prop tableName=Pivot1
    readback: pivot reference
  field   string   [add/set/get]   aliases: column
    description: pivot field name. Must match an existing cacheField (case-insensitive).
    example: --prop field=Region
    example: --prop column=Region
    readback: field name
  caption   string   [add/set/get]
    description: user-facing caption shown in the slicer header. Defaults to the field name.
    example: --prop caption='Filter by Region'
    readback: caption
  name   string   [add/set/get]
    description: slicer name. Sanitized; defaults to 'Slicer_<fieldName>'.
    example: --prop name=RegionSlicer
    readback: slicer name

Note: Slicers require an existing pivot table target. 'field' must match an existing cacheField name in the pivot's cache.
```

## xlsx Element: sparkline

```text
xlsx sparkline
--------------
Parent: sheet
Paths: /SheetName/sparkline[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type sparkline [--prop key=val ...]
  officecli set <file> /SheetName/sparkline[N] --prop key=val ...
  officecli get <file> /SheetName/sparkline[N]
  officecli query <file> sparkline
  officecli remove <file> /SheetName/sparkline[N]

Properties:
  type   enum   [add/set/get]
    description: sparkline chart kind. 'stacked'/'winloss' both map to OOXML stacked.
    values: line, column, stacked, winloss, win-loss
    example: --prop type=line
    readback: sparkline type
  dataRange   string   [add/set/get]   aliases: datarange, range, data
    description: source data range (e.g. A1:A10).
    example: --prop dataRange=A1:A10
    readback: range reference
  location   string   [add/set/get]   aliases: cell, ref
    description: target cell address.
    example: --prop location=B1
    readback: target cell
  color   color   [add/set/get]
    description: series line/column color. Defaults to #4472C4.
    example: --prop color=#FF0000
    readback: #RRGGBB
  negativeColor   color   [add/set/get]   aliases: negativecolor
    description: color used when 'negative' flag is on (winLoss/highlight negative points).
    example: --prop negativeColor=#FF0000
    readback: #RRGGBB
  markers   bool   [add/set/get]
    description: show data-point markers (line sparklines only).
    example: --prop markers=true
    readback: true/false
  highPoint   bool   [add/set/get]   aliases: highpoint
    description: highlight the maximum point.
    example: --prop highPoint=true
    readback: true/false
  lowPoint   bool   [add/set/get]   aliases: lowpoint
    description: highlight the minimum point.
    example: --prop lowPoint=true
    readback: true/false
  firstPoint   bool   [add/set/get]   aliases: firstpoint
    description: highlight the first point.
    example: --prop firstPoint=true
    readback: true/false
  lastPoint   bool   [add/set/get]   aliases: lastpoint
    description: highlight the last point.
    example: --prop lastPoint=true
    readback: true/false
  negative   bool   [add/set/get]
    description: highlight negative points using negativeColor.
    example: --prop negative=true
    readback: true/false
  highMarkerColor   color   [add]   aliases: highmarkercolor
    description: marker color for the high point. Add-only; not modifiable via Set.
    example: --prop highMarkerColor=#00B050
    readback: n/a
  lowMarkerColor   color   [add]   aliases: lowmarkercolor
    description: marker color for the low point. Add-only.
    example: --prop lowMarkerColor=#FF0000
    readback: n/a
  firstMarkerColor   color   [add]   aliases: firstmarkercolor
    description: marker color for the first point. Add-only.
    example: --prop firstMarkerColor=#4472C4
    readback: n/a
  lastMarkerColor   color   [add]   aliases: lastmarkercolor
    description: marker color for the last point. Add-only.
    example: --prop lastMarkerColor=#4472C4
    readback: n/a
  markersColor   color   [add]   aliases: markerscolor
    description: marker color for all non-extreme points. Add-only.
    example: --prop markersColor=#808080
    readback: n/a
  lineWeight   number   [add/set/get]   aliases: lineweight
    description: line stroke weight in points (line sparklines only).
    example: --prop lineWeight=1.5
    readback: number

Note: SparklineGroup stored under x14 extension list. Renders tiny inline chart in a target cell.
```

## xlsx Element: table

```text
xlsx table
--------------
Parent: sheet
Paths: /SheetName/table[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type table [--prop key=val ...]
  officecli set <file> /SheetName/table[N] --prop key=val ...
  officecli get <file> /SheetName/table[N]
  officecli query <file> table
  officecli remove <file> /SheetName/table[N]

Properties:
  ref   string   [add/set/get]   aliases: range
    description: cell range reference (A1:C10). Required. Alias: range.
    example: --prop ref=A1:C10
    readback: range string
  name   string   [add/set/get]
    description: table identifier (sanitized). Defaults to 'TableN'.
    example: --prop name=SalesData
    readback: identifier
  displayName   string   [add/set/get]
    description: Excel UI display name. Defaults to name.
    example: --prop displayName=SalesData
    readback: display name
  style   string   [add/set/get]
    description: built-in or workbook custom table style name. Defaults to TableStyleMedium2.
    example: --prop style=TableStyleMedium2
    readback: style name
  headerRow   bool   [add/set/get]   aliases: showHeader
    description: show header row. Alias: showHeader.
    example: --prop headerRow=true
    readback: true/false
  totalRow   bool   [add/set/get]   aliases: showTotals
    description: show total row. Alias: showTotals.
    example: --prop totalRow=true
    readback: true/false
  autoExpand   bool   [add]
    description: auto-expand range downward through contiguous non-empty rows at Add time.
    example: --prop autoExpand=true
    readback: affects range at Add time
  showFirstColumn   bool   [add/set/get]   aliases: firstColumn
    description: highlight the first column with the table style. Alias: firstColumn.
    example: --prop showFirstColumn=true
    readback: true/false
  showLastColumn   bool   [add/set/get]   aliases: lastColumn
    description: highlight the last column with the table style. Alias: lastColumn.
    example: --prop showLastColumn=true
    readback: true/false
  showRowStripes   bool   [add/set/get]   aliases: showBandedRows, bandedRows, bandRows
    description: alternate-row banding from the table style. Default: true. Aliases: showBandedRows, bandedRows, bandRows.
    example: --prop showRowStripes=false
    readback: true/false
  showColumnStripes   bool   [add/set/get]   aliases: showBandedColumns, bandedColumns, bandedCols, showColStripes, bandCols
    description: alternate-column banding from the table style. Default: false. Aliases: showBandedColumns, bandedColumns, bandedCols, showColStripes, bandCols.
    example: --prop showColumnStripes=true
    readback: true/false
  columns   string   [add]
    description: comma-separated column header names overriding A1, B1, ... defaults.
    example: --prop columns=Name,Qty,Price
    readback: applied at Add time
  totalsRowFunction   string   [add]
    description: comma-separated per-column totals row functions (none|sum|average|count|countNums|max|min|stdDev|var|custom). Effective only when totalRow=true.
    example: --prop totalsRowFunction=none,sum,average
    readback: per-column tokens

Note: Aliases: listobject. 'ref' (alias 'range') required: cell range like 'A1:C10'. Rejects ranges that overlap existing tables. Names sanitized; style validated against built-in/custom whitelist.
```

## xlsx Element: validation

```text
xlsx validation
---------------
Parent: sheet
Paths: /SheetName/validation[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type validation [--prop key=val ...]
  officecli set <file> /SheetName/validation[N] --prop key=val ...
  officecli get <file> /SheetName/validation[N]
  officecli query <file> validation
  officecli remove <file> /SheetName/validation[N]

Properties:
  type   enum   [add/set/get]
    values: list, whole, decimal, date, time, textlength, custom
    example: --prop type=list
    readback: validation type
  ref   string   [add/set/get]   aliases: sqref
    description: target cell range. Aliases: sqref.
    example: --prop ref=A1:A10
    example: --prop sqref=A1:A10
    readback: cell range
  allowBlank   bool   [add/set/get]
    description: allow blank cells. Default: true.
    example: --prop allowBlank=false
    readback: true/false
  showError   bool   [add/set/get]
    description: show error message on invalid input. Default: true.
    example: --prop showError=true
    readback: true/false
  showInput   bool   [add/set/get]
    description: show input prompt when cell selected. Default: true.
    example: --prop showInput=true
    readback: true/false
  errorTitle   string   [add/set/get]
    description: title of the error popup.
    example: --prop errorTitle="Bad value"
    readback: title text
  promptTitle   string   [add/set/get]
    description: title of the input prompt popup.
    example: --prop promptTitle="Hint"
    readback: title text
  errorStyle   enum   [add/get]
    description: severity of error popup. Default: stop. Aliases: warn=warning, info=information.
    values: stop, warning, information
    example: --prop errorStyle=warning
    readback: stop|warning|information
  inCellDropdown   bool   [add/get]
    description: show in-cell dropdown arrow for type=list. Default: true. Inverse of OOXML showDropDown.
    example: --prop inCellDropdown=false
    readback: true/false
  showDropDown   bool   [add]
    description: raw OOXML showDropDown flag (INVERTED: true = HIDE arrow). Prefer inCellDropdown for clarity.
    example: --prop showDropDown=true
    readback: raw OOXML flag
  operator   enum   [add/set/get]
    values: between, notBetween, equal, notEqual, greaterThan, greaterThanOrEqual, lessThan, lessThanOrEqual
    example: --prop operator=between
    readback: operator name
  formula1   string   [add/set/get]
    example: --prop formula1="Yes,No,Maybe"
    readback: formula1 content
  formula2   string   [add/set/get]
    example: --prop formula2=100
    readback: formula2 content
  prompt   string   [add/set/get]
    description: message shown when cell selected.
    example: --prop prompt="Enter 1-100"
    readback: prompt text
  error   string   [add/set/get]
    description: error message on invalid input.
    example: --prop error="Invalid value"
    readback: error text

Note: Aliases: datavalidation. Target cell range via 'ref'. Type determines which of formula1/formula2 are used.
```

## xlsx Element: workbook

```text
xlsx workbook
--------------
Read-only container (never created or removed via CLI).
Paths: /
Operations: set get query

Usage:
  officecli get <file> /
  officecli query <file> workbook

Properties:
  defaultFont   string   [get]   aliases: fontName, fontname
    description: default font for all cells (fontname alias).
    example: --prop defaultFont=Calibri
    readback: font name
  defaultFontSize   length   [get]   aliases: fontSize, fontsize
    description: default font size.
    example: --prop defaultFontSize=11
    readback: unit-qualified pt
  author   string   [get]   aliases: creator
    description: document author (core properties).
    example: --prop author="Alice"
    readback: author string
  title   string   [get]
    example: --prop title="Q1 Report"
    readback: title string
  subject   string   [get]
    example: --prop subject=Finance
    readback: subject string

Children:
  sheet  (1..n)  /{SheetName}

Note: Root container. Get returns sheet list and workbook-level metadata. Set exists for workbook-wide properties (defaultFont, defaultFontSize, calculation, author). Sheets are mutated via /SheetName paths.
```

## Format: pptx Elements

```text
Elements for pptx:
  chart
    chart-axis
    chart-series
  comment
  connector
  group
  media
  model3d
  notes
  ole
  picture
  placeholder
  presentation
  shape
    animation
    equation
    hyperlink
    paragraph
      run
  slide
  slidemaster
    slidelayout
  table
    table-column
    table-row
      table-cell
  textbox
  theme
  zoom

Run 'officecli help pptx <element>' for detail.
```

## pptx Element: chart

```text
pptx chart
--------------
Paths: /slide[N]/chart[@id=ID]  /slide[N]/chart[N]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type chart [--prop key=val ...]
  officecli set <file> /slide[N]/chart[N] --prop key=val ...
  officecli get <file> /slide[N]/chart[N]
  officecli query <file> chart
  officecli remove <file> /slide[N]/chart[N]

Properties:
  chartType   enum   [add/set/get]   aliases: col, donut, xy, spider, ohlc, wf
    values: bar, column, line, pie, doughnut, area, scatter, bubble, radar, stock, combo, waterfall, funnel, treemap, sunburst, boxWhisker, histogram, pareto
    example: --prop chartType=column
    example: --prop chartType=stackedBar
    example: --prop chartType=percentStackedColumn
    example: --prop chartType=column3d
    example: --prop chartType=waterfall
    readback: normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)
  title   string   [add/set/get]
    example: --prop title="2024 Sales"
    readback: plain text of chart title
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: length in cm
  y   length   [add/set/get]
    example: --prop y=3cm
    readback: length in cm
  width   length   [add/set/get]
    example: --prop width=18cm
    readback: length in cm
  height   length   [add/set/get]
    example: --prop height=10cm
    readback: length in cm
  categories   string   [add/set]
    description: comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)
    example: --prop categories="Q1,Q2,Q3,Q4"
    example: --prop categories="Sheet1!$A$2:$A$5"
  data   string   [add]
    description: legacy compact series syntax. Prefer per-series keys (see chart-series). Format: 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'
    example: --prop data="Sales:10,20,30;Cost:5,8,12"
  colors   string   [add]
    description: comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) override positions.
    example: --prop colors="4472C4,ED7D31,A5A5A5"
  holeSize   number   [set/get]
    description: doughnut hole size (10-90)
    example: --prop holeSize=50
  smooth   bool   [set/get]
    description: smooth line rendering
    example: --prop smooth=true
  preset   string   [add/set]   aliases: theme, style.preset
  style   number   [add/set]   aliases: styleid
  anchor   string   [add/set]
  dataRange   string   [add]   aliases: datarange, range
  legend   string   [add/set/get]
  legendfont   string   [add/set]   aliases: legend.font
  legendoverlay   bool   [add/set]   aliases: legend.overlay
  direction   string   [set]   aliases: rtl
    description: Chart-level reading direction. rtl stamps a:rtl="1" on chartSpace c:txPr lvl1pPr so default text bodies (axis labels, data labels) render right-to-left for Arabic / Hebrew.
    example: --prop direction=rtl
    readback: rtl|ltr
  datalabels   string   [add/set]   aliases: labels
  labelpos   string   [add/set]   aliases: labelposition
  labelfont   string   [add/set]
  labeloffset   number   [add/set]
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
  leaderlines   bool   [add/set]   aliases: showleaderlines
  axistitle   string   [add/set]   aliases: vtitle
  cattitle   string   [add/set]   aliases: htitle
  axismin   number   [add/set]   aliases: min
  axismax   number   [add/set]   aliases: max
  majorunit   number   [add/set]
  minorunit   number   [add/set]
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
  axisfont   string   [add/set]   aliases: axis.font
  majortickmark   string   [add/set]   aliases: majortick
  minortickmark   string   [add/set]   aliases: minortick
  ticklabelpos   string   [add/set]   aliases: ticklabelposition
  ticklabelskip   number   [add/set]   aliases: tickskip
  axisposition   string   [add/set]   aliases: axispos
  axisorientation   string   [add/set]   aliases: axisreverse
  axisline   string   [add/set]   aliases: axis.line
  cataxisline   string   [add/set]   aliases: cataxis.line
  valaxisline   string   [add/set]   aliases: valaxis.line
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
  cataxisvisible   bool   [add/set]   aliases: cataxis.visible
  valaxisvisible   bool   [add/set]   aliases: valaxis.visible
  logbase   number   [add/set]   aliases: logscale, yaxisscale
  crosses   string   [add/set]
  crossesat   number   [add/set]
  crossbetween   string   [add/set]
  dispunits   string   [add/set]   aliases: displayunits
  gridlines   bool   [add/set]   aliases: majorgridlines
  minorgridlines   bool   [add/set]
  plotareafill   string   [add/set]   aliases: plotfill
  chartareafill   string   [add/set]   aliases: chartfill
  plotborder   string   [add/set]   aliases: plotarea.border
  chartborder   string   [add/set]   aliases: chartarea.border
  areafill   string   [add/set]   aliases: area.fill
  linewidth   number   [add/set]
  linedash   string   [add/set]   aliases: dash
  marker   string   [add/set]   aliases: markers
  markersize   number   [add/set]
  showmarker   bool   [add/set]   aliases: showmarkers
  transparency   number   [add/set]   aliases: opacity, alpha
  gradient   string   [add/set]   aliases: gradientfill
  gradients   string   [add/set]
  view3d   string   [add/set]   aliases: camera, perspective
  trendline   string   [add/set]
  secondaryaxis   string   [add/set]   aliases: secondary
  referenceline   string   [add/set]   aliases: refline, targetline
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
  combotypes   string   [add/set]   aliases: combo.types
  scatterstyle   string   [add/set]
  radarstyle   string   [add/set]
  varycolors   bool   [add/set]
  dispblanksas   string   [add/set]   aliases: blanksas
  roundedcorners   bool   [add/set]
  autotitledeleted   bool   [add/set]
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
  gapwidth   number   [add/set]   aliases: gap
  overlap   number   [add/set]
  gapdepth   number   [add/set]
  shape   string   [add/set]   aliases: barshape
  explosion   number   [add/set]   aliases: explode
  invertifneg   bool   [add/set]   aliases: invertifnegative
  errbars   string   [add/set]   aliases: errorbars
  seriesshadow   string   [add/set]   aliases: series.shadow
  seriesoutline   string   [add/set]   aliases: series.outline
  firstsliceangle   number   [add/set]   aliases: sliceangle
  bubblescale   number   [add/set]
  shownegbubbles   bool   [add/set]
  sizerepresents   string   [add/set]
  datatable   bool   [add/set]
  droplines   string   [add/set]
  hilowlines   string   [add/set]
  updownbars   string   [add/set]
  serlines   string   [add/set]   aliases: serieslines
  increaseColor   color   [add]
  decreaseColor   color   [add]
  totalColor   color   [add]
  combosplit   number   [add]

Children:
  chart-title  (0..1)  /title
  chart-legend  (0..1)  /legend
  chart-plotArea  (0..1)  /plotArea
  chart-axis  (0..n)  /axis
  chart-series  (1..n)  /series

Note: source of truth: Core/Chart/ChartHelper.cs ParseChartType() for the classic (c:chart) family, Core/Chart/ChartExBuilder.cs IsExtendedChartType() for the extended (cx:chart) family. Adding a new chartType value MUST update both the handler and this file in the same PR — contract tests enforce equivalence.
```

## pptx Element: chart-axis

```text
pptx chart-axis
---------------
Parent: chart
Addressing: /slide[N]/chart[N]/axis[@role=ROLE]
Operations: set get

Properties:
  title   string   [set/get]
    example: --prop title="Quarter"
  visible   bool   [set/get]
    example: --prop visible=false
  min   number   [set/get]
    example: --prop min=0
  max   number   [set/get]
    example: --prop max=250
  logBase   number   [set/get]
    example: --prop logBase=10
  format   string   [set/get]
    description: number format string
    example: --prop format="#,##0"
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  majorGridlines   bool   [set/get]
    example: --prop majorGridlines=true
  minorGridlines   bool   [set/get]
    example: --prop minorGridlines=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Set/Get only operate on axes that already exist.
```

## pptx Element: chart-series

```text
pptx chart-series
-----------------
Parent: chart
Paths: /slide[N]/chart[@id=ID]/series[@id=ID]  /slide[N]/chart[N]/series[N]
Operations: add set get remove

Usage:
  officecli add <file> /slide[N]/chart[N] --type chart-series [--prop key=val ...]
  officecli set <file> /slide[N]/chart[N]/series[N] --prop key=val ...
  officecli get <file> /slide[N]/chart[N]/series[N]
  officecli remove <file> /slide[N]/chart[N]/series[N]

Properties:
  name   string   [add/set/get]   aliases: title
    example: --prop name="Product A"
    example: --prop series1.name="Product A"
  values   string   [add/set/get]
    description: comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)
    example: --prop series1.values="120,150,180,210"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
  categories   string   [add/set]
    description: per-series category override; range reference only
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
  color   color   [add/set/get]
    description: series fill color
    example: --prop series1.color=4472C4
    readback: #RRGGBB uppercase
  smooth   bool   [set/get]
    example: --prop smooth=true

Note: At Add time, series are usually passed as properties of the parent `chart` element using dotted keys (series1.name, series1.values, series1.color, series1.categories). This element represents per-series Set/Get after the chart exists. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type.
```

## pptx Element: comment

```text
pptx comment
--------------
Parent: slide
Paths: /slide[N]/comment[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type comment [--prop key=val ...]
  officecli set <file> /slide[N]/comment[M] --prop key=val ...
  officecli get <file> /slide[N]/comment[M]
  officecli query <file> comment
  officecli remove <file> /slide[N]/comment[M]

Properties:
  text   string   [add/set/get]
    example: --prop text="Reword this bullet"
    readback: comment text
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: author name
  initials   string   [add/set/get]
    description: author initials. Defaults to derived from author name when omitted.
    example: --prop initials=AT
    readback: initials
  date   string   [add/set/get]
    description: ISO 8601 timestamp. Defaults to UtcNow.
    example: --prop date=2025-01-15T10:30:00Z
    readback: ISO timestamp
  index   int   [get]
    description: Per-author monotonic index, assigned by the engine.
    readback: comment index
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: EMU
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: EMU
  direction   string   [add]   aliases: dir, rtl
    description: Reading direction for the comment text. rtl prepends U+200F (RIGHT-TO-LEFT MARK) so Arabic / Hebrew comments render with proper bidi context. p:cm has no native rtl attribute, so this is the standard pure-text convention.
    example: --prop direction=rtl
    readback: rtl|ltr

Note: Comments live in CommentsPart with an author list. Anchored at x/y EMU on the slide.
```

## pptx Element: connector

```text
pptx connector
--------------
Parent: slide
Paths: /slide[N]/connector[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type connector [--prop key=val ...]
  officecli set <file> /slide[N]/connector[M] --prop key=val ...
  officecli get <file> /slide[N]/connector[M]
  officecli query <file> connector
  officecli remove <file> /slide[N]/connector[M]

Properties:
  shape   enum   [add/set/get]
    values: line, straightConnector1, bentConnector2, bentConnector3, curvedConnector2, curvedConnector3
    example: --prop shape=straightConnector1
    readback: geometry preset name
  from   string   [add/set]
    description: start-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as returned by 'query shape'). Get readback exposes the resolved shape ID via Format[startShape] (a separate read-only key); reverse path resolution is not implemented.
    example: --prop from=/slide[1]/shape[1]
    example: --prop from=/slide[1]/shape[@id=10001]
    readback: see Format[startShape] (id, not path)
  to   string   [add/set]
    description: end-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as returned by 'query shape'). Get readback exposes the resolved shape ID via Format[endShape] (a separate read-only key); reverse path resolution is not implemented.
    example: --prop to=/slide[1]/shape[2]
    example: --prop to=/slide[1]/shape[@id=10002]
    readback: see Format[endShape] (id, not path)
  x   length   [add/set/get]
    example: --prop x=1in
    readback: EMU
  y   length   [add/set/get]
    example: --prop y=1in
    readback: EMU
  width   length   [add/set/get]
    example: --prop width=2in
    readback: EMU
  height   length   [add/set/get]
    example: --prop height=1in
    readback: EMU
  color   color   [add/set/get]
    example: --prop color=#000000
    readback: #-prefixed uppercase hex
  lineWidth   length   [add/set/get]   aliases: linewidth, line.width
    example: --prop lineWidth=2pt
    readback: pt-qualified string
  lineDash   enum   [add/set/get]   aliases: linedash
    values: solid, dot, dash, dashDot, longDash, longDashDot, sysDot, sysDash
    example: --prop lineDash=dash
    readback: OOXML preset dash name
  headEnd   enum   [add/set/get]   aliases: headend
    values: none, triangle, arrow, stealth, diamond, oval
    example: --prop headEnd=triangle
    readback: OOXML LineEndValues token (canonical)
  tailEnd   enum   [add/set/get]   aliases: tailend
    values: none, triangle, arrow, stealth, diamond, oval
    example: --prop tailEnd=arrow
    readback: OOXML LineEndValues token (canonical)

Note: Aliases: connection. Straight / bent / curved connector lines. 'from' and 'to' can reference shape paths to auto-attach endpoints.
```

## pptx Element: group

```text
pptx group
--------------
Parent: slide
Paths: /slide[N]/group[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type group [--prop key=val ...]
  officecli set <file> /slide[N]/group[M] --prop key=val ...
  officecli get <file> /slide[N]/group[M]
  officecli query <file> group
  officecli remove <file> /slide[N]/group[M]

Properties:
  shapes   string   [add]
    description: comma-separated shape indices (1,2,3) or DOM paths (/slide[N]/shape[M],...). Required.
    example: --prop shapes=1,2
    readback: n/a (structural)
  name   string   [add/set/get]
    description: group name. Defaults to 'Group N'.
    example: --prop name="Logos"
    readback: name string

Note: Groups existing shapes on a slide. 'shapes' takes comma-separated shape indices or DOM paths. Group bounding box auto-computed from member transforms.
```

## pptx Element: media

```text
pptx media
--------------
Parent: slide
Paths: /slide[N]/video[M]  /slide[N]/audio[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type media [--prop key=val ...]
  officecli set <file> /slide[N]/video[M] --prop key=val ...
  officecli get <file> /slide[N]/video[M]
  officecli query <file> media
  officecli remove <file> /slide[N]/video[M]

Properties:
  src   string   [add/set/get]   aliases: path
    example: --prop src=/path/to/video.mp4
    readback: media URL or rel id
  poster   string   [add/set]
    description: custom thumbnail image path.
    example: --prop poster=/path/to/thumb.png
    readback: n/a
  x   length   [add/set/get]
    example: --prop x=1in
    readback: unit-qualified length
  y   length   [add/set/get]
    example: --prop y=1in
    readback: unit-qualified length
  width   length   [add/set/get]
    example: --prop width=4in
    readback: unit-qualified length
  height   length   [add/set/get]
    example: --prop height=3in
    readback: unit-qualified length
  volume   int   [add/set/get]
    description: playback volume 0-100.
    example: --prop volume=80
    readback: volume percent
  autoPlay   bool   [add/set/get]   aliases: autoplay
    example: --prop autoPlay=true
    readback: true/false
  trimstart   string   [add/set/get]
    description: trim from media start (e.g. '00:00:01.500' or millisecond count). Surfaced as trimStart on Get.
    example: --prop trimstart=00:00:01.500
    readback: OOXML trim Start string
  trimend   string   [add/set/get]
    description: trim from media end. Surfaced as trimEnd on Get.
    example: --prop trimend=00:00:10.000
    readback: OOXML trim End string

Note: Aliases: video, audio. Video/audio inferred from extension when type=media. Poster image auto-generated when not supplied.
```

## pptx Element: model3d

```text
pptx model3d
--------------
Parent: slide
Paths: /slide[N]/model3d[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type model3d [--prop key=val ...]
  officecli set <file> /slide[N]/model3d[M] --prop key=val ...
  officecli get <file> /slide[N]/model3d[M]
  officecli query <file> model3d
  officecli remove <file> /slide[N]/model3d[M]

Properties:
  src   string   [add/set/get]   aliases: path
    description: .glb source (file path, URL, data-URI). Non-glb rejected.
    example: --prop src=/path/to/model.glb
    readback: model URL or rel id
  x   length   [add/set/get]   aliases: left
    example: --prop x=2cm
    readback: unit-qualified length
  y   length   [add/set/get]   aliases: top
    example: --prop y=2cm
    readback: unit-qualified length
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: unit-qualified length
  height   length   [add/set/get]
    example: --prop height=10cm
    readback: unit-qualified length

Note: Only .glb (glTF-Binary) accepted. Placeholder PNG auto-generated for non-3D-aware viewers. Defaults to 10cm × 10cm centered on the slide.
```

## pptx Element: notes

```text
pptx notes
--------------
Parent: slide
Paths: /slide[N]/notes
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type notes [--prop key=val ...]
  officecli set <file> /slide[N]/notes --prop key=val ...
  officecli get <file> /slide[N]/notes
  officecli query <file> notes
  officecli remove <file> /slide[N]/notes

Properties:
  text   string   [add/set/get]
    description: notes body text.
    example: --prop text="Emphasize slide 3 data"
    readback: notes text
  direction   enum   [add/set]   aliases: dir, rtl
    description: Reading direction for the notes body. Sets <a:pPr rtl="1"/> on every paragraph and rtlCol="1" on the body shape's bodyPr. Required for Arabic / Hebrew speaker notes.
    values: ltr, rtl
    example: --prop direction=rtl
  lang   string   [add/set]
    description: BCP-47 language tag applied to every run in the notes body (a:rPr/@lang). Mirrors the shape Set vocabulary.
    example: --prop lang=ar-SA

Note: Speaker notes live in a NotesSlidePart paired with the slide. Add creates the part if absent; Set replaces text.
```

## pptx Element: ole

```text
pptx ole
--------------
Parent: slide
Paths: /slide[N]/ole[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type ole [--prop key=val ...]
  officecli set <file> /slide[N]/ole[M] --prop key=val ...
  officecli get <file> /slide[N]/ole[M]
  officecli query <file> ole
  officecli remove <file> /slide[N]/ole[M]

Properties:
  src   string   [add/set/get]   aliases: path
    example: --prop src=/path/to/data.xlsx
    readback: rel id
  progId   string   [add/set/get]   aliases: progid
    example: --prop progId=Excel.Sheet.12
    readback: ProgID
  preview   string   [add/set]
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: EMU
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: EMU
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: EMU
  height   length   [add/set/get]
    example: --prop height=8cm
    readback: EMU

Note: Aliases: oleobject, object, embed. Binary package + preview image. Position via x/y/width/height (EMU).
```

## pptx Element: picture

```text
pptx picture
--------------
Parent: slide
Paths: /slide[N]/picture[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type picture [--prop key=val ...]
  officecli set <file> /slide[N]/picture[M] --prop key=val ...
  officecli get <file> /slide[N]/picture[M]
  officecli query <file> picture
  officecli remove <file> /slide[N]/picture[M]

Properties:
  src   string   [add/set/get]   aliases: path
    example: --prop src=/path/to/image.png
    readback: resolved image URL or rel id
  x   length   [add/set/get]
    example: --prop x=1in
    readback: unit-qualified length
  y   length   [add/set/get]
    example: --prop y=1in
    readback: unit-qualified length
  width   length   [add/set/get]
    description: EMU-parseable. Defaults to 6in if omitted.
    example: --prop width=3in
    readback: unit-qualified length
  height   length   [add/set/get]
    description: EMU-parseable. Defaults to 4in if omitted.
    example: --prop height=2in
    readback: unit-qualified length
  crop   string   [add/set]
    description: Crop in percent (0-100). 1 value = symmetric, 2 values = vertical,horizontal, 4 values = left,top,right,bottom.
    example: --prop crop=10
    example: --prop crop=5,10
    example: --prop crop=10,5,10,5
  cropLeft   string   [add/set]   aliases: cropleft
    description: Crop from left edge as percent (0-100). Aliases: cropleft.
    example: --prop cropLeft=10
  cropRight   string   [add/set]   aliases: cropright
    description: Crop from right edge as percent (0-100). Aliases: cropright.
    example: --prop cropRight=10
  cropTop   string   [add/set]   aliases: croptop
    description: Crop from top edge as percent (0-100). Aliases: croptop.
    example: --prop cropTop=10
  cropBottom   string   [add/set]   aliases: cropbottom
    description: Crop from bottom edge as percent (0-100). Aliases: cropbottom.
    example: --prop cropBottom=10

Note: Aliases: image, img. 'src' (alias 'path') required. Source resolved by ImageSource — file path, URL, data-URI, raw bytes.
```

## pptx Element: placeholder

```text
pptx placeholder
----------------
Parent: slide
Paths: /slide[N]/placeholder[M]  /slide[N]/shape[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type placeholder [--prop key=val ...]
  officecli set <file> /slide[N]/placeholder[M] --prop key=val ...
  officecli get <file> /slide[N]/placeholder[M]
  officecli query <file> placeholder
  officecli remove <file> /slide[N]/placeholder[M]

Properties:
  phType   enum   [add/set/get]   aliases: phtype, type
    description: placeholder type. Required.
    values: title, body, subtitle, date, footer, slidenum, header, picture, chart, table, diagram, media, obj, clipart
    example: --prop phType=title
    readback: placeholder type string
  name   string   [add/set/get]
    description: placeholder name. Defaults to '{type} Placeholder {id}'.
    example: --prop name="Title 1"
    readback: name string
  text   string   [add/set/get]
    description: optional initial text content.
    example: --prop text="Slide title"
    readback: concatenated run text

Note: Aliases: ph. Inserts a Shape with PlaceholderShape nonVisual properties — geometry comes from the slide layout. Add returns /slide[N]/shape[M] path (placeholder is a shape at the OOXML layer).
```

## pptx Element: presentation

```text
pptx presentation
-----------------
Read-only container (never created or removed via CLI).
Paths: /
Operations: get query

Usage:
  officecli get <file> /
  officecli query <file> presentation

Children:
  slide  (0..n)  /slide
  slidemaster  (1..n)  /slidemaster
  theme  (1)  /theme

Note: Root container. Get returns the presentation node with slide count + theme/master/layout references as children. Not addressable via Add or Set — mutate via /slide[N], /theme, etc.
```

## pptx Element: shape

```text
pptx shape
--------------
Paths: /slide[N]/shape[@id=ID]  /slide[N]/shape[N]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type shape [--prop key=val ...]
  officecli set <file> /slide[N]/shape[N] --prop key=val ...
  officecli get <file> /slide[N]/shape[N]
  officecli query <file> shape
  officecli remove <file> /slide[N]/shape[N]

Properties:
  text   string   [add/set/get]
    example: --prop text="Hello"
    readback: plain text content of the shape
  fill   color   [add/set/get]   aliases: background
    example: --prop fill=FF0000
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop fill=accent1
    readback: #RRGGBB (uppercase) or scheme color name (e.g. accent1)
  color   color   [add/set/get]   aliases: font.color
    description: text color
    example: --prop color=0000FF
    readback: #RRGGBB (uppercase)
  size   font-size   [add/set/get]   aliases: fontSize, fontsize, font.size
    description: font size
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified string, e.g. "14pt"
  bold   bool   [add/set/get]   aliases: font.bold
    example: --prop bold=true
    readback: true | false
  italic   bool   [add/set/get]   aliases: font.italic
    example: --prop italic=true
    readback: true | false
  align   enum   [add/set/get]
    description: text horizontal alignment
    values: left, center, right, justify
    example: --prop align=center
    readback: one of: left | center | right | justify
  x   length   [add/set/get]   aliases: left
    description: horizontal position of shape
    example: --prop x=2cm
    example: --prop x=1in
    example: --prop x=72pt
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]   aliases: top
    description: vertical position of shape
    example: --prop y=3cm
    readback: length in cm (e.g. "3cm")
  width   length   [add/set/get]   aliases: w
    example: --prop width=5cm
    readback: length in cm
  height   length   [add/set/get]   aliases: h
    example: --prop height=3cm
    readback: length in cm
  rotation   number   [add/set/get]   aliases: rotate
    description: rotation in degrees
    example: --prop rotation=45
    readback: degrees as number (e.g. 45)
  flipH   bool   [add/set]   aliases: flipHorizontal
    description: Flip the shape horizontally.
    example: --prop flipH=true
  flipV   bool   [add/set]   aliases: flipVertical
    description: Flip the shape vertically.
    example: --prop flipV=true
  opacity   number   [add/set/get]
    description: fill opacity (0.0 - 1.0). Requires a fill to attach to — opacity alone (without fill/gradient/pattern) has no effect in OOXML.
    example: --prop opacity=0.5 --prop fill=FF0000
    readback: number in [0, 1]
  name   string   [add/set/get]
    description: shape name (identifier, not display text)
    example: --prop name=MyShape
    readback: plain string
  geometry   string   [add/set/get]   aliases: preset, shape
    description: Preset shape geometry (default: rect).
    values: rect, roundRect, ellipse, triangle, diamond, parallelogram, rightArrow, star5
    example: --prop geometry=ellipse
    example: --prop preset=roundRect
    readback: preset name (e.g. "ellipse", "roundRect")
  font   string   [add/set/get]   aliases: font.name
    description: default font family for shape text. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / Arabic) use font.latin, font.ea, or font.cs.
    example: --prop font=Arial
    readback: font name
  font.latin   string   [add/set/get]
    description: Latin-script font slot only (a:latin). Use to target ASCII/European text without overwriting CJK / complex-script slots.
    example: --prop font.latin=Calibri
    readback: typeface (only emitted when it differs from the bare 'font' slot)
  font.ea   string   [add/set/get]   aliases: font.eastasia, font.eastasian
    description: East-Asian font slot (a:ea) — Chinese / Japanese / Korean text.
    example: --prop font.ea="メイリオ"
    readback: typeface (only emitted when it differs from the bare 'font' slot)
  font.cs   string   [add/set/get]   aliases: font.complexscript, font.complex
    description: Complex-script font slot (a:cs) — Arabic / Hebrew / Thai etc.
    example: --prop font.cs="Arabic Typesetting"
    readback: typeface
  direction   enum   [add/set/get]   aliases: dir, rtl
    description: paragraph reading direction (a:pPr rtl). Use 'rtl' for Arabic / Hebrew layouts.
    values: ltr, rtl
    example: --prop direction=rtl
    readback: rtl | ltr (only emitted when explicitly set)
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style for shape text.
    values: single, double, dotted, dash, wave, none
    example: --prop underline=single
    readback: underline style
  strike   bool   [add/set/get]   aliases: strikethrough, font.strike, font.strikethrough
    description: strikethrough on shape text.
    example: --prop strike=true
    readback: true | false
  cap   enum   [add/set/get]   aliases: allCaps, allcaps, smallCaps, smallcaps
    description: letter-case rendering mode for shape text (rPr/cap).
    values: none, small, all
    example: --prop cap=all
    example: --prop allCaps=true
    readback: none | small | all
  lang   string   [add/set/get]   aliases: altLang, altlang
    description: BCP-47 language tag on first run rPr (drawingML rPr/@lang).
    example: --prop lang=en-US
    readback: BCP-47 tag
  spc   number   [add/set/get]   aliases: spacing, charspacing, letterspacing
    description: character spacing in 1/100 pt (drawingML rPr/@spc).
    example: --prop spc=200
    readback: integer
  kern   number   [add/set/get]
    description: minimum kerning size in 1/100 pt (drawingML rPr/@kern).
    example: --prop kern=1200
    readback: integer
  valign   enum   [add/set/get]
    description: vertical alignment of text within shape.
    values: top, middle, bottom, ctr
    example: --prop valign=middle
    readback: vertical alignment
  margin   length   [add/set]
    description: uniform internal padding (text inset) for shape body.
    example: --prop margin=0.1in
    readback: n/a
  autofit   enum   [add/set]
    description: auto-fit mode for shape text body.
    values: none, normal, shape, noAutofit, spAutoFit
    example: --prop autofit=shape
    readback: n/a
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: line spacing for shape paragraphs (multiplier or pt).
    example: --prop lineSpacing=1.5x
    readback: 1.5x or 18pt
  spaceBefore   length   [add/set/get]   aliases: spacebefore
    example: --prop spaceBefore=6pt
    readback: unit-qualified pt
  spaceAfter   length   [add/set/get]   aliases: spaceafter
    example: --prop spaceAfter=6pt
    readback: unit-qualified pt
  gradient   string   [add/set]
    description: gradient fill spec: colors separated by '-' (e.g. 'FF0000-0000FF' linear).
    example: --prop gradient="FF0000-0000FF"
    readback: n/a
  pattern   string   [add/set]
    description: pattern fill: 'preset' or 'preset:fg' or 'preset:fg:bg' (defaults: fg=000000, bg=FFFFFF).
    example: --prop pattern="diagBrick:FF0000:FFFFFF"
    readback: n/a
  image   string   [add/set]   aliases: imagefill
    description: image (blip) fill: path to a local image file used as the shape fill.
    example: --prop image=/path/to/photo.png
    readback: n/a
  line   color   [add/set/get]   aliases: linecolor, lineColor, border
    description: outline (border) color.
    example: --prop line=000000
    readback: #RRGGBB
  linewidth   length   [add/set/get]   aliases: lineWidth
    description: outline width.
    example: --prop linewidth=1pt
    readback: unit-qualified
  list   string   [add/set]   aliases: liststyle
    description: list style for shape paragraphs (bullet|ordered|none).
    example: --prop list=bullet
    readback: n/a
  link   string   [add/set]
    description: hyperlink URL or anchor for shape click action.
    example: --prop link=https://example.com
    readback: n/a
  tooltip   string   [add/set]
    description: tooltip / screen-tip text for hyperlink.
    example: --prop tooltip="click here"
    readback: n/a
  animation   string   [add/set]   aliases: animate
    description: animation effect spec.
    example: --prop animation=fade
    readback: n/a
  shadow   string   [add/set/get]
    description: outer shadow effect. Pass a color (e.g. '000000') or 'true' (defaults to black). Routed to text-level rPr for text-only shapes.
    example: --prop shadow=000000
    example: --prop shadow=true
    readback: color hex string
  glow   string   [add/set/get]
    description: glow effect. Pass a color (e.g. '4472C4') or 'true' (defaults to accent blue).
    example: --prop glow=4472C4
    example: --prop glow=true
    readback: color hex string
  reflection   string   [add/set]
    description: reflection effect. Accepts 'true' to enable a default reflection.
    example: --prop reflection=true
    readback: n/a
  softEdge   length   [add/set]   aliases: softedge
    description: soft-edge blur radius (pt).
    example: --prop softEdge=4pt
    readback: n/a
```

## pptx Element: animation

```text
pptx animation
--------------
Parent: shape
Paths: /slide[N]/shape[M]/animation[K]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/shape[M] --type animation [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M]/animation[K] --prop key=val ...
  officecli get <file> /slide[N]/shape[M]/animation[K]
  officecli query <file> animation
  officecli remove <file> /slide[N]/shape[M]/animation[K]

Properties:
  effect   enum   [add/set/get]
    description: animation preset. spin/grow/wave require class=emphasis; appear/fade/fly/zoom/wipe/bounce/float/swivel/split/wheel/checkerboard/blinds/dissolve/flash/box/circle/diamond/plus/strips/wedge/random work for entrance and exit. (disappear is not supported — use class=exit + appear or fade.)
    values: appear, fade, fly, zoom, wipe, bounce, float, swivel, split, wheel, checkerboard, blinds, dissolve, flash, box, circle, diamond, plus, strips, wedge, random, spin, grow, wave
    example: --prop effect=fade
    example: --prop effect=spin --prop class=emphasis
    readback: effect name
  class   enum   [add/set/get]
    description: animation category — entrance, exit, or emphasis. spin/grow/wave only work with emphasis.
    values: entrance, exit, emphasis
    example: --prop class=entrance
    readback: entrance | exit | emphasis
  trigger   enum   [add/set/get]
    values: onClick, withPrevious, afterPrevious
    example: --prop trigger=onClick
    readback: trigger mode
  duration   length   [add/set/get]   aliases: dur
    description: Animation duration in milliseconds (integer).
    example: --prop duration=500
    example: --prop dur=2000
    readback: duration in milliseconds
  delay   length   [add/set/get]
    description: Delay before starting in milliseconds (integer).
    example: --prop delay=200
    readback: delay in milliseconds
  direction   string   [add/set/get]
    description: direction for directional effects (in/out/left/right/up/down).
    example: --prop direction=in
    readback: direction

Note: Animation attached to a specific shape. Effect name drives the timing preset; trigger controls sequencing (onClick / withPrevious / afterPrevious).
```

## pptx Element: equation

```text
pptx equation
--------------
Parent: slide|shape
Paths: /slide[N]/shape[M]/oMath[K]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/shape[M] --type equation [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M]/oMath[K] --prop key=val ...
  officecli get <file> /slide[N]/shape[M]/oMath[K]
  officecli query <file> equation
  officecli remove <file> /slide[N]/shape[M]/oMath[K]

Properties:
  formula   string   [add/set/get]   aliases: text
    example: --prop formula="x^2 + y^2 = z^2"
    readback: source formula when round-trippable
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: EMU
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: EMU
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: EMU
  height   length   [add/set/get]
    example: --prop height=3cm
    readback: EMU

Note: Aliases: formula, math. FormulaParser parses LaTeX-ish input. Adding a 'shape' or 'textbox' with 'formula' prop also routes here.
```

## pptx Element: hyperlink

```text
pptx hyperlink
--------------
Parent: shape|run
Paths: /slide[N]/shape[M]/hyperlink  /slide[N]/shape[M]/p[K]/r[L]/hyperlink
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/shape[M] --type hyperlink [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M]/hyperlink --prop key=val ...
  officecli get <file> /slide[N]/shape[M]/hyperlink
  officecli query <file> hyperlink
  officecli remove <file> /slide[N]/shape[M]/hyperlink

Properties:
  url   string   [add/set/get]   aliases: href
    example: --prop url=https://example.com
    readback: target URL
  slide   int   [add/set/get]
    description: internal target slide index (1-based).
    example: --prop slide=3
    readback: target slide index
  tooltip   string   [add/set/get]
    description: hover tooltip.
    example: --prop tooltip="Next section"
    readback: tooltip text

Note: Aliases: link. Attached to a shape (shape-wide link) or to a run (inline link). Exactly one of 'url' or 'slide' is required.
```

## pptx Element: paragraph

```text
pptx paragraph
--------------
Parent: shape|placeholder
Paths: /slide[N]/shape[M]/p[K]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/shape[M] --type paragraph [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M]/p[K] --prop key=val ...
  officecli get <file> /slide[N]/shape[M]/p[K]
  officecli query <file> paragraph
  officecli remove <file> /slide[N]/shape[M]/p[K]

Properties:
  text   string   [add/set/get]
    description: initial single-run text.
    example: --prop text="Hello"
    readback: concatenated run text
  align   enum   [add/set/get]   aliases: alignment, halign
    values: left, center, right, justify
    example: --prop align=center
    readback: canonical 'align'
  level   int   [add/set/get]
    description: list indent level 0-8.
    example: --prop level=1
    readback: indent level
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: multiplier (1.5x, 150%) or fixed length (18pt). SpacingConverter routes input.
    example: --prop lineSpacing=1.5x
    readback: '<N>x' or '<N>pt'

Children:
  run  (0..n)  /r

Note: Aliases: para. Appends a:p to a shape's TextBody. Alignment uses pptx vocabulary (l/ctr/r/just); lineSpacing via SpacingConverter.
```

## pptx Element: run

```text
pptx run
--------------
Parent: paragraph
Paths: /slide[N]/shape[M]/p[K]/r[L]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/shape[M]/p[K] --type run [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M]/p[K]/r[L] --prop key=val ...
  officecli get <file> /slide[N]/shape[M]/p[K]/r[L]
  officecli query <file> run
  officecli remove <file> /slide[N]/shape[M]/p[K]/r[L]

Properties:
  text   string   [add/set/get]
    example: --prop text="word"
    readback: a:t content
  font   string   [add/set/get]
    description: Latin/EastAsia typeface name.
    example: --prop font="Arial"
    readback: font name
  size   length   [add/set/get]   aliases: fontsize, fontSize, font.size
    description: font size. Lenient input (14, 14pt, 10.5pt).
    example: --prop size=14
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true/false
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true/false
  underline   enum   [add/set/get]
    values: single, double, dotted, dashed, wavy, none
    example: --prop underline=single
    readback: underline style
  color   color   [add/set/get]
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex (scheme colors pass through)
  cap   enum   [add/set/get]   aliases: allCaps, allcaps, smallCaps, smallcaps
    values: none, small, all
    example: --prop cap=all
    example: --prop allCaps=true
    readback: none | small | all

Note: Appends a:r inside a:p. Font properties live on a:rPr. Colors get #-prefixed on readback via ParseHelpers.FormatHexColor.
```

## pptx Element: slide

```text
pptx slide
--------------
Parent: presentation
Paths: /slide[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type slide [--prop key=val ...]
  officecli set <file> /slide[N] --prop key=val ...
  officecli get <file> /slide[N]
  officecli query <file> slide
  officecli remove <file> /slide[N]

Properties:
  layout   string   [add/set/get]
    description: slide layout name (e.g. 'Title Slide', 'Title and Content'). Resolved against the presentation's slide masters.
    example: --prop layout="Title Slide"
    readback: layout name string
  title   string   [add/set/get]
    description: title text. Creates a Title shape at Add time.
    example: --prop title="Introduction"
    readback: Preview surfaces the title text (not in Format)
  text   string   [add]
    description: content body text. Creates a Content text shape at Add time.
    example: --prop text="Body text"
    readback: not surfaced at slide level
  background   color   [add/set/get]
    description: slide background. Accepts hex color, 'transparent', or 'image:/path'.
    example: --prop background=#FFFFFF
    readback: resolved background descriptor
  transition   string   [add/set/get]
    description: transition name (fade, push, wipe, morph, etc.). 'morph...' triggers auto-prefixing of shape names.
    example: --prop transition=fade
    readback: transition name
  advanceTime   length   [add/set/get]   aliases: advancetime
    description: auto-advance time in seconds/ms.
    example: --prop advanceTime=5
    readback: time descriptor
  advanceClick   bool   [add/set/get]   aliases: advanceclick
    description: advance on click.
    example: --prop advanceClick=true
    readback: true/false
  notes   string   [set/get]
    description: slide notes text. Set-only at creation time.
    example: --prop notes="Speaker notes here"
    readback: notes text when present

Children:
  shape  (0..n)  /shape
  table  (0..n)  /table
  chart  (0..n)  /chart
  picture  (0..n)  /picture
  placeholder  (0..n)  /placeholder

Note: Slide layouts are resolved by name via ResolveSlideLayout. 'title' / 'text' shorthand inserts title / content text shapes at Add time. Background accepts hex color, 'transparent', or 'image:/path'. Transition 'morph...' auto-prefixes shape names. Newly added slides contain no placeholders by default — use --prop title=... / text=... shorthand, `add /slide[N] --type placeholder --prop phType=title`, or `add /slide[N] --type shape|textbox` to add content.
```

## pptx Element: slidemaster

```text
pptx slidemaster
----------------
Read-only container (never created or removed via CLI).
Parent: presentation
Paths: /slidemaster[N]
Operations: get query

Usage:
  officecli get <file> /slidemaster[N]
  officecli query <file> slidemaster

Properties:
  name   string   [get]
    description: master part name from NonVisualDrawingProperties.
    readback: master name string

Children:
  slidelayout  (1..n)  /slidelayout

Note: Slide master definition. Children: slideLayout references. Currently read-only — masters are created by templates, not user Add.
```

## pptx Element: slidelayout

```text
pptx slidelayout
----------------
Read-only container (never created or removed via CLI).
Parent: slidemaster
Paths: /slidemaster[N]/slidelayout[M]  /slidelayout[M]
Operations: get query

Usage:
  officecli get <file> /slidemaster[N]/slidelayout[M]
  officecli query <file> slidelayout

Properties:
  name   string   [get]
    description: layout display name (e.g. 'Title Slide').
    readback: layout name string
  type   string   [get]
    description: layout type (title, obj, twoObj, etc.).
    readback: SlideLayoutValues.InnerText

Note: Slide layout definition. Referenced by slides via the 'layout' property. Read-only here; mutate by editing the template file.
```

## pptx Element: table

```text
pptx table
--------------
Parent: slide
Paths: /slide[N]/table[@id=ID]  /slide[N]/table[@name=NAME]  /slide[N]/table[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type table [--prop key=val ...]
  officecli set <file> /slide[N]/table[M] --prop key=val ...
  officecli get <file> /slide[N]/table[M]
  officecli query <file> table
  officecli remove <file> /slide[N]/table[M]

Properties:
  rows   int   [add/get]
    description: number of rows (ignored if 'data' is supplied).
    example: --prop rows=3
    readback: integer row count
  cols   int   [add/get]
    description: number of columns (ignored if 'data' is supplied).
    example: --prop cols=3
    readback: integer column count from first row
  data   string   [add]
    description: inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.
    example: --prop data="A,B;1,2"
    readback: n/a (seeds cells at Add time)
  name   string   [add/set/get]
    description: NonVisualDrawingProperties Name (used for stable @name addressing).
    example: --prop name=Summary
    readback: name string
  x   length   [add/set/get]
    description: left offset in EMU-parseable length.
    example: --prop x=1in
    readback: cm-formatted length
  y   length   [add/set/get]
    example: --prop y=1in
    readback: cm-formatted length
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: cm-formatted length
  height   length   [add/set/get]
    example: --prop height=5cm
    readback: cm-formatted length
  rowHeight   length   [add]   aliases: rowheight
    description: uniform row height (EMU). If unspecified, derived from 'height' / rows.
    example: --prop rowHeight=1cm
    readback: not surfaced at table level
  style   string   [add/set/get]   aliases: tableStyle, tableStyleId
    description: table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, none, or a direct {GUID}.
    values: medium1, medium2, medium3, medium4, light1, light2, light3, dark1, dark2, none
    example: --prop style=medium1
    readback: style name when resolvable, else GUID
  headerFill   color   [add]   aliases: headerfill
    description: solid fill color applied to row 0 (header).
    example: --prop headerFill=#4472C4
    readback: per-cell fill, not aggregated at table level
  bodyFill   color   [add]   aliases: bodyfill
    description: solid fill color applied to rows 1..N (body).
    example: --prop bodyFill=#EEECE1
    readback: per-cell fill, not aggregated at table level

Children:
  row  (1..n)  /tr
  column  (1..n)  /col

Note: A table is a GraphicFrame wrapping a Drawing.Table. Data can be seeded inline via 'data' (semicolon-separated rows, comma-separated cells) or per-cell via 'r{R}c{C}' props. Dimensions in EMU-parseable length (1in/2cm/raw EMU/720pt).
```

## pptx Element: table-column

```text
pptx column
--------------
Parent: table
Paths: /slide[N]/table[M]/col[C]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/table[M] --type column [--prop key=val ...]
  officecli set <file> /slide[N]/table[M]/col[C] --prop key=val ...
  officecli get <file> /slide[N]/table[M]/col[C]
  officecli query <file> column
  officecli remove <file> /slide[N]/table[M]/col[C]

Properties:
  width   length   [add/set/get]
    description: column width in EMU-parseable length. Defaults to average of existing columns or ~2.54cm.
    example: --prop width=3cm
    readback: EMU numeric
  text   string   [add]
    description: seed text inserted into every new cell of this column.
    example: --prop text=Header
    readback: not surfaced at column level

Note: Adds a GridColumn plus a new TableCell in every existing row at the insertion index.
```

## pptx Element: table-row

```text
pptx row
--------------
Parent: table
Paths: /slide[N]/table[M]/tr[R]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/table[M] --type row [--prop key=val ...]
  officecli set <file> /slide[N]/table[M]/tr[R] --prop key=val ...
  officecli get <file> /slide[N]/table[M]/tr[R]
  officecli query <file> row
  officecli remove <file> /slide[N]/table[M]/tr[R]

Properties:
  cols   int   [add]
    description: override column count for the new row (defaults to table grid column count).
    example: --prop cols=4
    readback: n/a (structural)
  height   length   [add/set/get]
    description: row height in EMU-parseable length. Defaults to first-row height or ~1cm.
    example: --prop height=1cm
    readback: EMU numeric

Note: Row inherits column count from the table grid unless 'cols' override is supplied. Per-cell seed text via c{N}=value props.
```

## pptx Element: table-cell

```text
pptx cell
--------------
Parent: row
Paths: /slide[N]/table[M]/tr[R]/tc[C]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N]/table[M]/tr[R] --type cell [--prop key=val ...]
  officecli set <file> /slide[N]/table[M]/tr[R]/tc[C] --prop key=val ...
  officecli get <file> /slide[N]/table[M]/tr[R]/tc[C]
  officecli query <file> cell
  officecli remove <file> /slide[N]/table[M]/tr[R]/tc[C]

Properties:
  text   string   [add/set/get]
    description: cell text content (single run).
    example: --prop text="Hello"
    readback: concatenated run text

Note: Appending a cell to a row is unusual — normally cells are seeded at row-Add time. This op exists for completeness.
```

## pptx Element: textbox

```text
pptx textbox
--------------
Parent: slide
Paths: /slide[N]/shape[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type textbox [--prop key=val ...]
  officecli set <file> /slide[N]/shape[M] --prop key=val ...
  officecli get <file> /slide[N]/shape[M]
  officecli query <file> textbox
  officecli remove <file> /slide[N]/shape[M]

Properties:
  text   string   [add/set/get]
    example: --prop text="Hello"
    readback: plain text content of the textbox
  font   string   [add/set/get]   aliases: fontname, fontFamily
    description: font family. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / Arabic) use font.latin, font.ea, or font.cs.
    example: --prop font=Calibri
    readback: font family string
  font.latin   string   [add/set/get]
    description: Latin-script font slot (a:latin) only.
    example: --prop font.latin=Calibri
  font.ea   string   [add/set/get]   aliases: font.eastasia, font.eastasian
    description: East-Asian font slot (a:ea) — Chinese / Japanese / Korean text.
    example: --prop font.ea="メイリオ"
  font.cs   string   [add/set/get]   aliases: font.complexscript, font.complex
    description: Complex-script font slot (a:cs) — Arabic / Hebrew / Thai etc.
    example: --prop font.cs="Arabic Typesetting"
  direction   enum   [add/set/get]   aliases: dir, rtl
    description: paragraph reading direction (a:pPr rtl). Use 'rtl' for Arabic / Hebrew layouts.
    values: ltr, rtl
    example: --prop direction=rtl
  size   font-size   [add/set/get]   aliases: fontsize
    description: font size
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified string, e.g. "14pt"
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true | false
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true | false
  color   color   [add/set/get]
    description: text color
    example: --prop color=0000FF
    example: --prop color=#0000FF
    readback: #RRGGBB (uppercase)
  fill   color   [add/set/get]   aliases: background
    description: textbox background fill
    example: --prop fill=FFFF00
    example: --prop fill=accent1
    readback: #RRGGBB (uppercase) or scheme color name
  align   enum   [add/set/get]
    description: text horizontal alignment
    values: left, center, right, justify
    example: --prop align=center
    readback: one of: left | center | right | justify
  width   length   [add/set/get]
    example: --prop width=5cm
    readback: length in cm
  height   length   [add/set/get]
    example: --prop height=3cm
    readback: length in cm
  x   length   [add/set/get]
    description: horizontal position of the textbox
    example: --prop x=2cm
    example: --prop x=1in
    example: --prop x=72pt
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    description: vertical position of the textbox
    example: --prop y=3cm
    readback: length in cm (e.g. "3cm")

Note: textbox is an alias for shape — both route to AddShape. 'textbox' input that includes --prop formula routes to AddEquation instead. The common text/position/size/font properties are inlined below; the full property surface (geometry, rotation, opacity, name, effects, …) is documented in pptx/shape.json.
```

## pptx Element: theme

```text
pptx theme
--------------
Read-only container (never created or removed via CLI).
Parent: presentation
Paths: /theme
Operations: set get query

Usage:
  officecli get <file> /theme
  officecli query <file> theme

Properties:
  majorFont   string   [get]
    description: major (heading) Latin typeface.
    example: --prop majorFont="Calibri Light"
    readback: font name
  minorFont   string   [get]
    description: minor (body) Latin typeface.
    example: --prop minorFont=Calibri
    readback: font name
  headingFont.ea   string   [get]
    description: major (heading) East Asian typeface (CJK).
    example: --prop headingFont.ea="Yu Gothic"
    readback: font name
  headingFont.cs   string   [get]
    description: major (heading) Complex Script typeface (Arabic/Hebrew/Thai).
    example: --prop headingFont.cs=Arial
    readback: font name
  bodyFont.ea   string   [get]
    description: minor (body) East Asian typeface (CJK).
    example: --prop bodyFont.ea="Yu Gothic"
    readback: font name
  bodyFont.cs   string   [get]
    description: minor (body) Complex Script typeface (Arabic/Hebrew/Thai).
    example: --prop bodyFont.cs="Times New Roman"
    readback: font name
  accent1   color   [get]
    example: --prop accent1=#4472C4
    readback: #-prefixed uppercase hex
  accent2   color   [get]
    example: --prop accent2=#ED7D31
  accent3   color   [get]
    example: --prop accent3=#A5A5A5
  accent4   color   [get]
    example: --prop accent4=#FFC000
  accent5   color   [get]
    example: --prop accent5=#5B9BD5
  accent6   color   [get]
    example: --prop accent6=#70AD47
  hyperlink   color   [get]
    description: theme hyperlink color.
    example: --prop hyperlink=#0563C1
    readback: #-prefixed uppercase hex

Note: Presentation theme part — fonts and color scheme. Set accepts a limited subset (color scheme entries, major/minor font); full theme replacement is not supported.
```

## pptx Element: zoom

```text
pptx zoom
--------------
Parent: slide
Paths: /slide[N]/zoom[M]
Operations: add set get query remove

Usage:
  officecli add <file> /slide[N] --type zoom [--prop key=val ...]
  officecli set <file> /slide[N]/zoom[M] --prop key=val ...
  officecli get <file> /slide[N]/zoom[M]
  officecli query <file> zoom
  officecli remove <file> /slide[N]/zoom[M]

Properties:
  target   int   [add/set/get]   aliases: slide
    description: target slide number (1-based). Required. Alias: slide.
    example: --prop target=3
    readback: target slide index
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: EMU / unit-qualified
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: EMU / unit-qualified
  width   length   [add/set/get]
    example: --prop width=8cm
    readback: EMU / unit-qualified
  height   length   [add/set/get]
    example: --prop height=4.5cm
    readback: EMU / unit-qualified
  name   string   [add/set/get]
    description: zoom frame name. Defaults to 'Slide Zoom N'.
    example: --prop name="Section 2"
    readback: name string
  returnToParent   bool   [add/set/get]   aliases: returntoparent
    description: return to parent slide after zoom plays.
    example: --prop returnToParent=true
    readback: true/false
  transitionDur   int   [add/set/get]   aliases: transitiondur
    description: transition duration in ms. Defaults to 1000.
    example: --prop transitionDur=1500
    readback: ms

Note: Aliases: slidezoom, slide-zoom. Creates a slide-zoom link on the source slide pointing to target slide. Default size 8cm × 4.5cm centered. Used for interactive non-linear navigation.
```

