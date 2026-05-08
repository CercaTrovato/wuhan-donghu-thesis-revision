# OfficeCLI 1.0.72 Full Reference

Generated: 2026-05-06 12:54:39 +08:00

This file is generated from the installed officecli binary. Regenerate it after upgrading OfficeCLI.

Regenerate command from this directory:

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
  dump <file>                                Serialize a document into a replayable batch script (round-trip mechanism)
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
  officecli help all                              Flat dump of every (format,element,property) — pipe to grep
  officecli help all --json                       Same dump as one envelope-wrapped JSON document
  officecli help all --jsonl                      Same dump as NDJSON (one JSON object per line)

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
  <mode>  View mode: text, annotated, outline, stats, issues, html, svg, screenshot, forms

选项:
  --start <start>                          Start line/paragraph number
  --end <end>                              End line/paragraph number
  --max-lines <max-lines>                  Maximum number of lines/rows/slides to output (truncates with total count)
  --type <type>                            Issue type filter: format, content, structure
  --limit <limit>                          Limit number of results
  --cols <cols>                            Column filter, comma-separated (Excel only, e.g. A,B,C)
  --page <page>                            Page filter (e.g. 1, 2-5, 1,3,5). html mode: default=all. screenshot mode: default=1 (use --page 1-N to capture more, or --grid N for pptx thumbnails).
  --browser                                Open output in browser (html / svg modes)
  -o, --out <out>                          Output file path (screenshot mode; defaults to a temp file)
  --screenshot-width <screenshot-width>    Screenshot viewport width (default 1600) [default: 1600]
  --screenshot-height <screenshot-height>  Screenshot viewport height (default 1200) [default: 1200]
  --grid <grid>                            Tile slides into an N-column thumbnail grid (screenshot mode, pptx only; 0 = off) [default: 0]
  --render <render>                        Screenshot rendering path (docx only): auto (default; native on Windows w/ Word, html elsewhere), native (force OS-native, error if unavailable), html [default: auto]
  --page-count                             stats mode (docx only): also report total page count via Word repagination (Win + Word required; slow on long docs)
  --json                                   Output as JSON (AI-friendly)
  -?, -h, --help                           Show help and usage information
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

## Command: dump

```text
Description:
  Serialize a document into a replayable batch script (round-trip mechanism)

用法:
  officecli dump <file> [options]

参数:
  <file>  Office document path (.docx)

选项:
  --format <format>  Output format (currently: batch) [default: batch]
  -o, --out <out>    Write output to a file instead of stdout
  --json             Output as JSON (AI-friendly)
  -?, -h, --help     Show help and usage information
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
  officecli skills install <skill-name> <agent>  Install a specific skill to a single agent (either order works)
  officecli skills <agent>                Install base SKILL.md to a specific agent
  officecli skills list                   List all available skills

Skills: pptx, word, excel, morph-ppt, pitch-deck, academic-paper, data-dashboard, financial-model
Agents: claude, copilot, codex, cursor, windsurf, minimax, openclaw, nanobot, zeroclaw, hermes, all
```

## Command: install

```text
Usage:
  officecli install           One-step setup: install binary + skills + MCP to all detected agents
  officecli install <target>  Install to a specific agent (claude, copilot, cursor, vscode, ...)

Equivalent to: installing the binary, then `officecli skills install` and `officecli mcp <target>`.
Targets: claude, copilot, codex, cursor, windsurf, vscode, minimax, openclaw, nanobot, zeroclaw, hermes, all
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
  author   string   [set/get]   aliases: creator
    example: --prop author="Alice"
    readback: author string
  title   string   [set/get]
    example: --prop title="Report"
    readback: title string
  keywords   string   [set/get]
    example: --prop keywords="tag1,tag2"
    readback: keywords string
  description   string   [set/get]
    example: --prop description="Abstract"
    readback: description string
  lastModifiedBy   string   [set/get]   aliases: lastmodifiedby
    example: --prop lastModifiedBy="Bob"
    readback: last-modified author
  category   string   [get]
    description: document category metadata. Emitted only when present.
    readback: category string
  revision   string   [get]
    description: document revision counter. Emitted only when present.
    readback: revision string
  created   string   [get]
    description: creation timestamp (ISO-8601). Emitted only when present.
    readback: ISO-8601 timestamp
  modified   string   [get]
    description: last modification timestamp (ISO-8601). Emitted only when present.
    readback: ISO-8601 timestamp
  protection   enum   [get]
    description: document protection mode.
    values: none, readOnly, comments, trackedChanges, forms
    readback: protection mode name
  protectionEnforced   bool   [get]
    description: whether document protection is enforced.
    readback: true | false
  docGrid.type   enum   [set/get]
    description: document grid type.
    values: default, lines, linesAndChars, snapToChars
    readback: grid type token
  docGrid.linePitch   number   [set/get]
    description: document grid line pitch.
    readback: integer
  docGrid.charSpace   number   [set/get]
    description: document grid char space.
    readback: integer
  charSpacingControl   enum   [set/get]
    description: CJK character spacing control.
    values: compressPunctuation, compressPunctuationAndJapaneseKana, doNotCompress
    readback: spacing control token
  compatibility.mode   string   [set/get]
    description: compatibility mode identifier.
    readback: compatibility mode value
  docDefaults.font   string   [set/get]   aliases: defaultFont
    description: default Latin font.
    readback: font family name
  docDefaults.font.eastAsia   string   [set/get]
    description: default East Asian font slot.
    readback: font family name
  docDefaults.font.hAnsi   string   [set/get]
    description: default hAnsi font slot.
    readback: font family name
  docDefaults.font.complexScript   string   [set/get]
    description: default complex-script font slot.
    readback: font family name
  docDefaults.fontSize   font-size   [set/get]
    description: default font size.
    readback: Npt
  docDefaults.color   color   [set/get]
    description: default text color.
    readback: #RRGGBB
  docDefaults.bold   bool   [set/get]
    description: default bold flag.
    readback: true | false
  docDefaults.italic   bool   [set/get]
    description: default italic flag.
    readback: true | false
  docDefaults.rtl   bool   [set/get]
    description: default right-to-left flag.
    readback: true | false
  docDefaults.alignment   string   [set/get]
    description: default paragraph alignment.
    readback: alignment token
  docDefaults.spaceBefore   string   [set/get]
    description: default paragraph space-before.
    readback: Npt
  docDefaults.spaceAfter   string   [set/get]
    description: default paragraph space-after.
    readback: Npt
  docDefaults.lineSpacing   string   [set/get]
    description: default paragraph line spacing.
    readback: 1.5x or Npt
  autoSpaceDE   bool   [set]
    description: auto-spacing between East Asian and Latin text.
    readback: n/a (set-only)
  autoSpaceDN   bool   [set]
    description: auto-spacing between East Asian and numeric text.
    readback: n/a (set-only)
  kinsoku   bool   [set]
    description: Japanese kinsoku line breaking rules.
    readback: n/a (set-only)
  overflowPunct   bool   [set]
    description: allow punctuation to overflow margin.
    readback: n/a (set-only)
  embedFonts   bool   [set]
    description: embed TrueType fonts.
    readback: n/a (set-only)
  embedSystemFonts   bool   [set]
    description: embed system fonts.
    readback: n/a (set-only)
  saveSubsetFonts   bool   [set]
    description: save font subsets.
    readback: n/a (set-only)
  mirrorMargins   bool   [set]
    description: mirror margins for facing pages.
    readback: n/a (set-only)
  gutterAtTop   bool   [set]
    description: gutter at top.
    readback: n/a (set-only)
  bookFoldPrinting   bool   [set]
    description: book fold printing layout.
    readback: n/a (set-only)
  evenAndOddHeaders   bool   [set]
    description: different headers for even/odd pages.
    readback: n/a (set-only)
  defaultTabStop   string   [set]
    description: default tab stop (e.g. "720" twips or "0.5in").
    example: --prop defaultTabStop=720
    example: --prop defaultTabStop=0.5in
    readback: n/a (set-only)
  displayBackgroundShape   bool   [set]
    description: display background shape.
    readback: n/a (set-only)
  removePersonalInformation   bool   [set]
    description: remove personal info on save.
    readback: n/a (set-only)
  removeDateAndTime   bool   [set]
    description: remove date/time on save.
    readback: n/a (set-only)
  printFormsData   bool   [set]
    description: print only form data.
    readback: n/a (set-only)
  pageWidth   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop pageWidth=21cm
    readback: length in cm (e.g. "21cm")
  pageHeight   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop pageHeight=29.7cm
    readback: length in cm (e.g. "29.7cm")
  orientation   enum   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    values: portrait, landscape
    example: --prop orientation=landscape
    readback: orientation token
  marginTop   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop marginTop=2.54cm
    readback: length in cm
  marginBottom   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop marginBottom=2.54cm
    readback: length in cm
  marginLeft   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop marginLeft=3.18cm
    readback: length in cm
  marginRight   length   [set/get]
    description: convenience readback from sectPr; primary edit path is /section[N].
    example: --prop marginRight=3.18cm
    readback: length in cm
  extended.application   string   [get]
    description: from docProps/app.xml application identifier (e.g. "Microsoft Word").
    readback: application string
  bookFoldPrintingSheets   number   [get]
    description: settings.xml bookFoldPrintingSheets — sheets per booklet signature when book-fold printing.
    readback: integer sheets-per-signature
  bookFoldReversePrinting   bool   [get]
    description: settings.xml bookFoldRevPrinting flag — true when book-fold printing reverses the page order.
    readback: true|false
  doNotDisplayPageBoundaries   bool   [get]
    description: settings.xml doNotDisplayPageBoundaries flag — Word view hides the page-boundary frame.
    readback: true when set
  columns.equalWidth   bool   [get]
    description: document-default columns equal-width flag (sectPr cols @equalWidth on the body sectPr).
    readback: true|false
  columns.separator   bool   [get]
    description: document-default columns separator flag (sectPr cols @sep on the body sectPr).
    readback: true|false
  extended.applicationVersion   string   [get]
    description: docProps/app.xml AppVersion field.
    readback: version string
  extended.characters   number   [get]
    description: docProps/app.xml Characters count.
    readback: integer
  extended.company   string   [set/get]
    description: docProps/app.xml Company field.
    readback: company name
  extended.lines   number   [get]
    description: docProps/app.xml Lines count.
    readback: integer
  extended.manager   string   [set/get]
    description: docProps/app.xml Manager field.
    readback: manager name
  extended.pages   number   [get]
    description: docProps/app.xml Pages count.
    readback: integer
  extended.paragraphs   number   [get]
    description: docProps/app.xml Paragraphs count.
    readback: integer
  extended.template   string   [set/get]
    description: docProps/app.xml Template field.
    readback: template name
  extended.totalTime   number   [get]
    description: docProps/app.xml TotalTime field (minutes).
    readback: integer minutes
  extended.words   number   [get]
    description: docProps/app.xml Words count.
    readback: integer
  subject   string   [set/get]
    example: --prop subject=Finance
    readback: subject string
  theme.color.accent1   color   [set/get]
    description: theme accent color 1.
    readback: #RRGGBB or scheme reference
  theme.color.accent2   color   [set/get]
    description: theme accent color 2.
    readback: #RRGGBB or scheme reference
  theme.color.accent3   color   [set/get]
    description: theme accent color 3.
    readback: #RRGGBB or scheme reference
  theme.color.accent4   color   [set/get]
    description: theme accent color 4.
    readback: #RRGGBB or scheme reference
  theme.color.accent5   color   [set/get]
    description: theme accent color 5.
    readback: #RRGGBB or scheme reference
  theme.color.accent6   color   [set/get]
    description: theme accent color 6.
    readback: #RRGGBB or scheme reference
  theme.color.dk1   color   [set/get]
    description: theme color slot dk1 (dark 1 / default text).
    readback: #RRGGBB or scheme reference
  theme.color.dk2   color   [set/get]
    description: theme color slot dk2 (dark 2).
    readback: #RRGGBB or scheme reference
  theme.color.folHlink   color   [set/get]
    description: theme followed-hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.hlink   color   [set/get]
    description: theme hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.lt1   color   [set/get]
    description: theme color slot lt1 (light 1 / default background).
    readback: #RRGGBB or scheme reference
  theme.color.lt2   color   [set/get]
    description: theme color slot lt2 (light 2).
    readback: #RRGGBB or scheme reference
  theme.colorScheme   string   [get]
    description: color scheme name (a:clrScheme/@name).
    readback: color scheme name
  theme.font.major.eastAsia   string   [set/get]
    description: major (heading) East Asian typeface.
    readback: font family name
  theme.font.major.latin   string   [set/get]
    description: major (heading) Latin typeface.
    readback: font family name
  theme.font.minor.eastAsia   string   [set/get]
    description: minor (body) East Asian typeface.
    readback: font family name
  theme.font.minor.latin   string   [set/get]
    description: minor (body) Latin typeface.
    readback: font family name
  theme.fontScheme   string   [get]
    description: font scheme name (a:fontScheme/@name).
    readback: font scheme name
  theme.formatScheme   string   [get]
    description: format scheme name (a:fmtScheme/@name).
    readback: format scheme name
  theme.name   string   [get]
    description: theme display name (a:theme/@name).
    readback: theme name string

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
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right, justify, both, distribute
    example: --prop align=center
    readback: first-paragraph Justification.Val.InnerText
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the footer paragraph, <w:rtl/> on the paragraph mark, and <w:rtl/> on every run (text + field runs alike) so Arabic / Hebrew character order reverses end-to-end. 'ltr' clears all three.
    values: rtl, ltr
    example: --prop direction=rtl
  font   string   [add/set/get]
    example: --prop font="Arial"
    readback: Ascii or HighAnsi font name
  size   font-size   [add/set/get]
    description: font size. Accepts bare number or pt-suffixed.
    example: --prop size=12
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true when bold, key absent otherwise
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true when italic, key absent otherwise
  color   color   [add/set/get]
    description: font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex
  field   enum   [add]
    values: page, pagenum, pagenumber, numpages, date, author, title, time, filename
    example: --prop field=page
    readback: not surfaced as a distinct key

Note: Mirror of header.json — same surface, stored in FooterParts. Duplicate type per section rejected at Add. A single Add supports at most one text + one field pair. For composite footers like 'Page X of Y' (two fields + literal text), create the footer first, then Add additional runs/fields to its paragraph (/footer[N]/p[1]) one by one — see examples.

Examples:
  Simple page-number footer: officecli add file.docx / --type footer --prop field=page --prop align=center
  'Page X of Y' — must be built in steps after creating the footer:
    1) officecli add file.docx / --type footer --prop text="Page " --prop align=center
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
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right, justify, both, distribute
    example: --prop align=center
    readback: first-paragraph Justification.Val.InnerText
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the header paragraph, <w:rtl/> on the paragraph mark, and <w:rtl/> on every run (text + field runs alike) so Arabic / Hebrew character order reverses end-to-end. 'ltr' clears all three.
    values: rtl, ltr
    example: --prop direction=rtl
  font   string   [add/set/get]
    example: --prop font="Arial"
    readback: Ascii or HighAnsi font name
  size   font-size   [add/set/get]
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
    description: font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).
    example: --prop color=#FF0000
    readback: #-prefixed uppercase hex
  field   enum   [add]
    description: complex field to insert (page/numpages/date/author/title/time/filename, or an arbitrary field name).
    values: page, pagenum, pagenumber, numpages, date, author, title, time, filename
    example: --prop field=page
    readback: not surfaced as a distinct key

Note: Headers are stored in HeaderParts and referenced by the last sectPr. Duplicate type rejected at Add. 'first' type auto-enables TitlePage. Field insertion uses complex fldChar (begin/instr/separate/result/end). A single Add supports at most one text + one field pair; composite headers like 'Page X of Y' must be built in steps by adding additional runs/fields to the header's paragraph (/header[N]/p[1]) after creation — see examples.

Examples:
  Simple page-number header: officecli add file.docx / --type header --prop field=page --prop align=right
  'Page X of Y' — build in steps after creating the header:
    1) officecli add file.docx / --type header --prop text="Page " --prop align=right
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

Properties:
  abstractNumCount   number   [get]
    description: total number of abstractNum definitions in numbering.xml.
    readback: integer abstractNum count
  abstractNumId   number   [get]
    description: per-num child readback — the abstractNumId referenced by each /num child. Surfaces on enumerated num child nodes, not the numbering container itself.
    readback: integer abstractNum reference

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
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right, justify, both, distribute
    example: --prop align=center
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
  listStyle   enum   [add/set/get]   aliases: liststyle
    description: high-level list type. 'bullet' (aliases: unordered, ul) creates a bulleted list; 'ordered' (or any other non-bullet value, e.g. 'decimal') creates a numbered list; 'none'/'remove'/'clear' strips list formatting. Preferred over raw numId. Continues a preceding list of the same type automatically unless 'start' is also given.
    values: bullet, ordered, none
    example: --prop listStyle=bullet --prop text="item"
    example: --prop listStyle=ordered --prop text="step 1"
    readback: 'bullet' or 'ordered' (normalized from the numbering format)
  numId   int   [add/set/get]   aliases: numid
    description: numbering definition id (w:numId). Low-level entry point — prefer 'listStyle' unless you specifically need to reference an existing numbering instance. Requires the numId to already exist in /numbering (create via `add /numbering --type num` first).
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
    description: paragraph reading direction. 'rtl' writes <w:bidi/> on pPr, <w:rtl/> on the paragraph mark, and <w:rtl/> on every run (so Arabic / Hebrew character order reverses inside runs, not just page-side layout). 'ltr' clears all three.
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
  hangingIndent   length   [add/set/get]   aliases: hangingindent, hanging
    description: hanging indent (pairs with left indent). Routed through SpacingConverter.
    example: --prop hangingIndent=0.5cm
    readback: unit-qualified length (e.g. "28.35pt")
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
  effective.size   font-size   [get]
    description: inheritance-resolved font size (read-only) — derived from the first run's style chain → paragraph style → docDefaults.
    readback: unit-qualified, e.g. "14pt"
  effective.size.src   string   [get]
    description: source pointer for effective.size.
    readback: style/docDefaults path
  effective.font.ascii   string   [get]
    description: inheritance-resolved Latin/ASCII font slot (read-only).
    readback: font family name
  effective.font.ascii.src   string   [get]
    description: source pointer for effective.font.ascii.
    readback: style/docDefaults path
  effective.font.eastAsia   string   [get]
    description: inheritance-resolved East-Asian font slot (read-only).
    readback: font family name
  effective.font.eastAsia.src   string   [get]
    description: source pointer for effective.font.eastAsia.
    readback: style/docDefaults path
  effective.font.hAnsi   string   [get]
    description: inheritance-resolved High-ANSI font slot (read-only).
    readback: font family name
  effective.font.hAnsi.src   string   [get]
    description: source pointer for effective.font.hAnsi.
    readback: style/docDefaults path
  effective.font.cs   string   [get]
    description: inheritance-resolved complex-script font slot (read-only).
    readback: font family name
  effective.font.cs.src   string   [get]
    description: source pointer for effective.font.cs.
    readback: style/docDefaults path
  effective.bold   bool   [get]
    description: inheritance-resolved bold (read-only).
    readback: true | false
  effective.bold.src   string   [get]
    description: source pointer for effective.bold.
    readback: style/docDefaults path
  effective.italic   bool   [get]
    description: inheritance-resolved italic (read-only).
    readback: true | false
  effective.italic.src   string   [get]
    description: source pointer for effective.italic.
    readback: style/docDefaults path
  effective.color   color   [get]
    description: inheritance-resolved font color (read-only). #RRGGBB or scheme color name.
    readback: #RRGGBB uppercase or scheme color
  effective.color.src   string   [get]
    description: source pointer for effective.color.
    readback: style/docDefaults path
  effective.underline   string   [get]
    description: inheritance-resolved underline style (read-only).
    readback: underline style name
  effective.underline.src   string   [get]
    description: source pointer for effective.underline.
    readback: style/docDefaults path
  effective.rtl   bool   [get]
    description: inheritance-resolved right-to-left flag (read-only). Emitted even when 'rtl' is set directly so callers can compare direct vs cascade-resolved state.
    readback: true | false
  effective.rtl.src   string   [get]
    description: source pointer for effective.rtl.
    readback: style/docDefaults path
  numFmt   string   [get]
    description: raw numbering format (e.g. bullet, decimal, lowerLetter). Emitted only when present.
    readback: numbering format token
  shading.val   string   [get]
    description: shading pattern value (decomposed from `shd`). Add/Set use `shd`.
    readback: shading pattern token
  shading.fill   string   [get]
    description: shading fill color hex (decomposed from `shd`).
    readback: #RRGGBB
  shading.color   string   [get]
    description: shading foreground color hex.
    readback: #RRGGBB
  paraId   string   [get]
    description: paragraph stable id (source of @paraId in stable path). Emitted only when present.
    readback: paraId hex string
  outlineLvl   number   [get]
    description: outline level (0-9). Emitted only when present.
    readback: integer
  tabs   array   [get]
    description: tab stops array. Emitted only when present.
    readback: array of tab stop descriptors
  pbdr.top   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  pbdr.bottom   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  pbdr.left   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  pbdr.right   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  pbdr.between   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  pbdr.bar   string   [-]
    description: paragraph border edge descriptor. Emitted only when present.
    readback: n/a (handler does not surface paragraph borders today)
  firstLineChars   number   [get]
    description: first-line indent in 1/100 character units (CT_Ind @firstLineChars). Word's chars-relative variant of firstLineIndent.
    readback: integer 1/100-char units
  hangingChars   number   [get]
    description: hanging indent in 1/100 character units (CT_Ind @hangingChars). Word's chars-relative variant of hangingIndent.
    readback: integer 1/100-char units
  indent   length   [add/set/get]   aliases: leftindent, leftIndent
    description: left indentation. Routed through SpacingConverter — accepts twips int or unit-qualified (2cm/0.5in/24pt). Aliases: leftindent/leftIndent/indentleft.
    example: --prop indent=2cm
    readback: length string (cm or twips, format-dependent)
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: multiplier (e.g. 1.5x, 150%) or fixed length (e.g. 18pt)
    example: --prop lineSpacing=1.5x
    example: --prop lineSpacing=18pt
    readback: "<N>x" for multiplier or "<N>pt" for fixed
  text   string   [add/set/get]
    description: Sets plain text on the paragraph by creating an implicit single run. Do not also add a 'run' child with text on the same paragraph — they will duplicate.
    example: --prop text="Hello"
    example: --prop text="Hello world"
    readback: plain text content of paragraph

Children:
  run  (0..n)  /r

Note: Canonical keys per CLAUDE.md: spaceBefore/spaceAfter/lineSpacing/align. Legacy aliases (spacebefore, linespacing, halign) are still accepted on Add/Set but Get normalizes to canonical. effective.* keys (effective.size, effective.bold, effective.color, ...) are read-only inheritance-resolved values derived from the first run's resolution through paragraph style → docDefaults; each carries an effective.X.src pointer to the writing layer (e.g. "/styles/Heading1", "/docDefaults"). They are suppressed when the paragraph (or its first run) sets the corresponding direct value.
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
  id   string   [get]
    description: OOXML bookmark id (w:bookmarkStart/@w:id). Assigned by the writer; surfaces only on Get/Query.
    readback: numeric bookmark id as stored on BookmarkStart

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
  dispUnits   string   [add/set/get]   aliases: displayunits, dispunits
    description: value-axis display units token readback (e.g. thousands, millions). Surfaces on the chart node when emitted by the value axis.
    example: --prop dispunits=thousands
    readback: display unit token
  seriesCount   number   [get]
    description: number of data series in the chart (extended cx:chart only).
    readback: number of data series
  radarstyle   string   [add/set]
    description: radar chart subtype. Values: standard|line, marker, filled|fill.
    example: --prop radarstyle=filled
  roundedcorners   bool   [add/set]
    description: round the chart-area outer corners.
    example: --prop roundedcorners=true
  valaxisvisible   bool   [add/set]   aliases: valaxis.visible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisvisible=false
  areafill   string   [add/set]   aliases: area.fill
    description: fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.
    example: --prop areafill=4472C4-A5C8FF:90
  autotitledeleted   bool   [add/set]
    description: suppress the auto-generated 'Chart Title' placeholder.
    example: --prop autotitledeleted=true
  axisfont   string   [add/set]   aliases: axis.font
    description: convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options
    example: --prop axisfont=10:8B949E:Helvetica
  axisline   string   [add/set]   aliases: axis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options
    example: --prop axisline=666666:1
  axismax   number   [add/set]   aliases: max
    description: convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismax=1000
    example: --prop axismax=250
  axismin   number   [add/set]   aliases: min
    description: convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismin=0
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
    description: convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level options
    example: --prop axisnumfmt="#,##0"
  axisorientation   string   [add/set]   aliases: axisreverse
    description: convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options
    example: --prop axisorientation=true
  axisposition   string   [add/set]   aliases: axispos
    description: convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-level options
    example: --prop axisposition=top
  axistitle   string   [add/set]   aliases: vtitle
    description: convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options
    example: --prop axistitle="Revenue"
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options
    example: --prop axisvisible=false
  bubbleScale   number   [add/set/get]   aliases: bubblescale
    description: bubble chart scale (% of default).
    example: --prop bubblescale=100
    readback: integer percentage
  catAxisVisible   bool   [add/set/get]   aliases: cataxis.visible, cataxisvisible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisvisible=false
    readback: true | false
  catTitle   string   [add/set/get]   aliases: htitle, cattitle
    description: category axis title text.
    example: --prop cattitle="Quarter"
    readback: title string
  cataxisline   string   [add/set]   aliases: cataxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisline=333333:1
  categories   string   [add/set/get]
    description: comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)
    example: --prop categories=A,B,C
    example: --prop categories="Q1,Q2,Q3,Q4"
    example: --prop categories="Sheet1!$A$2:$A$5"
    readback: comma-separated category labels
  chartFill   color   [get]
    description: chart-level fill color readback.
    readback: #RRGGBB or color descriptor
  chartType   enum   [add/set/get]   aliases: type, col, donut, xy, spider, ohlc, wf, charttype
    values: bar, column, line, pie, doughnut, area, scatter, bubble, radar, stock, combo, waterfall, funnel, treemap, sunburst, boxWhisker, histogram, pareto
    example: --prop chartType=column
    example: --prop chartType=stackedBar
    example: --prop chartType=percentStackedColumn
    example: --prop chartType=column3d
    example: --prop chartType=waterfall
    readback: normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)
  chartareafill   string   [add/set]   aliases: chartfill
    description: chart-area background fill. Solid color, gradient, or 'none'.
    example: --prop chartareafill=FFFFFF
  chartborder   string   [add/set]   aliases: chartarea.border
    description: chart-area outer border line. Same format as plotborder.
    example: --prop chartborder=000000:1
    example: --prop chartborder=none
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
    description: conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.
    example: --prop colorrule=0:FF0000:00AA00
  colors   string   [add]
    description: comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) override positions.
    example: --prop colors="4472C4,ED7D31,A5A5A5"
  combosplit   number   [add]
    description: combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.
    example: --prop combosplit=2
  combotypes   string   [add/set]   aliases: combo.types
    description: rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.
    example: --prop combotypes="column,column,line"
  crossBetween   string   [add/set/get]   aliases: crossbetween
    description: category axis cross-between behavior (between / midCat).
    example: --prop crossBetween=between
    example: --prop crossbetween=midcat
    readback: crossBetween token
  crosses   string   [add/set/get]
    description: where the value axis crosses the category axis. Values: autoZero (default), max, min.
    example: --prop crosses=max
    readback: crosses token
  crossesAt   number   [add/set/get]   aliases: crossesat
    description: value-axis crossesAt value readback.
    example: --prop crossesat=0
    readback: numeric value
  data   string   [add]
    description: inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after creation.
    example: --prop data="Sales:10,20,30"
    example: --prop data="Sales:10,20,30;Cost:5,8,12"
    readback: n/a
  dataLabels   string   [add/set/get]   aliases: datalabels, labels
    description: show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also accepts seriesName/categoryName/percentage/values aliases). Position values (outsideEnd/center/insideEnd/insideBase/top/bottom/left/right/bestFit) implicitly enable showVal and apply as dLblPos.
    example: --prop dataLabels=value
    example: --prop dataLabels="value,percent"
    example: --prop dataLabels=outsideEnd
    example: --prop dataLabels=none
    readback: comma-separated flags: value,percent,category,series
  dataRange   string   [add]   aliases: datarange, range
    description: external workbook range source for series; Add-time only.
    example: --prop dataRange=Sheet1!A1:D5
  dataTable   bool   [add/set/get]   aliases: datatable
    description: show data table beneath the chart (with default borders + legend keys).
    example: --prop dataTable=true
    readback: true | false
  decreaseColor   color   [add]
    description: waterfall: negative bar color. Add-time only.
    example: --prop decreaseColor=FF0000
  dispBlanksAs   enum   [set/get]
    description: how empty cells render (gap leaves a hole, zero plots as 0, span connects across).
    values: gap, zero, span
    example: --prop dispBlanksAs=gap
    readback: dispBlanksAs token
  droplines   string   [add/set]
    description: drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.
    example: --prop droplines=true
    example: --prop droplines=808080:0.5
  errbars   string   [add/set]   aliases: errorbars
    description: error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' removes.
    example: --prop errbars=fixedVal:5
    example: --prop errbars=none
    example: --prop errbars=percentage:10
  explosion   number   [add/set/get]   aliases: explode
    description: pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.
    example: --prop explosion=10
    readback: as emitted by handler (per-format details vary)
  firstSliceAngle   number   [add/set/get]   aliases: sliceangle, firstsliceangle
    description: pie/doughnut first slice angle (degrees).
    example: --prop firstsliceangle=90
    readback: integer degrees
  gapdepth   number   [add/set]
    description: depth gap between series in 3D bar/line/area charts (percent).
    example: --prop gapdepth=150
  gapwidth   number   [add/set/get]   aliases: gap
    description: gap between bar/column groups, 0..500 (percent of bar width).
    example: --prop gapwidth=150
    readback: integer 0..500
  gradient   string   [add/set/get]   aliases: gradientfill
    description: gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.
    example: --prop gradient=FF0000-0000FF
    example: --prop gradient=FF0000-00FF00-0000FF:90
    readback: as emitted by handler (per-format details vary)
  gradients   string   [add/set]
    description: per-series gradient fills, semicolon-separated; one entry per series.
    example: --prop gradients="FF0000-0000FF;00FF00-FFFF00"
  gridlines   bool   [add/set/get]   aliases: majorgridlines
    description: value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none' removes.
    example: --prop gridlines=true
    example: --prop gridlines=E0E0E0:0.3
    example: --prop gridlines=none
    readback: true | false
  height   length   [add/set/get]
    description: chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop height=10cm
  hilowlines   string   [add/set]
    description: high-low lines on line/stock chart. Same format as droplines.
    example: --prop hilowlines=true
  holeSize   number   [add/set/get]   aliases: holesize
    description: doughnut hole size readback.
    example: --prop holesize=50
    example: --prop holeSize=50
    readback: integer 10..90 percent
  increaseColor   color   [add]
    description: waterfall: positive bar color. Add-time only.
    example: --prop increaseColor=00AA00
  invertifneg   bool   [add/set]   aliases: invertifnegative
    description: if true, draw negative bars in an inverted (lighter) color.
    example: --prop invertifneg=true
  labelPos   string   [add/set/get]   aliases: labelpos, labelposition
    description: data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bestFit|best|auto, top|t, bottom|b, left|l, right|r. Restrictions: not supported on doughnut/area/radar/stock; pie maps everything to bestFit; stacked series clamp to ctr/inBase/inEnd; combo charts skip entirely.
    example: --prop labelPos=outsideEnd
    readback: OOXML position token: ctr/inEnd/inBase/outEnd/bestFit/t/b/l/r
  labelfont   string   [add/set]
    description: data label text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop labelfont=9:333333:Calibri
  labeloffset   number   [add/set]
    description: category-axis label offset 0..1000 (percent of font height); category axis only.
    example: --prop labeloffset=100
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
    description: tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./valaxis.* targets value.
    example: --prop labelrotation=-45
    example: --prop xaxis.labelrotation=30
  leaderlines   bool   [add/set]   aliases: showleaderlines
    description: show/hide leader lines connecting data labels to slices (pie/doughnut).
    example: --prop leaderlines=true
  legend   enum   [add/set/get]
    description: legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and underscore variants accepted.
    values: true, false, none, top, bottom, left, right, topRight, tr
    example: --prop legend=bottom
    example: --prop legend=none
  legend.overlay   bool   [add/set/get]   aliases: legendoverlay
    description: if true, legend overlays the plot area instead of reserving space.
    example: --prop legend.overlay=true
    readback: true | false
  legendFont   string   [add/set/get]   aliases: legendfont, legend.font
    description: legend text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop legendFont=10:CCCCCC:Arial
    example: --prop legendFont=9:808080
    readback: size:color:fontname
  linedash   string   [add/set]   aliases: dash
    description: line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.
    example: --prop linedash=dash
  linewidth   number   [add/set]
    description: line width in points (applies to every series line).
    example: --prop linewidth=2
  logbase   number   [add/set]   aliases: logscale, yaxisscale
    description: value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log scale.
    example: --prop logbase=10
    example: --prop logscale=true
    example: --prop yaxisscale=linear
  majorTickMark   string   [add/set/get]   aliases: majortick, majortickmark
    description: major tick mark style (out / in / cross / none).
    example: --prop majorTickMark=out
    example: --prop majortickmark=out
    readback: tick mark token
  majorunit   number   [add/set]
    description: value-axis major gridline / tick spacing.
    example: --prop majorunit=200
    example: --prop majorunit=50
  marker   string   [add/set]   aliases: markers
    description: marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or 'symbol:size:color'. Symbols: none, auto, circle, square, diamond, triangle, x, plus, star, dash, dot, picture. Chart-level Get does not surface marker because applicability is chart-type-conditional — read per-series via /chart[N]/series[K] (chart-series schema declares marker get:true).
    example: --prop marker=circle
    example: --prop marker=square:8:FF0000
    readback: as emitted by handler (per-format details vary)
  markersize   number   [add/set]
    description: marker size 2..72 (line/scatter/radar series only).
    example: --prop markersize=8
  minorGridlines   bool   [add/set/get]   aliases: minorgridlines
    description: value-axis minor gridlines; same format as gridlines.
    example: --prop minorGridlines=true
    example: --prop minorGridlines=F0F0F0:0.25
    readback: true | false
  minorTickMark   string   [add/set/get]   aliases: minortick, minortickmark
    description: minor tick mark style (out / in / cross / none).
    example: --prop minorTickMark=none
    example: --prop minortickmark=in
    readback: tick mark token
  minorunit   number   [add/set]
    description: value-axis minor gridline / tick spacing.
    example: --prop minorunit=50
    example: --prop minorunit=10
  overlap   number   [add/set/get]
    description: bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).
    example: --prop overlap=0
    example: --prop overlap=100
    readback: as emitted by handler (per-format details vary)
  plotFill   color   [add/set/get]   aliases: plotareafill, plotfill
    description: plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.
    example: --prop plotFill=FAFAFA
    example: --prop plotareafill=FAFAFA
    example: --prop plotFill=none
    readback: #RRGGBB or color descriptor
  plotborder   string   [add/set]   aliases: plotarea.border
    description: plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.
    example: --prop plotborder=CCCCCC:0.5
    example: --prop plotborder=none
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
    description: if true, skip plotting hidden worksheet rows/columns.
    example: --prop plotvisonly=true
  preset   string   [add/set]   aliases: theme, style.preset
    description: named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).
    example: --prop preset=minimal
    example: --prop preset=corporate
    example: --prop preset=dark
  referenceline   string   [add/set]   aliases: refline, targetline
    description: horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'. Pass 'none' to remove.
    example: --prop referenceline=100:FF0000:Target
    example: --prop referenceline=none
    example: --prop refline=80:00AA00
  scatterstyle   string   [add/set]
    description: scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.
    example: --prop scatterstyle=smoothMarker
  secondaryaxis   string   [add/set]   aliases: secondary
    description: comma-separated 1-based series indices to plot on a secondary value axis.
    example: --prop secondaryaxis=2
    example: --prop secondary="2,3"
  seriesoutline   string   [add/set]   aliases: series.outline
    description: series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.
    example: --prop seriesoutline=000000:0.5
    example: --prop seriesoutline=none
  seriesshadow   string   [add/set]   aliases: series.shadow
    description: outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.
    example: --prop seriesshadow=000000-5-45-3-50
    example: --prop seriesshadow=none
  serlines   string   [add/set]   aliases: serieslines
    description: series lines on stacked bar charts (true/false).
    example: --prop serlines=true
  shape   string   [add/set]   aliases: barshape
    description: 3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.
    example: --prop shape=cylinder
  showMarker   bool   [set/get]
    description: show markers on line/scatter series at chart level.
    example: --prop showMarker=true
    readback: true | false
  shownegbubbles   bool   [add/set]
    description: render negative-valued bubbles. Bubble charts only.
    example: --prop shownegbubbles=true
  sizerepresents   string   [add/set]
    description: how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.
    example: --prop sizerepresents=area
  smooth   bool   [add/set/get]
    description: smooth lines on line/scatter charts. Reported unsupported for other chart types.
    example: --prop smooth=true
    readback: as emitted by handler (per-format details vary)
  style   number   [add/set/get]   aliases: styleid
    description: built-in chart style id 1..48; pass 'none' to clear.
    example: --prop style=2
    readback: as emitted by handler (per-format details vary)
  tickLabelPos   string   [add/set/get]   aliases: ticklabelposition, ticklabelpos
    description: tick label position (high / low / nextTo / none).
    example: --prop tickLabelPos=nextTo
    example: --prop ticklabelpos=low
    readback: tick label position token
  ticklabelskip   number   [add/set]   aliases: tickskip
    description: draw tick labels every Nth category (category axis).
    example: --prop ticklabelskip=2
  title   string   [add/set/get]
    description: chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.color, title.bold when set; these are get-only readback fields surfaced from chart title runs.
    example: --prop title="Q1"
    example: --prop title="2024 Sales"
    example: --prop title=none
    readback: chart title
  title.bold   bool   [get]
    description: title bold flag (readback only)
    readback: true | false
  title.color   color   [get]
    description: title font color (readback only, #RRGGBB)
    readback: #RRGGBB
  title.font   string   [get]
    description: title font name (readback only)
    readback: font name
  title.size   font-size   [get]
    description: title font size (readback only, e.g. 14pt)
    readback: Npt
  totalColor   color   [add]
    description: waterfall: subtotal/total bar color. Add-time only.
    example: --prop totalColor=4472C4
  transparency   number   [add/set]   aliases: opacity, alpha
    description: series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=70).
    example: --prop transparency=30
    example: --prop opacity=70
  trendline   string   [add/set/get]
    description: add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponential, log|logarithmic, poly|polynomial, power, movingAvg|moving|movingAverage. Order applies to poly/movingAvg. Pass 'none' to clear.
    example: --prop trendline=linear
    example: --prop trendline=poly:3
    example: --prop trendline=none
    example: --prop trendline=movingAvg:3
    readback: as emitted by handler (per-format details vary)
  updownbars   string   [add/set]
    description: up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.
    example: --prop updownbars=true
    example: --prop updownbars=150:00AA00:FF0000
  valaxisline   string   [add/set]   aliases: valaxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisline=333333:1
  varyColors   bool   [set/get]
    description: vary colors by data point (single-series charts).
    example: --prop varyColors=true
    readback: true | false
  view3d   string   [add/set/get]   aliases: camera, perspective
    description: 3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key form (rotX=...) is rejected.
    example: --prop view3d=15,20,30
    example: --prop view3d=20
    example: --prop perspective=30
    readback: as emitted by handler (per-format details vary)
  width   length   [add/set/get]
    description: chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop width=18cm
    example: --prop width=15cm

Note: Embedded as inline DrawingML chart (c:chart) or extended chart (cx:chart) depending on chartType. Data via inline spec or per-series props. Mirrors pptx/chart surface. Axis configuration: chart-level axis* props (axismin, axismax, axistitle, axisfont, ...) are Add-time only; for post-creation axis Set/Get use the chart-axis element.
```

## docx Element: chart-axis

```text
docx chart-axis
---------------
Parent: chart
Addressing: /chart[N]/axis[@role=ROLE]
  role values: category, value, value2, series
Operations: set get

Properties:
  axisFont   string   [get]
    description: axis text font readback.
    readback: font name string
  axisMax   number   [get]
    description: value-axis maximum readback (also surfaced via max on axis-by-role path).
    readback: numeric value
  axisMin   number   [get]
    description: value-axis minimum readback (also surfaced via min on axis-by-role path).
    readback: numeric value
  axisNumFmt   string   [get]
    description: axis number format string.
    readback: format code
  axisOrientation   string   [get]
    description: axis scaling orientation (e.g. maxMin when reversed).
    readback: orientation token
  axisTitle   string   [get]
    description: value-axis title readback (chart-level convenience; axis-by-role uses 'title').
    readback: title string
  format   string   [set/get]
    description: number format string
    example: --prop format="#,##0"
    example: --prop format="#,##0.00"
  labelOffset   number   [get]
    description: category axis label offset (% of default 100).
    readback: integer percentage
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  logBase   number   [set/get]
    description: logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop logBase=10
    readback: number (e.g. 10)
  majorGridlines   bool   [set/get]
    description: show or hide major gridlines. Applies to all roles.
    example: --prop majorGridlines=true
  max   number   [set/get]
    description: maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop max=1000
    example: --prop max=250
  min   number   [set/get]
    description: minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop min=0
  minorGridlines   bool   [set/get]
    description: show or hide minor gridlines. Applies to all roles.
    example: --prop minorGridlines=false
  tickLabelSkip   number   [get]
    description: category axis label skip interval (>1 means tick labels are sparser).
    readback: integer interval
  title   string   [set/get]
    description: axis title text. Applies to all roles (category, value). Pass 'none' to remove.
    example: --prop title="Revenue"
    example: --prop title="Quarter"
  visible   bool   [set/get]
    description: show or hide the axis. Applies to all roles.
    example: --prop visible=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Mirror of pptx/chart-axis.json surface. Add-time configuration: use the chart element's axis* props (axismin, axismax, axistitle, axisfont, ...) when creating the chart; chart-axis covers post-creation Set/Get. `labelFont`, `lineWidth`, `lineDash` are not yet supported on axis-by-role paths. `lineWidth`/`lineDash` Set on a chart-axis path currently apply to all series in the plot area; `labelFont` writes the axis title run, not tick labels. Use chart-series schema for series line styling.
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
  categories   string   [add/set/get]
    description: per-series category override; range reference only.
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
    readback: as emitted by handler (per-format details vary)
  categoriesRef   string   [get]
    description: A1 cell range backing the category labels.
    readback: A1 range string
  color   color   [add/set/get]
    description: series fill color.
    example: --prop series1.color=#4472C4
    example: --prop series1.color=4472C4
    readback: #-prefixed uppercase hex
  dataLabels.numFmt   string   [get]
    description: per-series data label number format readback.
    readback: format code
  dataLabels.separator   string   [get]
    description: per-series data label separator string readback.
    readback: separator string
  errBars   string   [get]
    description: error bar value type token (e.g. cust, fixedVal, stdDev).
    readback: OOXML errValType token
  invertIfNeg   bool   [get]
    description: invert color for negative values (per-series readback).
    readback: true | false
  lineDash   enum   [set/get]   aliases: dash
    description: series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash/sysDot/sysDashDot/lgDash). 'solid' is the only round-trip-stable value.
    values: solid, sysDash, sysDot, sysDashDot, lgDash, lgDashDot, lgDashDotDot, dash, dashDot, dot, longDash
    example: --prop lineDash=dash
    example: --prop lineDash=solid
    readback: OOXML preset dash token
  lineWidth   number   [set/get]
    description: series line width in points (e.g. 1.5).
    example: --prop lineWidth=1.5
    readback: numeric width in points
  marker   string   [set/get]
    description: per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports 'symbol:size:COLOR' compound form (e.g. 'circle:8:FF0000'). Applies to line/scatter/radar series.
    example: --prop marker=circle
    example: --prop marker="circle:8:FF0000"
    readback: marker symbol name
  markerSize   number   [set/get]
    description: marker size in points (2–72). Applies when marker is not 'none'.
    example: --prop markerSize=8
    readback: integer
  name   string   [add/set/get]   aliases: title
    description: series name shown in legend and data labels.
    example: --prop name="Q1"
    example: --prop series1.name="Q1"
    example: --prop name="Product A"
    example: --prop series1.name="Product A"
    example: --prop name="Revenue"
    example: --prop series1.name="Revenue"
    readback: series name string
  nameRef   string   [get]
    description: A1 cell reference backing the series name.
    readback: A1 cell reference
  scatterStyle   string   [get]
    description: scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
    readback: OOXML scatterStyle token
  secondaryAxis   bool   [get]
    description: true when the chart has more than one value axis (this series uses the secondary).
    readback: true | false
  smooth   bool   [set/get]
    description: smooth line interpolation for line/scatter series.
    example: --prop smooth=true
    readback: true | false
  values   string   [add/set/get]
    description: comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)
    example: --prop series1.values="120,150,180"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
    example: --prop series1.values="120,150,180,210"

Note: Mirror of pptx/chart-series. At Add time, series pass as dotted props on the parent chart (series1.name, series1.values, series1.color, series1.categories). This schema represents per-series Set/Get after creation. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type. lineWidth (line width in pt) and lineDash (solid/dash/dot/dashDot/longDash) are available on line/scatter series; `lineStyle` is not a recognized key (rejected as UNSUPPORTED — use lineWidth/lineDash instead).
```

## docx Element: comment

```text
docx comment
--------------
Parent: paragraph|run
Paths: /comments/comment[@commentId=N]  /comments/comment[N]
Operations: add set get query remove

Usage:
  officecli add <file> /body/p[N] --type comment [--prop key=val ...]
  officecli add <file> /body/p[N]/r[M] --type comment [--prop key=val ...]
  officecli set <file> /comments/comment[N] --prop key=val ...
  officecli get <file> /comments/comment[N]
  officecli query <file> comment
  officecli remove <file> /comments/comment[N]

Properties:
  id   number   [get]
    description: OOXML comment id (w:comment/@w:id). Assigned by the writer; surfaces only on Get/Query.
    readback: integer comment ID
  anchoredTo   string   [get]
    description: path of the paragraph or run the comment is anchored to (resolved from CommentRangeStart).
    readback: path of anchored paragraph/run
  date   string   [add/set/get]
    description: ISO-8601 timestamp. Defaults to DateTime.UtcNow.
    example: --prop date=2025-01-15T10:30:00Z
    example: --prop date=2025-01-15T10:00:00Z
    readback: Date attribute
  initials   string   [add/set/get]
    description: author initials. Defaults to derived from author name when omitted.
    example: --prop initials=AT
    example: --prop initials=AW
    readback: initials
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: Author attribute
  text   string   [add/set/get]
    description: comment body. Required.
    example: --prop text="Check formula"
    example: --prop text="Reword this bullet"
    example: --prop text="Review this"
    readback: concatenated text

Note: Comments live in WordprocessingCommentsPart. Anchor: CommentRangeStart/End surround the target run or paragraph; CommentReference marks the inline anchor.
```

## docx Element: endnote

```text
docx endnote
--------------
Parent: paragraph|body
Paths: /endnote[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type endnote [--prop key=val ...]
  officecli set <file> /endnote[N] --prop key=val ...
  officecli get <file> /endnote[N]
  officecli query <file> endnote
  officecli remove <file> /endnote[N]

Properties:
  text   string   [add/set/get]
    example: --prop text="End-of-doc reference"
    readback: concatenated text
  direction   enum   [add/set]   aliases: dir, bidi
    description: Reading direction. 'rtl' writes <w:bidi/> on the endnote content paragraph and cascades <w:rtl/> to the paragraph mark.
    values: rtl, ltr
    example: --prop direction=rtl
  align   enum   [add/set]   aliases: alignment
    description: Horizontal alignment applied to the endnote content paragraph (<w:jc/>).
    values: left, center, right, justify, both, distribute
    example: --prop align=right
  font.cs   string   [add/set]   aliases: font.complexscript, font.complex
    description: Complex-script font (rFonts/cs).
    example: --prop font.cs="Arabic Typesetting"
  font.ea   string   [add/set]   aliases: font.eastasia, font.eastasian
    description: East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.
    example: --prop font.ea="メイリオ"
  font.latin   string   [add/set]
    description: Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.
    example: --prop font.latin=Calibri
  bold.cs   bool   [add/set]   aliases: font.bold.cs, boldcs
    description: complex-script bold for the endnote's runs (<w:bCs/>). Required for Arabic / Hebrew bold rendering.
    example: --prop bold.cs=true
  italic.cs   bool   [add/set]   aliases: font.italic.cs, italiccs
    description: complex-script italic (<w:iCs/>) for the endnote's runs.
    example: --prop italic.cs=true
  size.cs   font-size   [add/set]   aliases: font.size.cs, sizecs
    description: complex-script font size (<w:szCs/>) for the endnote's runs.
    example: --prop size.cs=14pt
  id   number   [get]
    description: OOXML endnote id; source of @endnoteId in stable path /endnote[@endnoteId=N].
    readback: integer

Note: Endnotes live in EndnotesPart. Semantics mirror footnote.json. Parent must be a paragraph path (/body/p[N]); use --index N to control position within the paragraph. Run-level parent (/body/p[N]/r[M]) is not accepted -- the endnote reference is inserted as a new run.
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
  mode   enum   [add/get]
    values: display, inline
    example: --prop mode=inline
    readback: display | inline
  formula   string   [add/set]   aliases: text
    description: math expression. Aliases: text.
    example: --prop formula="x^2 + y^2 = z^2"
    readback: n/a (formula source surfaces in DocumentNode.Text, not Format[])

Note: Aliases: formula, math. formula input is parsed by FormulaParser (LaTeX-ish). Display mode wraps in oMathPara; inline mode appends oMath to the parent paragraph. Get returns only `mode` (display|inline) in Format[]; the formula source itself is in DocumentNode.Text.
```

## docx Element: field

```text
docx field
--------------
Parent: paragraph|body
Paths: /field[N]
Operations: add set get query remove

Usage:
  officecli add <file> / --type field [--prop key=val ...]
  officecli set <file> /field[N] --prop key=val ...
  officecli get <file> /field[N]
  officecli query <file> field
  officecli remove <file> /field[N]

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
  id   string   [add/set/get]   aliases: identifier
    description: SEQ field's identifier (sequence label). Defaults to 'name' when 'id' is not supplied. Alias: identifier.
    example: --prop id=Figure
    example: --prop identifier=Figure
    readback: n/a (embedded in instruction)
  expression   string   [add/set]   aliases: condition
    description: IF field's logical expression (e.g. 'MERGEFIELD Gender = "Male"'). Add/Set only — surfaces back inside the `instruction` readback, not as its own Format key.
    example: --prop expression='{ MERGEFIELD Gender } = "Male"'
    readback: n/a (embedded in instruction)
  trueText   string   [add/set]   aliases: truetext
    description: IF field's text shown when expression evaluates true. Add/Set only — surfaces back inside the `instruction` readback.
    example: --prop trueText="Mr."
    readback: n/a (embedded in instruction)
  falseText   string   [add/set]   aliases: falsetext
    description: IF field's text shown when expression evaluates false. Add/Set only — surfaces back inside the `instruction` readback.
    example: --prop falseText="Ms."
    readback: n/a (embedded in instruction)
  hyperlink   bool   [add/set]
    description: REF field: append \h switch so the inserted reference becomes a clickable hyperlink to the bookmark target. Add/Set only — surfaces back as a switch inside the `instruction` readback.
    example: --prop hyperlink=true
    readback: n/a (embedded in instruction)
  format   string   [add/set/get]
    description: switch-style format (e.g. '\@ "yyyy-MM-dd"' for date).
    example: --prop format="yyyy-MM-dd"
    readback: instruction switches
  instruction   string   [add/set/get]   aliases: instr, code
    description: Raw field instruction text. Bypasses fieldType-specific helpers — useful for arbitrary fields not covered by the typed shortcuts.
    example: --prop instruction=' DATE \@ "yyyy年MM月" '
    readback: instrText element text content

Note: Complex field (fldChar: begin/instr/separate/result/end). Path is document-level /field[N] — the field is addressed as a whole, not via its inner runs. /body/p[N]/r[M] returns the inner fieldChar run node (type=fieldChar), not the field. Field instruction selected by 'fieldType' or the element-type alias (pagenum, numpages, date, author, title, time, filename, section, sectionpages, mergefield, ref, if, seq, styleref, docproperty). Per-type required parameters: mergefield/ref need 'name' (aka fieldName, bookmarkName); seq needs 'identifier'; styleref needs 'styleName'; docproperty needs 'propertyName'; if needs 'expression' (+ optional 'trueText' / 'falseText'); date/time accept optional 'format'.
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
Paths: /footnote[@footnoteId=N]  /footnotes/footnote[N]
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
  align   enum   [add/set]   aliases: alignment
    description: Horizontal alignment applied to the footnote content paragraph (<w:jc/>).
    values: left, center, right, justify, both, distribute
    example: --prop align=right
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
    description: complex-script italic (<w:iCs/>) for the footnote's runs.
    example: --prop italic.cs=true
  size.cs   font-size   [add/set]   aliases: font.size.cs, sizecs
    description: complex-script font size (<w:szCs/>) for the footnote's runs.
    example: --prop size.cs=14pt
  id   number   [get]
    description: OOXML footnote id (w:footnote/@w:id). Assigned by the writer; surfaces only on Get/Query.
    readback: integer footnote ID

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
  default   string   [get]
    description: form-field default value. Text-fields surface the default string; dropdowns surface the integer default index.
    readback: default value (string or integer)
  enabled   bool   [get]
    description: true when the form field accepts user input (FFData @enabled). Defaults true when the element is absent.
    readback: true|false
  hasFormFieldData   bool   [get]
    description: true when the run carries an embedded fldData payload (legacy form-field binary blob).
    readback: true when present

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
    description: external URL. Aliases: href, link. docx Set accepts all three (url canonical).
    example: --prop url=https://example.com
    readback: URL string
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
    readback: #-prefixed uppercase hex, or scheme color name (e.g. 'hyperlink', 'followedhyperlink') when using theme default
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
  instruction   string   [set/get]   aliases: instr
    description: The Word field instruction. Leading/trailing spaces inside the value are significant — they form the OOXML separator between switches. Alias: instr.
    example: --prop 'instruction= PAGE \\* MERGEFORMAT '
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
  height   length   [add/set/get]
    example: --prop height=8cm
    example: --prop height=2in
    readback: unit-qualified length from inline style (e.g. "5cm")
  width   length   [add/set/get]
    example: --prop width=10cm
    example: --prop width=3in
    readback: unit-qualified length from inline style (e.g. "5cm")
  preview   string   [add]
    description: preview thumbnail image source. Add-time only — Set ignores this key.
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  progId   string   [add/set/get]   aliases: progid
    description: OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.
    example: --prop progId=Word.Document.12
    example: --prop progId=Excel.Sheet.12
    readback: ProgID string
  src   string   [add/set]   aliases: path
    description: embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/data.docx
    example: --prop src=/path/to/data.xlsx
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded relationship.

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
  behindText   bool   [get]
    description: true when the picture floats behind text (anchor @behindDoc=1).
    readback: true on behind-text floats
  hPosition   length   [get]
    description: absolute horizontal anchor position in cm (positionH/posOffset).
    readback: length in cm (e.g. `5.0cm`)
  hRelative   string   [get]
    description: horizontal anchor reference frame (e.g. page, margin, column, character).
    readback: OOXML positionH @relativeFrom token
  width   length   [add/set/get]
    description: width — cm length (extent.Cy/Cx in EMU formatted to cm).
    example: --prop width=5
    example: --prop width=3in
    readback: length string
  height   length   [add/set/get]
    description: height — cm length (extent.Cy/Cx in EMU formatted to cm).
    example: --prop height=5
    example: --prop height=2in
    readback: length string
  fallback   string   [add]
    description: optional PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is generated.
    example: --prop fallback=/path/to/fallback.png
    readback: n/a (SVG-only)
  id   number   [get]
    description: OOXML shape id; source of the @id in the stable path /picture[@id=ID].
    readback: integer shape id
  alt   string   [add/set/get]   aliases: altText, alttext, description
    description: alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.
    example: --prop alt="Logo"
    example: --prop alt="Company logo"
    readback: string
  contentType   string   [get]
    description: OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced by the BlipFill embed relationship.
    readback: MIME-style content-type string from the image part
  fileSize   number   [get]
    description: embedded image file size in bytes (length of the image part stream).
    readback: byte length of the embedded image part
  src   string   [add/set]   aliases: path
    description: image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/image.png
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded image relationship.

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
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right
    example: --prop align=center
    example: --prop align=right
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
  rtl   bool   [add/set]
    description: right-to-left text (legacy alias of 'direction'). Get surfaces this as direction=rtl|ltr.
    example: --prop rtl=true
  direction   enum   [add/set/get]   aliases: dir
    description: run reading direction. Use 'rtl' for Arabic / Hebrew, 'ltr' to clear. Canonical key for run direction; matches paragraph/section vocabulary.
    values: ltr, rtl
    example: --prop direction=rtl
    readback: rtl | ltr
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
  textOutline   string   [add/set/get]   aliases: textoutline
    description: w14 text outline 'WIDTHpt-COLOR' (e.g. '1pt-FF0000'). Width first, color second; '-' or ';' separator.
    example: --prop textOutline=1pt-FF0000
    readback: "{width}pt" or "{width}pt;#RRGGBB"
  textFill   string   [add/set/get]   aliases: textfill
    description: w14 text fill (color or gradient spec).
    example: --prop textFill=FF0000
    readback: #RRGGBB (solid) | C1;C2;angle (gradient) | radial:C1;C2
  w14shadow   string   [add/set/get]
    description: w14 text shadow effect.
    example: --prop w14shadow=FF0000
    readback: #RRGGBB;blur_pt;angle_deg;dist_pt;opacity
  w14glow   string   [add/set/get]
    description: w14 text glow effect.
    example: --prop w14glow=FF0000
    readback: #RRGGBB;radius_pt;opacity
  w14reflection   string   [add/set/get]
    description: w14 text reflection effect.
    example: --prop w14reflection=true
    readback: semicolon-delimited reflection parameters
  effective.size.src   string   [-]
    description: source pointer for effective.size — path of the writing layer (e.g. "/styles/Heading1", "/docDefaults"). Documented but not emitted today; only the resolved `effective.size` value surfaces on Get.
    readback: n/a (planned — only effective.size emits today)
  effective.font.ascii   string   [get]
    description: inheritance-resolved Latin/ASCII font slot (read-only).
    readback: font family name
  effective.font.ascii.src   string   [-]
    description: source pointer for effective.font.ascii. Documented but not emitted today.
    readback: n/a (planned)
  effective.font.eastAsia   string   [get]
    description: inheritance-resolved East-Asian font slot (read-only).
    readback: font family name
  effective.font.eastAsia.src   string   [-]
    description: source pointer for effective.font.eastAsia. Documented but not emitted today.
    readback: n/a (planned)
  effective.font.hAnsi   string   [get]
    description: inheritance-resolved High-ANSI font slot (read-only).
    readback: font family name
  effective.font.hAnsi.src   string   [-]
    description: source pointer for effective.font.hAnsi. Documented but not emitted today.
    readback: n/a (planned)
  effective.font.cs   string   [get]
    description: inheritance-resolved complex-script font slot (read-only).
    readback: font family name
  effective.font.cs.src   string   [-]
    description: source pointer for effective.font.cs. Documented but not emitted today.
    readback: n/a (planned)
  effective.bold.src   string   [-]
    description: source pointer for effective.bold. Documented but not emitted today.
    readback: n/a (planned)
  effective.italic   bool   [get]
    description: inheritance-resolved italic (read-only). Surfaced only when the run does not set 'italic' directly.
    readback: true | false
  effective.italic.src   string   [-]
    description: source pointer for effective.italic. Documented but not emitted today.
    readback: n/a (planned)
  effective.color.src   string   [-]
    description: source pointer for effective.color. Documented but not emitted today.
    readback: n/a (planned)
  effective.underline   string   [get]
    description: inheritance-resolved underline style (read-only).
    readback: underline style name
  effective.underline.src   string   [-]
    description: source pointer for effective.underline. Documented but not emitted today.
    readback: n/a (planned)
  effective.rtl   bool   [get]
    description: inheritance-resolved right-to-left flag (read-only). Emitted even when 'rtl' is set directly so callers can compare direct vs cascade-resolved state.
    readback: true | false
  effective.rtl.src   string   [get]
    description: source pointer for effective.rtl.
    readback: style/docDefaults path
  dirty   bool   [get]
    description: true when the run is flagged as dirty (rPr/dirty=1) — Word treats it as needing reflow on next open.
    readback: true|false
  font.ascii   string   [get]
    description: individual rFonts @ascii slot readback. On Add/Set use the unified `font.latin` key (which writes both ascii + hAnsi).
    readback: font family name
  font.eastAsia   string   [get]
    description: individual rFonts @eastAsia slot readback. On Add/Set use the `font.ea` key.
    readback: font family name
  font.hAnsi   string   [get]
    description: individual rFonts @hAnsi slot readback. On Add/Set use the unified `font.latin` key (which writes both ascii + hAnsi).
    readback: font family name
  subscript   bool   [add/set/get]
    description: vertical alignment = subscript. Mutually exclusive with superscript.
    example: --prop subscript=true
    readback: true | false
  superscript   bool   [add/set/get]
    description: vertical alignment = superscript. Mutually exclusive with subscript.
    example: --prop superscript=true
    readback: true | false
  effective.bold   bool   [get]
    description: resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on the run.
    readback: true/false
  effective.color   color   [get]
    description: resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set directly on the run.
    readback: #-prefixed uppercase hex (scheme colors pass through)
  effective.size   font-size   [get]
    description: inheritance-resolved font size (read-only). Surfaced when the run does not set 'size' directly; resolved through run style → paragraph style → docDefaults.
    readback: unit-qualified, e.g. "14pt"
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style. Common values: single, double, dotted, dash, wave, none.
    values: single, double, dotted, dash, wave, none, thick, dottedHeavy, dashLong, dashLongHeavy, dashDotHeavy, wavyHeavy, wavyDouble
    example: --prop underline=single
    example: --prop underline=double
    readback: underline style name
  bold   bool   [add/set/get]   aliases: font.bold
    example: --prop bold=true
    readback: true | false
  color   color   [add/set/get]   aliases: font.color
    example: --prop color=#FF0000
    example: --prop color=FF0000
    example: --prop color=red
    readback: #RRGGBB uppercase
  font   string   [add/set]   aliases: fontname, fontFamily, font.name
    description: bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readback to per-script canonical keys (font.latin / font.ea / font.cs) so a get→set round-trip preserves divergent slot values.
    example: --prop font=Calibri
    example: --prop font="Arial"
    example: --prop font="Times New Roman"
    readback: see font.latin / font.ea / font.cs
  italic   bool   [add/set/get]   aliases: font.italic
    example: --prop italic=true
    readback: true | false
  size   font-size   [add/set/get]   aliases: fontsize, fontSize, font.size
    example: --prop size=11
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified, e.g. "14pt"
  text   string   [add/set/get]
    example: --prop text="bold word"
    example: --prop text="word"
    example: --prop text="run content"
    readback: plain text of run

Note: effective.* keys (effective.size, effective.bold, effective.color, ...) are read-only inheritance-resolved values: the run does not set the property directly, but resolves it by walking the run/paragraph style chain up to docDefaults. Each carries a paired effective.X.src pointer (e.g. "/styles/Heading1" or "/docDefaults") so callers can locate the writing layer. effective.* never appears when the run has the corresponding direct value — direct always wins.
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
  id   number   [get]
    description: OOXML SdtId value; source of @sdtId in stable path /sdt[@sdtId=N].
    readback: integer
  editable   bool   [get]
    description: false when SdtContentLockingValues.SdtContentLocked is set on this content control.
    readback: true | false

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
  pageNumbers   bool   [add/set/get]   aliases: pagenumbers
    description: include page numbers in TOC entries (Add/Set use lowercase alias 'pagenumbers').
    example: --prop pageNumbers=false
    readback: true if TOC includes page numbers

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
  type   enum   [add/set/get]   aliases: nextPage, evenPage, oddPage, nextColumn
    description: section break type. Only applies to mid-document sections at /section[N]; the body-level path / refers to the final section which has no break type, and Set rejects 'type'/'break' there with an actionable error pointing at /section[N].
    values: nextPage, continuous, evenPage, oddPage, nextColumn
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
  titlePage   bool   [add/set/get]   aliases: titlepage, titlepg
    description: enable distinct first-page header/footer for the section (writes <w:titlePg/>).
    example: --prop titlePage=true
    readback: true when <w:titlePg/> is present
  pageNumFmt   enum   [add/set/get]   aliases: pagenumfmt, pagenumberformat, pagenumberfmt
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
  rtlGutter   bool   [add/set/get]   aliases: rtlgutter
    description: places the binding gutter on the right side (writes <w:rtlGutter/> on sectPr). Used together with direction=rtl for Arabic/Hebrew layouts.
    example: --prop rtlGutter=true
    readback: true (only emitted when sectPr/<w:rtlGutter/> is present)
  pageStart   int   [add/set/get]   aliases: pagestart, pagenumberstart, pagenumstart
    description: starting page number for the section (writes w:pgNumType/@w:start). Use 'none'/'off' to clear.
    example: --prop pageStart=1
    example: --prop pageStart=none
    readback: integer start value
  lineNumbers   enum   [add/set/get]   aliases: restartPage, restartSection
    values: continuous, restartPage, restartSection
    example: --prop lineNumbers=continuous
    readback: one of values
  lineNumberCountBy   int   [add/set/get]   aliases: linenumbercountby
    description: line numbering interval (every Nth line gets a number). Companion to lineNumbers; only emitted when > 1.
    example: --prop lineNumbers=continuous --prop lineNumberCountBy=5
    readback: integer
  headerRef   string   [get]
    description: path to primary (default) header part. Convenience shortcut equal to headerRef.default when present.
    readback: OOXML part path
  headerRef.default   string   [get]
    description: path to default-type header part.
    readback: OOXML part path
  headerRef.first   string   [get]
    description: path to first-page-only header part.
    readback: OOXML part path
  headerRef.even   string   [get]
    description: path to even-page header part.
    readback: OOXML part path
  footerRef   string   [get]
    description: path to primary (default) footer part. Convenience shortcut equal to footerRef.default when present.
    readback: OOXML part path
  footerRef.default   string   [get]
    description: path to default-type footer part.
    readback: OOXML part path
  footerRef.first   string   [get]
    description: path to first-page-only footer part.
    readback: OOXML part path
  footerRef.even   string   [get]
    description: path to even-page footer part.
    readback: OOXML part path
  colSpaces   string   [get]
    description: per-column space overrides — comma-separated EMU/twips values, one per column. Surfaces when columns carry individual @space attrs.
    readback: comma-separated integer twips
  columns.equalWidth   bool   [get]
    description: sectPr cols @equalWidth flag — true when all columns share the same width.
    readback: true|false
  columns.separator   bool   [get]
    description: sectPr cols @sep flag — vertical separator line drawn between columns.
    readback: true when set

Note: Sections are section-break paragraphs carrying SectionProperties. Canonical length readback is cm (via FormatTwipsToCm). Lenient length input (twips int, or 2cm/0.5in/24pt via ParseTwips).
```

## docx Element: style

```text
docx style
--------------
Parent: styles
Paths: /styles/StyleId
Operations: add set get query remove

Usage:
  officecli add <file> /styles --type style [--prop key=val ...]
  officecli set <file> /styles/StyleId --prop key=val ...
  officecli get <file> /styles/StyleId
  officecli query <file> style
  officecli remove <file> /styles/StyleId

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
    description: parent style id to inherit from. Must be an existing w:styleId (not display name). Inherited properties are overridden by properties defined on this style.
    example: --prop basedOn=Normal
    readback: BasedOn.Val
  basedOn.path   string   [get]
    description: resolved path to the parent style node (get-only). Shortcut: use basedOn to Set.
    readback: /styles/{styleId}
  next   string   [add/set/get]
    description: next-paragraph style id.
    example: --prop next=Normal
    readback: NextParagraphStyle.Val
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right, justify, both, distribute
    example: --prop align=center
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
  size   font-size   [add/set/get]
    description: font size. Accepts bare number or pt-suffixed.
    example: --prop size=14
    readback: unit-qualified pt
  bold   bool   [add/set/get]
    example: --prop bold=true
    readback: true/false
  italic   bool   [add/set/get]
    example: --prop italic=true
    readback: true/false
  color   color   [add/set/get]
    description: font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).
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
  snapToGrid   bool   [add/set]   aliases: snaptogrid
    description: snap to document grid for CJK layout. Applied to the style's pPr. Add/Set only — Get does not surface this back today.
    example: --prop snapToGrid=false
    readback: n/a
  wordWrap   bool   [add/set]   aliases: wordwrap
    description: allow word-break for non-CJK text inside CJK lines. Applied to the style's pPr. Add/Set only — Get does not surface this back today.
    example: --prop wordWrap=true
    readback: n/a
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
  topLinePunct   bool   [add/set]   aliases: toplinepunct
    description: compress punctuation at the start of a line (CJK). Applied to the style's pPr. Add/Set only — Get does not surface this back today.
    example: --prop topLinePunct=true
    readback: n/a
  suppressAutoHyphens   bool   [add/set]   aliases: suppressautohyphens
    description: disable automatic hyphenation in this style. Add/Set only — Get does not surface this back today.
    example: --prop suppressAutoHyphens=true
    readback: n/a
  suppressLineNumbers   bool   [add/set]   aliases: suppresslinenumbers
    description: exclude this paragraph style from line numbering. Add/Set only — Get does not surface this back today.
    example: --prop suppressLineNumbers=true
    readback: n/a
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
  pbdr   string   [set]   aliases: border
    description: paragraph border. Sub-keys: pbdr.top / pbdr.bottom / pbdr.left / pbdr.right / pbdr.between / pbdr.bar / pbdr.all. Value form: 'style:size:color' (e.g. 'single:6:#FF0000'). Set-only — Get does not surface paragraph borders on the style today.
    example: --prop pbdr.bottom=single:6:#FF0000
    example: --prop pbdr.all=single:4:auto
    readback: n/a
  numId   int   [add/set/get]   aliases: numid
    description: numbering instance ID this style references. Paragraphs using --prop style=<id> inherit numbering through ResolveNumPrFromStyle without their own numPr — the canonical multi-level outline pattern (Heading1..9). Requires the numId to already exist in /numbering.
    example: --prop numId=3
    readback: integer numId on style/pPr/numPr
  ilvl   int   [add/set/get]   aliases: numLevel, numlevel
    description: list level (0-8) for the style-borne numPr.
    example: --prop ilvl=0
    readback: integer 0-8
  effective.alignment   string   [get]
    description: resolved paragraph alignment after walking basedOn → linked → docDefaults.
    readback: alignment token (left|center|right|both|distribute)
  effective.alignment.src   string   [get]
    description: source pointer for effective.alignment (style id chain).
    readback: style id or `docDefaults`
  effective.direction   string   [get]
    description: resolved paragraph reading direction (rtl|ltr).
    readback: `rtl` | `ltr`
  effective.direction.src   string   [get]
    description: source pointer for effective.direction.
    readback: style id or `docDefaults`
  effective.highlight   string   [get]
    description: resolved highlight color name (yellow|green|cyan|...) inherited from the style chain.
    readback: highlight token
  effective.lineSpacing   string   [get]
    description: resolved line spacing (`<N>x` or `<N>pt`).
    readback: unit-qualified spacing
  effective.lineSpacing.src   string   [get]
    description: source pointer for effective.lineSpacing.
    readback: style id or `docDefaults`
  effective.spaceBefore   string   [get]
    description: resolved space-before (unit-qualified).
    readback: unit-qualified length
  effective.spaceBefore.src   string   [get]
    description: source pointer for effective.spaceBefore.
    readback: style id or `docDefaults`
  effective.spaceAfter   string   [get]
    description: resolved space-after (unit-qualified).
    readback: unit-qualified length
  effective.spaceAfter.src   string   [get]
    description: source pointer for effective.spaceAfter.
    readback: style id or `docDefaults`
  effective.strike   bool   [get]
    description: true when strike-through is inherited from the style chain.
    readback: true|false

Note: Style type defaults to paragraph. 'id' must be unique in styles.xml; duplicate id rejected if explicit, else auto-suffixed. Built-in ids (Normal, Heading1..9, Title, Subtitle, Quote, IntenseQuote, ListParagraph, NoSpacing, TOCHeading) bypass the customStyle=true flag. Path forms /style[@name=NAME] and /style[N] are NOT supported — only /styles/StyleId resolves; navigation does not handle a bare 'style' top-level segment.
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

Properties:
  count   number   [get]
    description: total number of style definitions in styles.xml.
    readback: integer style count

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
  colWidths   string   [add/get]   aliases: colwidths
    description: comma-separated per-column widths in twips. Aliases: colwidths.
    example: --prop colWidths=3000,2000,5000
    readback: comma-separated column widths in OOXML units
  direction   enum   [add/set/get]   aliases: dir, bidi
    description: Reading direction (Arabic / Hebrew). 'rtl' writes <w:bidiVisual/> on tblPr (mirrors column order); 'ltr' clears it. Distinct from per-cell textDirection.
    values: rtl, ltr
    example: --prop direction=rtl
    readback: rtl when set, key absent otherwise
  align   enum   [add/set/get]   aliases: alignment
    values: left, center, right
    example: --prop align=center
    readback: one of values
  indent   int   [add/set/get]
    description: table indent in twips.
    example: --prop indent=200
    readback: twips
  cellSpacing   int   [add/set/get]   aliases: cellspacing
    description: space between cells in twips. Alias: cellspacing.
    example: --prop cellSpacing=40
    readback: twips
  layout   enum   [add/set/get]
    values: fixed, autofit
    example: --prop layout=fixed
    readback: one of values
  padding   int   [add/set]
    description: default cell padding (all four sides) in twips. Add/Set only — Get does not surface the table-default cell margin today.
    example: --prop padding=100
    readback: n/a
  border.all   string   [add/set]   aliases: border
    description: shorthand: applies the border to every edge of every cell. PPT OOXML has no table-level border element — this fans out to per-cell a:lnL/lnR/lnT/lnB. Format: 'WIDTH[ DASH][ COLOR]' space-separated (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' semicolon form (style is ignored — kept for docx parity). DASH ∈ solid|dot|dash|lgDash|dashDot|sysDot|sysDash. Use 'none' to clear. Alias: border. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.all="single;1pt;FF0000"
    example: --prop border.all="1pt solid FF0000"
    example: --prop border="single;1pt;000000"
    example: --prop border.all=none
  border.bottom   string   [add/set]
    description: outer bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR'. Add/Set only — read per-cell.
    example: --prop border.bottom="single;2pt;000000"
    example: --prop border.bottom="2pt solid 000000"
    example: --prop border.bottom="double;6;0000FF"
  border.horizontal   string   [add/set]   aliases: border.insideh, border.insideH
    description: inside-horizontal dividers (between rows). Fans out to bottom of rows 1..N-1 plus top of rows 2..N. PPT has no native inside-border element. Alias: border.insideH. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.horizontal="single;1pt;CCCCCC"
    example: --prop border.horizontal="1pt solid CCCCCC"
  border.left   string   [add/set]
    description: outer left edge: applies to the left of column-1 cells in every row only. Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.left="single;1pt;808080"
    example: --prop border.left="1pt solid 808080"
  border.right   string   [add/set]
    description: outer right edge: applies to the right of last-column cells in every row only. Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.right="single;1pt;808080"
    example: --prop border.right="1pt solid 808080"
  border.top   string   [add/set]
    description: outer top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units). Add/Set only — table-level border readback is not surfaced today; inspect per-cell border.top instead.
    example: --prop border.top="single;2pt;000000"
    example: --prop border.top="2pt solid 000000"
  border.vertical   string   [add/set]   aliases: border.insidev, border.insideV
    description: inside-vertical dividers (between columns). Fans out to right of cols 1..M-1 plus left of cols 2..M. Alias: border.insideV. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.vertical="single;1pt;CCCCCC"
    example: --prop border.vertical="1pt solid CCCCCC"
  cols   int   [add/get]
    description: number of columns (ignored if 'data' is supplied).
    example: --prop cols=3
    readback: integer column count from first row
  data   string   [add]
    description: inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.
    example: --prop data="A,B;1,2"
    readback: n/a (seeds cells at Add time)
  rows   int   [add/get]
    description: number of rows (ignored if 'data' is supplied).
    example: --prop rows=3
    readback: integer row count
  width   string   [add/set/get]
    description: table width in twips (Dxa) or percent ('50%' → Pct).
    example: --prop width=10cm
    example: --prop width=9000
    readback: Dxa twips or pct50ths
  style   string   [add/set/get]   aliases: tableStyle, tableStyleId
    description: table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, none, or a direct {GUID}.
    values: medium1, medium2, medium3, medium4, light1, light2, light3, dark1, dark2, none
    example: --prop style=medium2
    example: --prop style=light1
    example: --prop style=dark1
    readback: style name when resolvable, else GUID

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
  height.exact   length   [add/set]
    description: row height in twips (Exact rule, cannot grow). Add/Set only — Get does not surface a separate exact-height key; inspect `height.rule=exact` paired with `height` instead.
    example: --prop height.exact=500
    readback: n/a (inspect height + height.rule)
  header   bool   [add/set/get]
    description: repeat row as table header on every page.
    example: --prop header=true
    readback: true when header, key absent otherwise
  height.rule   string   [get]
    description: row height rule readback — `exact` when the row enforces a fixed height, otherwise absent (auto/atLeast).
    readback: `exact` when set
  cols   int   [add]
    description: override column count for the new row (defaults to table grid column count).
    example: --prop cols=4
    example: --prop cols=3
    readback: n/a (structural — cell count surfaces via DocumentNode.Children, not Format)
  height   length   [add/set/get]
    description: row height in EMU-parseable length. Defaults to first-row height or ~1cm.
    example: --prop height=1cm
    example: --prop height=500
    readback: length in cm (e.g. "2cm")

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
  align   enum   [set/get]   aliases: alignment
    description: horizontal paragraph alignment applied to every paragraph in the cell (set-only; apply after add).
    values: left, center, right, justify, both, distribute
    example: --prop align=center
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
    description: Reading direction (Arabic / Hebrew). 'rtl' writes <w:bidi/> on every cell paragraph, <w:rtl/> on each paragraph mark, and <w:rtl/> on every run; 'ltr' clears all three. Distinct from textDirection (which controls vertical/horizontal text flow inside the cell).
    values: rtl, ltr
    example: --prop direction=rtl
    readback: rtl when set, key absent otherwise
  nowrap   bool   [set/get]
    description: disable text wrapping inside the cell (set-only; apply after add).
    example: --prop nowrap=true
    readback: true | (absent)
  padding.top   number   [set/get]
    description: top cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.
    example: --prop padding.top=100
    readback: twips integer
  padding.bottom   number   [set/get]
    description: bottom cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.
    example: --prop padding.bottom=100
    readback: twips integer
  padding.left   number   [set/get]
    description: left cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.
    example: --prop padding.left=100
    readback: twips integer
  padding.right   number   [set/get]
    description: right cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.
    example: --prop padding.right=100
    readback: twips integer
  border.all   string   [add/set]   aliases: border
    description: all four cell edges. Format: 'WIDTH[ DASH][ COLOR]' (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' (style ignored — kept for docx parity). DASH ∈ solid|dot|dash|lgDash|dashDot|sysDot|sysDash. Use 'none' to clear. Alias: border. Stored as a:lnL/lnR/lnT/lnB on a:tcPr. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.all="single;1pt;FF0000"
    example: --prop border.all="1pt solid FF0000"
    example: --prop border=none
  border.bottom   string   [set]
    description: bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.bottom="single;1pt;808080"
    example: --prop border.bottom="1pt solid 808080"
    example: --prop border.bottom="double;6;0000FF"
  border.left   string   [set]
    description: left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.left="single;1pt;808080"
    example: --prop border.left="1pt solid 808080"
  border.right   string   [set]
    description: right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.right="single;1pt;808080"
    example: --prop border.right="1pt solid 808080"
  border.tl2br   string   [add/set]
    description: diagonal from top-left to bottom-right (a:lnTlToBr). Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient. Add/Set only — Get does not surface diagonal borders today.
    example: --prop border.tl2br="single;1pt;FF0000"
    example: --prop border.tl2br="1pt solid FF0000"
  border.top   string   [set]
    description: top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.top="single;2pt;000000"
    example: --prop border.top="2pt solid 000000"
  border.tr2bl   string   [add/set]
    description: diagonal from top-right to bottom-left (a:lnBlToTr). Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient. Add/Set only — Get does not surface diagonal borders today.
    example: --prop border.tr2bl="single;1pt;FF0000"
    example: --prop border.tr2bl="1pt solid FF0000"
  fill   color   [add/set/get]   aliases: background, shd, shading
    description: cell background fill. Accepts a solid color (hex, named, rgb(...)), 'none' for explicit no-fill, or a gradient string 'COLOR1-COLOR2[-ANGLE]' (e.g. 'FF0000-0000FF-90'). Stored as a:solidFill / a:gradFill / a:noFill on a:tcPr.
    example: --prop fill=FFFF00
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop background=accent1
    example: --prop fill=none
    example: --prop fill="FF0000-0000FF-90"
    example: --prop fill="gradient;FF0000;0000FF;90"
    readback: #RRGGBB uppercase, 'gradient' (with separate 'gradient' key), or 'image' for picture fill
  text   string   [add/set/get]
    description: single-run text content placed in a fresh paragraph.
    example: --prop text="Hello"
    readback: concatenated run text

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
    description: opacity 0..1 float as string (e.g. 0.5). Verbatim VML attribute injection.
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
  aboveaverage
  autofilter
  cell
    comment
    hyperlink
    run
  cellis
  cfextended
  chart
    chart-axis
    chart-series
  colbreak
  colorscale
  column
  conditionalformatting
  containstext
  databar
  dateoccurring
  duplicatevalues
  formulacf
  iconset
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
  topn
  uniquevalues
  validation
  workbook

Run 'officecli help xlsx <element>' for detail.
```

## xlsx Element: aboveaverage

```text
xlsx aboveaverage
-----------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type aboveaverage [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  aboveAverage   bool   [add/get]   aliases: above, aboveaverage
    description: highlight above-average values (default true). Set false for below-average.
    example: --prop aboveAverage=true
    example: --prop aboveAverage=false
    readback: true | false
  stdDev   number   [add]
    description: standard-deviation count (1, 2, ...) above/below the mean.
    example: --prop stdDev=1
  equalAverage   bool   [add]
    description: include cells equal to the mean.
    example: --prop equalAverage=true
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFFF00
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Above/below-average rule. Add via `add /Sheet1/cf --type aboveaverage --prop sqref=A1:A100 --prop above=true`. Lookup: Add.Cf.cs:606 (AddCfExtended `aboveaverage` case); Get: Query.cs:555.
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
  criteria0   string   [add]
    description: column 0 filter criterion. Use dotted key: --prop criteria0.OP=VAL. OP ∈ equals/notEquals/contains/doesNotContain/beginsWith/endsWith/gt/gte/lt/lte/between/notBetween/top/topPercent/bottom/bottomPercent/blanks/nonBlanks/values/dynamic. Use criteria1, criteria2, … for additional columns. Add-time only — Set on /sheet/autofilter currently accepts only `range`, and Get does not surface stored criteria back today.
    example: --prop criteria0.equals=Red
    example: --prop criteria2.gt=100
    readback: criterion spec

Note: A sheet has at most one AutoFilter. Per-column criteria via 'criteriaN.OP=VAL' props where N is the 0-based column offset from the filter range and OP ∈ {equals, notEquals, contains, doesNotContain, beginsWith, endsWith, gt, gte, lt, lte, between, notBetween, top, topPercent, bottom, bottomPercent, blanks, nonBlanks, values, dynamic}. Canonical key matches sheet.autoFilter alias.
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
    description: bold font weight on the cell.
    example: --prop bold=true
    readback: true | false
  font.italic   bool   [add/set/get]   aliases: italic
    description: italic style on the cell.
    example: --prop italic=true
    readback: true | false
  font.name   string   [add/set/get]   aliases: font, fontname
    description: font family name. Aliases: font, fontname.
    example: --prop font="Calibri"
    readback: font family name string
  font.size   font-size   [add/set/get]   aliases: size, fontsize
    example: --prop size=11pt
    readback: unit-qualified, e.g. "11pt"
  font.color   color   [add/set/get]
    description: font color on the cell. Note: the bare 'color' alias is intentionally rejected on cells due to ambiguity with 'fill' (background) — use 'font.color' explicitly.
    example: --prop font.color=FF0000
    readback: #RRGGBB uppercase
  fill   color   [add/set/get]   aliases: bgcolor
    description: cell background fill. Solid color (hex / named / rgb(...)) or a linear gradient as 'COLOR1-COLOR2[-ANGLE]' / 'gradient;COLOR1;COLOR2[;ANGLE]'. Scheme color names (accent1..) and 'none' are not accepted on input — readback may surface them when a cell already carries them.
    example: --prop fill=FFFF00
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop fill="FF0000-0000FF-90"
    example: --prop fill="gradient;FF0000;0000FF;90"
    readback: #RRGGBB uppercase, 'gradient;#START;#END;ANGLE' for gradients, scheme color name (e.g. accent1) when set externally
  strike   bool   [add/set/get]   aliases: strikethrough, font.strike
    description: single strikethrough on the cell text.
    example: --prop strike=true
    readback: true | false
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style on the cell text.
    values: single, double, singleAccounting, doubleAccounting, none
    example: --prop underline=single
    readback: underline style name
  locked   bool   [add/set]
    description: cell protection: lock the cell against edits when the sheet is protected. Default Excel behavior is locked=true. Add/Set only — readback is exposed under 'protection.locked'.
    example: --prop locked=false
    readback: n/a (use protection.locked on Get)
  protection.locked   bool   [get]
    description: cell protection lock state. Get-only readback (dotted form). For Add/Set use the flat `locked` key.
    readback: true | false
  protection.hidden   bool   [get]
    description: hide formula in protected sheet. Get-only readback.
    readback: true | false
  numFmtId   number   [get]
    description: raw OOXML number format id (supplementary; prefer `numberformat`). Emitted only when numFmtId > 0.
    readback: integer
  phonetic   string   [get]
    description: phonetic guide text from SST PhoneticRun. Emitted only when present.
    readback: phonetic string
  quotePrefix   bool   [get]
    description: leading apostrophe quote-prefix flag. Emitted only when set.
    readback: true | false
  alignment.horizontal   enum   [add/set/get]   aliases: halign
    description: horizontal text alignment. Alias: halign.
    values: left, center, right, justify, fill, distributed
    example: --prop alignment.horizontal=center
    readback: one of values
  alignment.vertical   enum   [add/set/get]   aliases: valign
    description: vertical text alignment. Alias: valign.
    values: top, center, bottom
    example: --prop alignment.vertical=center
    readback: one of values
  alignment.wrapText   bool   [add/set/get]   aliases: wrap, wrapText
    description: wrap text within the cell. Aliases: wrap, wrapText.
    example: --prop alignment.wrapText=true
    readback: true | false
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
    description: force a cell type. Normally inferred from value/formula. Add/Set accept the listed values only; SST-backed shared strings and inline strings are not creatable via Add (use plain string instead). Get may still surface 'SharedString' or 'InlineString' when reading cells written by Excel or other tools.
    values: string, number, boolean, date, error, richtext
    example: --prop value=01234 --prop type=string
    readback: PascalCase type name (e.g. "String", "Number", "Boolean", "Error", "SharedString", "InlineString", "Date")
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
  cachedValue   string   [get]
    description: cached display value computed by the formula evaluator. Surfaces only on Get/Query for formula cells; absent on plain-value cells.
    readback: cached display value for formula cells; absent on plain-value cells
  alignment.indent   number   [get]
    description: cell alignment indent units (CT_CellAlignment @indent). Use the flat `indent` key on Add/Set.
    readback: integer indent units
  alignment.shrinkToFit   bool   [get]
    description: cell alignment shrinkToFit flag.
    readback: true|false
  alignment.textRotation   number   [get]
    description: cell alignment text rotation in degrees (CT_CellAlignment @textRotation).
    readback: integer degrees
  font.subscript   bool   [get]
    description: font vertical-alignment subscript flag (legacy alias of cell-level `subscript`).
    readback: true|false
  font.superscript   bool   [get]
    description: font vertical-alignment superscript flag (legacy alias of cell-level `superscript`).
    readback: true|false
  border.diagonal   string   [get]
    description: diagonal border line style (CT_Border/diagonal @style — thin, medium, thick, dashed, etc.).
    readback: line-style token
  border.diagonal.color   color   [get]
    description: diagonal border color.
    readback: #RRGGBB uppercase
  border.diagonalDown   bool   [get]
    description: true when the cell shows a top-left → bottom-right diagonal border.
    readback: true|false
  border.diagonalUp   bool   [get]
    description: true when the cell shows a bottom-left → top-right diagonal border.
    readback: true|false
  arrayref   string   [get]
    description: array-formula spill range (CellFormula @ref). Surfaces on the master cell of an array formula.
    readback: A1 range string
  mergeAnchor   bool   [get]
    description: true when this cell is the top-left anchor of a merged range. Empty merged-region cells receive mergeAnchor=false; the anchor receives true.
    readback: true|false
  empty   bool   [get]
    description: true when the cell has neither display text nor a formula. Useful for distinguishing styled-but-empty cells from data cells.
    readback: true|false
  richtext   bool   [get]
    description: true when the cell stores rich-text runs (multi-format text). Surfaces alongside `runs` in Get output.
    readback: true|false
  subscript   bool   [get]
    description: cell-level run subscript flag (when cell is rich text with a single run).
    readback: true|false
  superscript   bool   [get]
    description: cell-level run superscript flag (when cell is rich text with a single run).
    readback: true|false

Note: Canonical keys per CLAUDE.md: numberformat (not `format`), alignment.horizontal / alignment.vertical / alignment.wrapText. Font properties surface in Get as font.bold / font.italic / font.name / font.size / font.color (readback namespace). Add/Set accept both the short forms (bold, italic, font, size) and the font.* forms. Note: the bare 'color' alias is intentionally rejected on cells due to ambiguity with 'fill' (cell background) — use 'font.color' explicitly. Parent path controls placement: `add <file> /Sheet1 --type cell` appends to the next empty cell; use `add <file> /Sheet1/A2 --type cell` to target a specific cell.
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
  ref   string   [add/set/get]
    description: target cell address (e.g. B2).
    example: --prop ref=B2
    readback: cell reference
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: Author attribute
  text   string   [add/set/get]
    description: comment body. Required.
    example: --prop text="Check formula"
    example: --prop text="Reword this bullet"
    example: --prop text="Review this"
    readback: concatenated text

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
  url   string   [get]
    description: external URL readback (read-only at this element). For cell-level Set use cell `link=URL`.
    readback: URL string
  ref   string   [get]
    description: target cell range. Readback only (from <hyperlink ref=.../>).
    readback: cell reference
  location   string   [get]
    description: internal sheet/cell target (Sheet1!A1). Readback only here; create via cell `link=` property.
    readback: internal target
  display   string   [get]
    description: display text. Readback only here; set via cell `display=` property.
    readback: display string
  tooltip   string   [get]
    description: hover tooltip. Readback only here; set via cell `tooltip=` property.
    example: --prop tooltip="Next section"
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
  subscript   bool   [add/set/get]
    description: vertical alignment = subscript. Mutually exclusive with superscript.
    example: --prop subscript=true
    readback: true | false
  superscript   bool   [add/set/get]
    description: vertical alignment = superscript. Mutually exclusive with subscript.
    example: --prop superscript=true
    readback: true | false
  bold   bool   [add/set/get]   aliases: font.bold
    example: --prop bold=true
    readback: true | false
  color   color   [add/set/get]   aliases: font.color
    example: --prop color=#FF0000
    example: --prop color=FF0000
    example: --prop color=red
    readback: #RRGGBB uppercase
  font   string   [add/set]   aliases: fontname, fontFamily, font.name
    description: bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readback to per-script canonical keys (font.latin / font.ea / font.cs) so a get→set round-trip preserves divergent slot values.
    example: --prop font=Calibri
    example: --prop font="Arial"
    example: --prop font="Times New Roman"
    readback: see font.latin / font.ea / font.cs
  italic   bool   [add/set/get]   aliases: font.italic
    example: --prop italic=true
    readback: true | false
  size   font-size   [add/set/get]   aliases: fontsize, fontSize, font.size
    example: --prop size=11
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified, e.g. "14pt"
  text   string   [add/set/get]
    example: --prop text="bold word"
    example: --prop text="word"
    example: --prop text="run content"
    readback: plain text of run

Note: Rich-text run inside an inline-string cell. Adds an rPh/r element with font properties on the run.
```

## xlsx Element: cellis

```text
xlsx cellis
--------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type cellis [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A10
  operator   enum   [add/get]
    description: comparison operator. Aliases: gt/lt/gte/lte/eq/ne/=, etc.
    values: greaterThan, lessThan, greaterThanOrEqual, lessThanOrEqual, equal, notEqual, between, notBetween
    example: --prop operator=greaterThan
    example: --prop operator=between
    readback: OOXML operator token
  value   string   [add/get]   aliases: formula, value1
    description: primary comparison value (literal or formula). Required.
    example: --prop value=50
    example: --prop value="=AVERAGE(A:A)"
    readback: formula text as stored
  value2   string   [add/get]   aliases: formula2, maxvalue
    description: secondary value, only used by between/notBetween.
    example: --prop value2=100
    readback: formula text as stored
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFFF00
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Compare cell value against literal/formula. Add via `add /Sheet1/cf --type cellis --prop sqref=A1:A10 --prop operator=greaterThan --prop value=50 --prop fill=FFFF00`. Lookup: Add.Cf.cs:453 (AddCellIs); Get: Query.cs:585.
```

## xlsx Element: cfextended

```text
xlsx cfextended
---------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type cfextended [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  type   enum   [add]
    description: subtype selector. Required.
    values: belowAverage, containsBlanks, notContainsBlanks, containsErrors, notContainsErrors, contains, notContains, beginsWith, endsWith
    example: --prop type=containsBlanks
    example: --prop type=beginsWith
  text   string   [add/get]
    description: substring for contains/notContains/beginsWith/endsWith subtypes.
    example: --prop text=error
    readback: matched substring (when subtype emits it)
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFCCCC
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Catch-all CF dispatch for sub-types not exposed by their own --type alias: belowAverage, containsBlanks, notContainsBlanks, containsErrors, notContainsErrors, contains, notContains, beginsWith, endsWith. Pass `--prop type=<subtype>` to select. Lookup: Add.Cf.cs:557 (AddCfExtended). Most subtypes share Query.cs readback through `cfType` (Query.cs:464+).
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
  radarStyle   string   [add/set/get]   aliases: radarstyle
    description: radar chart style token (standard | marker | filled).
    example: --prop radarstyle=filled
    readback: radar style token
  roundedCorners   string   [add/set/get]   aliases: roundedcorners
    description: chartSpace roundedCorners flag (true|false).
    example: --prop roundedcorners=true
    readback: true|false
  valAxisVisible   bool   [add/set/get]   aliases: valaxis.visible, valaxisvisible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisvisible=false
    readback: true|false
  view3d.perspective   number   [get]
    description: 3-D chart perspective (0..240).
    readback: integer perspective
  view3d.rotateX   number   [get]
    description: 3-D chart X rotation in degrees (-90..90).
    readback: integer degrees
  view3d.rotateY   number   [get]
    description: 3-D chart Y rotation in degrees (0..360).
    readback: integer degrees
  anchor   string   [add/set]
    description: absolute placement on slide; cm-based 'x,y,w,h' or named anchor token.
    example: --prop anchor=D2:J18
    example: --prop anchor=2cm,3cm,18cm,10cm
  dispunits   string   [add/set]   aliases: displayunits
    description: value-axis display units divisor. Values: none, hundreds, thousands, tenThousands|10000, hundredThousands|100000, millions, tenMillions|10000000, hundredMillions|100000000, billions, trillions.
    example: --prop dispunits=thousands
  x   length   [add/set/get]
    description: absolute X position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop x=2cm
  y   length   [add/set/get]
    description: absolute Y position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop y=3cm
  seriesCount   number   [get]
    description: number of data series in the chart (extended cx:chart only).
    readback: number of data series
  areafill   string   [add/set]   aliases: area.fill
    description: fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.
    example: --prop areafill=4472C4-A5C8FF:90
  autotitledeleted   bool   [add/set]
    description: suppress the auto-generated 'Chart Title' placeholder.
    example: --prop autotitledeleted=true
  axisfont   string   [add/set]   aliases: axis.font
    description: convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options
    example: --prop axisfont=10:8B949E:Helvetica
  axisline   string   [add/set]   aliases: axis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options
    example: --prop axisline=666666:1
  axismax   number   [add/set]   aliases: max
    description: convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismax=1000
    example: --prop axismax=250
  axismin   number   [add/set]   aliases: min
    description: convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismin=0
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
    description: convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level options
    example: --prop axisnumfmt="#,##0"
  axisorientation   string   [add/set]   aliases: axisreverse
    description: convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options
    example: --prop axisorientation=true
  axisposition   string   [add/set]   aliases: axispos
    description: convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-level options
    example: --prop axisposition=top
  axistitle   string   [add/set]   aliases: vtitle
    description: convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options
    example: --prop axistitle="Revenue"
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options
    example: --prop axisvisible=false
  bubbleScale   number   [add/set/get]   aliases: bubblescale
    description: bubble chart scale (% of default).
    example: --prop bubblescale=100
    readback: integer percentage
  catAxisVisible   bool   [add/set/get]   aliases: cataxis.visible, cataxisvisible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisvisible=false
    readback: true | false
  catTitle   string   [add/set/get]   aliases: htitle, cattitle
    description: category axis title text.
    example: --prop cattitle="Quarter"
    readback: title string
  cataxisline   string   [add/set]   aliases: cataxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisline=333333:1
  categories   string   [add/set/get]
    description: comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)
    example: --prop categories=A,B,C
    example: --prop categories="Q1,Q2,Q3,Q4"
    example: --prop categories="Sheet1!$A$2:$A$5"
    readback: comma-separated category labels
  chartFill   color   [get]
    description: chart-level fill color readback.
    readback: #RRGGBB or color descriptor
  chartType   enum   [add/set/get]   aliases: type, col, donut, xy, spider, ohlc, wf, charttype
    values: bar, column, line, pie, doughnut, area, scatter, bubble, radar, stock, combo, waterfall, funnel, treemap, sunburst, boxWhisker, histogram, pareto
    example: --prop chartType=column
    example: --prop chartType=stackedBar
    example: --prop chartType=percentStackedColumn
    example: --prop chartType=column3d
    example: --prop chartType=waterfall
    readback: normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)
  chartareafill   string   [add/set]   aliases: chartfill
    description: chart-area background fill. Solid color, gradient, or 'none'.
    example: --prop chartareafill=FFFFFF
  chartborder   string   [add/set]   aliases: chartarea.border
    description: chart-area outer border line. Same format as plotborder.
    example: --prop chartborder=000000:1
    example: --prop chartborder=none
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
    description: conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.
    example: --prop colorrule=0:FF0000:00AA00
  colors   string   [add]
    description: comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) override positions.
    example: --prop colors="4472C4,ED7D31,A5A5A5"
  combosplit   number   [add]
    description: combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.
    example: --prop combosplit=2
  combotypes   string   [add/set]   aliases: combo.types
    description: rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.
    example: --prop combotypes="column,column,line"
  crossBetween   string   [add/set/get]   aliases: crossbetween
    description: category axis cross-between behavior (between / midCat).
    example: --prop crossBetween=between
    example: --prop crossbetween=midcat
    readback: crossBetween token
  crosses   string   [add/set/get]
    description: where the value axis crosses the category axis. Values: autoZero (default), max, min.
    example: --prop crosses=max
    readback: crosses token
  crossesAt   number   [add/set/get]   aliases: crossesat
    description: value-axis crossesAt value readback.
    example: --prop crossesat=0
    readback: numeric value
  data   string   [add]
    description: inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after creation.
    example: --prop data="Sales:10,20,30"
    example: --prop data="Sales:10,20,30;Cost:5,8,12"
    readback: n/a
  dataLabels   string   [add/set/get]   aliases: datalabels, labels
    description: show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also accepts seriesName/categoryName/percentage/values aliases). Position values (outsideEnd/center/insideEnd/insideBase/top/bottom/left/right/bestFit) implicitly enable showVal and apply as dLblPos.
    example: --prop dataLabels=value
    example: --prop dataLabels="value,percent"
    example: --prop dataLabels=outsideEnd
    example: --prop dataLabels=none
    readback: comma-separated flags: value,percent,category,series
  dataRange   string   [add]   aliases: datarange, range
    description: external workbook range source for series; Add-time only.
    example: --prop dataRange=Sheet1!A1:D5
  dataTable   bool   [add/set/get]   aliases: datatable
    description: show data table beneath the chart (with default borders + legend keys).
    example: --prop dataTable=true
    readback: true | false
  decreaseColor   color   [add]
    description: waterfall: negative bar color. Add-time only.
    example: --prop decreaseColor=FF0000
  dispBlanksAs   enum   [set/get]
    description: how empty cells render (gap leaves a hole, zero plots as 0, span connects across).
    values: gap, zero, span
    example: --prop dispBlanksAs=gap
    readback: dispBlanksAs token
  droplines   string   [add/set]
    description: drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.
    example: --prop droplines=true
    example: --prop droplines=808080:0.5
  errbars   string   [add/set]   aliases: errorbars
    description: error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' removes.
    example: --prop errbars=fixedVal:5
    example: --prop errbars=none
    example: --prop errbars=percentage:10
  explosion   number   [add/set/get]   aliases: explode
    description: pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.
    example: --prop explosion=10
    readback: as emitted by handler (per-format details vary)
  firstSliceAngle   number   [add/set/get]   aliases: sliceangle, firstsliceangle
    description: pie/doughnut first slice angle (degrees).
    example: --prop firstsliceangle=90
    readback: integer degrees
  gapdepth   number   [add/set]
    description: depth gap between series in 3D bar/line/area charts (percent).
    example: --prop gapdepth=150
  gapwidth   number   [add/set/get]   aliases: gap
    description: gap between bar/column groups, 0..500 (percent of bar width).
    example: --prop gapwidth=150
    readback: integer 0..500
  gradient   string   [add/set/get]   aliases: gradientfill
    description: gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.
    example: --prop gradient=FF0000-0000FF
    example: --prop gradient=FF0000-00FF00-0000FF:90
    readback: as emitted by handler (per-format details vary)
  gradients   string   [add/set]
    description: per-series gradient fills, semicolon-separated; one entry per series.
    example: --prop gradients="FF0000-0000FF;00FF00-FFFF00"
  gridlines   bool   [add/set/get]   aliases: majorgridlines
    description: value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none' removes.
    example: --prop gridlines=true
    example: --prop gridlines=E0E0E0:0.3
    example: --prop gridlines=none
    readback: true | false
  height   length   [add/set/get]
    description: chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop height=10cm
  hilowlines   string   [add/set]
    description: high-low lines on line/stock chart. Same format as droplines.
    example: --prop hilowlines=true
  holeSize   number   [add/set/get]   aliases: holesize
    description: doughnut hole size readback.
    example: --prop holesize=50
    example: --prop holeSize=50
    readback: integer 10..90 percent
  increaseColor   color   [add]
    description: waterfall: positive bar color. Add-time only.
    example: --prop increaseColor=00AA00
  invertifneg   bool   [add/set]   aliases: invertifnegative
    description: if true, draw negative bars in an inverted (lighter) color.
    example: --prop invertifneg=true
  labelPos   string   [add/set/get]   aliases: labelpos, labelposition
    description: data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bestFit|best|auto, top|t, bottom|b, left|l, right|r. Restrictions: not supported on doughnut/area/radar/stock; pie maps everything to bestFit; stacked series clamp to ctr/inBase/inEnd; combo charts skip entirely.
    example: --prop labelPos=outsideEnd
    readback: OOXML position token: ctr/inEnd/inBase/outEnd/bestFit/t/b/l/r
  labelfont   string   [add/set]
    description: data label text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop labelfont=9:333333:Calibri
  labeloffset   number   [add/set]
    description: category-axis label offset 0..1000 (percent of font height); category axis only.
    example: --prop labeloffset=100
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
    description: tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./valaxis.* targets value.
    example: --prop labelrotation=-45
    example: --prop xaxis.labelrotation=30
  leaderlines   bool   [add/set]   aliases: showleaderlines
    description: show/hide leader lines connecting data labels to slices (pie/doughnut).
    example: --prop leaderlines=true
  legend   enum   [add/set/get]
    description: legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and underscore variants accepted.
    values: true, false, none, top, bottom, left, right, topRight, tr
    example: --prop legend=bottom
    example: --prop legend=none
  legend.overlay   bool   [add/set/get]   aliases: legendoverlay
    description: if true, legend overlays the plot area instead of reserving space.
    example: --prop legend.overlay=true
    readback: true | false
  legendFont   string   [add/set/get]   aliases: legendfont, legend.font
    description: legend text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop legendFont=10:CCCCCC:Arial
    example: --prop legendFont=9:808080
    readback: size:color:fontname
  linedash   string   [add/set]   aliases: dash
    description: line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.
    example: --prop linedash=dash
  linewidth   number   [add/set]
    description: line width in points (applies to every series line).
    example: --prop linewidth=2
  logbase   number   [add/set]   aliases: logscale, yaxisscale
    description: value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log scale.
    example: --prop logbase=10
    example: --prop logscale=true
    example: --prop yaxisscale=linear
  majorTickMark   string   [add/set/get]   aliases: majortick, majortickmark
    description: major tick mark style (out / in / cross / none).
    example: --prop majorTickMark=out
    example: --prop majortickmark=out
    readback: tick mark token
  majorunit   number   [add/set]
    description: value-axis major gridline / tick spacing.
    example: --prop majorunit=200
    example: --prop majorunit=50
  marker   string   [add/set]   aliases: markers
    description: marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or 'symbol:size:color'. Symbols: none, auto, circle, square, diamond, triangle, x, plus, star, dash, dot, picture. Chart-level Get does not surface marker because applicability is chart-type-conditional — read per-series via /chart[N]/series[K] (chart-series schema declares marker get:true).
    example: --prop marker=circle
    example: --prop marker=square:8:FF0000
    readback: as emitted by handler (per-format details vary)
  markersize   number   [add/set]
    description: marker size 2..72 (line/scatter/radar series only).
    example: --prop markersize=8
  minorGridlines   bool   [add/set/get]   aliases: minorgridlines
    description: value-axis minor gridlines; same format as gridlines.
    example: --prop minorGridlines=true
    example: --prop minorGridlines=F0F0F0:0.25
    readback: true | false
  minorTickMark   string   [add/set/get]   aliases: minortick, minortickmark
    description: minor tick mark style (out / in / cross / none).
    example: --prop minorTickMark=none
    example: --prop minortickmark=in
    readback: tick mark token
  minorunit   number   [add/set]
    description: value-axis minor gridline / tick spacing.
    example: --prop minorunit=50
    example: --prop minorunit=10
  overlap   number   [add/set/get]
    description: bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).
    example: --prop overlap=0
    example: --prop overlap=100
    readback: as emitted by handler (per-format details vary)
  plotFill   color   [add/set/get]   aliases: plotareafill, plotfill
    description: plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.
    example: --prop plotFill=FAFAFA
    example: --prop plotareafill=FAFAFA
    example: --prop plotFill=none
    readback: #RRGGBB or color descriptor
  plotborder   string   [add/set]   aliases: plotarea.border
    description: plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.
    example: --prop plotborder=CCCCCC:0.5
    example: --prop plotborder=none
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
    description: if true, skip plotting hidden worksheet rows/columns.
    example: --prop plotvisonly=true
  preset   string   [add/set]   aliases: theme, style.preset
    description: named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).
    example: --prop preset=minimal
    example: --prop preset=corporate
    example: --prop preset=dark
  referenceline   string   [add/set]   aliases: refline, targetline
    description: horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'. Pass 'none' to remove.
    example: --prop referenceline=100:FF0000:Target
    example: --prop referenceline=none
    example: --prop refline=80:00AA00
  scatterstyle   string   [add/set]
    description: scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.
    example: --prop scatterstyle=smoothMarker
  secondaryaxis   string   [add/set]   aliases: secondary
    description: comma-separated 1-based series indices to plot on a secondary value axis.
    example: --prop secondaryaxis=2
    example: --prop secondary="2,3"
  seriesoutline   string   [add/set]   aliases: series.outline
    description: series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.
    example: --prop seriesoutline=000000:0.5
    example: --prop seriesoutline=none
  seriesshadow   string   [add/set]   aliases: series.shadow
    description: outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.
    example: --prop seriesshadow=000000-5-45-3-50
    example: --prop seriesshadow=none
  serlines   string   [add/set]   aliases: serieslines
    description: series lines on stacked bar charts (true/false).
    example: --prop serlines=true
  shape   string   [add/set]   aliases: barshape
    description: 3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.
    example: --prop shape=cylinder
  showMarker   bool   [set/get]
    description: show markers on line/scatter series at chart level.
    example: --prop showMarker=true
    readback: true | false
  shownegbubbles   bool   [add/set]
    description: render negative-valued bubbles. Bubble charts only.
    example: --prop shownegbubbles=true
  sizerepresents   string   [add/set]
    description: how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.
    example: --prop sizerepresents=area
  smooth   bool   [add/set/get]
    description: smooth lines on line/scatter charts. Reported unsupported for other chart types.
    example: --prop smooth=true
    readback: as emitted by handler (per-format details vary)
  style   number   [add/set/get]   aliases: styleid
    description: built-in chart style id 1..48; pass 'none' to clear.
    example: --prop style=2
    readback: as emitted by handler (per-format details vary)
  tickLabelPos   string   [add/set/get]   aliases: ticklabelposition, ticklabelpos
    description: tick label position (high / low / nextTo / none).
    example: --prop tickLabelPos=nextTo
    example: --prop ticklabelpos=low
    readback: tick label position token
  ticklabelskip   number   [add/set]   aliases: tickskip
    description: draw tick labels every Nth category (category axis).
    example: --prop ticklabelskip=2
  title   string   [add/set/get]
    description: chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.color, title.bold when set; these are get-only readback fields surfaced from chart title runs.
    example: --prop title="Q1"
    example: --prop title="2024 Sales"
    example: --prop title=none
    readback: chart title
  title.bold   bool   [get]
    description: title bold flag (readback only)
    readback: true | false
  title.color   color   [get]
    description: title font color (readback only, #RRGGBB)
    readback: #RRGGBB
  title.font   string   [get]
    description: title font name (readback only)
    readback: font name
  title.size   font-size   [get]
    description: title font size (readback only, e.g. 14pt)
    readback: Npt
  totalColor   color   [add]
    description: waterfall: subtotal/total bar color. Add-time only.
    example: --prop totalColor=4472C4
  transparency   number   [add/set]   aliases: opacity, alpha
    description: series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=70).
    example: --prop transparency=30
    example: --prop opacity=70
  trendline   string   [add/set/get]
    description: add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponential, log|logarithmic, poly|polynomial, power, movingAvg|moving|movingAverage. Order applies to poly/movingAvg. Pass 'none' to clear.
    example: --prop trendline=linear
    example: --prop trendline=poly:3
    example: --prop trendline=none
    example: --prop trendline=movingAvg:3
    readback: as emitted by handler (per-format details vary)
  updownbars   string   [add/set]
    description: up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.
    example: --prop updownbars=true
    example: --prop updownbars=150:00AA00:FF0000
  valaxisline   string   [add/set]   aliases: valaxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisline=333333:1
  varyColors   bool   [set/get]
    description: vary colors by data point (single-series charts).
    example: --prop varyColors=true
    readback: true | false
  view3d   string   [add/set/get]   aliases: camera, perspective
    description: 3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key form (rotX=...) is rejected.
    example: --prop view3d=15,20,30
    example: --prop view3d=20
    example: --prop perspective=30
    readback: as emitted by handler (per-format details vary)
  width   length   [add/set/get]
    description: chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop width=18cm
    example: --prop width=15cm

Note: Source of truth: Core/Chart/ChartHelper.Builder.cs (DeferredAddKeys + DeferredPrefixes) and ChartHelper.Setter.cs (case branches). Adding a new property MUST update both the handler and this file. Validator is also lenient about dotted sub-property namespaces (axis., series., trendline., errbars., datatable., displayunitslabel., trendlinelabel., combo., area., style., title., plotArea., chartArea., legend., datalabels., font., border., fill., shadow., glow., alignment.) and indexed namespaces (series{N}., dataLabel{N}., point{N}., legendEntry{N}.). Axis configuration: chart-level axis* props (axismin, axismax, axistitle, axisfont, ...) are Add-time only; for post-creation axis Set/Get use the chart-axis element.
```

## xlsx Element: chart-axis

```text
xlsx chart-axis
---------------
Parent: chart
Addressing: /SheetName/chart[N]/axis[@role=ROLE]
  role values: category, value, value2, series
Operations: set get

Properties:
  role   string   [get]
    description: axis role token — value, value2, category, series. Surfaces on Get to identify which axis this node represents.
    readback: axis role token (lowercase)
  dispUnits   enum   [set/get]
    description: display units for value axis labels. Applies to role=value|value2.
    values: hundreds, thousands, tenThousands, hundredThousands, millions, tenMillions, hundredMillions, billions, trillions
    example: --prop dispUnits=thousands
    readback: display unit token
  majorUnit   number   [set/get]
    description: major tick interval on the value axis. Applies to role=value|value2.
    example: --prop majorUnit=20
    readback: numeric interval
  minorUnit   number   [set/get]
    description: minor tick interval on the value axis. Applies to role=value|value2.
    example: --prop minorUnit=5
    readback: numeric interval
  axisFont   string   [get]
    description: axis text font readback.
    readback: font name string
  axisMax   number   [get]
    description: value-axis maximum readback (also surfaced via max on axis-by-role path).
    readback: numeric value
  axisMin   number   [get]
    description: value-axis minimum readback (also surfaced via min on axis-by-role path).
    readback: numeric value
  axisNumFmt   string   [get]
    description: axis number format string.
    readback: format code
  axisOrientation   string   [get]
    description: axis scaling orientation (e.g. maxMin when reversed).
    readback: orientation token
  axisTitle   string   [get]
    description: value-axis title readback (chart-level convenience; axis-by-role uses 'title').
    readback: title string
  format   string   [set/get]
    description: number format string
    example: --prop format="#,##0"
    example: --prop format="#,##0.00"
  labelOffset   number   [get]
    description: category axis label offset (% of default 100).
    readback: integer percentage
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  logBase   number   [set/get]
    description: logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop logBase=10
    readback: number (e.g. 10)
  majorGridlines   bool   [set/get]
    description: show or hide major gridlines. Applies to all roles.
    example: --prop majorGridlines=true
  max   number   [set/get]
    description: maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop max=1000
    example: --prop max=250
  min   number   [set/get]
    description: minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop min=0
  minorGridlines   bool   [set/get]
    description: show or hide minor gridlines. Applies to all roles.
    example: --prop minorGridlines=false
  tickLabelSkip   number   [get]
    description: category axis label skip interval (>1 means tick labels are sparser).
    readback: integer interval
  title   string   [set/get]
    description: axis title text. Applies to all roles (category, value). Pass 'none' to remove.
    example: --prop title="Revenue"
    example: --prop title="Quarter"
  visible   bool   [set/get]
    description: show or hide the axis. Applies to all roles.
    example: --prop visible=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Extended charts (funnel/treemap/sunburst/boxWhisker/histogram) reject axis path — use chart-level Set. Add-time configuration: use the chart element's axis* props (axismin, axismax, axistitle, axisfont, ...) when creating the chart; chart-axis covers post-creation Set/Get. `labelFont`, `lineWidth`, `lineDash` are not yet supported on axis-by-role paths. `lineWidth`/`lineDash` Set on a chart-axis path currently apply to all series in the plot area; `labelFont` writes the axis title run, not tick labels. Use chart-series schema for series line styling.
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
  valuesRef   string   [get]
    description: A1 cell range backing the series values.
    readback: A1 range string
  trendline.dispEq   bool   [get]
    description: trendline displayEquation flag.
    readback: true when shown
  trendline.dispRSqr   bool   [get]
    description: trendline displayRSquaredValue flag.
    readback: true when shown
  alpha   number   [get]
    description: series fill alpha readback in OOXML units (0..100000 = 0..100%). Distinct from chart-level `transparency` which is the percent input on Add/Set.
    readback: integer 0..100000 (OOXML alpha units)
  outlineColor   color   [get]
    description: per-series outline color readback.
    readback: #RRGGBB or scheme reference
  categories   string   [add/set/get]
    description: per-series category override; range reference only.
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
    readback: as emitted by handler (per-format details vary)
  categoriesRef   string   [get]
    description: A1 cell range backing the category labels.
    readback: A1 range string
  color   color   [add/set/get]
    description: series fill color.
    example: --prop series1.color=#4472C4
    example: --prop series1.color=4472C4
    readback: #-prefixed uppercase hex
  dataLabels.numFmt   string   [get]
    description: per-series data label number format readback.
    readback: format code
  dataLabels.separator   string   [get]
    description: per-series data label separator string readback.
    readback: separator string
  errBars   string   [get]
    description: error bar value type token (e.g. cust, fixedVal, stdDev).
    readback: OOXML errValType token
  invertIfNeg   bool   [get]
    description: invert color for negative values (per-series readback).
    readback: true | false
  lineDash   enum   [set/get]   aliases: dash
    description: series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash/sysDot/sysDashDot/lgDash). 'solid' is the only round-trip-stable value.
    values: solid, sysDash, sysDot, sysDashDot, lgDash, lgDashDot, lgDashDotDot, dash, dashDot, dot, longDash
    example: --prop lineDash=dash
    example: --prop lineDash=solid
    readback: OOXML preset dash token
  lineWidth   number   [set/get]
    description: series line width in points (e.g. 1.5).
    example: --prop lineWidth=1.5
    readback: numeric width in points
  marker   string   [set/get]
    description: per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports 'symbol:size:COLOR' compound form (e.g. 'circle:8:FF0000'). Applies to line/scatter/radar series.
    example: --prop marker=circle
    example: --prop marker="circle:8:FF0000"
    readback: marker symbol name
  markerSize   number   [set/get]
    description: marker size in points (2–72). Applies when marker is not 'none'.
    example: --prop markerSize=8
    readback: integer
  name   string   [add/set/get]   aliases: title
    description: series name shown in legend and data labels.
    example: --prop name="Q1"
    example: --prop series1.name="Q1"
    example: --prop name="Product A"
    example: --prop series1.name="Product A"
    example: --prop name="Revenue"
    example: --prop series1.name="Revenue"
    readback: series name string
  nameRef   string   [get]
    description: A1 cell reference backing the series name.
    readback: A1 cell reference
  scatterStyle   string   [get]
    description: scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
    readback: OOXML scatterStyle token
  secondaryAxis   bool   [get]
    description: true when the chart has more than one value axis (this series uses the secondary).
    readback: true | false
  smooth   bool   [set/get]
    description: smooth line interpolation for line/scatter series.
    example: --prop smooth=true
    readback: true | false
  values   string   [add/set/get]
    description: comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)
    example: --prop series1.values="120,150,180"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
    example: --prop series1.values="120,150,180,210"

Note: Mirror of pptx/chart-series and docx/chart-series. At Add time, series pass as dotted props on the parent chart (series1.name, series1.values, series1.color, series1.categories). This schema represents per-series Set/Get after creation. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type. lineWidth (line width in pt) and lineDash (solid/dash/dot/dashDot/longDash) are available on line/scatter series; `lineStyle` is not a recognized key (rejected as UNSUPPORTED — use lineWidth/lineDash instead).
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
  col   string   [add]   aliases: column, index
    description: column index or letter. Aliases: column, index.
    example: --prop col=F
    readback: n/a (see sheet.colBreaks)

Note: Manual page break before the specified column. Accepts numeric index or column letter.
```

## xlsx Element: colorscale

```text
xlsx colorscale
---------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type colorscale [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A10
  minColor   color   [add/get]   aliases: mincolor
    description: low-end color (default F8696B).
    example: --prop minColor=F8696B
    readback: #-prefixed uppercase hex
  maxColor   color   [add/get]   aliases: maxcolor
    description: high-end color (default 63BE7B).
    example: --prop maxColor=63BE7B
    readback: #-prefixed uppercase hex
  midColor   color   [add/get]   aliases: midcolor
    description: midpoint color (omit for 2-stop scale).
    example: --prop midColor=FFEB84
    readback: #-prefixed uppercase hex
  midpoint   number   [add]   aliases: midPoint
    description: midpoint percentile (default 50). Only meaningful when midcolor is set.
    example: --prop midpoint=50
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Conditional formatting 2-/3-stop color scale. Add via `add /Sheet1/cf --type colorscale --prop sqref=A1:A10 --prop mincolor=F8696B --prop maxcolor=63BE7B`. Lookup: Add.Cf.cs:266 (AddColorScale); Get: Query.cs:500.
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
  customWidth   bool   [get]
    description: Get-only readback. True when the column has an explicit width set (i.e. width is not the sheet default). Mirrors OOXML col@customWidth.
    readback: true when column has explicit width
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
    description: background fill color for matched cells. Use this for cellIs, text, top/bottom, and formula rules.
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
    description: bar color for dataBar rules only. For cellIs/text/formula rules, use 'fill' instead.
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
  aboveAverage   bool   [add/get]   aliases: above
    description: aboveAverage rule: true=above, false=below. Alias: above.
    example: --prop type=aboveAverage --prop aboveAverage=true
    readback: true/false
  stdDev   number   [add]
    description: stdDev offset for aboveAverage rules (1 = 1σ above mean). Add-time only — Get does not surface this back today.
    example: --prop stdDev=1
    readback: n/a
  equalAverage   bool   [add]
    description: include the mean in aboveAverage matching. Add-time only — Get does not surface this back today.
    example: --prop equalAverage=true
    readback: n/a
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
  axisPosition   enum   [add]
    description: data-bar axis position. Default: automatic. Add-time only — Get does not surface this back today.
    values: automatic, middle, none
    example: --prop axisPosition=middle
    readback: n/a
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
  midPoint   string   [add]   aliases: midpoint
    description: color-scale midpoint value (numeric or percentile). Alias: midpoint. Add-time only — Get does not surface this back today.
    example: --prop midPoint=50
    readback: n/a
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
  ruleType   string   [get]
    description: Get-only readback of the underlying OOXML CT_CfRule@type (e.g. cellIs, colorScale, dataBar, iconSet, expression, top10, aboveAverage, duplicateValues, uniqueValues, containsText, timePeriod). Distinct from 'cfType' which is the higher-level family token.
    readback: OOXML cfRule@type token
  cfType   enum   [get]
    description: Get-only readback of the high-level CF family (camelCase). Set by Get based on which OOXML child element is present on the rule.
    values: dataBar, colorScale, iconSet, formula, topN, aboveAverage, duplicateValues, uniqueValues, containsText, cellIs, timePeriod
    readback: camelCase family token
  dxfId   int   [get]
    description: Get-only readback of the differential format index referenced by this rule (links to the workbook-level dxfs table).
    readback: 0-based dxf index

Note: Aliases: cf, cfextended. Type names map to xlsx CF rules (cellIs, colorScale, dataBar, iconSet, containsText, top/bottom N, etc.).
```

## xlsx Element: containstext

```text
xlsx containstext
-----------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type containstext [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  text   string   [add/get]
    description: substring to match (case-insensitive). Required.
    example: --prop text=error
    readback: matched substring
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFCCCC
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Match cells whose text contains a substring. Add via `add /Sheet1/cf --type containstext --prop sqref=A1:A100 --prop text=error --prop fill=FFCCCC`. Lookup: Add.Cf.cs:655 (AddCfExtended `containstext` case); Get: Query.cs:577.
```

## xlsx Element: databar

```text
xlsx databar
--------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type databar [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A10
  min   string   [add]
    description: data bar lower bound (omit for auto-min).
    example: --prop min=0
  max   string   [add]
    description: data bar upper bound (omit for auto-max).
    example: --prop max=100
  color   color   [add/get]
    description: primary bar color (default 638EC6).
    example: --prop color=4472C4
    readback: #-prefixed uppercase hex or 'themeN'
  showValue   bool   [add/get]
    description: show cell value alongside the bar (default true).
    example: --prop showValue=false
    readback: true | false (only emitted when false)
  negativeColor   color   [add/get]
    description: negative-value bar color (x14 extension, default FF0000).
    example: --prop negativeColor=FF0000
    readback: #-prefixed uppercase hex
  axisColor   color   [add/get]
    description: axis color (x14 extension, default 000000).
    example: --prop axisColor=000000
    readback: #-prefixed uppercase hex
  axisPosition   enum   [add]
    description: axis position for negative values (x14 extension, default automatic).
    values: automatic, middle, none
    example: --prop axisPosition=middle
  minLength   number   [add/get]
    description: minimum bar length (% of cell, default 0).
    example: --prop minLength=10
    readback: integer percentage
  maxLength   number   [add/get]
    description: maximum bar length (% of cell, default 100).
    example: --prop maxLength=90
    readback: integer percentage
  direction   enum   [add/get]
    description: bar direction (x14 extension).
    values: leftToRight, rightToLeft, context, ltr, rtl
    example: --prop direction=leftToRight
    readback: OOXML direction token
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Conditional formatting data bar rule. Add via `add /Sheet1/cf --type databar --prop sqref=A1:A10`. Lookup: Add.Cf.cs:84 (AddDataBar); Get readback: Query.cs:464.
```

## xlsx Element: dateoccurring

```text
xlsx dateoccurring
------------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type dateoccurring [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  period   enum   [add/get]   aliases: timePeriod, timeperiod
    description: time period token (default today).
    values: today, yesterday, tomorrow, last7Days, thisWeek, lastWeek, nextWeek, thisMonth, lastMonth, nextMonth
    example: --prop period=last7Days
    example: --prop period=today
    readback: OOXML time-period token
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFCCCC
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Match dates falling in a named time period. Aliases for type: timeperiod. Add via `add /Sheet1/cf --type dateoccurring --prop sqref=A1:A100 --prop period=last7Days`. Lookup: Add.Cf.cs:669 (AddCfExtended `dateoccurring` case); Get: Query.cs:597.
```

## xlsx Element: duplicatevalues

```text
xlsx duplicatevalues
--------------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type duplicatevalues [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFCCCC
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Highlight duplicate values in range. Add via `add /Sheet1/cf --type duplicatevalues --prop sqref=A1:A100 --prop fill=FFCCCC`. Lookup: Add.Cf.cs:646 (AddCfExtended `duplicatevalues` case); Get: Query.cs:563.
```

## xlsx Element: formulacf

```text
xlsx formulacf
--------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type formulacf [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A10
  formula   string   [add/get]
    description: formula expression evaluated per-cell (without leading '='). Required.
    example: --prop formula="$A1>100"
    example: --prop formula="MOD(ROW(),2)=0"
    readback: formula text as stored
  fill   color   [add]
    description: background fill color applied via differential format (dxf).
    example: --prop fill=FFFF00
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  font.italic   bool   [add]
    description: italic via dxf.
    example: --prop font.italic=true
  font.underline   bool   [add]
    description: underline via dxf.
    example: --prop font.underline=true
  font.strike   bool   [add]
    description: strikethrough via dxf.
    example: --prop font.strike=true
  font.size   font-size   [add]
    description: font size via dxf.
    example: --prop font.size=12pt
  font.name   string   [add]
    description: font family via dxf.
    example: --prop font.name=Arial
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Formula-based conditional formatting. Add via `add /Sheet1/cf --type formula --prop sqref=A1:A10 --prop formula="$A1>100" --prop fill=FFFF00`. Lookup: Add.Cf.cs:382 (AddFormulaCf); Get: Query.cs:536.
```

## xlsx Element: iconset

```text
xlsx iconset
--------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type iconset [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range
    example: --prop ref=A1:A10
  iconset   enum   [add/get]   aliases: icons
    description: icon set name
    values: 3arrows, 3arrowsGray, 3flags, 3trafficLights1, 3trafficLights2, 3signs, 3symbols, 3symbols2, 4arrows, 4arrowsGray, 4rating, 4redToBlack, 4trafficLights, 5arrows, 5arrowsGray, 5rating, 5quarters
    example: --prop iconset=3arrows
    readback: icon set token
  reverse   bool   [add]
    description: reverse icon order
    example: --prop reverse=true
  showValue   bool   [add]
    description: show cell value alongside icon (default true)
    example: --prop showValue=false
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Conditional formatting iconset rule. Add via `add /Sheet1/cf --type iconset --prop sqref=A1:A10 --prop iconset=3arrows`. Lookup: Add.Cf.cs:322 (AddIconSet); Get: Query.cs:525.
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
  scope   string   [add/set/get]
    description: sheet name for local scope, or 'workbook' (default).
    example: --prop scope=workbook
    readback: scope descriptor
  comment   string   [add/set/get]
    description: free-text description shown in Excel's Name Manager.
    example: --prop comment="Q4 totals"
    readback: comment text
  volatile   bool   [add/set/get]
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
  anchor   string   [add/set/get]   aliases: ref
    example: --prop anchor=B2:F7
    readback: anchor descriptor
  shapeId   number   [get]
    description: VML shape id of the OLE container (xlsx legacy drawing).
    readback: integer shape id
  contentType   string   [get]
    description: MIME type of the embedded part.
    readback: MIME type string
  fileSize   number   [get]
    description: embedded payload bytes.
    readback: integer byte count
  objectType   string   [get]
    description: OLE object type marker (always 'ole').
    readback: literal string 'ole'
  preview   string   [add]
    description: preview thumbnail image source. Add-time only — Set ignores this key.
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  progId   string   [add/set/get]   aliases: progid
    description: OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.
    example: --prop progId=Word.Document.12
    example: --prop progId=Excel.Sheet.12
    readback: ProgID string
  src   string   [add/set]   aliases: path
    description: embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/data.docx
    example: --prop src=/path/to/data.xlsx
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded relationship.

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
  row   int   [add]
    description: row index — routes to rowbreak. Add-time only — Set is not supported (re-add to relocate). Get does not surface this back today; use sheet.rowBreaks for the indexed list.
    example: --prop row=20
    readback: n/a (see sheet.rowBreaks)
  col   string   [add]   aliases: column
    description: column index/letter — routes to colbreak. Alias: column. Add-time only — Set is not supported (re-add to relocate). Get does not surface this back today; use sheet.colBreaks for the indexed list.
    example: --prop col=F
    readback: n/a (see sheet.colBreaks)

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
  crop   string   [get]
    description: Crop in percent (0-100). 1 value = symmetric, 2 values = vertical,horizontal, 4 values = left,top,right,bottom. Excel reads but does not write crops — overrides shared base which marks add/set true (pptx-only writability).
    example: --prop crop=10
    readback: comma-separated percentages (left,top,right,bottom)
  title   string   [add]
    description: OOXML @title attribute on cNvPr (distinct from alt).
    example: --prop title="Logo"
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
  anchoredTo   string   [get]
    description: anchor descriptor — sheet/cell-range path the picture is anchored to.
    readback: `/SheetName/A1[:Z9]` anchor path
  relId   string   [get]
    description: relationship id of the embedded image part (rId-style token).
    readback: relationship id token
  mergeAnchor   bool   [get]
    description: true when the picture is anchored to a merged-cell region.
    readback: true|false
  x   length   [add/set/get]
    description: x as TwoCellAnchor column/row index (xlsx cell-anchor positioning, integer).
    example: --prop x=0
    example: --prop x=1in
    readback: integer column/row index
  y   length   [add/set/get]
    description: y as TwoCellAnchor column/row index (xlsx cell-anchor positioning, integer).
    example: --prop y=0
    example: --prop y=1in
    readback: integer column/row index
  width   integer   [add/set/get]
    description: width — TwoCellAnchor column/row span (xlsx cell-anchor positioning, integer)
    example: --prop width=5
    example: --prop width=3in
    readback: integer column/row span
  height   integer   [add/set/get]
    description: height — TwoCellAnchor column/row span (xlsx cell-anchor positioning, integer)
    example: --prop height=5
    example: --prop height=2in
    readback: integer column/row span
  cropBottom   string   [add/set]   aliases: cropbottom
    description: Crop from bottom edge as percent (0-100). Aliases: cropbottom.
    example: --prop cropBottom=10
  cropLeft   string   [add/set]   aliases: cropleft
    description: Crop from left as fraction (<=1) or percent (>1). E.g. cropLeft=0.1 or cropLeft=10 both mean 10%.
    example: --prop cropLeft=0.1
    example: --prop cropLeft=10
  cropRight   string   [add/set]   aliases: cropright
    description: Crop from right edge as percent (0-100). Aliases: cropright.
    example: --prop cropRight=10
  cropTop   string   [add/set]   aliases: croptop
    description: Crop from top edge as percent (0-100). Aliases: croptop.
    example: --prop cropTop=10
  name   string   [add/get]
    description: Override the auto-generated 'Picture {id}' label on cNvPr @name.
    example: --prop name="hero-image"
    example: --prop name="Hero Image"
    readback: shape name string
  fallback   string   [add]
    description: optional PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is generated.
    example: --prop fallback=/path/to/fallback.png
    readback: n/a (SVG-only)
  alt   string   [add/set/get]   aliases: altText, alttext, description
    description: alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.
    example: --prop alt="Logo"
    example: --prop alt="Company logo"
    readback: string
  contentType   string   [get]
    description: OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced by the BlipFill embed relationship.
    readback: MIME-style content-type string from the image part
  fileSize   number   [get]
    description: embedded image file size in bytes (length of the image part stream).
    readback: byte length of the embedded image part
  src   string   [add/set]   aliases: path
    description: image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/image.png
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded image relationship.

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
  topN   string   [add]   aliases: topn
    description: keep only top-N row keys ranked by first value field's aggregate. Integer >= 1; filter applied to source rows pre-cache. Add-time only — Set ignores this key.
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
  labelFilter   string   [add]   aliases: labelfilter
    description: row-level pre-cache label filter as 'field:type:value' (e.g. 'Region:beginsWith:N'). Type one of equals, notEquals, beginsWith, endsWith, contains, notContains, greaterThan, greaterThanEqual, lessThan, lessThanEqual, between, notBetween. Add-time only — Set ignores this key.
    example: --prop labelFilter=Region:beginsWith:N
    readback: n/a (filters source rows)
  calculatedField   string   [add]   aliases: calculatedfield, calculatedfields
    description: user-defined formula field as 'Name:=Formula' (e.g. 'Margin:=Sales-Cost'). Use calculatedField1, calculatedField2, ... for multiple. Alias: calculatedFields. Add-time only — Set ignores this key.
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
  showDrill   bool   [add]   aliases: showdrill
    description: show expand/collapse (+/-) buttons on every pivot field. Add-time only — Set ignores this key.
    example: --prop showDrill=false
    readback: n/a
  mergeLabels   bool   [add]   aliases: mergelabels
    description: merge+center repeated outer-axis item cells (<pivotTableDefinition mergeItem='1'>). Add-time only — Set ignores this key.
    example: --prop mergeLabels=true
    readback: n/a
  cacheId   number   [get]
    description: pivot cache index (read-only; assigned by Excel when the pivot table is created).
    readback: pivot cache index (read-only; assigned by Excel)
  fieldCount   number   [get]
    description: total number of pivot fields in the source range (read-only).
    readback: total number of pivot fields in the source range
  dataFieldCount   number   [get]
    description: number of data field aggregations (read-only; equals the count of dataField{N} entries).
    readback: number of data field aggregations
  dataField{N}   string   [get]
    description: per-data-field readback (1-indexed: dataField1, dataField2, …) packed as 'name:aggFunc:fieldIdx'. Get also returns `dataField{N}.showAs` when ShowDataAs != normal.
    readback: packed as 'name:aggFunc:fieldIdx'; name reflects Excel's stored DataField/@name which includes auto-prefixes (e.g. 'Sum of Revenue:sum:1')
  dataField{N}.showAs   enum   [get]
    description: data field showAs token (read-only). Values are canonicalized from OOXML ShowDataAs.
    values: percent_of_total, percent_of_row, percent_of_col, running_total, difference, percent_diff, index
    readback: showAs canonical token
  location   string   [get]
    description: target cell range where the pivot table is rendered (e.g. D1:E4).
    readback: A1 range string
  collapsedFields   string   [get]
    description: comma-separated names of fields with collapsed items.
    readback: comma-separated field names
  axisAsDataField   bool   [get]
    description: comma-separated names of fields acting as data field on axis.
    readback: comma-separated field names
  sortByField   string   [get]
    description: comma-separated 'field:direction' sort tuples.
    readback: comma-separated sort tuples

Note: Aliases: pivot. 'source' required (e.g. Sheet1!A1:D100). External workbook refs rejected. Position auto-placed after source if omitted. Field axes (rows/cols/filters/values) take comma-separated field names; values use 'Field:agg' tuples. Query returns child nodes typed pivotfield/pivotrow/pivotcolumn/pivotdata — these are read-only structural nodes, not independently addressable elements; no Add/Set/Remove is supported on them.
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
  merge   bool   [set/get]
    description: merge all cells in the range into a single cell. Set merge=false to unmerge — the range must exactly match an existing merge, otherwise the call fails with the precise refs to use. Pass merge=sweep to bulk-clear every merge contained in the range (destructive, no precision check).
    example: --prop merge=true
    example: --prop merge=false
    example: --prop merge=sweep
    readback: true/false
  font.bold   bool   [set]
    description: broadcast bold to every cell.
    example: --prop font.bold=true
    readback: n/a (broadcast)
  fill   color   [set]
    description: broadcast fill color.
    example: --prop fill=#FFFF00
    readback: n/a (broadcast)
  numberformat   string   [set]   aliases: format
    description: broadcast number format code.
    example: --prop numberformat="#,##0.00"
    readback: n/a (broadcast)
  alignment.horizontal   enum   [set]   aliases: halign
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
    description: outline/group level 0-7. Aliases: outlineLevel, group. Set accepts `outline`/`outlineLevel`/`group`; Get readback uses canonical key `outlineLevel`.
    example: --prop outline=1
    readback: see `outlineLevel`
  outlineLevel   number   [get]
    description: row outline grouping level (0 = ungrouped, 1..7 = nested group depth). Get-only readback of the value set via `outline`.
    readback: integer 0..7; key omitted when row has no outline level
  collapsed   bool   [set]
    description: collapse row group. Currently Set-only.
    example: --prop collapsed=true
    readback: not surfaced by Get
  customHeight   bool   [get]
    description: true when the row carries an explicit height (Row @customHeight). Get-only flag.
    readback: true when row has a custom height

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
  row   int   [add]   aliases: index
    description: 1-based row index where the break occurs. Alias: index.
    example: --prop row=20
    readback: n/a (see sheet.rowBreaks)

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
  gradientFill   string   [add]
    description: Two/three-stop linear gradient, e.g. 'C1-C2[-C3][:angle]'. Mutually exclusive with fill (gradientFill wins).
    example: --prop gradientFill=FF0000-0000FF:90
  geometry   string   [add/set/get]   aliases: preset, shape
    description: geometry preset name (rect, ellipse, roundRect, triangle, rightArrow, etc.). Unknown presets fall back to rect with a stderr warning. Set replaces the existing PresetGeometry preserving fill/line/effects.
    example: --prop geometry=ellipse
  flip   string   [add/set]
    description: Compact flip token: 'h' / 'v' / 'both' / 'hv' / 'vh' / 'none'.
    example: --prop flip=h
    example: --prop flip=both
  flipBoth   bool   [add/set]
    description: Flip both axes.
    example: --prop flipBoth=true
  x   length   [add/set/get]   aliases: left
    description: x as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.
    example: --prop x=2
    example: --prop x=2cm
    example: --prop x=1in
    example: --prop x=72pt
    readback: integer column/row index
  y   string   [add/set/get]   aliases: top
    description: y as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.
    example: --prop y=3
    example: --prop y=3cm
    readback: integer column/row index
  width   string   [add/set/get]   aliases: w
    description: width as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.
    example: --prop width=4
    example: --prop width=6cm
    example: --prop width=5cm
    readback: integer column/row index
  height   string   [add/set/get]   aliases: h
    description: height as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.
    example: --prop height=3
    example: --prop height=3cm
    readback: integer column/row index
  align   string   [add/set/get]
    description: Paragraph alignment: 'left' / 'center' (c/ctr) / 'right' (r) / 'justify'.
    example: --prop align=center
  bold   bool   [add/set/get]   aliases: font.bold
    description: Bold runs. Bare alias of font.bold.
    example: --prop bold=true
    readback: as emitted by handler (per-format details vary)
  color   color   [add/set/get]   aliases: font.color
    description: Text color. Bare alias of font.color.
    example: --prop color=#FF0000
    example: --prop color=0000FF
    readback: as emitted by handler (per-format details vary)
  fill   color   [add/set/get]   aliases: background
    description: Solid fill color, or 'none' for no fill (text-only shapes route effects to text-level rPr).
    example: --prop fill=#FFFF00
    example: --prop fill=none
    example: --prop fill=FF0000
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop fill=accent1
    readback: #-prefixed uppercase hex
  flipH   bool   [add/set]   aliases: flipHorizontal
    description: Flip horizontally (Office-API alias of flip=h).
    example: --prop flipH=true
  flipV   bool   [add/set]   aliases: flipVertical
    description: Flip vertically (Office-API alias of flip=v).
    example: --prop flipV=true
  font   string   [add/set/get]   aliases: font.name
    description: default font family for shape text. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / Arabic) use font.latin, font.ea, or font.cs.
    example: --prop font=Arial
    readback: font name
  glow   string   [add/set/get]
    description: glow effect. Pass a color (e.g. '4472C4') or 'true' (defaults to accent blue).
    example: --prop glow=#4472C4
    example: --prop glow=4472C4
    example: --prop glow=true
    readback: color hex string
  italic   bool   [add/set/get]   aliases: font.italic
    description: Italic runs. Bare alias of font.italic.
    example: --prop italic=true
    readback: as emitted by handler (per-format details vary)
  line   string   [add/set/get]   aliases: border, linecolor, lineColor
    description: Outline color (or 'none'). Form: 'color[:width[:style]]', e.g. 'FF0000:1.5:dash'. width in points; style: solid|dash|dot|dashdot|longdash.
    example: --prop line=#000000
    example: --prop line=FF0000:1.5
    example: --prop line=none
    example: --prop line=000000
    readback: color or color:width
  margin   length   [add/set/get]
    description: uniform internal padding (text inset) for shape body.
    example: --prop margin=4
    example: --prop margin=0.1in
    readback: n/a
  name   string   [add/set/get]
    description: Override the auto-generated 'Shape {id}' label on cNvPr @name.
    example: --prop name="banner"
    example: --prop name=MyShape
    readback: shape name string (cNvPr @name)
  reflection   string   [add/set]
    description: reflection effect. Accepts 'true' to enable a default reflection.
    example: --prop reflection=true
    readback: n/a
  rotation   string   [add/set/get]   aliases: rot, rotate
    description: Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.
    example: --prop rotation=45
    readback: as emitted by handler (per-format details vary)
  shadow   string   [add/set/get]
    description: outer shadow effect. Pass a color (e.g. '000000') or 'true' (defaults to black). Routed to text-level rPr for text-only shapes.
    example: --prop shadow=#808080
    example: --prop shadow=none
    example: --prop shadow=000000
    example: --prop shadow=true
    readback: color hex string
  size   font-size   [add/set/get]   aliases: fontSize, fontsize, font.size
    description: font size
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified string, e.g. "14pt"
  softEdge   string   [add/set]   aliases: softedge
    description: Soft edge radius, or 'none' to clear.
    example: --prop softEdge=5
    example: --prop softEdge=4pt
  text   string   [add/set/get]
    example: --prop text="Note"
    example: --prop text="Hello"
    readback: plain text content of the shape
  underline   string   [add/set/get]   aliases: font.underline
    description: Underline style: 'true'/'single'/'sng', 'double'/'dbl', 'none'/'false'. Bare alias of font.underline.
    example: --prop underline=single
    readback: as emitted by handler (per-format details vary)
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
  direction   enum   [set/get]   aliases: rtl, rightToLeft, righttoleft, sheet.direction
    description: RTL sheet layout (Arabic / Hebrew) — column A renders on the right, column scroll direction inverts. Maps to <sheetView rightToLeft=...>. Canonical key matches Word/PPT.
    values: rtl, ltr
    example: --prop direction=rtl
    example: --prop rightToLeft=true
    readback: rtl when set; absent when default (ltr)
  zoom   number   [get]
    description: sheetView zoom percentage (10-400). Emitted only when non-default (≠100).
    readback: zoom percentage 10-400
  gridlines   bool   [get]
    description: sheetView gridline visibility. Emitted only when hidden (false); default-on is omitted (CONSISTENCY(default-omission)).
    readback: true | false
  headings   bool   [get]
    description: row/column header visibility. Emitted only when hidden (false); default-on is omitted (CONSISTENCY(default-omission)).
    readback: row/column headings visible
  visibility   enum   [get]
    description: workbook-level sheet state when not visible. Emitted alongside hidden=true; absent for default-visible sheets.
    values: hidden, veryHidden
    readback: if hidden
  protect   bool   [set/get]
    description: sheet protection state. On Set: pass `true` to enable protection, `false` to disable. Use the separate `password` property to set/clear an Excel legacy password hash.
    readback: true if sheet protection enabled
  password   string   [set]
    description: Excel legacy password hash for sheet protection (ECMA-376 14.7.1). On Set: pass plaintext password to hash and apply, or `none` to clear. Implicitly enables protection if not already set.
    example: --prop password=secret123
    example: --prop password=none
    readback: n/a (hash not exposed on Get)
  printTitleRows   string   [set]
    description: rows to repeat at top of every printed page (e.g. 1:1).
    example: --prop printTitleRows=1:1
    readback: n/a (set-only)
  printTitleCols   string   [set]
    description: columns to repeat at left of every printed page (e.g. A:A).
    example: --prop printTitleCols=A:A
    readback: n/a (set-only)
  orientation   string   [get]
    description: PageSetup orientation (portrait | landscape). Emitted only when set on the sheet.
    readback: page orientation (portrait|landscape)
  paperSize   number   [get]
    description: PageSetup paper-size code (OOXML enumeration; e.g. 1=Letter, 9=A4).
    readback: OOXML paper size code
  fitToPage   string   [get]
    description: PageSetup fit-to-page width x height (e.g. '1x1' = fit to one page).
    readback: WxH fit-to-page settings
  printArea   string   [set/get]
    description: defined-name _xlnm.Print_Area for this sheet. Get returns the A1 range with the leading 'SheetName!' prefix stripped. On Set: pass an A1 range (e.g. A1:C20) or `none` to clear.
    example: --prop printArea=A1:C20
    example: --prop printArea=none
    readback: A1 range string
  margin.top   string   [get]
    description: PageMargins top margin in inches (e.g. '0.75in').
    readback: margin in inches
  margin.bottom   string   [get]
    description: PageMargins bottom margin in inches.
    readback: margin in inches
  margin.left   string   [get]
    description: PageMargins left margin in inches.
    readback: margin in inches
  margin.right   string   [get]
    description: PageMargins right margin in inches.
    readback: margin in inches
  margin.header   string   [get]
    description: PageMargins header margin in inches (distance from top edge to header).
    readback: margin in inches
  margin.footer   string   [get]
    description: PageMargins footer margin in inches (distance from bottom edge to footer).
    readback: margin in inches
  header   string   [set/get]
    description: odd-page header text (HeaderFooter/OddHeader). Excel format codes (&L, &C, &R, &P, &D, etc.) pass through verbatim.
    readback: raw odd-header text as stored
  footer   string   [set/get]
    description: odd-page footer text (HeaderFooter/OddFooter). Excel format codes pass through verbatim.
    readback: raw odd-footer text as stored
  sort   string   [set/get]
    description: sort the sheet by one or more columns. Set input: comma-separated `Col [dir]` tokens, direction optional, defaults to asc (e.g. `A`, `A asc`, `A asc,B desc`). Use `none` to clear. Get readback: comma-separated `Col:dir` entries (colon-separated, e.g. `A:asc`).
    example: --prop sort=A
    example: --prop sort="A asc,B desc"
    example: --prop sort=none
    readback: comma-separated `Col:asc|desc` list (e.g. `A:asc`)
  rowBreaks   string   [get]
    description: manual horizontal page breaks. Comma-separated row indices (1-based) where each break sits above that row.
    readback: comma-separated row break indices
  colBreaks   string   [get]
    description: manual vertical page breaks. Comma-separated column indices (1-based) where each break sits to the left of that column.
    readback: comma-separated column break indices

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
  field   string   [add/get]   aliases: column
    description: pivot field name. Must match an existing cacheField (case-insensitive). Add-time only — Set ignores this key (slicers are anchored to their cache field at creation).
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
  rowHeight   number   [add/set/get]
    description: row height of each slicer item, in EMU. Default 225425 (~17.5pt).
    example: --prop rowHeight=250000
    readback: row height in EMU
  columnCount   number   [add/set/get]
    description: number of columns in the slicer button grid. Range 1..20000.
    example: --prop columnCount=2
    readback: number of columns
  pivotCacheId   number   [get]
    description: extension pivot cache id (x14 cacheField extension). Read-only — auto-assigned at slicer creation.
    readback: pivot cache index (read-only)
  itemCount   number   [get]
    description: total number of items (buttons) in the slicer cache. Read-only — derived from the pivot's shared items.
    readback: total slicer item count
  cache   string   [get]
    description: slicer cache name (Slicer @cache attribute).
    readback: slicer cache name

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
    readback: "line", "column", or "winLoss" (OOXML stacked maps back as "winLoss")
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
  displayName   string   [add/set/get]
    description: Excel UI display name. Defaults to name.
    example: --prop displayName=SalesData
    readback: display name
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
  columns   string   [add/get]
    description: comma-separated column header names overriding A1, B1, ... defaults.
    example: --prop columns=Name,Qty,Price
    readback: comma-separated column names as stored (e.g. "Name,Qty,Price")
  totalsRowFunction   string   [add]
    description: comma-separated per-column totals row functions (none|sum|average|count|countNums|max|min|stdDev|var|custom). Effective only when totalRow=true.
    example: --prop totalsRowFunction=none,sum,average
    readback: per-column tokens
  totalFunction   string   [get]
    description: per-column totals-row function readback (surfaces on the column child node).
    readback: function token
  totalLabel   string   [get]
    description: per-column totals-row label readback (surfaces on the column child node).
    readback: label text
  name   string   [add/set/get]
    description: NonVisualDrawingProperties Name (used for stable @name addressing).
    example: --prop name=SalesData
    example: --prop name=Summary
    readback: name string
  style   string   [add/set/get]   aliases: tableStyle, tableStyleId
    description: table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, none, or a direct {GUID}.
    values: medium1, medium2, medium3, medium4, light1, light2, light3, dark1, dark2, none
    example: --prop style=medium2
    example: --prop style=light1
    example: --prop style=dark1
    readback: style name when resolvable, else GUID

Note: Aliases: listobject. 'ref' (alias 'range') required: cell range like 'A1:C10'. Rejects ranges that overlap existing tables. Names sanitized; style validated against built-in/custom whitelist.
```

## xlsx Element: topn

```text
xlsx topn
--------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type topn [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  rank   number   [add/get]   aliases: top, bottomN, value
    description: number (or percent) of items to highlight. Default 10. Required >= 1.
    example: --prop rank=10
    readback: integer
  percent   bool   [add/get]
    description: interpret rank as a percentage (true) or absolute count (false, default).
    example: --prop percent=true
    readback: true | false (only emitted when true)
  bottom   bool   [add/get]
    description: highlight bottom-N instead of top-N (default false).
    example: --prop bottom=true
    readback: true | false (only emitted when true)
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFFF00
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Top-N or bottom-N rank conditional formatting. Add via `add /Sheet1/cf --type topn --prop sqref=A1:A100 --prop rank=10`. Aliases for type: top10, top. Lookup: Add.Cf.cs:577 (AddCfExtended `topn` case); Get: Query.cs:545.
```

## xlsx Element: uniquevalues

```text
xlsx uniquevalues
-----------------
Parent: sheet
Paths: /SheetName/cf[N]
Operations: add get

Usage:
  officecli add <file> /SheetName --type uniquevalues [--prop key=val ...]
  officecli get <file> /SheetName/cf[N]

Properties:
  ref   string   [add/get]   aliases: sqref, range
    description: target cell range.
    example: --prop ref=A1:A100
  fill   color   [add]
    description: background fill via dxf.
    example: --prop fill=FFFF00
  font.color   color   [add]
    description: font color via dxf.
    example: --prop font.color=FF0000
  font.bold   bool   [add]
    description: bold via dxf.
    example: --prop font.bold=true
  stopIfTrue   bool   [add]
    description: stop evaluating subsequent CF rules when this rule applies.
    example: --prop stopIfTrue=true
  ruleType   string   [get]
    description: raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
    readback: OOXML rule type token
  cfType   string   [get]
    description: normalized CF type string. Emitted on every CF rule.
    readback: normalized CF type token
  dxfId   number   [get]
    description: differential format id referencing dxf styles. Emitted only when present on the rule.
    readback: integer

Note: Highlight unique values in range. Add via `add /Sheet1/cf --type uniquevalues --prop sqref=A1:A100 --prop fill=FFFF00`. Lookup: Add.Cf.cs:637 (AddCfExtended `uniquevalues` case); Get: Query.cs:570.
```

## xlsx Element: validation

```text
xlsx validation
---------------
Parent: sheet
Paths: /SheetName/dataValidation[N]
Operations: add set get query remove

Usage:
  officecli add <file> /SheetName --type validation [--prop key=val ...]
  officecli set <file> /SheetName/dataValidation[N] --prop key=val ...
  officecli get <file> /SheetName/dataValidation[N]
  officecli query <file> validation
  officecli remove <file> /SheetName/dataValidation[N]

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

Note: Aliases: datavalidation. Target cell range via 'ref'. Type determines which of formula1/formula2 are used. Alias 'validation' accepted in path segments by query/set/remove (e.g. /SheetName/validation[N]); Add and Get echo back the canonical 'dataValidation[N]' form.
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
  defaultFont   string   [-]   aliases: fontName, fontname
    description: default font for all cells (fontname alias). Not implemented in ExcelHandler — Add/Set/Get all return n/a today; manage cell fonts directly.
    example: --prop defaultFont=Calibri
    readback: n/a
  defaultFontSize   length   [-]   aliases: fontSize, fontsize
    description: default font size. Not implemented in ExcelHandler — Add/Set/Get all return n/a today; manage cell fonts directly.
    example: --prop defaultFontSize=11
    readback: n/a
  author   string   [set/get]   aliases: creator
    description: document author (core properties).
    example: --prop author="Alice"
    readback: author string
  title   string   [set/get]
    example: --prop title="Q1 Report"
    readback: title string
  calc.mode   enum   [set/get]   aliases: calcmode
    description: workbook formula calculation mode. 'auto' recalculates on every change, 'manual' requires F9, 'autoExceptTables' skips data tables.
    values: auto, manual, autoExceptTables
    example: --prop calc.mode=manual
    example: --prop calcmode=auto
    readback: calc mode name
  calc.iterate   bool   [set/get]   aliases: iterate
    description: enable iterative calculation for circular references.
    example: --prop calc.iterate=true
    example: --prop iterate=false
    readback: true|false
  calc.iterateCount   number   [set/get]
    description: maximum number of iterations when calc.iterate is enabled.
    example: --prop calc.iterateCount=100
    readback: integer
  calc.iterateDelta   number   [set/get]
    description: maximum change between iterations to consider the calculation converged.
    example: --prop calc.iterateDelta=0.001
    readback: number
  calc.fullPrecision   bool   [set/get]
    description: if true, calculations use full precision rather than the displayed value.
    example: --prop calc.fullPrecision=true
    readback: true|false
  lastModifiedBy   string   [set/get]   aliases: lastmodifiedby
    description: from docProps/core.xml lastModifiedBy field.
    example: --prop lastModifiedBy="Alice"
    readback: author string
  created   string   [get]
    description: creation timestamp ISO-8601.
    readback: ISO-8601 timestamp
  modified   string   [get]
    description: last modification timestamp ISO-8601.
    readback: ISO-8601 timestamp
  extended.application   string   [get]
    description: from docProps/app.xml application identifier (e.g. "Microsoft Excel").
    readback: application string
  category   string   [set/get]
    description: docProps/core.xml Category field.
    example: --prop category=Reports
    readback: category string
  description   string   [set/get]
    description: docProps/core.xml Description field.
    example: --prop description="Annual revenue summary"
    readback: description string
  keywords   string   [set/get]
    description: docProps/core.xml Keywords field.
    example: --prop keywords="finance,2026"
    readback: keyword list string
  revision   string   [set/get]
    description: docProps/core.xml Revision field.
    example: --prop revision=3
    readback: revision number string
  activeTab   number   [get]
    description: workbook BookViews activeTab — index of the sheet active when the file opens.
    readback: integer (0-based)
  firstSheet   number   [get]
    description: workbook BookViews firstSheet — index of the leftmost visible sheet.
    readback: integer (0-based)
  calc.fullCalcOnLoad   bool   [get]
    description: CalculationProperties FullCalculationOnLoad flag — force a full recalc when the workbook opens.
    readback: true|false
  calc.refMode   string   [get]
    description: CalculationProperties ReferenceMode (A1 or R1C1).
    readback: reference mode string
  workbook.backupFile   bool   [get]
    description: WorkbookProperties BackupFile flag — Excel keeps a backup .bak alongside saves.
    readback: true|false
  workbook.codeName   string   [get]
    description: WorkbookProperties CodeName — VBA project workbook codename (e.g. ThisWorkbook).
    readback: codename string
  workbook.date1904   bool   [get]
    description: WorkbookProperties Date1904 flag — true means dates use the 1904 epoch (Mac legacy).
    readback: true|false
  extended.applicationVersion   string   [get]
    description: docProps/app.xml AppVersion field.
    readback: version string
  extended.characters   number   [get]
    description: docProps/app.xml Characters count.
    readback: integer
  extended.company   string   [set/get]
    description: docProps/app.xml Company field.
    readback: company name
  extended.lines   number   [get]
    description: docProps/app.xml Lines count.
    readback: integer
  extended.manager   string   [set/get]
    description: docProps/app.xml Manager field.
    readback: manager name
  extended.pages   number   [get]
    description: docProps/app.xml Pages count.
    readback: integer
  extended.paragraphs   number   [get]
    description: docProps/app.xml Paragraphs count.
    readback: integer
  extended.template   string   [set/get]
    description: docProps/app.xml Template field.
    readback: template name
  extended.totalTime   number   [get]
    description: docProps/app.xml TotalTime field (minutes).
    readback: integer minutes
  extended.words   number   [get]
    description: docProps/app.xml Words count.
    readback: integer
  subject   string   [set/get]
    example: --prop subject=Finance
    readback: subject string
  theme.color.accent1   color   [set/get]
    description: theme accent color 1.
    readback: #RRGGBB or scheme reference
  theme.color.accent2   color   [set/get]
    description: theme accent color 2.
    readback: #RRGGBB or scheme reference
  theme.color.accent3   color   [set/get]
    description: theme accent color 3.
    readback: #RRGGBB or scheme reference
  theme.color.accent4   color   [set/get]
    description: theme accent color 4.
    readback: #RRGGBB or scheme reference
  theme.color.accent5   color   [set/get]
    description: theme accent color 5.
    readback: #RRGGBB or scheme reference
  theme.color.accent6   color   [set/get]
    description: theme accent color 6.
    readback: #RRGGBB or scheme reference
  theme.color.dk1   color   [set/get]
    description: theme color slot dk1 (dark 1 / default text).
    readback: #RRGGBB or scheme reference
  theme.color.dk2   color   [set/get]
    description: theme color slot dk2 (dark 2).
    readback: #RRGGBB or scheme reference
  theme.color.folHlink   color   [set/get]
    description: theme followed-hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.hlink   color   [set/get]
    description: theme hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.lt1   color   [set/get]
    description: theme color slot lt1 (light 1 / default background).
    readback: #RRGGBB or scheme reference
  theme.color.lt2   color   [set/get]
    description: theme color slot lt2 (light 2).
    readback: #RRGGBB or scheme reference
  theme.colorScheme   string   [get]
    description: color scheme name (a:clrScheme/@name).
    readback: color scheme name
  theme.font.major.eastAsia   string   [set/get]
    description: major (heading) East Asian typeface.
    readback: font family name
  theme.font.major.latin   string   [set/get]
    description: major (heading) Latin typeface.
    readback: font family name
  theme.font.minor.eastAsia   string   [set/get]
    description: minor (body) East Asian typeface.
    readback: font family name
  theme.font.minor.latin   string   [set/get]
    description: minor (body) Latin typeface.
    readback: font family name
  theme.fontScheme   string   [get]
    description: font scheme name (a:fontScheme/@name).
    readback: font scheme name
  theme.formatScheme   string   [get]
    description: format scheme name (a:fmtScheme/@name).
    readback: format scheme name
  theme.name   string   [get]
    description: theme display name (a:theme/@name).
    readback: theme name string

Children:
  sheet  (1..n)  /{SheetName}

Note: Root container. Get returns sheet list and workbook-level metadata. Set exists for workbook-wide properties (defaultFont, defaultFontSize, calc.mode, calc.iterate, author, title, subject). Sheets are mutated via /SheetName paths.
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
  transition
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
  direction   string   [set]   aliases: rtl
    description: Chart-level reading direction. rtl stamps a:rtl="1" on chartSpace c:txPr lvl1pPr so default text bodies (axis labels, data labels) render right-to-left for Arabic / Hebrew.
    example: --prop direction=rtl
    readback: rtl|ltr
  id   number   [get]
    description: OOXML chart shape id; source of @id in the stable path /chart[@id=ID].
    readback: integer chart shape id
  name   string   [add/get]
    description: shape name (DocProperties.Name).
    example: --prop name="Sales Chart"
    readback: shape name string
  anchor   string   [add/set]
    description: absolute placement on slide; cm-based 'x,y,w,h' or named anchor token.
    example: --prop anchor=D2:J18
    example: --prop anchor=2cm,3cm,18cm,10cm
  dispunits   string   [add/set]   aliases: displayunits
    description: value-axis display units divisor. Values: none, hundreds, thousands, tenThousands|10000, hundredThousands|100000, millions, tenMillions|10000000, hundredMillions|100000000, billions, trillions.
    example: --prop dispunits=thousands
  x   length   [add/set/get]
    description: absolute X position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop x=2cm
  y   length   [add/set/get]
    description: absolute Y position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop y=3cm
  radarstyle   string   [add/set]
    description: radar chart subtype. Values: standard|line, marker, filled|fill.
    example: --prop radarstyle=filled
  roundedcorners   bool   [add/set]
    description: round the chart-area outer corners.
    example: --prop roundedcorners=true
  valaxisvisible   bool   [add/set]   aliases: valaxis.visible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisvisible=false
  areafill   string   [add/set]   aliases: area.fill
    description: fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.
    example: --prop areafill=4472C4-A5C8FF:90
  autotitledeleted   bool   [add/set]
    description: suppress the auto-generated 'Chart Title' placeholder.
    example: --prop autotitledeleted=true
  axisfont   string   [add/set]   aliases: axis.font
    description: convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options
    example: --prop axisfont=10:8B949E:Helvetica
  axisline   string   [add/set]   aliases: axis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options
    example: --prop axisline=666666:1
  axismax   number   [add/set]   aliases: max
    description: convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismax=1000
    example: --prop axismax=250
  axismin   number   [add/set]   aliases: min
    description: convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level options
    example: --prop axismin=0
  axisnumfmt   string   [add/set]   aliases: axisnumberformat
    description: convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level options
    example: --prop axisnumfmt="#,##0"
  axisorientation   string   [add/set]   aliases: axisreverse
    description: convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options
    example: --prop axisorientation=true
  axisposition   string   [add/set]   aliases: axispos
    description: convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-level options
    example: --prop axisposition=top
  axistitle   string   [add/set]   aliases: vtitle
    description: convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options
    example: --prop axistitle="Revenue"
  axisvisible   bool   [add/set]   aliases: axis.delete, axis.visible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options
    example: --prop axisvisible=false
  bubbleScale   number   [add/set/get]   aliases: bubblescale
    description: bubble chart scale (% of default).
    example: --prop bubblescale=100
    readback: integer percentage
  catAxisVisible   bool   [add/set/get]   aliases: cataxis.visible, cataxisvisible
    description: convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisvisible=false
    readback: true | false
  catTitle   string   [add/set/get]   aliases: htitle, cattitle
    description: category axis title text.
    example: --prop cattitle="Quarter"
    readback: title string
  cataxisline   string   [add/set]   aliases: cataxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for full axis-level options
    example: --prop cataxisline=333333:1
  categories   string   [add/set/get]
    description: comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)
    example: --prop categories=A,B,C
    example: --prop categories="Q1,Q2,Q3,Q4"
    example: --prop categories="Sheet1!$A$2:$A$5"
    readback: comma-separated category labels
  chartFill   color   [get]
    description: chart-level fill color readback.
    readback: #RRGGBB or color descriptor
  chartType   enum   [add/set/get]   aliases: type, col, donut, xy, spider, ohlc, wf, charttype
    values: bar, column, line, pie, doughnut, area, scatter, bubble, radar, stock, combo, waterfall, funnel, treemap, sunburst, boxWhisker, histogram, pareto
    example: --prop chartType=column
    example: --prop chartType=stackedBar
    example: --prop chartType=percentStackedColumn
    example: --prop chartType=column3d
    example: --prop chartType=waterfall
    readback: normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)
  chartareafill   string   [add/set]   aliases: chartfill
    description: chart-area background fill. Solid color, gradient, or 'none'.
    example: --prop chartareafill=FFFFFF
  chartborder   string   [add/set]   aliases: chartarea.border
    description: chart-area outer border line. Same format as plotborder.
    example: --prop chartborder=000000:1
    example: --prop chartborder=none
  colorrule   string   [add/set]   aliases: conditionalcolor, colorRule
    description: conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.
    example: --prop colorrule=0:FF0000:00AA00
  colors   string   [add]
    description: comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) override positions.
    example: --prop colors="4472C4,ED7D31,A5A5A5"
  combosplit   number   [add]
    description: combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.
    example: --prop combosplit=2
  combotypes   string   [add/set]   aliases: combo.types
    description: rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.
    example: --prop combotypes="column,column,line"
  crossBetween   string   [add/set/get]   aliases: crossbetween
    description: category axis cross-between behavior (between / midCat).
    example: --prop crossBetween=between
    example: --prop crossbetween=midcat
    readback: crossBetween token
  crosses   string   [add/set/get]
    description: where the value axis crosses the category axis. Values: autoZero (default), max, min.
    example: --prop crosses=max
    readback: crosses token
  crossesAt   number   [add/set/get]   aliases: crossesat
    description: value-axis crossesAt value readback.
    example: --prop crossesat=0
    readback: numeric value
  data   string   [add]
    description: inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after creation.
    example: --prop data="Sales:10,20,30"
    example: --prop data="Sales:10,20,30;Cost:5,8,12"
    readback: n/a
  dataLabels   string   [add/set/get]   aliases: datalabels, labels
    description: show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also accepts seriesName/categoryName/percentage/values aliases). Position values (outsideEnd/center/insideEnd/insideBase/top/bottom/left/right/bestFit) implicitly enable showVal and apply as dLblPos.
    example: --prop dataLabels=value
    example: --prop dataLabels="value,percent"
    example: --prop dataLabels=outsideEnd
    example: --prop dataLabels=none
    readback: comma-separated flags: value,percent,category,series
  dataRange   string   [add]   aliases: datarange, range
    description: external workbook range source for series; Add-time only.
    example: --prop dataRange=Sheet1!A1:D5
  dataTable   bool   [add/set/get]   aliases: datatable
    description: show data table beneath the chart (with default borders + legend keys).
    example: --prop dataTable=true
    readback: true | false
  decreaseColor   color   [add]
    description: waterfall: negative bar color. Add-time only.
    example: --prop decreaseColor=FF0000
  dispBlanksAs   enum   [set/get]
    description: how empty cells render (gap leaves a hole, zero plots as 0, span connects across).
    values: gap, zero, span
    example: --prop dispBlanksAs=gap
    readback: dispBlanksAs token
  droplines   string   [add/set]
    description: drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.
    example: --prop droplines=true
    example: --prop droplines=808080:0.5
  errbars   string   [add/set]   aliases: errorbars
    description: error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' removes.
    example: --prop errbars=fixedVal:5
    example: --prop errbars=none
    example: --prop errbars=percentage:10
  explosion   number   [add/set/get]   aliases: explode
    description: pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.
    example: --prop explosion=10
    readback: as emitted by handler (per-format details vary)
  firstSliceAngle   number   [add/set/get]   aliases: sliceangle, firstsliceangle
    description: pie/doughnut first slice angle (degrees).
    example: --prop firstsliceangle=90
    readback: integer degrees
  gapdepth   number   [add/set]
    description: depth gap between series in 3D bar/line/area charts (percent).
    example: --prop gapdepth=150
  gapwidth   number   [add/set/get]   aliases: gap
    description: gap between bar/column groups, 0..500 (percent of bar width).
    example: --prop gapwidth=150
    readback: integer 0..500
  gradient   string   [add/set/get]   aliases: gradientfill
    description: gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.
    example: --prop gradient=FF0000-0000FF
    example: --prop gradient=FF0000-00FF00-0000FF:90
    readback: as emitted by handler (per-format details vary)
  gradients   string   [add/set]
    description: per-series gradient fills, semicolon-separated; one entry per series.
    example: --prop gradients="FF0000-0000FF;00FF00-FFFF00"
  gridlines   bool   [add/set/get]   aliases: majorgridlines
    description: value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none' removes.
    example: --prop gridlines=true
    example: --prop gridlines=E0E0E0:0.3
    example: --prop gridlines=none
    readback: true | false
  height   length   [add/set/get]
    description: chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop height=10cm
  hilowlines   string   [add/set]
    description: high-low lines on line/stock chart. Same format as droplines.
    example: --prop hilowlines=true
  holeSize   number   [add/set/get]   aliases: holesize
    description: doughnut hole size readback.
    example: --prop holesize=50
    example: --prop holeSize=50
    readback: integer 10..90 percent
  increaseColor   color   [add]
    description: waterfall: positive bar color. Add-time only.
    example: --prop increaseColor=00AA00
  invertifneg   bool   [add/set]   aliases: invertifnegative
    description: if true, draw negative bars in an inverted (lighter) color.
    example: --prop invertifneg=true
  labelPos   string   [add/set/get]   aliases: labelpos, labelposition
    description: data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bestFit|best|auto, top|t, bottom|b, left|l, right|r. Restrictions: not supported on doughnut/area/radar/stock; pie maps everything to bestFit; stacked series clamp to ctr/inBase/inEnd; combo charts skip entirely.
    example: --prop labelPos=outsideEnd
    readback: OOXML position token: ctr/inEnd/inBase/outEnd/bestFit/t/b/l/r
  labelfont   string   [add/set]
    description: data label text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop labelfont=9:333333:Calibri
  labeloffset   number   [add/set]
    description: category-axis label offset 0..1000 (percent of font height); category axis only.
    example: --prop labeloffset=100
  labelrotation   number   [add/set]   aliases: xaxis.labelrotation, valaxis.labelrotation, yaxis.labelrotation, xaxislabelrotation, valaxislabelrotation, yaxislabelrotation
    description: tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./valaxis.* targets value.
    example: --prop labelrotation=-45
    example: --prop xaxis.labelrotation=30
  leaderlines   bool   [add/set]   aliases: showleaderlines
    description: show/hide leader lines connecting data labels to slices (pie/doughnut).
    example: --prop leaderlines=true
  legend   enum   [add/set/get]
    description: legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and underscore variants accepted.
    values: true, false, none, top, bottom, left, right, topRight, tr
    example: --prop legend=bottom
    example: --prop legend=none
  legend.overlay   bool   [add/set/get]   aliases: legendoverlay
    description: if true, legend overlays the plot area instead of reserving space.
    example: --prop legend.overlay=true
    readback: true | false
  legendFont   string   [add/set/get]   aliases: legendfont, legend.font
    description: legend text font. Format: 'size:color:fontname' (any segment optional).
    example: --prop legendFont=10:CCCCCC:Arial
    example: --prop legendFont=9:808080
    readback: size:color:fontname
  linedash   string   [add/set]   aliases: dash
    description: line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.
    example: --prop linedash=dash
  linewidth   number   [add/set]
    description: line width in points (applies to every series line).
    example: --prop linewidth=2
  logbase   number   [add/set]   aliases: logscale, yaxisscale
    description: value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log scale.
    example: --prop logbase=10
    example: --prop logscale=true
    example: --prop yaxisscale=linear
  majorTickMark   string   [add/set/get]   aliases: majortick, majortickmark
    description: major tick mark style (out / in / cross / none).
    example: --prop majorTickMark=out
    example: --prop majortickmark=out
    readback: tick mark token
  majorunit   number   [add/set]
    description: value-axis major gridline / tick spacing.
    example: --prop majorunit=200
    example: --prop majorunit=50
  marker   string   [add/set]   aliases: markers
    description: marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or 'symbol:size:color'. Symbols: none, auto, circle, square, diamond, triangle, x, plus, star, dash, dot, picture. Chart-level Get does not surface marker because applicability is chart-type-conditional — read per-series via /chart[N]/series[K] (chart-series schema declares marker get:true).
    example: --prop marker=circle
    example: --prop marker=square:8:FF0000
    readback: as emitted by handler (per-format details vary)
  markersize   number   [add/set]
    description: marker size 2..72 (line/scatter/radar series only).
    example: --prop markersize=8
  minorGridlines   bool   [add/set/get]   aliases: minorgridlines
    description: value-axis minor gridlines; same format as gridlines.
    example: --prop minorGridlines=true
    example: --prop minorGridlines=F0F0F0:0.25
    readback: true | false
  minorTickMark   string   [add/set/get]   aliases: minortick, minortickmark
    description: minor tick mark style (out / in / cross / none).
    example: --prop minorTickMark=none
    example: --prop minortickmark=in
    readback: tick mark token
  minorunit   number   [add/set]
    description: value-axis minor gridline / tick spacing.
    example: --prop minorunit=50
    example: --prop minorunit=10
  overlap   number   [add/set/get]
    description: bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).
    example: --prop overlap=0
    example: --prop overlap=100
    readback: as emitted by handler (per-format details vary)
  plotFill   color   [add/set/get]   aliases: plotareafill, plotfill
    description: plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.
    example: --prop plotFill=FAFAFA
    example: --prop plotareafill=FAFAFA
    example: --prop plotFill=none
    readback: #RRGGBB or color descriptor
  plotborder   string   [add/set]   aliases: plotarea.border
    description: plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.
    example: --prop plotborder=CCCCCC:0.5
    example: --prop plotborder=none
  plotvisonly   bool   [add/set]   aliases: plotvisibleonly
    description: if true, skip plotting hidden worksheet rows/columns.
    example: --prop plotvisonly=true
  preset   string   [add/set]   aliases: theme, style.preset
    description: named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).
    example: --prop preset=minimal
    example: --prop preset=corporate
    example: --prop preset=dark
  referenceline   string   [add/set]   aliases: refline, targetline
    description: horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'. Pass 'none' to remove.
    example: --prop referenceline=100:FF0000:Target
    example: --prop referenceline=none
    example: --prop refline=80:00AA00
  scatterstyle   string   [add/set]
    description: scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.
    example: --prop scatterstyle=smoothMarker
  secondaryaxis   string   [add/set]   aliases: secondary
    description: comma-separated 1-based series indices to plot on a secondary value axis.
    example: --prop secondaryaxis=2
    example: --prop secondary="2,3"
  seriesoutline   string   [add/set]   aliases: series.outline
    description: series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.
    example: --prop seriesoutline=000000:0.5
    example: --prop seriesoutline=none
  seriesshadow   string   [add/set]   aliases: series.shadow
    description: outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.
    example: --prop seriesshadow=000000-5-45-3-50
    example: --prop seriesshadow=none
  serlines   string   [add/set]   aliases: serieslines
    description: series lines on stacked bar charts (true/false).
    example: --prop serlines=true
  shape   string   [add/set]   aliases: barshape
    description: 3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.
    example: --prop shape=cylinder
  showMarker   bool   [set/get]
    description: show markers on line/scatter series at chart level.
    example: --prop showMarker=true
    readback: true | false
  shownegbubbles   bool   [add/set]
    description: render negative-valued bubbles. Bubble charts only.
    example: --prop shownegbubbles=true
  sizerepresents   string   [add/set]
    description: how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.
    example: --prop sizerepresents=area
  smooth   bool   [add/set/get]
    description: smooth lines on line/scatter charts. Reported unsupported for other chart types.
    example: --prop smooth=true
    readback: as emitted by handler (per-format details vary)
  style   number   [add/set/get]   aliases: styleid
    description: built-in chart style id 1..48; pass 'none' to clear.
    example: --prop style=2
    readback: as emitted by handler (per-format details vary)
  tickLabelPos   string   [add/set/get]   aliases: ticklabelposition, ticklabelpos
    description: tick label position (high / low / nextTo / none).
    example: --prop tickLabelPos=nextTo
    example: --prop ticklabelpos=low
    readback: tick label position token
  ticklabelskip   number   [add/set]   aliases: tickskip
    description: draw tick labels every Nth category (category axis).
    example: --prop ticklabelskip=2
  title   string   [add/set/get]
    description: chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.color, title.bold when set; these are get-only readback fields surfaced from chart title runs.
    example: --prop title="Q1"
    example: --prop title="2024 Sales"
    example: --prop title=none
    readback: chart title
  title.bold   bool   [get]
    description: title bold flag (readback only)
    readback: true | false
  title.color   color   [get]
    description: title font color (readback only, #RRGGBB)
    readback: #RRGGBB
  title.font   string   [get]
    description: title font name (readback only)
    readback: font name
  title.size   font-size   [get]
    description: title font size (readback only, e.g. 14pt)
    readback: Npt
  totalColor   color   [add]
    description: waterfall: subtotal/total bar color. Add-time only.
    example: --prop totalColor=4472C4
  transparency   number   [add/set]   aliases: opacity, alpha
    description: series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=70).
    example: --prop transparency=30
    example: --prop opacity=70
  trendline   string   [add/set/get]
    description: add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponential, log|logarithmic, poly|polynomial, power, movingAvg|moving|movingAverage. Order applies to poly/movingAvg. Pass 'none' to clear.
    example: --prop trendline=linear
    example: --prop trendline=poly:3
    example: --prop trendline=none
    example: --prop trendline=movingAvg:3
    readback: as emitted by handler (per-format details vary)
  updownbars   string   [add/set]
    description: up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.
    example: --prop updownbars=true
    example: --prop updownbars=150:00AA00:FF0000
  valaxisline   string   [add/set]   aliases: valaxis.line
    description: convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full axis-level options
    example: --prop valaxisline=333333:1
  varyColors   bool   [set/get]
    description: vary colors by data point (single-series charts).
    example: --prop varyColors=true
    readback: true | false
  view3d   string   [add/set/get]   aliases: camera, perspective
    description: 3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key form (rotX=...) is rejected.
    example: --prop view3d=15,20,30
    example: --prop view3d=20
    example: --prop perspective=30
    readback: as emitted by handler (per-format details vary)
  width   length   [add/set/get]
    description: chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.
    example: --prop width=18cm
    example: --prop width=15cm

Children:
  chart-title  (0..1)  /title
  chart-legend  (0..1)  /legend
  chart-plotArea  (0..1)  /plotArea
  chart-axis  (0..n)  /axis
  chart-series  (1..n)  /series

Note: source of truth: Core/Chart/ChartHelper.cs ParseChartType() for the classic (c:chart) family, Core/Chart/ChartExBuilder.cs IsExtendedChartType() for the extended (cx:chart) family. Adding a new chartType value MUST update both the handler and this file in the same PR — contract tests enforce equivalence. Axis configuration: chart-level axis* props (axismin, axismax, axistitle, axisfont, ...) are Add-time only; for post-creation axis Set/Get use the chart-axis element.
```

## pptx Element: chart-axis

```text
pptx chart-axis
---------------
Parent: chart
Addressing: /slide[N]/chart[N]/axis[@role=ROLE]
  role values: category, value, value2, series
Operations: set get

Properties:
  dispUnits   enum   [set/get]
    description: display units for value axis labels. Applies to role=value|value2.
    values: hundreds, thousands, tenThousands, hundredThousands, millions, tenMillions, hundredMillions, billions, trillions
    example: --prop dispUnits=thousands
    readback: display unit token
  majorUnit   number   [set/get]
    description: major tick interval on the value axis. Applies to role=value|value2.
    example: --prop majorUnit=20
    readback: numeric interval
  minorUnit   number   [set/get]
    description: minor tick interval on the value axis. Applies to role=value|value2.
    example: --prop minorUnit=5
    readback: numeric interval
  axisFont   string   [get]
    description: axis text font readback.
    readback: font name string
  axisMax   number   [get]
    description: value-axis maximum readback (also surfaced via max on axis-by-role path).
    readback: numeric value
  axisMin   number   [get]
    description: value-axis minimum readback (also surfaced via min on axis-by-role path).
    readback: numeric value
  axisNumFmt   string   [get]
    description: axis number format string.
    readback: format code
  axisOrientation   string   [get]
    description: axis scaling orientation (e.g. maxMin when reversed).
    readback: orientation token
  axisTitle   string   [get]
    description: value-axis title readback (chart-level convenience; axis-by-role uses 'title').
    readback: title string
  format   string   [set/get]
    description: number format string
    example: --prop format="#,##0"
    example: --prop format="#,##0.00"
  labelOffset   number   [get]
    description: category axis label offset (% of default 100).
    readback: integer percentage
  labelRotation   number   [set/get]
    description: tick label rotation in degrees
    example: --prop labelRotation=-45
  logBase   number   [set/get]
    description: logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop logBase=10
    readback: number (e.g. 10)
  majorGridlines   bool   [set/get]
    description: show or hide major gridlines. Applies to all roles.
    example: --prop majorGridlines=true
  max   number   [set/get]
    description: maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop max=1000
    example: --prop max=250
  min   number   [set/get]
    description: minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.
    example: --prop min=0
  minorGridlines   bool   [set/get]
    description: show or hide minor gridlines. Applies to all roles.
    example: --prop minorGridlines=false
  tickLabelSkip   number   [get]
    description: category axis label skip interval (>1 means tick labels are sparser).
    readback: integer interval
  title   string   [set/get]
    description: axis title text. Applies to all roles (category, value). Pass 'none' to remove.
    example: --prop title="Revenue"
    example: --prop title="Quarter"
  visible   bool   [set/get]
    description: show or hide the axis. Applies to all roles.
    example: --prop visible=false

Note: Axes are created/destroyed implicitly by chartType changes, not via Add/Remove on axis directly. Set/Get only operate on axes that already exist. Add-time configuration: use the chart element's axis* props (axismin, axismax, axistitle, axisfont, ...) when creating the chart; chart-axis covers post-creation Set/Get. `labelFont`, `lineWidth`, `lineDash` are not yet supported on axis-by-role paths. `lineWidth`/`lineDash` Set on a chart-axis path currently apply to all series in the plot area; `labelFont` writes the axis title run, not tick labels. Use chart-series schema for series line styling.
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
  alpha   number   [get]
    description: series fill alpha readback in OOXML units (0..100000 = 0..100%). Distinct from chart-level `transparency` which is the percent input on Add/Set.
    readback: integer 0..100000 (OOXML alpha units)
  outlineColor   color   [get]
    description: per-series outline color readback.
    readback: #RRGGBB or scheme reference
  categories   string   [add/set/get]
    description: per-series category override; range reference only.
    example: --prop series1.categories="Sheet1!$A$2:$A$5"
    readback: as emitted by handler (per-format details vary)
  categoriesRef   string   [get]
    description: A1 cell range backing the category labels.
    readback: A1 range string
  color   color   [add/set/get]
    description: series fill color.
    example: --prop series1.color=#4472C4
    example: --prop series1.color=4472C4
    readback: #-prefixed uppercase hex
  dataLabels.numFmt   string   [get]
    description: per-series data label number format readback.
    readback: format code
  dataLabels.separator   string   [get]
    description: per-series data label separator string readback.
    readback: separator string
  errBars   string   [get]
    description: error bar value type token (e.g. cust, fixedVal, stdDev).
    readback: OOXML errValType token
  invertIfNeg   bool   [get]
    description: invert color for negative values (per-series readback).
    readback: true | false
  lineDash   enum   [set/get]   aliases: dash
    description: series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash/sysDot/sysDashDot/lgDash). 'solid' is the only round-trip-stable value.
    values: solid, sysDash, sysDot, sysDashDot, lgDash, lgDashDot, lgDashDotDot, dash, dashDot, dot, longDash
    example: --prop lineDash=dash
    example: --prop lineDash=solid
    readback: OOXML preset dash token
  lineWidth   number   [set/get]
    description: series line width in points (e.g. 1.5).
    example: --prop lineWidth=1.5
    readback: numeric width in points
  marker   string   [set/get]
    description: per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports 'symbol:size:COLOR' compound form (e.g. 'circle:8:FF0000'). Applies to line/scatter/radar series.
    example: --prop marker=circle
    example: --prop marker="circle:8:FF0000"
    readback: marker symbol name
  markerSize   number   [set/get]
    description: marker size in points (2–72). Applies when marker is not 'none'.
    example: --prop markerSize=8
    readback: integer
  name   string   [add/set/get]   aliases: title
    description: series name shown in legend and data labels.
    example: --prop name="Q1"
    example: --prop series1.name="Q1"
    example: --prop name="Product A"
    example: --prop series1.name="Product A"
    example: --prop name="Revenue"
    example: --prop series1.name="Revenue"
    readback: series name string
  nameRef   string   [get]
    description: A1 cell reference backing the series name.
    readback: A1 cell reference
  scatterStyle   string   [get]
    description: scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
    readback: OOXML scatterStyle token
  secondaryAxis   bool   [get]
    description: true when the chart has more than one value axis (this series uses the secondary).
    readback: true | false
  smooth   bool   [set/get]
    description: smooth line interpolation for line/scatter series.
    example: --prop smooth=true
    readback: true | false
  values   string   [add/set/get]
    description: comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)
    example: --prop series1.values="120,150,180"
    example: --prop series1.values="Sheet1!$B$2:$B$5"
    example: --prop series1.values="120,150,180,210"

Note: At Add time, series are usually passed as properties of the parent `chart` element using dotted keys (series1.name, series1.values, series1.color, series1.categories). This element represents per-series Set/Get after the chart exists. Combo charts (mixed chartType per series, or secondary axis) are not supported. Create a separate chart for each chart type. lineWidth (line width in pt) and lineDash (solid/dash/dot/dashDot/longDash) are available on line/scatter series; `lineStyle` is not a recognized key (rejected as UNSUPPORTED — use lineWidth/lineDash instead).
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
  index   int   [get]
    description: Per-author monotonic index, assigned by the engine.
    readback: comment index
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: length in cm (e.g. "2cm")
  direction   string   [add]   aliases: dir, rtl
    description: Reading direction for the comment text. rtl prepends U+200F (RIGHT-TO-LEFT MARK) so Arabic / Hebrew comments render with proper bidi context. p:cm has no native rtl attribute, so this is the standard pure-text convention.
    example: --prop direction=rtl
    readback: rtl|ltr
  date   string   [add/set/get]
    description: ISO-8601 timestamp. Defaults to DateTime.UtcNow.
    example: --prop date=2025-01-15T10:30:00Z
    example: --prop date=2025-01-15T10:00:00Z
    readback: Date attribute
  initials   string   [add/set/get]
    description: author initials. Defaults to derived from author name when omitted.
    example: --prop initials=AT
    example: --prop initials=AW
    readback: initials
  author   string   [add/set/get]
    example: --prop author="Alice"
    readback: Author attribute
  text   string   [add/set/get]
    description: comment body. Required.
    example: --prop text="Check formula"
    example: --prop text="Reword this bullet"
    example: --prop text="Review this"
    readback: concatenated text

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
    description: Connector geometry preset. Add/Set accept the short names (straight, elbow, curve) or OOXML full names (straightConnector1, bentConnector2, bentConnector3, curvedConnector2, curvedConnector3 — bent/curved 2-segment forms map to the 3-segment primitive). Get readback returns the OOXML full name.
    values: straight, elbow, curve
    example: --prop shape=straight
    example: --prop shape=elbow
    example: --prop shape=curve
    readback: OOXML preset full name (straightConnector1, bentConnector3, curvedConnector3)
  from   string   [add/set]
    description: start-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as returned by 'query shape'). Reverse path resolution is not implemented.
    example: --prop from=/slide[1]/shape[1]
    example: --prop from=/slide[1]/shape[@id=10001]
    readback: see startShape/endShape get-only properties for resolved endpoint shape ids
  to   string   [add/set]
    description: end-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as returned by 'query shape'). Reverse path resolution is not implemented.
    example: --prop to=/slide[1]/shape[2]
    example: --prop to=/slide[1]/shape[@id=10002]
    readback: see startShape/endShape get-only properties for resolved endpoint shape ids
  x   length   [add/set/get]
    example: --prop x=1in
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=1in
    readback: length in cm (e.g. "2cm")
  width   length   [add/set/get]
    example: --prop width=2in
    readback: length in cm (e.g. "2cm")
  height   length   [add/set/get]
    example: --prop height=1in
    readback: length in cm (e.g. "2cm")
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
  id   number   [get]
    description: OOXML shape id; source of the @id in the stable path /connector[@id=ID].
    readback: integer shape id
  name   string   [add/set/get]
    description: connector name
    example: --prop name="Arrow1"
    readback: plain string
  startShape   number   [get]
    description: shape id of the start connection endpoint.
    readback: integer shape id
  startIdx   number   [get]
    description: connection point index on start shape (0-based; omitted when 0).
    readback: integer
  endShape   number   [get]
    description: shape id of the end connection endpoint.
    readback: integer shape id
  endIdx   number   [get]
    description: connection point index on end shape (0-based; omitted when 0).
    readback: integer

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
    description: comma-separated shape indices (1,2,3) or paths (/slide[N]/shape[M] or /slide[N]/shape[@id=ID]). Required.
    example: --prop shapes=1,2
    readback: n/a (structural)
  name   string   [add/set/get]
    description: group name. Defaults to 'Group N'.
    example: --prop name="Logos"
    readback: name string
  zorder   number   [-]
    description: 1-based z-order in slide shape tree.
    readback: 1-based integer (1 = back)
  x   length   [get]
    description: horizontal offset (group origin). Readback in cm via EmuConverter.
    readback: length in cm (e.g. "2cm")
  y   length   [get]
    description: vertical offset.
    readback: length in cm
  width   length   [get]
    description: group bounding box width.
    readback: length in cm
  height   length   [get]
    description: group bounding box height.
    readback: length in cm

Note: Groups existing shapes on a slide. 'shapes' takes comma-separated shape indices or DOM paths. Group bounding box auto-computed from member transforms. Shapes inside a group are addressable via /slide[N]/group[M]/shape[K] for direct Set/Get. zorder is emitted only when the group appears as a child in slide Query results, not via direct Get on /slide[N]/group[N]. This is a known C# Query/Get inconsistency.
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
  src   string   [add/set]   aliases: path
    description: media source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key (no Format["src"] or Format["relId"] is emitted for media).
    example: --prop src=/path/to/video.mp4
    readback: add-time only; not surfaced in Get.
  poster   string   [add/set]
    description: custom thumbnail image path.
    example: --prop poster=/path/to/thumb.png
    readback: n/a
  x   length   [add/set/get]
    example: --prop x=1in
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=1in
    readback: length in cm (e.g. "2cm")
  width   length   [add/set/get]
    example: --prop width=4in
    readback: length in cm (e.g. "2cm")
  height   length   [add/set/get]
    example: --prop height=3in
    readback: length in cm (e.g. "2cm")
  volume   int   [add/set/get]
    description: playback volume 0-100.
    example: --prop volume=80
    readback: volume percent
  autoPlay   bool   [add/set/get]   aliases: autoplay
    example: --prop autoPlay=true
    readback: true/false
  trimStart   string   [add/set/get]   aliases: trimstart
    description: trim from media start (e.g. '00:00:01.500' or millisecond count). Alias: trimstart.
    example: --prop trimStart=00:00:01.500
    readback: OOXML trim Start string
  trimEnd   string   [add/set/get]   aliases: trimend
    description: trim from media end. Alias: trimend.
    example: --prop trimEnd=00:00:10.000
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
  src   string   [add/set]   aliases: path
    description: .glb source (file path, URL, data-URI). Non-glb rejected. Accepted on add/set only; Get does NOT surface this key (no Format["src"] or Format["relId"] is emitted for model3d).
    example: --prop src=/path/to/model.glb
    readback: add-time only; not surfaced in Get.
  x   length   [add/set/get]   aliases: left
    example: --prop x=2cm
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]   aliases: top
    example: --prop y=2cm
    readback: length in cm (e.g. "2cm")
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: length in cm (e.g. "2cm")
  height   length   [add/set/get]
    example: --prop height=10cm
    readback: length in cm (e.g. "2cm")

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
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: length in cm (e.g. "2cm")
  contentType   string   [get]
    description: MIME type of the embedded part.
    readback: MIME type string
  fileSize   number   [get]
    description: embedded payload bytes.
    readback: integer byte count
  objectType   string   [get]
    description: OLE object type marker (always 'ole').
    readback: literal string 'ole'
  height   length   [add/set/get]
    example: --prop height=8cm
    example: --prop height=2in
    readback: unit-qualified length from inline style (e.g. "5cm")
  width   length   [add/set/get]
    example: --prop width=10cm
    example: --prop width=3in
    readback: unit-qualified length from inline style (e.g. "5cm")
  preview   string   [add]
    description: preview thumbnail image source. Add-time only — Set ignores this key.
    example: --prop preview=/path/to/thumb.png
    readback: n/a
  progId   string   [add/set/get]   aliases: progid
    description: OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.
    example: --prop progId=Word.Document.12
    example: --prop progId=Excel.Sheet.12
    readback: ProgID string
  src   string   [add/set]   aliases: path
    description: embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/data.docx
    example: --prop src=/path/to/data.xlsx
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded relationship.

Note: Aliases: oleobject, object, embed. Binary package + preview image. Position via x/y/width/height (EMU-parseable; readback in cm).
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
  mediaType   string   [get]
    description: logical media kind derived from VideoFromFile / AudioFromFile presence under the picture. One of `picture`, `video`, `audio`. Surfaces only via the `image`/`video`/`audio`/`media` selectors.
    readback: `picture` | `video` | `audio`
  x   length   [add/set/get]
    description: x offset in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop x=0
    example: --prop x=1in
    readback: length string (FormatEmu)
  y   length   [add/set/get]
    description: y offset in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop y=0
    example: --prop y=1in
    readback: length string (FormatEmu)
  width   length   [add/set/get]
    description: width — EMU/length form (e.g. 1.5cm). Required if not inferred from native ratio.
    example: --prop width=5
    example: --prop width=3in
    readback: length string
  height   length   [add/set/get]
    description: height — EMU/length form (e.g. 1.5cm). Required if not inferred from native ratio.
    example: --prop height=5
    example: --prop height=2in
    readback: length string
  crop   string   [add/set/get]
    description: Crop in percent (0-100). 1 value = symmetric, 2 values = vertical,horizontal, 4 values = left,top,right,bottom.
    example: --prop crop=10
    example: --prop crop=5,10
    example: --prop crop=10,5,10,5
    readback: as emitted by handler (per-format details vary)
  cropBottom   string   [add/set]   aliases: cropbottom
    description: Crop from bottom edge as percent (0-100). Aliases: cropbottom.
    example: --prop cropBottom=10
  cropLeft   string   [add/set]   aliases: cropleft
    description: Crop from left as fraction (<=1) or percent (>1). E.g. cropLeft=0.1 or cropLeft=10 both mean 10%.
    example: --prop cropLeft=0.1
    example: --prop cropLeft=10
  cropRight   string   [add/set]   aliases: cropright
    description: Crop from right edge as percent (0-100). Aliases: cropright.
    example: --prop cropRight=10
  cropTop   string   [add/set]   aliases: croptop
    description: Crop from top edge as percent (0-100). Aliases: croptop.
    example: --prop cropTop=10
  name   string   [add/get]
    description: Override the auto-generated 'Picture {id}' label on cNvPr @name.
    example: --prop name="hero-image"
    example: --prop name="Hero Image"
    readback: shape name string
  id   number   [get]
    description: OOXML shape id; source of the @id in the stable path /picture[@id=ID].
    readback: integer shape id
  alt   string   [add/set/get]   aliases: altText, alttext, description
    description: alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.
    example: --prop alt="Logo"
    example: --prop alt="Company logo"
    readback: string
  contentType   string   [get]
    description: OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced by the BlipFill embed relationship.
    readback: MIME-style content-type string from the image part
  fileSize   number   [get]
    description: embedded image file size in bytes (length of the image part stream).
    readback: byte length of the embedded image part
  src   string   [add/set]   aliases: path
    description: image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relationship id is exposed under a separate Format["relId"] key.
    example: --prop src=/path/to/image.png
    readback: add/set-only input; not echoed by Get. Use Format["relId"] to inspect the embedded image relationship.

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
  phIndex   number   [get]
    description: placeholder index within the slide layout (PlaceholderShape/@idx). Disambiguates same-typed placeholders (e.g. two `body` placeholders).
    readback: non-negative integer; key omitted when @idx absent
  effective.direction   enum   [get]
    description: resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' is set directly on the placeholder.
    values: rtl, ltr
    readback: rtl | ltr
  effective.size   length   [get]
    description: resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set directly on the placeholder.
    readback: unit-qualified pt (e.g. "18pt")
  effective.font   string   [get]
    description: resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set directly on the placeholder.
    readback: font name
  effective.color   color   [get]
    description: resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set directly on the placeholder.
    readback: #-prefixed uppercase hex (scheme colors pass through)
  effective.bold   bool   [get]
    description: resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on the placeholder.
    readback: true/false
  isTitle   bool   [get]
    description: true when the shape is the title placeholder (phType=title or ctrTitle).
    readback: true on title placeholders
  inheritedFrom   string   [get]
    description: placeholder inheritance source — `layout` when the placeholder definition lives on the parent slide layout (not the slide itself).
    readback: `layout` when inherited

Note: Aliases: ph. Inserts a Shape with PlaceholderShape nonVisual properties — geometry comes from the slide layout. Add returns /slide[N]/shape[M] path (placeholder is a shape at the OOXML layer).

effective.* keys (direction, size, font, color, bold) are read-only resolved values walked up the placeholder→layout→master→presentation defaults inheritance chain. They appear only when the direct key is absent on this placeholder; once a direct value is set, the corresponding effective.* is suppressed. There are no .src counterparts (the implementation does not emit them).
```

## pptx Element: presentation

```text
pptx presentation
-----------------
Read-only container (never created or removed via CLI).
Paths: /
Operations: set get query

Usage:
  officecli get <file> /
  officecli query <file> presentation

Properties:
  title   string   [set/get]
    example: --prop title="Q4 Review"
    readback: title string
  author   string   [set/get]   aliases: creator
    example: --prop author="Alice"
    readback: author string
  keywords   string   [set/get]
    example: --prop keywords="tag1,tag2"
    readback: keywords string
  description   string   [set/get]
    example: --prop description="Abstract"
    readback: description string
  category   string   [set/get]
    example: --prop category=Marketing
    readback: category string
  lastModifiedBy   string   [set/get]   aliases: lastmodifiedby
    example: --prop lastModifiedBy="Bob"
    readback: last-modified author
  revision   string   [set/get]
    example: --prop revision=3
    readback: revision string
  created   string   [get]
    description: creation timestamp from docProps/core.xml.
    readback: ISO 8601 timestamp
  modified   string   [get]
    description: last-modified timestamp from docProps/core.xml.
    readback: ISO 8601 timestamp
  slideWidth   string   [get]
    description: slide width from <p:sldSz/@cx>, formatted via FormatEmu.
    readback: unit-qualified length string (e.g. '25.4cm', '720pt')
  slideHeight   string   [get]
    description: slide height from <p:sldSz/@cy>, formatted via FormatEmu.
    readback: unit-qualified length string (e.g. '19.05cm', '540pt')
  slideSize   string   [get]
    description: slide size preset name derived from <p:sldSz/@type>.
    readback: preset name: widescreen | standard | 16:10 | a4 | a3 | letter | b4 | b5 | 35mm | overhead | banner | ledger | custom
  defaultFont   string   [get]
    description: default minor (body) font from the first slide master's theme FontScheme.
    readback: default text font family name
  extended.application   string   [get]
    description: from docProps/app.xml application identifier (e.g. "Microsoft PowerPoint").
    readback: application string
  compatMode   bool   [get]
    description: presentation @compatMode flag — true when the file is in legacy-compatibility mode.
    readback: true when compat mode is on
  firstSlideNum   number   [get]
    description: presentation @firstSlideNum — slide number of the first slide (default 1).
    readback: integer
  print.colorMode   string   [get]
    description: PrintingProperties color mode (e.g. clr | gray | bw).
    readback: color mode token
  print.frameSlides   bool   [get]
    description: PrintingProperties FrameSlides flag — print a thin border around each slide.
    readback: true when set
  print.hiddenSlides   bool   [get]
    description: PrintingProperties HiddenSlides flag — include hidden slides in printed output.
    readback: true when set
  extended.applicationVersion   string   [get]
    description: docProps/app.xml AppVersion field.
    readback: version string
  extended.characters   number   [get]
    description: docProps/app.xml Characters count.
    readback: integer
  extended.company   string   [set/get]
    description: docProps/app.xml Company field.
    readback: company name
  extended.lines   number   [get]
    description: docProps/app.xml Lines count.
    readback: integer
  extended.manager   string   [set/get]
    description: docProps/app.xml Manager field.
    readback: manager name
  extended.pages   number   [get]
    description: docProps/app.xml Pages count.
    readback: integer
  extended.paragraphs   number   [get]
    description: docProps/app.xml Paragraphs count.
    readback: integer
  extended.template   string   [set/get]
    description: docProps/app.xml Template field.
    readback: template name
  extended.totalTime   number   [get]
    description: docProps/app.xml TotalTime field (minutes).
    readback: integer minutes
  extended.words   number   [get]
    description: docProps/app.xml Words count.
    readback: integer
  subject   string   [set/get]
    example: --prop subject=Finance
    readback: subject string
  theme.color.accent1   color   [set/get]
    description: theme accent color 1.
    readback: #RRGGBB or scheme reference
  theme.color.accent2   color   [set/get]
    description: theme accent color 2.
    readback: #RRGGBB or scheme reference
  theme.color.accent3   color   [set/get]
    description: theme accent color 3.
    readback: #RRGGBB or scheme reference
  theme.color.accent4   color   [set/get]
    description: theme accent color 4.
    readback: #RRGGBB or scheme reference
  theme.color.accent5   color   [set/get]
    description: theme accent color 5.
    readback: #RRGGBB or scheme reference
  theme.color.accent6   color   [set/get]
    description: theme accent color 6.
    readback: #RRGGBB or scheme reference
  theme.color.dk1   color   [set/get]
    description: theme color slot dk1 (dark 1 / default text).
    readback: #RRGGBB or scheme reference
  theme.color.dk2   color   [set/get]
    description: theme color slot dk2 (dark 2).
    readback: #RRGGBB or scheme reference
  theme.color.folHlink   color   [set/get]
    description: theme followed-hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.hlink   color   [set/get]
    description: theme hyperlink color.
    readback: #RRGGBB or scheme reference
  theme.color.lt1   color   [set/get]
    description: theme color slot lt1 (light 1 / default background).
    readback: #RRGGBB or scheme reference
  theme.color.lt2   color   [set/get]
    description: theme color slot lt2 (light 2).
    readback: #RRGGBB or scheme reference
  theme.colorScheme   string   [get]
    description: color scheme name (a:clrScheme/@name).
    readback: color scheme name
  theme.font.major.eastAsia   string   [set/get]
    description: major (heading) East Asian typeface.
    readback: font family name
  theme.font.major.latin   string   [set/get]
    description: major (heading) Latin typeface.
    readback: font family name
  theme.font.minor.eastAsia   string   [set/get]
    description: minor (body) East Asian typeface.
    readback: font family name
  theme.font.minor.latin   string   [set/get]
    description: minor (body) Latin typeface.
    readback: font family name
  theme.fontScheme   string   [get]
    description: font scheme name (a:fontScheme/@name).
    readback: font scheme name
  theme.formatScheme   string   [get]
    description: format scheme name (a:fmtScheme/@name).
    readback: format scheme name
  theme.name   string   [get]
    description: theme display name (a:theme/@name).
    readback: theme name string

Children:
  slide  (0..n)  /slide
  slidemaster  (1..n)  /slidemaster
  theme  (1)  /theme

Note: Root container. Get returns the presentation node with slide count + theme/master/layout references as children. Not addressable via Add. Set on '/' exposes core document metadata (title/author/subject/keywords/description/category) — written to docProps/core.xml, same source as docx/xlsx. Element-level mutations go through /slide[N], /theme, etc.
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
  opacity   number   [add/set/get]
    description: fill opacity (0.0 - 1.0). Requires a fill to attach to — opacity alone (without fill/gradient/pattern) has no effect in OOXML.
    example: --prop opacity=0.5 --prop fill=FF0000
    readback: number in [0, 1]
  geometry   string   [add/set/get]   aliases: preset, shape
    description: Preset shape geometry (default: rect).
    values: rect, roundRect, ellipse, triangle, diamond, parallelogram, rightArrow, star5
    example: --prop geometry=ellipse
    example: --prop preset=roundRect
    readback: preset name (e.g. "ellipse", "roundRect")
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
    readback: rtl (ltr is the default and is suppressed; clearing direction removes the attribute)
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
  spacing   number   [add/set/get]   aliases: spc, charspacing, letterspacing
    description: character spacing in 1/100 pt (drawingML rPr/@spc).
    example: --prop spacing=200
    readback: integer
  kern   number   [add/set]
    description: minimum kerning size in 1/100 pt (drawingML rPr/@kern). Add/Set only — Get does not surface this back today.
    example: --prop kern=1200
    readback: n/a
  autoFit   enum   [add/set/get]   aliases: autofit
    description: text body auto-fit mode. 'normal' shrinks text to fit; 'shape' resizes the shape to fit text; 'none' overflows. Aliases on Set: true/shrink → normal, resize → shape, false → none.
    values: normal, shape, none
    example: --prop autoFit=normal
    example: --prop autoFit=shape
    example: --prop autoFit=none
    readback: normal | shape | none
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
  gradient   string   [add/set/get]
    description: gradient fill spec. Linear: 'C1-C2[-ANGLE]' or 'LINEAR;C1;C2;ANGLE'. Radial: 'radial:C1-C2[-FOCUS]' (focus: tl/tr/bl/br/center). Path: 'path:C1-C2[-FOCUS]'. Per-stop position: 'C@PCT' (e.g. 'FF0000@0-0000FF@100').
    example: --prop gradient="FF0000-0000FF"
    example: --prop gradient="FF0000-0000FF-90"
    example: --prop gradient="LINEAR;FF0000;0000FF;45"
    example: --prop gradient="radial:4B0082-1E90FF-center"
    readback: linear: 'linear;C1;C2;ANGLE' (semicolon-separated, degree integer). radial/path: 'radial:C1-C2-FOCUS' / 'path:C1-C2-FOCUS'. When gradient is present, 'fill' reads back as 'gradient' unless a solidFill also exists.
  pattern   string   [add/set/get]
    description: pattern fill: 'preset' or 'preset:fg' or 'preset:fg:bg' (defaults: fg=000000, bg=FFFFFF).
    example: --prop pattern="diagBrick:FF0000:FFFFFF"
    readback: preset:fg_color[:bg_color] e.g. diagBrick:#FF0000:#FFFFFF
  image   string   [add/set/get]   aliases: imagefill
    description: image (blip) fill: path to a local image file used as the shape fill.
    example: --prop image=/path/to/photo.png
    readback: "true" when shape has an image (blipFill) fill
  lineWidth   length   [add/set/get]   aliases: linewidth
    description: outline width.
    example: --prop lineWidth=1pt
    readback: length in pt (e.g. "1pt")
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
  effective.direction   enum   [get]
    description: resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' is set directly on the shape.
    values: rtl, ltr
    readback: rtl | ltr
  effective.size   length   [get]
    description: resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set directly on the shape.
    readback: unit-qualified pt (e.g. "18pt")
  effective.font   string   [get]
    description: resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set directly on the shape.
    readback: font name
  effective.color   color   [get]
    description: resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set directly on the shape.
    readback: #-prefixed uppercase hex (scheme colors pass through)
  effective.bold   bool   [get]
    description: resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on the shape.
    readback: true/false
  id   number   [get]
    description: OOXML shape id; source of the @id in the stable path /shape[@id=ID].
    readback: integer shape id
  zorder   number   [get]
    description: 1-based z-order in slide shape tree.
    readback: 1-based integer (1 = back)
  bevel   string   [get]
    description: 3-D top bevel descriptor (preset[:width:height], e.g. `circle:6:6`). Surfaces when sp3d.bevelT is present.
    readback: `preset:width:height` token
  bevelBottom   string   [get]
    description: 3-D bottom bevel descriptor (sp3d.bevelB).
    readback: `preset:width:height` token
  depth   length   [get]
    description: 3-D extrusion height (sp3d @extrusionH) in points.
    readback: unit-qualified pt length
  lighting   string   [get]
    description: 3-D scene lighting rig name (e.g. threePt, balanced, soft).
    readback: OOXML preset light rig token
  material   string   [get]
    description: 3-D preset material (e.g. metal, plastic, matte).
    readback: OOXML preset material token
  lineOpacity   number   [get]
    description: shape outline alpha as fraction (0..1). Surfaces when the outline carries an a:alpha child.
    readback: fraction 0..1
  x   length   [add/set/get]   aliases: left
    description: x in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop x=2
    example: --prop x=2cm
    example: --prop x=1in
    example: --prop x=72pt
    readback: length string (FormatEmu)
  y   string   [add/set/get]   aliases: top
    description: y in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop y=3
    example: --prop y=3cm
    readback: length string (FormatEmu)
  width   string   [add/set/get]   aliases: w
    description: width in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop width=4
    example: --prop width=6cm
    example: --prop width=5cm
    readback: length string (FormatEmu)
  height   string   [add/set/get]   aliases: h
    description: height in EMU/length form (e.g. 2cm). pptx absolute positioning.
    example: --prop height=3
    example: --prop height=3cm
    readback: length string (FormatEmu)
  align   string   [add/set/get]
    description: Paragraph alignment: 'left' / 'center' (c/ctr) / 'right' (r) / 'justify'.
    example: --prop align=center
  bold   bool   [add/set/get]   aliases: font.bold
    description: Bold runs. Bare alias of font.bold.
    example: --prop bold=true
    readback: as emitted by handler (per-format details vary)
  color   color   [add/set/get]   aliases: font.color
    description: Text color. Bare alias of font.color.
    example: --prop color=#FF0000
    example: --prop color=0000FF
    readback: as emitted by handler (per-format details vary)
  fill   color   [add/set/get]   aliases: background
    description: Solid fill color, or 'none' for no fill (text-only shapes route effects to text-level rPr).
    example: --prop fill=#FFFF00
    example: --prop fill=none
    example: --prop fill=FF0000
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop fill=accent1
    readback: #-prefixed uppercase hex
  flipH   bool   [add/set]   aliases: flipHorizontal
    description: Flip horizontally (Office-API alias of flip=h).
    example: --prop flipH=true
  flipV   bool   [add/set]   aliases: flipVertical
    description: Flip vertically (Office-API alias of flip=v).
    example: --prop flipV=true
  font   string   [add/set/get]   aliases: font.name
    description: default font family for shape text. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / Arabic) use font.latin, font.ea, or font.cs.
    example: --prop font=Arial
    readback: font name
  glow   string   [add/set/get]
    description: glow effect. Pass a color (e.g. '4472C4') or 'true' (defaults to accent blue).
    example: --prop glow=#4472C4
    example: --prop glow=4472C4
    example: --prop glow=true
    readback: color hex string
  italic   bool   [add/set/get]   aliases: font.italic
    description: Italic runs. Bare alias of font.italic.
    example: --prop italic=true
    readback: as emitted by handler (per-format details vary)
  line   string   [add/set/get]   aliases: border, linecolor, lineColor
    description: Outline color (or 'none'). Form: 'color[:width[:style]]', e.g. 'FF0000:1.5:dash'. width in points; style: solid|dash|dot|dashdot|longdash.
    example: --prop line=#000000
    example: --prop line=FF0000:1.5
    example: --prop line=none
    example: --prop line=000000
    readback: color or color:width
  margin   length   [add/set/get]
    description: uniform internal padding (text inset) for shape body.
    example: --prop margin=4
    example: --prop margin=0.1in
    readback: n/a
  name   string   [add/set/get]
    description: Override the auto-generated 'Shape {id}' label on cNvPr @name.
    example: --prop name="banner"
    example: --prop name=MyShape
    readback: shape name string (cNvPr @name)
  reflection   string   [add/set]
    description: reflection effect. Accepts 'true' to enable a default reflection.
    example: --prop reflection=true
    readback: n/a
  rotation   string   [add/set/get]   aliases: rot, rotate
    description: Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.
    example: --prop rotation=45
    readback: as emitted by handler (per-format details vary)
  shadow   string   [add/set/get]
    description: outer shadow effect. Pass a color (e.g. '000000') or 'true' (defaults to black). Routed to text-level rPr for text-only shapes.
    example: --prop shadow=#808080
    example: --prop shadow=none
    example: --prop shadow=000000
    example: --prop shadow=true
    readback: color hex string
  size   font-size   [add/set/get]   aliases: fontSize, fontsize, font.size
    description: font size
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified string, e.g. "14pt"
  softEdge   string   [add/set]   aliases: softedge
    description: Soft edge radius, or 'none' to clear.
    example: --prop softEdge=5
    example: --prop softEdge=4pt
  text   string   [add/set/get]
    example: --prop text="Note"
    example: --prop text="Hello"
    readback: plain text content of the shape
  underline   string   [add/set/get]   aliases: font.underline
    description: Underline style: 'true'/'single'/'sng', 'double'/'dbl', 'none'/'false'. Bare alias of font.underline.
    example: --prop underline=single
    readback: as emitted by handler (per-format details vary)
  valign   string   [add/set/get]
    description: Vertical anchor: 'top' (t) / 'center' (ctr/middle/c/m) / 'bottom' (b).
    example: --prop valign=middle

Note: Positional /shape[N] enumerates ALL shapes on the slide including layout-inherited placeholders (title, body, etc.) — newly added shapes typically land at the end, not at /shape[1]. The 'add' command echoes back the canonical /shape[@id=ID] path; prefer that for follow-up Set/Get rather than guessing the positional index.

effective.* keys (direction, size, font, color, bold) are read-only resolved values walked up the placeholder→layout→master→presentation defaults inheritance chain. They appear only when the direct key is absent on this shape; once a direct value is set, the corresponding effective.* is suppressed. There are no .src counterparts (the implementation does not emit them).
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
  duration   number   [add/set/get]   aliases: dur
    description: Animation duration in milliseconds (integer, e.g. 500 = 0.5s).
    example: --prop duration=500
    example: --prop dur=2000
    readback: duration in milliseconds
  delay   number   [add/set/get]
    description: Delay before starting in milliseconds (integer, e.g. 500 = 0.5s).
    example: --prop delay=200
    readback: delay in milliseconds
  direction   string   [add/set]
    description: direction for directional effects (in/out/left/right/up/down).
    example: --prop direction=in
    readback: packed into the 'animation' key value as 'effectName-class-direction-duration' (e.g. 'fly-entrance-left-500'); no standalone 'direction' key is emitted on Get
  presetId   number   [get]
    description: raw OOXML preset id for the animation effect. Emitted when the effect has a recognized preset.
    readback: integer
  easein   number   [get]
    description: acceleration percentage (0..100) — fraction of the duration spent ramping up.
    readback: integer percent
  easeout   number   [get]
    description: deceleration percentage (0..100) — fraction of the duration spent ramping down.
    readback: integer percent
  motionPath   string   [get]
    description: motion-path SVG-like path string (animMotion @path) for path animations.
    readback: OOXML animMotion path string

Note: Animation attached to a specific shape. Effect name drives the timing preset; trigger controls sequencing (onClick / withPrevious / afterPrevious). On Get, returns individual keys: effect (preset name), class (entrance/emphasis/exit), presetId (numeric), trigger (onClick/afterPrevious/withPrevious), duration (ms integer). No composite 'animation' key is emitted. The `direction` parameter is consumed at Add time and not surfaced on Get. `repeat` and `restart` properties are not currently supported via prop — they are silently dropped with a stderr warning. Use raw-set on the timing nodes if needed.
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
  x   length   [add/set/get]
    example: --prop x=2cm
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: length in cm (e.g. "2cm")
  width   length   [add/set/get]
    example: --prop width=10cm
    readback: length in cm (e.g. "2cm")
  height   length   [add/set/get]
    example: --prop height=3cm
    readback: length in cm (e.g. "2cm")
  formula   string   [add/set]   aliases: text
    description: math expression. Aliases: text.
    example: --prop formula="x^2 + y^2 = z^2"
    readback: n/a (formula source surfaces in DocumentNode.Text, not Format[])

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
  link   string   [add/set/get]   aliases: url
    description: external URL or internal target. pptx Set/Get canonical key on shape/run is 'link'. Alias: url.
    example: --prop link=https://example.com
    readback: URL string or internal target
  slide   int   [add/set/get]
    description: internal target slide index (1-based).
    example: --prop slide=3
    readback: target slide index

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
  align   enum   [add/set/get]   aliases: alignment, halign
    values: left, center, right, justify
    example: --prop align=center
    readback: canonical 'align'
  level   int   [add/set/get]
    description: list indent level 0-8.
    example: --prop level=1
    readback: indent level
  marginLeft   length   [get]
    description: left text margin (CT_TextParagraphProperties @marL).
    readback: unit-qualified EMU length
  marginRight   length   [get]
    description: right text margin (CT_TextParagraphProperties @marR).
    readback: unit-qualified EMU length
  indent   length   [add/set/get]   aliases: leftindent, leftIndent
    description: left indentation. Routed through SpacingConverter — accepts twips int or unit-qualified (2cm/0.5in/24pt). Aliases: leftindent/leftIndent/indentleft.
    example: --prop indent=2cm
    readback: length string (cm or twips, format-dependent)
  lineSpacing   string   [add/set/get]   aliases: linespacing
    description: multiplier (e.g. 1.5x, 150%) or fixed length (e.g. 18pt)
    example: --prop lineSpacing=1.5x
    example: --prop lineSpacing=18pt
    readback: "<N>x" for multiplier or "<N>pt" for fixed
  text   string   [add/set/get]
    description: Sets plain text on the paragraph by creating an implicit single run. Do not also add a 'run' child with text on the same paragraph — they will duplicate.
    example: --prop text="Hello"
    example: --prop text="Hello world"
    readback: plain text content of paragraph

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
  cap   enum   [add/set/get]   aliases: allCaps, allcaps, smallCaps, smallcaps
    values: none, small, all
    example: --prop cap=all
    example: --prop allCaps=true
    readback: none | small | all
  effective.font   string   [get]
    description: resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set directly on the run.
    readback: font name
  effective.bold   bool   [get]
    description: resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on the run.
    readback: true/false
  effective.color   color   [get]
    description: resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set directly on the run.
    readback: #-prefixed uppercase hex (scheme colors pass through)
  effective.size   font-size   [get]
    description: inheritance-resolved font size (read-only). Surfaced when the run does not set 'size' directly; resolved through run style → paragraph style → docDefaults.
    readback: unit-qualified, e.g. "14pt"
  underline   enum   [add/set/get]   aliases: font.underline
    description: underline style. Common values: single, double, dotted, dash, wave, none.
    values: single, double, dotted, dash, wave, none, thick, dottedHeavy, dashLong, dashLongHeavy, dashDotHeavy, wavyHeavy, wavyDouble
    example: --prop underline=single
    example: --prop underline=double
    readback: underline style name
  bold   bool   [add/set/get]   aliases: font.bold
    example: --prop bold=true
    readback: true | false
  color   color   [add/set/get]   aliases: font.color
    example: --prop color=#FF0000
    example: --prop color=FF0000
    example: --prop color=red
    readback: #RRGGBB uppercase
  font   string   [add/set]   aliases: fontname, fontFamily, font.name
    description: bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readback to per-script canonical keys (font.latin / font.ea / font.cs) so a get→set round-trip preserves divergent slot values.
    example: --prop font=Calibri
    example: --prop font="Arial"
    example: --prop font="Times New Roman"
    readback: see font.latin / font.ea / font.cs
  italic   bool   [add/set/get]   aliases: font.italic
    example: --prop italic=true
    readback: true | false
  size   font-size   [add/set/get]   aliases: fontsize, fontSize, font.size
    example: --prop size=11
    example: --prop size=14
    example: --prop size=14pt
    example: --prop size=10.5pt
    readback: unit-qualified, e.g. "14pt"
  text   string   [add/set/get]
    example: --prop text="bold word"
    example: --prop text="word"
    example: --prop text="run content"
    readback: plain text of run

Note: Appends a:r inside a:p. Font properties live on a:rPr. Colors get #-prefixed on readback via ParseHelpers.FormatHexColor.

effective.* keys (size, font, color, bold) are read-only resolved values walked up the placeholder→layout→master→presentation defaults inheritance chain. They appear only when the direct key is absent on this run; once a direct value is set, the corresponding effective.* is suppressed. There is no effective.direction on runs (the implementation does not emit it). No .src counterparts.
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
  advanceTime   number   [add/set/get]   aliases: advancetime
    description: auto-advance time in milliseconds (integer). e.g. 5000 = 5 seconds.
    example: --prop advanceTime=5000
    readback: milliseconds (integer)
  advanceClick   bool   [add/set/get]   aliases: advanceclick
    description: advance on click.
    example: --prop advanceClick=true
    readback: true/false
  notes   string   [set/get]
    description: slide notes text. Set-only at creation time.
    example: --prop notes="Speaker notes here"
    readback: notes text when present
  hidden   bool   [get]
    description: true when the slide is hidden from slideshow (Slide/@show=false). Surfaces only on Get/Query.
    readback: true if slide is hidden in slideshow
  layoutType   string   [get]
    description: slide layout type name as encoded on the underlying SlideLayout (e.g. blank, title, titleOnly, twoContent, obj, txAndObj). Distinct from `layout`, which is the user-facing layout display name.
    readback: layout type token from SlideLayout/@type
  background.alpha   number   [get]
    description: slide background fill alpha as percent (0..100). Surfaces when the resolved fill carries an alpha channel.
    readback: integer percent 0..100
  background.crop   string   [get]
    description: slide background image crop quad in `l,t,r,b` percent units (CT_RelativeRect).
    readback: comma-separated `l,t,r,b` quad
  background.mode   string   [get]
    description: slide background image fill mode — `tile` or `center`. Absent for stretch (default).
    readback: `tile` | `center`
  background.ref   number   [get]
    description: theme background reference index — bgRef/@idx (1001/1002/1003 etc.) when the slide inherits from the theme.
    readback: integer theme bg ref id
  background.scale   number   [get]
    description: tile-fill scale percent (sx, both axes). Surfaces with background.mode=tile.
    readback: integer percent
  matchedShapes   number   [get]
    description: morph transition: number of shapes from the previous slide that matched on the current slide.
    readback: integer match count
  morphMode   string   [get]
    description: morph transition mode (byObject default, or other p:morph @option token).
    readback: morph mode token
  morphShapes   number   [get]
    description: morph transition: number of candidate shapes considered for matching on this slide.
    readback: integer candidate count

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
  layoutCount   number   [get]
    description: number of slide layouts associated with this master.
    readback: integer count of associated slide layouts
  theme   string   [get]
    description: name of the theme attached to this master, when the theme has a name.
    readback: theme name string (absent if theme has no name)
  shapeCount   number   [get]
    description: count of background shapes (Shape + Picture) on the master's shape tree.
    readback: count of background shapes on the master

Children:
  slidelayout  (1..n)  /slidelayout

Note: Slide master definition. Children: slideLayout references. Currently read-only — masters are created by templates, not user Add. Access via path /slidemaster[N]; 'help pptx slidemaster' is the canonical lookup — 'master' is not accepted as an element alias.
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

Note: Slide layout definition. Referenced by slides via the 'layout' property. Read-only here; mutate by editing the template file. Access via path /slidelayout[N]; 'help pptx slidelayout' is the canonical lookup — 'layout' is not accepted as an element alias.
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
  id   number   [get]
    description: OOXML graphic frame id (cNvPr id). pptx-only readback.
    readback: integer (cNvPr graphic frame id)
  x   length   [add/set/get]
    description: left offset in EMU-parseable length.
    example: --prop x=1in
    readback: cm-formatted length
  y   length   [add/set/get]
    example: --prop y=1in
    readback: cm-formatted length
  height   length   [add/set/get]
    example: --prop height=5cm
    readback: cm-formatted length
  rowHeight   length   [add]   aliases: rowheight
    description: uniform row height (EMU). If unspecified, derived from 'height' / rows.
    example: --prop rowHeight=1cm
    readback: not surfaced at table level
  headerFill   color   [add]   aliases: headerfill
    description: solid fill color applied to row 0 (header).
    example: --prop headerFill=#4472C4
    readback: per-cell fill, not aggregated at table level
  bodyFill   color   [add]   aliases: bodyfill
    description: solid fill color applied to rows 1..N (body).
    example: --prop bodyFill=#EEECE1
    readback: per-cell fill, not aggregated at table level
  firstRow   bool   [get]
    description: tblPr @firstRow flag — header-row styling enabled.
    readback: true|false
  lastRow   bool   [get]
    description: tblPr @lastRow flag — total-row styling enabled.
    readback: true|false
  firstCol   bool   [get]
    description: tblPr @firstCol flag — first-column styling enabled.
    readback: true|false
  lastCol   bool   [get]
    description: tblPr @lastCol flag — last-column styling enabled.
    readback: true|false
  bandedRows   bool   [get]
    description: tblPr @bandRow flag — alternating row banding from the table style.
    readback: true|false
  bandedCols   bool   [get]
    description: tblPr @bandCol flag — alternating column banding from the table style.
    readback: true|false
  border.all   string   [add/set/get]   aliases: border
    description: shorthand: applies the border to every edge of every cell. PPT OOXML has no table-level border element — this fans out to per-cell a:lnL/lnR/lnT/lnB. Format: 'WIDTH[ DASH][ COLOR]' space-separated (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' semicolon form (style is ignored — kept for docx parity). DASH ∈ solid|dot|dash|lgDash|dashDot|sysDot|sysDash. Use 'none' to clear. Alias: border. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.all="1pt solid FF0000"
    example: --prop border="single;1pt;000000"
    example: --prop border.all=none
    example: --prop border.all="single;4;FF0000"
    readback: edge descriptor
  border.bottom   string   [add/set/get]
    description: outer bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR'. Add/Set only — read per-cell.
    example: --prop border.bottom="2pt solid 000000"
    example: --prop border.bottom="double;6;0000FF"
    readback: edge descriptor
  border.horizontal   string   [add/set]   aliases: border.insideh, border.insideH
    description: inside-horizontal dividers (between rows). Fans out to bottom of rows 1..N-1 plus top of rows 2..N. PPT has no native inside-border element. Alias: border.insideH. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.horizontal="1pt solid CCCCCC"
    example: --prop border.horizontal="single;4;CCCCCC"
    readback: n/a (PPT has no native inside-border emit on Get)
  border.left   string   [add/set/get]
    description: outer left edge: applies to the left of column-1 cells in every row only. Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.left="1pt solid 808080"
    example: --prop border.left="single;4"
    readback: edge descriptor
  border.right   string   [add/set/get]
    description: outer right edge: applies to the right of last-column cells in every row only. Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.right="1pt solid 808080"
    example: --prop border.right="single;4"
    readback: edge descriptor
  border.top   string   [add/set/get]
    description: outer top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units). Add/Set only — table-level border readback is not surfaced today; inspect per-cell border.top instead.
    example: --prop border.top="2pt solid 000000"
    example: --prop border.top="single;4;000000"
    readback: edge descriptor
  border.vertical   string   [add/set]   aliases: border.insidev, border.insideV
    description: inside-vertical dividers (between columns). Fans out to right of cols 1..M-1 plus left of cols 2..M. Alias: border.insideV. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.vertical="1pt solid CCCCCC"
    example: --prop border.vertical="single;4;CCCCCC"
    readback: n/a (PPT has no native inside-border emit on Get)
  name   string   [add/set/get]
    description: NonVisualDrawingProperties Name (used for stable @name addressing).
    example: --prop name=SalesData
    example: --prop name=Summary
    readback: name string
  cols   int   [add/get]
    description: number of columns (ignored if 'data' is supplied).
    example: --prop cols=3
    readback: integer column count from first row
  data   string   [add]
    description: inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.
    example: --prop data="A,B;1,2"
    readback: n/a (seeds cells at Add time)
  rows   int   [add/get]
    description: number of rows (ignored if 'data' is supplied).
    example: --prop rows=3
    readback: integer row count
  width   string   [add/set/get]
    description: table width in twips (Dxa) or percent ('50%' → Pct).
    example: --prop width=10cm
    example: --prop width=9000
    readback: Dxa twips or pct50ths
  style   string   [add/set/get]   aliases: tableStyle, tableStyleId
    description: table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, none, or a direct {GUID}.
    values: medium1, medium2, medium3, medium4, light1, light2, light3, dark1, dark2, none
    example: --prop style=medium2
    example: --prop style=light1
    example: --prop style=dark1
    readback: style name when resolvable, else GUID

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
    readback: length in cm (e.g. "2cm")
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
    example: --prop cols=3
    readback: n/a (structural — cell count surfaces via DocumentNode.Children, not Format)
  height   length   [add/set/get]
    description: row height in EMU-parseable length. Defaults to first-row height or ~1cm.
    example: --prop height=1cm
    example: --prop height=500
    readback: length in cm (e.g. "2cm")

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
  baseline   number   [get]
    description: first run baseline offset for the cell text (percent units; positive=raised).
    readback: percent (e.g. 30)
  gridSpan   number   [get]
    description: horizontal merge span — number of grid columns this cell spans (>=2 means merged across).
    readback: integer span
  hmerge   bool   [get]
    description: true on cells continued from a horizontal merge anchor (CT_TableCell @hMerge).
    readback: true on continuation cells
  image.relId   string   [get]
    description: relationship id of an embedded image used as the cell's blip fill.
    readback: relationship id token
  border.all   string   [add/set/get]   aliases: border
    description: all four cell edges. Format: 'WIDTH[ DASH][ COLOR]' (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' (style ignored — kept for docx parity). DASH ∈ solid|dot|dash|lgDash|dashDot|sysDot|sysDash. Use 'none' to clear. Alias: border. Stored as a:lnL/lnR/lnT/lnB on a:tcPr. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient.
    example: --prop border.all="1pt solid FF0000"
    example: --prop border=none
    example: --prop border.all="single;4;FF0000"
    readback: edge descriptor (e.g. 'solid;4;FF0000')
  border.bottom   string   [set/get]
    description: bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.bottom="1pt solid 808080"
    example: --prop border.bottom="double;6;0000FF"
    readback: edge descriptor (e.g. 'solid;4;FF0000')
  border.left   string   [set/get]
    description: left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.left="1pt solid 808080"
    example: --prop border.left="single;4"
    readback: edge descriptor (e.g. 'solid;4;FF0000')
  border.right   string   [set/get]
    description: right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.right="1pt solid 808080"
    example: --prop border.right="single;4"
    readback: edge descriptor (e.g. 'solid;4;FF0000')
  border.tl2br   string   [add/set]
    description: diagonal from top-left to bottom-right (a:lnTlToBr). Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient. Add/Set only — Get does not surface diagonal borders today.
    example: --prop border.tl2br="1pt solid FF0000"
    example: --prop border.tl2br="single;4;FF0000"
    readback: n/a (Get does not surface diagonal borders)
  border.top   string   [set/get]
    description: top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' form; docx only accepts the semicolon form 'STYLE;SIZE;COLOR' (SIZE is in 1/8 pt units).
    example: --prop border.top="2pt solid 000000"
    example: --prop border.top="single;4;000000"
    readback: edge descriptor (e.g. 'solid;4;FF0000')
  border.tr2bl   string   [add/set]
    description: diagonal from top-right to bottom-left (a:lnBlToTr). Format same as border.all. Cross-format note: docx only accepts the semicolon form 'STYLE;SIZE;COLOR' — pptx is more lenient. Add/Set only — Get does not surface diagonal borders today.
    example: --prop border.tr2bl="1pt solid FF0000"
    example: --prop border.tr2bl="single;4;FF0000"
    readback: n/a (Get does not surface diagonal borders)
  fill   color   [add/set/get]   aliases: background, shd, shading
    description: cell background fill. Accepts a solid color (hex, named, rgb(...)), 'none' for explicit no-fill, or a gradient string 'COLOR1-COLOR2[-ANGLE]' (e.g. 'FF0000-0000FF-90'). Stored as a:solidFill / a:gradFill / a:noFill on a:tcPr.
    example: --prop fill=FFFF00
    example: --prop fill=#FF0000
    example: --prop fill=red
    example: --prop background=accent1
    example: --prop fill=none
    example: --prop fill="FF0000-0000FF-90"
    example: --prop fill="gradient;FF0000;0000FF;90"
    readback: #RRGGBB uppercase, 'gradient' (with separate 'gradient' key), or 'image' for picture fill
  text   string   [add/set/get]
    description: single-run text content placed in a fresh paragraph.
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
  effective.direction   enum   [get]
    description: resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' is set directly on the textbox.
    values: rtl, ltr
    readback: rtl | ltr
  effective.size   length   [get]
    description: resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set directly on the textbox.
    readback: unit-qualified pt (e.g. "18pt")
  effective.font   string   [get]
    description: resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set directly on the textbox.
    readback: font name
  effective.color   color   [get]
    description: resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set directly on the textbox.
    readback: #-prefixed uppercase hex (scheme colors pass through)
  effective.bold   bool   [get]
    description: resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on the textbox.
    readback: true/false
  autoFit   enum   [add/set/get]   aliases: autofit
    description: auto-fit mode for the textbox text body. Alias: autofit.
    values: none, normal, shape, noAutofit, spAutoFit
    example: --prop autoFit=shape
    readback: one of: none | normal | shape
  id   number   [get]
    description: OOXML shape id; source of the @id in the stable path /shape[@id=ID].
    readback: integer shape id
  zorder   number   [get]
    description: 1-based z-order in slide shape tree.
    readback: 1-based integer (1 = back)

Note: textbox is an alias for shape — both route to AddShape. 'textbox' input that includes --prop formula routes to AddEquation instead. The common text/position/size/font properties are inlined below; the full property surface (geometry, rotation, opacity, name, effects, …) is documented in pptx/shape.json.

effective.* keys (direction, size, font, color, bold) are read-only resolved values walked up the placeholder→layout→master→presentation defaults inheritance chain. They appear only when the direct key is absent on this textbox; once a direct value is set, the corresponding effective.* is suppressed. There are no .src counterparts (the implementation does not emit them).
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
  headingFont   string   [set/get]   aliases: majorFont, majorfont, major
    description: major (heading) Latin typeface.
    example: --prop headingFont="Calibri Light"
    readback: font name
  bodyFont   string   [set/get]   aliases: minorFont, minorfont, minor
    description: minor (body) Latin typeface.
    example: --prop bodyFont=Calibri
    readback: font name
  headingFont.ea   string   [set/get]   aliases: majorFont.ea, majorfont.ea
    description: major (heading) East Asian typeface (CJK).
    example: --prop headingFont.ea="Yu Gothic"
    readback: font name
  headingFont.cs   string   [set/get]   aliases: majorFont.cs, majorfont.cs
    description: major (heading) Complex Script typeface (Arabic/Hebrew/Thai).
    example: --prop headingFont.cs=Arial
    readback: font name
  bodyFont.ea   string   [set/get]   aliases: minorFont.ea, minorfont.ea
    description: minor (body) East Asian typeface (CJK).
    example: --prop bodyFont.ea="Yu Gothic"
    readback: font name
  bodyFont.cs   string   [set/get]   aliases: minorFont.cs, minorfont.cs
    description: minor (body) Complex Script typeface (Arabic/Hebrew/Thai).
    example: --prop bodyFont.cs="Times New Roman"
    readback: font name
  dk1   color   [set/get]   aliases: dark1
    description: dark 1 — default text color in the theme color scheme.
    example: --prop dk1=#000000
    readback: #-prefixed uppercase hex
  lt1   color   [set/get]   aliases: light1
    description: light 1 — default background color in the theme color scheme.
    example: --prop lt1=#FFFFFF
    readback: #-prefixed uppercase hex
  dk2   color   [set/get]   aliases: dark2
    description: dark 2 — secondary dark / dark accent color in the theme color scheme.
    example: --prop dk2=#44546A
    readback: #-prefixed uppercase hex
  lt2   color   [set/get]   aliases: light2
    description: light 2 — secondary light / light accent color in the theme color scheme.
    example: --prop lt2=#E7E6E6
    readback: #-prefixed uppercase hex
  accent1   color   [set/get]
    description: theme accent color 1.
    example: --prop accent1=#4472C4
    readback: #-prefixed uppercase hex
  accent2   color   [set/get]
    description: theme accent color 2.
    example: --prop accent2=#ED7D31
    readback: #-prefixed uppercase hex
  accent3   color   [set/get]
    description: theme accent color 3.
    example: --prop accent3=#A5A5A5
    readback: #-prefixed uppercase hex
  accent4   color   [set/get]
    description: theme accent color 4.
    example: --prop accent4=#FFC000
    readback: #-prefixed uppercase hex
  accent5   color   [set/get]
    description: theme accent color 5.
    example: --prop accent5=#5B9BD5
    readback: #-prefixed uppercase hex
  accent6   color   [set/get]
    description: theme accent color 6.
    example: --prop accent6=#70AD47
    readback: #-prefixed uppercase hex
  hyperlink   color   [set/get]   aliases: hlink
    description: theme hyperlink color.
    example: --prop hyperlink=#0563C1
    readback: #-prefixed uppercase hex
  followedhyperlink   color   [set/get]   aliases: folhlink
    description: theme followed (visited) hyperlink color.
    example: --prop followedhyperlink=#954F72
    readback: #-prefixed uppercase hex
  name   string   [get]
    description: theme color scheme name (e.g. 'Office'). Emitted when the theme carries a named color scheme.
    readback: scheme name string

Note: Presentation theme part — fonts and color scheme. Set accepts a limited subset (color scheme entries, heading/body font); full theme replacement is not supported.
```

## pptx Element: transition

```text
pptx transition
---------------
Parent: slide
Paths: /slide[N]
Operations: set get

Usage:
  officecli set <file> /slide[N] --prop key=val ...
  officecli get <file> /slide[N]

Properties:
  transition   enum   [set/get]
    description: transition type token
    values: morph, fade, push, wipe, split, cut, random, wheel, blinds, checker, comb, cover, dissolve, flash, fly, plus, strips, wedge, zoom
    example: --prop transition=morph
    readback: transition type token
  advanceTime   string   [set/get]
    description: auto-advance after time (ms, or 'none' to clear)
    example: --prop advanceTime=3000
    example: --prop advanceTime=none
    readback: ms string
  advanceClick   bool   [set/get]
    description: advance on click (default true)
    example: --prop advanceClick=true
    readback: true | false

Note: Slide-level transition properties. Set/Get target the slide node itself; no independent child path. Set examples: `set /slide[1] --prop transition=morph --prop advanceTime=3000`. Lookup: Set.Slide.cs:286/293/297; Get: Animations.cs:1346/1358/1408.
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
    readback: length in cm (e.g. "2cm")
  y   length   [add/set/get]
    example: --prop y=2cm
    readback: length in cm (e.g. "2cm")
  width   length   [add/set/get]
    example: --prop width=8cm
    readback: length in cm (e.g. "2cm")
  height   length   [add/set/get]
    example: --prop height=4.5cm
    readback: length in cm (e.g. "2cm")
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

## Flat Schema Dump: help all

```text
# officecli help all — grep-friendly schema dump
# Columns: <format> <element> <ELEM|PROP> <name> <type> ops:[asgqr] <details> <description> ex:<example>
# ops letters: a=add s=set g=get q=query r=remove (- = not supported)
# Add/Set form: officecli <fmt> add <path> --type <element> --prop key=value [--prop ...]
#   (the <element> token here is the value in column 2; the per-row ex:--prop ... shows one valid --prop for that row)
# Machine-readable: append --jsonl for one JSON record per line (for jq / scripts).
# Tips: grep '^docx paragraph'  |  grep '  PROP  '  |  grep align  |  grep aliases:alignment

docx body              ELEM  ops:[--gq-]  paths:/body
docx bookmark          ELEM  ops:[asgqr]  paths:/bookmark[@name=NAME];/bookmark[N]
docx bookmark          PROP  name                   string   ops:[asg--]  bookmark name (required). Letters, digits, '.', '_', '-' only.  ex:--prop name=chapter1
docx bookmark          PROP  text                   string   ops:[a----]  optional bookmark-covered text. Without this, only an empty Start/End pair is inserted.  ex:--prop text="Chapter 1 title"
docx bookmark          PROP  id                     string   ops:[--g--]  OOXML bookmark id (w:bookmarkStart/@w:id). Assigned by the writer; surfaces only on Get/Query.
docx chart             ELEM  ops:[asgqr]  paths:/body/p[N]/chart[M]
docx chart             PROP  dispUnits              string   ops:[asg--]  aliases:displayunits,dispunits  value-axis display units token readback (e.g. thousands, millions). Surfaces on the chart node when emitted by the valu…  ex:--prop dispunits=thousands
docx chart             PROP  seriesCount            number   ops:[--g--]  number of data series in the chart (extended cx:chart only).
docx chart             PROP  radarstyle             string   ops:[as---]  radar chart subtype. Values: standard|line, marker, filled|fill.  ex:--prop radarstyle=filled
docx chart             PROP  roundedcorners         bool     ops:[as---]  round the chart-area outer corners.  ex:--prop roundedcorners=true
docx chart             PROP  valaxisvisible         bool     ops:[as---]  aliases:valaxis.visible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level o…  ex:--prop valaxisvisible=false
docx chart             PROP  areafill               string   ops:[as---]  aliases:area.fill  fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.  ex:--prop areafill=4472C4-A5C8FF:90
docx chart             PROP  autotitledeleted       bool     ops:[as---]  suppress the auto-generated 'Chart Title' placeholder.  ex:--prop autotitledeleted=true
docx chart             PROP  axisfont               string   ops:[as---]  aliases:axis.font  convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options  ex:--prop axisfont=10:8B949E:Helvetica
docx chart             PROP  axisline               string   ops:[as---]  aliases:axis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options  ex:--prop axisline=666666:1
docx chart             PROP  axismax                number   ops:[as---]  aliases:max  convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismax=1000
docx chart             PROP  axismin                number   ops:[as---]  aliases:min  convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismin=0
docx chart             PROP  axisnumfmt             string   ops:[as---]  aliases:axisnumberformat  convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level optio…  ex:--prop axisnumfmt="#,##0"
docx chart             PROP  axisorientation        string   ops:[as---]  aliases:axisreverse  convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options  ex:--prop axisorientation=true
docx chart             PROP  axisposition           string   ops:[as---]  aliases:axispos  convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-lev…  ex:--prop axisposition=top
docx chart             PROP  axistitle              string   ops:[as---]  aliases:vtitle  convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options  ex:--prop axistitle="Revenue"
docx chart             PROP  axisvisible            bool     ops:[as---]  aliases:axis.delete,axis.visible  convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options  ex:--prop axisvisible=false
docx chart             PROP  bubbleScale            number   ops:[asg--]  aliases:bubblescale  bubble chart scale (% of default).  ex:--prop bubblescale=100
docx chart             PROP  catAxisVisible         bool     ops:[asg--]  aliases:cataxis.visible,cataxisvisible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-leve…  ex:--prop cataxisvisible=false
docx chart             PROP  catTitle               string   ops:[asg--]  aliases:htitle,cattitle  category axis title text.  ex:--prop cattitle="Quarter"
docx chart             PROP  cataxisline            string   ops:[as---]  aliases:cataxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for ful…  ex:--prop cataxisline=333333:1
docx chart             PROP  categories             string   ops:[asg--]  comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)  ex:--prop categories=A,B,C
docx chart             PROP  chartFill              color    ops:[--g--]  chart-level fill color readback.
docx chart             PROP  chartType              enum     ops:[asg--]  values:bar|column|line|pie|doughnut|area|scatter|bubble|radar|stock|combo|waterfall|funnel|treemap|sunburst|boxWhisker|histogram|pareto  aliases:type,col,donut,xy,spider,ohlc,wf,charttype  normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)  ex:--prop chartType=column
docx chart             PROP  chartareafill          string   ops:[as---]  aliases:chartfill  chart-area background fill. Solid color, gradient, or 'none'.  ex:--prop chartareafill=FFFFFF
docx chart             PROP  chartborder            string   ops:[as---]  aliases:chartarea.border  chart-area outer border line. Same format as plotborder.  ex:--prop chartborder=000000:1
docx chart             PROP  colorrule              string   ops:[as---]  aliases:conditionalcolor,colorRule  conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.  ex:--prop colorrule=0:FF0000:00AA00
docx chart             PROP  colors                 string   ops:[a----]  comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) overr…  ex:--prop colors="4472C4,ED7D31,A5A5A5"
docx chart             PROP  combosplit             number   ops:[a----]  combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.  ex:--prop combosplit=2
docx chart             PROP  combotypes             string   ops:[as---]  aliases:combo.types  rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.  ex:--prop combotypes="column,column,line"
docx chart             PROP  crossBetween           string   ops:[asg--]  aliases:crossbetween  category axis cross-between behavior (between / midCat).  ex:--prop crossBetween=between
docx chart             PROP  crosses                string   ops:[asg--]  where the value axis crosses the category axis. Values: autoZero (default), max, min.  ex:--prop crosses=max
docx chart             PROP  crossesAt              number   ops:[asg--]  aliases:crossesat  value-axis crossesAt value readback.  ex:--prop crossesat=0
docx chart             PROP  data                   string   ops:[a----]  inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after crea…  ex:--prop data="Sales:10,20,30"
docx chart             PROP  dataLabels             string   ops:[asg--]  aliases:datalabels,labels  show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also a…  ex:--prop dataLabels=value
docx chart             PROP  dataRange              string   ops:[a----]  aliases:datarange,range  external workbook range source for series; Add-time only.  ex:--prop dataRange=Sheet1!A1:D5
docx chart             PROP  dataTable              bool     ops:[asg--]  aliases:datatable  show data table beneath the chart (with default borders + legend keys).  ex:--prop dataTable=true
docx chart             PROP  decreaseColor          color    ops:[a----]  waterfall: negative bar color. Add-time only.  ex:--prop decreaseColor=FF0000
docx chart             PROP  dispBlanksAs           enum     ops:[-sg--]  values:gap|zero|span  how empty cells render (gap leaves a hole, zero plots as 0, span connects across).  ex:--prop dispBlanksAs=gap
docx chart             PROP  droplines              string   ops:[as---]  drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.  ex:--prop droplines=true
docx chart             PROP  errbars                string   ops:[as---]  aliases:errorbars  error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' remov…  ex:--prop errbars=fixedVal:5
docx chart             PROP  explosion              number   ops:[asg--]  aliases:explode  pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.  ex:--prop explosion=10
docx chart             PROP  firstSliceAngle        number   ops:[asg--]  aliases:sliceangle,firstsliceangle  pie/doughnut first slice angle (degrees).  ex:--prop firstsliceangle=90
docx chart             PROP  gapdepth               number   ops:[as---]  depth gap between series in 3D bar/line/area charts (percent).  ex:--prop gapdepth=150
docx chart             PROP  gapwidth               number   ops:[asg--]  aliases:gap  gap between bar/column groups, 0..500 (percent of bar width).  ex:--prop gapwidth=150
docx chart             PROP  gradient               string   ops:[asg--]  aliases:gradientfill  gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.  ex:--prop gradient=FF0000-0000FF
docx chart             PROP  gradients              string   ops:[as---]  per-series gradient fills, semicolon-separated; one entry per series.  ex:--prop gradients="FF0000-0000FF;00FF00-FFFF00"
docx chart             PROP  gridlines              bool     ops:[asg--]  aliases:majorgridlines  value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none'…  ex:--prop gridlines=true
docx chart             PROP  height                 length   ops:[asg--]  chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop height=10cm
docx chart             PROP  hilowlines             string   ops:[as---]  high-low lines on line/stock chart. Same format as droplines.  ex:--prop hilowlines=true
docx chart             PROP  holeSize               number   ops:[asg--]  aliases:holesize  doughnut hole size readback.  ex:--prop holesize=50
docx chart             PROP  increaseColor          color    ops:[a----]  waterfall: positive bar color. Add-time only.  ex:--prop increaseColor=00AA00
docx chart             PROP  invertifneg            bool     ops:[as---]  aliases:invertifnegative  if true, draw negative bars in an inverted (lighter) color.  ex:--prop invertifneg=true
docx chart             PROP  labelPos               string   ops:[asg--]  aliases:labelpos,labelposition  data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bes…  ex:--prop labelPos=outsideEnd
docx chart             PROP  labelfont              string   ops:[as---]  data label text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop labelfont=9:333333:Calibri
docx chart             PROP  labeloffset            number   ops:[as---]  category-axis label offset 0..1000 (percent of font height); category axis only.  ex:--prop labeloffset=100
docx chart             PROP  labelrotation          number   ops:[as---]  aliases:xaxis.labelrotation,valaxis.labelrotation,yaxis.labelrotation,xaxislabelrotation,valaxislabelrotation,yaxislabelrotation  tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./vala…  ex:--prop labelrotation=-45
docx chart             PROP  leaderlines            bool     ops:[as---]  aliases:showleaderlines  show/hide leader lines connecting data labels to slices (pie/doughnut).  ex:--prop leaderlines=true
docx chart             PROP  legend                 enum     ops:[asg--]  values:true|false|none|top|bottom|left|right|topRight|tr  legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and und…  ex:--prop legend=bottom
docx chart             PROP  legend.overlay         bool     ops:[asg--]  aliases:legendoverlay  if true, legend overlays the plot area instead of reserving space.  ex:--prop legend.overlay=true
docx chart             PROP  legendFont             string   ops:[asg--]  aliases:legendfont,legend.font  legend text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop legendFont=10:CCCCCC:Arial
docx chart             PROP  linedash               string   ops:[as---]  aliases:dash  line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.  ex:--prop linedash=dash
docx chart             PROP  linewidth              number   ops:[as---]  line width in points (applies to every series line).  ex:--prop linewidth=2
docx chart             PROP  logbase                number   ops:[as---]  aliases:logscale,yaxisscale  value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log s…  ex:--prop logbase=10
docx chart             PROP  majorTickMark          string   ops:[asg--]  aliases:majortick,majortickmark  major tick mark style (out / in / cross / none).  ex:--prop majorTickMark=out
docx chart             PROP  majorunit              number   ops:[as---]  value-axis major gridline / tick spacing.  ex:--prop majorunit=200
docx chart             PROP  marker                 string   ops:[as---]  aliases:markers  marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or '…  ex:--prop marker=circle
docx chart             PROP  markersize             number   ops:[as---]  marker size 2..72 (line/scatter/radar series only).  ex:--prop markersize=8
docx chart             PROP  minorGridlines         bool     ops:[asg--]  aliases:minorgridlines  value-axis minor gridlines; same format as gridlines.  ex:--prop minorGridlines=true
docx chart             PROP  minorTickMark          string   ops:[asg--]  aliases:minortick,minortickmark  minor tick mark style (out / in / cross / none).  ex:--prop minorTickMark=none
docx chart             PROP  minorunit              number   ops:[as---]  value-axis minor gridline / tick spacing.  ex:--prop minorunit=50
docx chart             PROP  overlap                number   ops:[asg--]  bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).  ex:--prop overlap=0
docx chart             PROP  plotFill               color    ops:[asg--]  aliases:plotareafill,plotfill  plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.  ex:--prop plotFill=FAFAFA
docx chart             PROP  plotborder             string   ops:[as---]  aliases:plotarea.border  plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.  ex:--prop plotborder=CCCCCC:0.5
docx chart             PROP  plotvisonly            bool     ops:[as---]  aliases:plotvisibleonly  if true, skip plotting hidden worksheet rows/columns.  ex:--prop plotvisonly=true
docx chart             PROP  preset                 string   ops:[as---]  aliases:theme,style.preset  named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).  ex:--prop preset=minimal
docx chart             PROP  referenceline          string   ops:[as---]  aliases:refline,targetline  horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'…  ex:--prop referenceline=100:FF0000:Target
docx chart             PROP  scatterstyle           string   ops:[as---]  scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.  ex:--prop scatterstyle=smoothMarker
docx chart             PROP  secondaryaxis          string   ops:[as---]  aliases:secondary  comma-separated 1-based series indices to plot on a secondary value axis.  ex:--prop secondaryaxis=2
docx chart             PROP  seriesoutline          string   ops:[as---]  aliases:series.outline  series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.  ex:--prop seriesoutline=000000:0.5
docx chart             PROP  seriesshadow           string   ops:[as---]  aliases:series.shadow  outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.  ex:--prop seriesshadow=000000-5-45-3-50
docx chart             PROP  serlines               string   ops:[as---]  aliases:serieslines  series lines on stacked bar charts (true/false).  ex:--prop serlines=true
docx chart             PROP  shape                  string   ops:[as---]  aliases:barshape  3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.  ex:--prop shape=cylinder
docx chart             PROP  showMarker             bool     ops:[-sg--]  show markers on line/scatter series at chart level.  ex:--prop showMarker=true
docx chart             PROP  shownegbubbles         bool     ops:[as---]  render negative-valued bubbles. Bubble charts only.  ex:--prop shownegbubbles=true
docx chart             PROP  sizerepresents         string   ops:[as---]  how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.  ex:--prop sizerepresents=area
docx chart             PROP  smooth                 bool     ops:[asg--]  smooth lines on line/scatter charts. Reported unsupported for other chart types.  ex:--prop smooth=true
docx chart             PROP  style                  number   ops:[asg--]  aliases:styleid  built-in chart style id 1..48; pass 'none' to clear.  ex:--prop style=2
docx chart             PROP  tickLabelPos           string   ops:[asg--]  aliases:ticklabelposition,ticklabelpos  tick label position (high / low / nextTo / none).  ex:--prop tickLabelPos=nextTo
docx chart             PROP  ticklabelskip          number   ops:[as---]  aliases:tickskip  draw tick labels every Nth category (category axis).  ex:--prop ticklabelskip=2
docx chart             PROP  title                  string   ops:[asg--]  chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.colo…  ex:--prop title="Q1"
docx chart             PROP  title.bold             bool     ops:[--g--]  title bold flag (readback only)
docx chart             PROP  title.color            color    ops:[--g--]  title font color (readback only, #RRGGBB)
docx chart             PROP  title.font             string   ops:[--g--]  title font name (readback only)
docx chart             PROP  title.size             font-size ops:[--g--]  title font size (readback only, e.g. 14pt)
docx chart             PROP  totalColor             color    ops:[a----]  waterfall: subtotal/total bar color. Add-time only.  ex:--prop totalColor=4472C4
docx chart             PROP  transparency           number   ops:[as---]  aliases:opacity,alpha  series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=7…  ex:--prop transparency=30
docx chart             PROP  trendline              string   ops:[asg--]  add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponent…  ex:--prop trendline=linear
docx chart             PROP  updownbars             string   ops:[as---]  up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.  ex:--prop updownbars=true
docx chart             PROP  valaxisline            string   ops:[as---]  aliases:valaxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full a…  ex:--prop valaxisline=333333:1
docx chart             PROP  varyColors             bool     ops:[-sg--]  vary colors by data point (single-series charts).  ex:--prop varyColors=true
docx chart             PROP  view3d                 string   ops:[asg--]  aliases:camera,perspective  3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key f…  ex:--prop view3d=15,20,30
docx chart             PROP  width                  length   ops:[asg--]  chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop width=18cm
docx chart-axis        ELEM  ops:[-sg--]  paths:/chart[N]/axis[@role=ROLE]
docx chart-axis        PROP  axisFont               string   ops:[--g--]  axis text font readback.
docx chart-axis        PROP  axisMax                number   ops:[--g--]  value-axis maximum readback (also surfaced via max on axis-by-role path).
docx chart-axis        PROP  axisMin                number   ops:[--g--]  value-axis minimum readback (also surfaced via min on axis-by-role path).
docx chart-axis        PROP  axisNumFmt             string   ops:[--g--]  axis number format string.
docx chart-axis        PROP  axisOrientation        string   ops:[--g--]  axis scaling orientation (e.g. maxMin when reversed).
docx chart-axis        PROP  axisTitle              string   ops:[--g--]  value-axis title readback (chart-level convenience; axis-by-role uses 'title').
docx chart-axis        PROP  format                 string   ops:[-sg--]  number format string  ex:--prop format="#,##0"
docx chart-axis        PROP  labelOffset            number   ops:[--g--]  category axis label offset (% of default 100).
docx chart-axis        PROP  labelRotation          number   ops:[-sg--]  tick label rotation in degrees  ex:--prop labelRotation=-45
docx chart-axis        PROP  logBase                number   ops:[-sg--]  logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop logBase=10
docx chart-axis        PROP  majorGridlines         bool     ops:[-sg--]  show or hide major gridlines. Applies to all roles.  ex:--prop majorGridlines=true
docx chart-axis        PROP  max                    number   ops:[-sg--]  maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop max=1000
docx chart-axis        PROP  min                    number   ops:[-sg--]  minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop min=0
docx chart-axis        PROP  minorGridlines         bool     ops:[-sg--]  show or hide minor gridlines. Applies to all roles.  ex:--prop minorGridlines=false
docx chart-axis        PROP  tickLabelSkip          number   ops:[--g--]  category axis label skip interval (>1 means tick labels are sparser).
docx chart-axis        PROP  title                  string   ops:[-sg--]  axis title text. Applies to all roles (category, value). Pass 'none' to remove.  ex:--prop title="Revenue"
docx chart-axis        PROP  visible                bool     ops:[-sg--]  show or hide the axis. Applies to all roles.  ex:--prop visible=false
docx chart-series      ELEM  ops:[asg-r]  paths:/chart[N]/series[K];/body/p[N]/chart[M]/series[K]
docx chart-series      PROP  categories             string   ops:[asg--]  per-series category override; range reference only.  ex:--prop series1.categories="Sheet1!$A$2:$A$5"
docx chart-series      PROP  categoriesRef          string   ops:[--g--]  A1 cell range backing the category labels.
docx chart-series      PROP  color                  color    ops:[asg--]  series fill color.  ex:--prop series1.color=#4472C4
docx chart-series      PROP  dataLabels.numFmt      string   ops:[--g--]  per-series data label number format readback.
docx chart-series      PROP  dataLabels.separator   string   ops:[--g--]  per-series data label separator string readback.
docx chart-series      PROP  errBars                string   ops:[--g--]  error bar value type token (e.g. cust, fixedVal, stdDev).
docx chart-series      PROP  invertIfNeg            bool     ops:[--g--]  invert color for negative values (per-series readback).
docx chart-series      PROP  lineDash               enum     ops:[-sg--]  values:solid|sysDash|sysDot|sysDashDot|lgDash|lgDashDot|lgDashDotDot|dash|dashDot|dot|longDash  aliases:dash  series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash…  ex:--prop lineDash=dash
docx chart-series      PROP  lineWidth              number   ops:[-sg--]  series line width in points (e.g. 1.5).  ex:--prop lineWidth=1.5
docx chart-series      PROP  marker                 string   ops:[-sg--]  per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports …  ex:--prop marker=circle
docx chart-series      PROP  markerSize             number   ops:[-sg--]  marker size in points (2–72). Applies when marker is not 'none'.  ex:--prop markerSize=8
docx chart-series      PROP  name                   string   ops:[asg--]  aliases:title  series name shown in legend and data labels.  ex:--prop name="Q1"
docx chart-series      PROP  nameRef                string   ops:[--g--]  A1 cell reference backing the series name.
docx chart-series      PROP  scatterStyle           string   ops:[--g--]  scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
docx chart-series      PROP  secondaryAxis          bool     ops:[--g--]  true when the chart has more than one value axis (this series uses the secondary).
docx chart-series      PROP  smooth                 bool     ops:[-sg--]  smooth line interpolation for line/scatter series.  ex:--prop smooth=true
docx chart-series      PROP  values                 string   ops:[asg--]  comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)  ex:--prop series1.values="120,150,180"
docx comment           ELEM  ops:[asgqr]  paths:/comments/comment[@commentId=N];/comments/comment[N]
docx comment           PROP  id                     number   ops:[--g--]  OOXML comment id (w:comment/@w:id). Assigned by the writer; surfaces only on Get/Query.
docx comment           PROP  anchoredTo             string   ops:[--g--]  path of the paragraph or run the comment is anchored to (resolved from CommentRangeStart).
docx comment           PROP  date                   string   ops:[asg--]  ISO-8601 timestamp. Defaults to DateTime.UtcNow.  ex:--prop date=2025-01-15T10:30:00Z
docx comment           PROP  initials               string   ops:[asg--]  author initials. Defaults to derived from author name when omitted.  ex:--prop initials=AT
docx comment           PROP  author                 string   ops:[asg--]  Author attribute  ex:--prop author="Alice"
docx comment           PROP  text                   string   ops:[asg--]  comment body. Required.  ex:--prop text="Check formula"
docx document          ELEM  ops:[-sgq-]  paths:/
docx document          PROP  author                 string   ops:[-sg--]  aliases:creator  author string  ex:--prop author="Alice"
docx document          PROP  title                  string   ops:[-sg--]  title string  ex:--prop title="Report"
docx document          PROP  keywords               string   ops:[-sg--]  keywords string  ex:--prop keywords="tag1,tag2"
docx document          PROP  description            string   ops:[-sg--]  description string  ex:--prop description="Abstract"
docx document          PROP  lastModifiedBy         string   ops:[-sg--]  aliases:lastmodifiedby  last-modified author  ex:--prop lastModifiedBy="Bob"
docx document          PROP  category               string   ops:[--g--]  document category metadata. Emitted only when present.
docx document          PROP  revision               string   ops:[--g--]  document revision counter. Emitted only when present.
docx document          PROP  created                string   ops:[--g--]  creation timestamp (ISO-8601). Emitted only when present.
docx document          PROP  modified               string   ops:[--g--]  last modification timestamp (ISO-8601). Emitted only when present.
docx document          PROP  protection             enum     ops:[--g--]  values:none|readOnly|comments|trackedChanges|forms  document protection mode.
docx document          PROP  protectionEnforced     bool     ops:[--g--]  whether document protection is enforced.
docx document          PROP  docGrid.type           enum     ops:[-sg--]  values:default|lines|linesAndChars|snapToChars  document grid type.
docx document          PROP  docGrid.linePitch      number   ops:[-sg--]  document grid line pitch.
docx document          PROP  docGrid.charSpace      number   ops:[-sg--]  document grid char space.
docx document          PROP  charSpacingControl     enum     ops:[-sg--]  values:compressPunctuation|compressPunctuationAndJapaneseKana|doNotCompress  CJK character spacing control.
docx document          PROP  compatibility.mode     string   ops:[-sg--]  compatibility mode identifier.
docx document          PROP  docDefaults.font       string   ops:[-sg--]  aliases:defaultFont  default Latin font.
docx document          PROP  docDefaults.font.eastAsia string   ops:[-sg--]  default East Asian font slot.
docx document          PROP  docDefaults.font.hAnsi string   ops:[-sg--]  default hAnsi font slot.
docx document          PROP  docDefaults.font.complexScript string   ops:[-sg--]  default complex-script font slot.
docx document          PROP  docDefaults.fontSize   font-size ops:[-sg--]  default font size.
docx document          PROP  docDefaults.color      color    ops:[-sg--]  default text color.
docx document          PROP  docDefaults.bold       bool     ops:[-sg--]  default bold flag.
docx document          PROP  docDefaults.italic     bool     ops:[-sg--]  default italic flag.
docx document          PROP  docDefaults.rtl        bool     ops:[-sg--]  default right-to-left flag.
docx document          PROP  docDefaults.alignment  string   ops:[-sg--]  default paragraph alignment.
docx document          PROP  docDefaults.spaceBefore string   ops:[-sg--]  default paragraph space-before.
docx document          PROP  docDefaults.spaceAfter string   ops:[-sg--]  default paragraph space-after.
docx document          PROP  docDefaults.lineSpacing string   ops:[-sg--]  default paragraph line spacing.
docx document          PROP  autoSpaceDE            bool     ops:[-s---]  auto-spacing between East Asian and Latin text.
docx document          PROP  autoSpaceDN            bool     ops:[-s---]  auto-spacing between East Asian and numeric text.
docx document          PROP  kinsoku                bool     ops:[-s---]  Japanese kinsoku line breaking rules.
docx document          PROP  overflowPunct          bool     ops:[-s---]  allow punctuation to overflow margin.
docx document          PROP  embedFonts             bool     ops:[-s---]  embed TrueType fonts.
docx document          PROP  embedSystemFonts       bool     ops:[-s---]  embed system fonts.
docx document          PROP  saveSubsetFonts        bool     ops:[-s---]  save font subsets.
docx document          PROP  mirrorMargins          bool     ops:[-s---]  mirror margins for facing pages.
docx document          PROP  gutterAtTop            bool     ops:[-s---]  gutter at top.
docx document          PROP  bookFoldPrinting       bool     ops:[-s---]  book fold printing layout.
docx document          PROP  evenAndOddHeaders      bool     ops:[-s---]  different headers for even/odd pages.
docx document          PROP  defaultTabStop         string   ops:[-s---]  default tab stop (e.g. "720" twips or "0.5in").  ex:--prop defaultTabStop=720
docx document          PROP  displayBackgroundShape bool     ops:[-s---]  display background shape.
docx document          PROP  removePersonalInformation bool     ops:[-s---]  remove personal info on save.
docx document          PROP  removeDateAndTime      bool     ops:[-s---]  remove date/time on save.
docx document          PROP  printFormsData         bool     ops:[-s---]  print only form data.
docx document          PROP  pageWidth              length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop pageWidth=21cm
docx document          PROP  pageHeight             length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop pageHeight=29.7cm
docx document          PROP  orientation            enum     ops:[-sg--]  values:portrait|landscape  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop orientation=landscape
docx document          PROP  marginTop              length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop marginTop=2.54cm
docx document          PROP  marginBottom           length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop marginBottom=2.54cm
docx document          PROP  marginLeft             length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop marginLeft=3.18cm
docx document          PROP  marginRight            length   ops:[-sg--]  convenience readback from sectPr; primary edit path is /section[N].  ex:--prop marginRight=3.18cm
docx document          PROP  extended.application   string   ops:[--g--]  from docProps/app.xml application identifier (e.g. "Microsoft Word").
docx document          PROP  bookFoldPrintingSheets number   ops:[--g--]  settings.xml bookFoldPrintingSheets — sheets per booklet signature when book-fold printing.
docx document          PROP  bookFoldReversePrinting bool     ops:[--g--]  settings.xml bookFoldRevPrinting flag — true when book-fold printing reverses the page order.
docx document          PROP  doNotDisplayPageBoundaries bool     ops:[--g--]  settings.xml doNotDisplayPageBoundaries flag — Word view hides the page-boundary frame.
docx document          PROP  columns.equalWidth     bool     ops:[--g--]  document-default columns equal-width flag (sectPr cols @equalWidth on the body sectPr).
docx document          PROP  columns.separator      bool     ops:[--g--]  document-default columns separator flag (sectPr cols @sep on the body sectPr).
docx document          PROP  extended.applicationVersion string   ops:[--g--]  docProps/app.xml AppVersion field.
docx document          PROP  extended.characters    number   ops:[--g--]  docProps/app.xml Characters count.
docx document          PROP  extended.company       string   ops:[-sg--]  docProps/app.xml Company field.
docx document          PROP  extended.lines         number   ops:[--g--]  docProps/app.xml Lines count.
docx document          PROP  extended.manager       string   ops:[-sg--]  docProps/app.xml Manager field.
docx document          PROP  extended.pages         number   ops:[--g--]  docProps/app.xml Pages count.
docx document          PROP  extended.paragraphs    number   ops:[--g--]  docProps/app.xml Paragraphs count.
docx document          PROP  extended.template      string   ops:[-sg--]  docProps/app.xml Template field.
docx document          PROP  extended.totalTime     number   ops:[--g--]  docProps/app.xml TotalTime field (minutes).
docx document          PROP  extended.words         number   ops:[--g--]  docProps/app.xml Words count.
docx document          PROP  subject                string   ops:[-sg--]  subject string  ex:--prop subject=Finance
docx document          PROP  theme.color.accent1    color    ops:[-sg--]  theme accent color 1.
docx document          PROP  theme.color.accent2    color    ops:[-sg--]  theme accent color 2.
docx document          PROP  theme.color.accent3    color    ops:[-sg--]  theme accent color 3.
docx document          PROP  theme.color.accent4    color    ops:[-sg--]  theme accent color 4.
docx document          PROP  theme.color.accent5    color    ops:[-sg--]  theme accent color 5.
docx document          PROP  theme.color.accent6    color    ops:[-sg--]  theme accent color 6.
docx document          PROP  theme.color.dk1        color    ops:[-sg--]  theme color slot dk1 (dark 1 / default text).
docx document          PROP  theme.color.dk2        color    ops:[-sg--]  theme color slot dk2 (dark 2).
docx document          PROP  theme.color.folHlink   color    ops:[-sg--]  theme followed-hyperlink color.
docx document          PROP  theme.color.hlink      color    ops:[-sg--]  theme hyperlink color.
docx document          PROP  theme.color.lt1        color    ops:[-sg--]  theme color slot lt1 (light 1 / default background).
docx document          PROP  theme.color.lt2        color    ops:[-sg--]  theme color slot lt2 (light 2).
docx document          PROP  theme.colorScheme      string   ops:[--g--]  color scheme name (a:clrScheme/@name).
docx document          PROP  theme.font.major.eastAsia string   ops:[-sg--]  major (heading) East Asian typeface.
docx document          PROP  theme.font.major.latin string   ops:[-sg--]  major (heading) Latin typeface.
docx document          PROP  theme.font.minor.eastAsia string   ops:[-sg--]  minor (body) East Asian typeface.
docx document          PROP  theme.font.minor.latin string   ops:[-sg--]  minor (body) Latin typeface.
docx document          PROP  theme.fontScheme       string   ops:[--g--]  font scheme name (a:fontScheme/@name).
docx document          PROP  theme.formatScheme     string   ops:[--g--]  format scheme name (a:fmtScheme/@name).
docx document          PROP  theme.name             string   ops:[--g--]  theme display name (a:theme/@name).
docx endnote           ELEM  ops:[asgqr]  paths:/endnote[N]
docx endnote           PROP  text                   string   ops:[asg--]  concatenated text  ex:--prop text="End-of-doc reference"
docx endnote           PROP  direction              enum     ops:[as---]  values:rtl|ltr  aliases:dir,bidi  Reading direction. 'rtl' writes <w:bidi/> on the endnote content paragraph and cascades <w:rtl/> to the paragraph mark.  ex:--prop direction=rtl
docx endnote           PROP  align                  enum     ops:[as---]  values:left|center|right|justify|both|distribute  aliases:alignment  Horizontal alignment applied to the endnote content paragraph (<w:jc/>).  ex:--prop align=right
docx endnote           PROP  font.cs                string   ops:[as---]  aliases:font.complexscript,font.complex  Complex-script font (rFonts/cs).  ex:--prop font.cs="Arabic Typesetting"
docx endnote           PROP  font.ea                string   ops:[as---]  aliases:font.eastasia,font.eastasian  East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.  ex:--prop font.ea="メイリオ"
docx endnote           PROP  font.latin             string   ops:[as---]  Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.  ex:--prop font.latin=Calibri
docx endnote           PROP  bold.cs                bool     ops:[as---]  aliases:font.bold.cs,boldcs  complex-script bold for the endnote's runs (<w:bCs/>). Required for Arabic / Hebrew bold rendering.  ex:--prop bold.cs=true
docx endnote           PROP  italic.cs              bool     ops:[as---]  aliases:font.italic.cs,italiccs  complex-script italic (<w:iCs/>) for the endnote's runs.  ex:--prop italic.cs=true
docx endnote           PROP  size.cs                font-size ops:[as---]  aliases:font.size.cs,sizecs  complex-script font size (<w:szCs/>) for the endnote's runs.  ex:--prop size.cs=14pt
docx endnote           PROP  id                     number   ops:[--g--]  OOXML endnote id; source of @endnoteId in stable path /endnote[@endnoteId=N].
docx equation          ELEM  ops:[asgqr]  paths:/body/oMathPara[N];/body/p[N]/oMath[M]
docx equation          PROP  mode                   enum     ops:[a-g--]  values:display|inline  display | inline  ex:--prop mode=inline
docx equation          PROP  formula                string   ops:[as---]  aliases:text  math expression. Aliases: text.  ex:--prop formula="x^2 + y^2 = z^2"
docx field             ELEM  ops:[asgqr]  paths:/field[N]
docx field             PROP  fieldType              enum     ops:[asg--]  values:page|pagenum|pagenumber|numpages|date|author|title|time|filename|section|sectionpages|mergefield|ref|pageref|noteref|seq|styleref|docproperty|if|createdate|savedate|printdate|edittime|lastsavedby|subject|numwords|numchars|revnum|template|comments|doccomments|keywords  aliases:fieldtype,type  resolved instruction  ex:--prop fieldType=page
docx field             PROP  name                   string   ops:[asg--]  aliases:fieldName,fieldname,bookmarkName,bookmarkname,bookmark,styleName,stylename,propertyName,propertyname  Per-type identifier: mergefield → field name (e.g. CustomerName); ref/pageref/noteref → target bookmark name; styleref …  ex:--prop name=CustomerName
docx field             PROP  id                     string   ops:[asg--]  aliases:identifier  SEQ field's identifier (sequence label). Defaults to 'name' when 'id' is not supplied. Alias: identifier.  ex:--prop id=Figure
docx field             PROP  expression             string   ops:[as---]  aliases:condition  IF field's logical expression (e.g. 'MERGEFIELD Gender = "Male"'). Add/Set only — surfaces back inside the `instruction…  ex:--prop expression='{ MERGEFIELD Gender } = "Male"'
docx field             PROP  trueText               string   ops:[as---]  aliases:truetext  IF field's text shown when expression evaluates true. Add/Set only — surfaces back inside the `instruction` readback.  ex:--prop trueText="Mr."
docx field             PROP  falseText              string   ops:[as---]  aliases:falsetext  IF field's text shown when expression evaluates false. Add/Set only — surfaces back inside the `instruction` readback.  ex:--prop falseText="Ms."
docx field             PROP  hyperlink              bool     ops:[as---]  REF field: append \h switch so the inserted reference becomes a clickable hyperlink to the bookmark target. Add/Set onl…  ex:--prop hyperlink=true
docx field             PROP  format                 string   ops:[asg--]  switch-style format (e.g. '\@ "yyyy-MM-dd"' for date).  ex:--prop format="yyyy-MM-dd"
docx field             PROP  instruction            string   ops:[asg--]  aliases:instr,code  Raw field instruction text. Bypasses fieldType-specific helpers — useful for arbitrary fields not covered by the typed …  ex:--prop instruction=' DATE \@ "yyyy年MM月" '
docx fieldchar         ELEM  ops:[-sgqr]  paths:/body/p[@paraId=X]/r[N];/header[N]/p[M]/r[K];/footer[N]/p[M]/r[K]
docx fieldchar         PROP  fieldCharType          enum     ops:[-sg--]  values:begin|separate|end  aliases:fieldchartype  fldChar fldCharType attribute  ex:--prop fieldCharType=separate
docx footer            ELEM  ops:[asgqr]  paths:/footer[N]
docx footer            PROP  type                   enum     ops:[asg--]  values:default|first|even  aliases:kind,ref  innerText of HeaderFooterValues  ex:--prop type=default
docx footer            PROP  text                   string   ops:[asg--]  concatenated Text.Descendants  ex:--prop text="My Footer"
docx footer            PROP  align                  enum     ops:[asg--]  values:left|center|right|justify|both|distribute  aliases:alignment  first-paragraph Justification.Val.InnerText  ex:--prop align=center
docx footer            PROP  direction              enum     ops:[as---]  values:rtl|ltr  aliases:dir,bidi  Reading direction. 'rtl' writes <w:bidi/> on the footer paragraph, <w:rtl/> on the paragraph mark, and <w:rtl/> on ever…  ex:--prop direction=rtl
docx footer            PROP  font                   string   ops:[asg--]  Ascii or HighAnsi font name  ex:--prop font="Arial"
docx footer            PROP  size                   font-size ops:[asg--]  font size. Accepts bare number or pt-suffixed.  ex:--prop size=12
docx footer            PROP  bold                   bool     ops:[asg--]  true when bold, key absent otherwise  ex:--prop bold=true
docx footer            PROP  italic                 bool     ops:[asg--]  true when italic, key absent otherwise  ex:--prop italic=true
docx footer            PROP  color                  color    ops:[asg--]  font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).  ex:--prop color=#FF0000
docx footer            PROP  field                  enum     ops:[a----]  values:page|pagenum|pagenumber|numpages|date|author|title|time|filename  not surfaced as a distinct key  ex:--prop field=page
docx footnote          ELEM  ops:[asgqr]  paths:/footnote[@footnoteId=N];/footnotes/footnote[N]
docx footnote          PROP  text                   string   ops:[asg--]  footnote text. Required.  ex:--prop text="See ref [1]"
docx footnote          PROP  direction              enum     ops:[as---]  values:rtl|ltr  aliases:dir,bidi  Reading direction. 'rtl' writes <w:bidi/> on the footnote content paragraph and cascades <w:rtl/> to the paragraph mark.  ex:--prop direction=rtl
docx footnote          PROP  align                  enum     ops:[as---]  values:left|center|right|justify|both|distribute  aliases:alignment  Horizontal alignment applied to the footnote content paragraph (<w:jc/>).  ex:--prop align=right
docx footnote          PROP  font.cs                string   ops:[as---]  aliases:font.complexscript,font.complex  Complex-script font (rFonts/cs) — Arabic / Hebrew typeface.  ex:--prop font.cs="Arabic Typesetting"
docx footnote          PROP  font.ea                string   ops:[as---]  aliases:font.eastasia,font.eastasian  East-Asian font (rFonts/eastAsia).  ex:--prop font.ea="メイリオ"
docx footnote          PROP  font.latin             string   ops:[as---]  Latin font slot (rFonts/ascii + hAnsi).  ex:--prop font.latin=Calibri
docx footnote          PROP  bold.cs                bool     ops:[as---]  aliases:font.bold.cs,boldcs  complex-script bold (<w:bCs/>). Required for Arabic / Hebrew bold rendering.  ex:--prop bold.cs=true
docx footnote          PROP  italic.cs              bool     ops:[as---]  aliases:font.italic.cs,italiccs  complex-script italic (<w:iCs/>) for the footnote's runs.  ex:--prop italic.cs=true
docx footnote          PROP  size.cs                font-size ops:[as---]  aliases:font.size.cs,sizecs  complex-script font size (<w:szCs/>) for the footnote's runs.  ex:--prop size.cs=14pt
docx footnote          PROP  id                     number   ops:[--g--]  OOXML footnote id (w:footnote/@w:id). Assigned by the writer; surfaces only on Get/Query.
docx formfield         ELEM  ops:[asgqr]  paths:/formfield[@name=NAME];/formfield[N]
docx formfield         PROP  type                   enum     ops:[asg--]  values:text|checkbox|check|dropdown  aliases:formfieldtype  form field type.  ex:--prop type=text
docx formfield         PROP  name                   string   ops:[asg--]  form field name (required for stable addressing). Same constraints as bookmark name.  ex:--prop name=email
docx formfield         PROP  text                   string   ops:[asg--]  aliases:value  initial text value (text fields only). Alias: value.  ex:--prop text=default
docx formfield         PROP  checked                bool     ops:[asg--]  default state (checkbox only).  ex:--prop checked=true
docx formfield         PROP  default                string   ops:[--g--]  form-field default value. Text-fields surface the default string; dropdowns surface the integer default index.
docx formfield         PROP  enabled                bool     ops:[--g--]  true when the form field accepts user input (FFData @enabled). Defaults true when the element is absent.
docx formfield         PROP  hasFormFieldData       bool     ops:[--g--]  true when the run carries an embedded fldData payload (legacy form-field binary blob).
docx header            ELEM  ops:[asgqr]  paths:/header[N]
docx header            PROP  type                   enum     ops:[asg--]  values:default|first|even  aliases:kind,ref  header scope.  ex:--prop type=default
docx header            PROP  text                   string   ops:[asg--]  header text (single run).  ex:--prop text="My Header"
docx header            PROP  align                  enum     ops:[asg--]  values:left|center|right|justify|both|distribute  aliases:alignment  first-paragraph Justification.Val.InnerText  ex:--prop align=center
docx header            PROP  direction              enum     ops:[as---]  values:rtl|ltr  aliases:dir,bidi  Reading direction. 'rtl' writes <w:bidi/> on the header paragraph, <w:rtl/> on the paragraph mark, and <w:rtl/> on ever…  ex:--prop direction=rtl
docx header            PROP  font                   string   ops:[asg--]  Ascii or HighAnsi font name  ex:--prop font="Arial"
docx header            PROP  size                   font-size ops:[asg--]  font size. Accepts bare number or pt-suffixed.  ex:--prop size=12
docx header            PROP  bold                   bool     ops:[asg--]  true when bold, key absent otherwise  ex:--prop bold=true
docx header            PROP  italic                 bool     ops:[asg--]  true when italic, key absent otherwise  ex:--prop italic=true
docx header            PROP  color                  color    ops:[asg--]  font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).  ex:--prop color=#FF0000
docx header            PROP  field                  enum     ops:[a----]  values:page|pagenum|pagenumber|numpages|date|author|title|time|filename  complex field to insert (page/numpages/date/author/title/time/filename, or an arbitrary field name).  ex:--prop field=page
docx hyperlink         ELEM  ops:[asgqr]  paths:/body/p[N]/hyperlink[M]
docx hyperlink         PROP  url                    string   ops:[asg--]  aliases:href,link  external URL. Aliases: href, link. docx Set accepts all three (url canonical).  ex:--prop url=https://example.com
docx hyperlink         PROP  anchor                 string   ops:[a-g--]  aliases:bookmark  bookmark name for internal links. Set after Add not supported — formatting lives on inner runs (Set the run, not the hy…  ex:--prop anchor=section1
docx hyperlink         PROP  text                   string   ops:[asg--]  display text. Defaults to url or anchor value if omitted.  ex:--prop text="click here"
docx hyperlink         PROP  color                  color    ops:[a-g--]  override link color (default: theme Hyperlink or 0563C1). Set after Add not supported — formatting lives on inner runs …  ex:--prop color=#0000FF
docx hyperlink         PROP  font                   string   ops:[a-g--]  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).  ex:--prop font="Calibri"
docx hyperlink         PROP  size                   length   ops:[a-g--]  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).  ex:--prop size=11
docx hyperlink         PROP  bold                   bool     ops:[a-g--]  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).  ex:--prop bold=true
docx hyperlink         PROP  italic                 bool     ops:[a-g--]  Set after Add not supported — formatting lives on inner runs (Set the run, not the hyperlink wrapper).  ex:--prop italic=true
docx instrtext         ELEM  ops:[-sgqr]  paths:/body/p[@paraId=X]/r[N];/header[N]/p[M]/r[K];/footer[N]/p[M]/r[K]
docx instrtext         PROP  instruction            string   ops:[-sg--]  aliases:instr  The Word field instruction. Leading/trailing spaces inside the value are significant — they form the OOXML separator be…  ex:--prop 'instruction= PAGE \\* MERGEFORMAT '
docx numbering         ELEM  ops:[--gq-]  paths:/numbering
docx numbering         PROP  abstractNumCount       number   ops:[--g--]  total number of abstractNum definitions in numbering.xml.
docx numbering         PROP  abstractNumId          number   ops:[--g--]  per-num child readback — the abstractNumId referenced by each /num child. Surfaces on enumerated num child nodes, not t…
docx ole               ELEM  ops:[asgqr]  paths:/body/p[N]/ole[M];/header[N]/ole[M];/footer[N]/ole[M]
docx ole               PROP  height                 length   ops:[asg--]  unit-qualified length from inline style (e.g. "5cm")  ex:--prop height=8cm
docx ole               PROP  width                  length   ops:[asg--]  unit-qualified length from inline style (e.g. "5cm")  ex:--prop width=10cm
docx ole               PROP  preview                string   ops:[a----]  preview thumbnail image source. Add-time only — Set ignores this key.  ex:--prop preview=/path/to/thumb.png
docx ole               PROP  progId                 string   ops:[asg--]  aliases:progid  OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.  ex:--prop progId=Word.Document.12
docx ole               PROP  src                    string   ops:[as---]  aliases:path  embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embe…  ex:--prop src=/path/to/data.docx
docx pagebreak         ELEM  ops:[asgqr]  paths:/body/p[@paraId=X]/r[N];/header[N]/p[M]/r[K];/footer[N]/p[M]/r[K]
docx pagebreak         PROP  type                   enum     ops:[a-g--]  values:page|column|textWrapping|line  Add-only alias; Get surfaces this as 'breakType', and Set requires 'breakType'.  ex:--prop type=page
docx pagebreak         PROP  breakType              enum     ops:[-sg--]  values:page|column|textWrapping|line  aliases:breaktype  Canonical key on Get/Set. Add accepts 'type' as a parallel synonym for symmetry with the historical alias.  ex:--prop breakType=column
docx paragraph         ELEM  ops:[asgqr]  paths:/body/p[@paraId=ID];/body/p[N]
docx paragraph         PROP  align                  enum     ops:[asg--]  values:left|center|right|justify|both|distribute  aliases:alignment  one of values  ex:--prop align=center
docx paragraph         PROP  style                  string   ops:[asg--]  aliases:styleId,styleid,styleName,stylename  paragraph styleId (e.g. Heading1, Normal, Quote). Must reference an existing style or one of the built-in style aliases…  ex:--prop style=Heading1
docx paragraph         PROP  spaceBefore            length   ops:[asg--]  aliases:spacebefore  unit-qualified, e.g. "12pt"  ex:--prop spaceBefore=12pt
docx paragraph         PROP  spaceAfter             length   ops:[asg--]  aliases:spaceafter  unit-qualified, e.g. "6pt"  ex:--prop spaceAfter=6pt
docx paragraph         PROP  listStyle              enum     ops:[asg--]  values:bullet|ordered|none  aliases:liststyle  high-level list type. 'bullet' (aliases: unordered, ul) creates a bulleted list; 'ordered' (or any other non-bullet val…  ex:--prop listStyle=bullet --prop text="item"
docx paragraph         PROP  numId                  int      ops:[asg--]  aliases:numid  numbering definition id (w:numId). Low-level entry point — prefer 'listStyle' unless you specifically need to reference…  ex:--prop numId=1
docx paragraph         PROP  numLevel               int      ops:[asg--]  aliases:numlevel,ilvl,listLevel,listlevel,level  list indent level (w:ilvl), 0..8. Requires numId or listStyle to be effective; Get only surfaces numLevel when numId is…  ex:--prop numLevel=1 --prop numId=1
docx paragraph         PROP  start                  int      ops:[as---]  starting number for an ordered list (w:start on level 0 of the numbering definition). Only meaningful together with lis…  ex:--prop liststyle=ordered --prop start=5 --prop text="item"
docx paragraph         PROP  bold                   bool     ops:[as---]  run-level bold. On Add, applied to the implicit run created by 'text'. On Set, applied to all runs in the paragraph and…  ex:--prop bold=true --prop text="Hi"
docx paragraph         PROP  italic                 bool     ops:[as---]  run-level italic. Same scope as 'bold'.  ex:--prop italic=true --prop text="Hi"
docx paragraph         PROP  font                   string   ops:[as---]  run-level font family (applied to Ascii/HighAnsi/EastAsia). On Add, applied to the implicit run created by 'text'. On S…  ex:--prop font="Times New Roman" --prop text="Hi"
docx paragraph         PROP  size                   font-size ops:[as---]  aliases:fontsize  run-level font size. Accepts bare number (pt), '14pt', '10.5pt'.  ex:--prop size=14 --prop text="Hi"
docx paragraph         PROP  color                  color    ops:[as---]  run-level text color. Accepts #RRGGBB, RRGGBB, named colors (e.g. red), rgb(r,g,b).  ex:--prop color=red --prop text="Hi"
docx paragraph         PROP  underline              string   ops:[as---]  run-level underline. Accepts 'true'/'false' or an underline style (single, double, thick, dotted, dash, wavy, etc.).  ex:--prop underline=true --prop text="Hi"
docx paragraph         PROP  strike                 bool     ops:[as---]  aliases:strikethrough  run-level single strikethrough.  ex:--prop strike=true --prop text="Hi"
docx paragraph         PROP  highlight              string   ops:[as---]  run-level highlight color (w:highlight values: yellow, green, cyan, magenta, blue, red, darkBlue, darkCyan, darkGreen, …  ex:--prop highlight=yellow --prop text="Hi"
docx paragraph         PROP  caps                   bool     ops:[a----]  aliases:allCaps  run-level all caps. On Add only (no paragraph-level Set wrapper).  ex:--prop caps=true --prop text="Hi"
docx paragraph         PROP  smallcaps              bool     ops:[a----]  aliases:smallCaps  run-level small caps. On Add only.  ex:--prop smallcaps=true --prop text="Hi"
docx paragraph         PROP  dstrike                bool     ops:[a----]  run-level double strikethrough. On Add only.  ex:--prop dstrike=true --prop text="Hi"
docx paragraph         PROP  vanish                 bool     ops:[a----]  run-level hidden text. On Add only.  ex:--prop vanish=true --prop text="Hi"
docx paragraph         PROP  outline                bool     ops:[a----]  run-level outline text effect. On Add only.  ex:--prop outline=true --prop text="Hi"
docx paragraph         PROP  shadow                 bool     ops:[a----]  run-level shadow text effect. On Add only.  ex:--prop shadow=true --prop text="Hi"
docx paragraph         PROP  emboss                 bool     ops:[a----]  run-level emboss text effect. On Add only.  ex:--prop emboss=true --prop text="Hi"
docx paragraph         PROP  imprint                bool     ops:[a----]  run-level imprint (engrave) text effect. On Add only.  ex:--prop imprint=true --prop text="Hi"
docx paragraph         PROP  noproof                bool     ops:[a----]  run-level no-proofing flag. On Add only.  ex:--prop noproof=true --prop text="Hi"
docx paragraph         PROP  superscript            bool     ops:[a----]  run-level superscript vertical alignment. On Add only (use vertAlign for Set).  ex:--prop superscript=true --prop text="x^2"
docx paragraph         PROP  subscript              bool     ops:[a----]  run-level subscript vertical alignment. On Add only (use vertAlign for Set).  ex:--prop subscript=true --prop text="H2O"
docx paragraph         PROP  vertAlign              enum     ops:[a----]  values:superscript|subscript|baseline|super|sub  aliases:vertalign  run-level vertical text alignment. On Add only.  ex:--prop vertAlign=superscript --prop text="x^2"
docx paragraph         PROP  charspacing            length   ops:[a----]  aliases:charSpacing,letterspacing,letterSpacing  run-level character spacing in points (bare number = pt, or 'Xpt'). Stored as twips. On Add only.  ex:--prop charspacing=2 --prop text="Hi"
docx paragraph         PROP  rtl                    bool     ops:[a----]  run-level right-to-left text flag. On Add only.  ex:--prop rtl=true --prop text="Hi"
docx paragraph         PROP  direction              enum     ops:[asg--]  values:ltr|rtl  aliases:dir,bidi  paragraph reading direction. 'rtl' writes <w:bidi/> on pPr, <w:rtl/> on the paragraph mark, and <w:rtl/> on every run (…  ex:--prop direction=rtl
docx paragraph         PROP  font.cs                string   ops:[asg--]  aliases:font.complexscript,font.complex  Complex-script font slot (rFonts/cs) — Arabic / Hebrew / Thai typefaces.  ex:--prop font.cs="Arabic Typesetting"
docx paragraph         PROP  font.ea                string   ops:[asg--]  aliases:font.eastasia,font.eastasian  East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.  ex:--prop font.ea="メイリオ"
docx paragraph         PROP  font.latin             string   ops:[asg--]  Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.  ex:--prop font.latin=Calibri
docx paragraph         PROP  bold.cs                bool     ops:[asg--]  aliases:font.bold.cs,boldcs  complex-script bold for the paragraph's runs (<w:bCs/>). Required for Arabic / Hebrew bold rendering.  ex:--prop bold.cs=true
docx paragraph         PROP  italic.cs              bool     ops:[asg--]  aliases:font.italic.cs,italiccs  complex-script italic (<w:iCs/>) for the paragraph's runs.  ex:--prop italic.cs=true
docx paragraph         PROP  size.cs                font-size ops:[asg--]  aliases:font.size.cs,sizecs  complex-script font size (<w:szCs/>) for the paragraph's runs.  ex:--prop size.cs=14pt
docx paragraph         PROP  shd                    string   ops:[a----]  aliases:shading  shading. Format: 'fill' or 'val;fill' or 'val;fill;color'. Applied at paragraph level on Add (pPr/shd).  ex:--prop shd=FFFF00
docx paragraph         PROP  firstLineIndent        length   ops:[asg--]  aliases:firstlineindent  first-line indent. Routed through SpacingConverter.  ex:--prop firstLineIndent=2cm
docx paragraph         PROP  rightIndent            length   ops:[asg--]  aliases:rightindent,indentright  right indentation. Routed through SpacingConverter.  ex:--prop rightIndent=1cm
docx paragraph         PROP  hangingIndent          length   ops:[asg--]  aliases:hangingindent,hanging  hanging indent (pairs with left indent). Routed through SpacingConverter.  ex:--prop hangingIndent=0.5cm
docx paragraph         PROP  keepNext               bool     ops:[as---]  aliases:keepnext  keep paragraph with the next paragraph (no page break between).  ex:--prop keepNext=true
docx paragraph         PROP  keepLines              bool     ops:[as---]  aliases:keeplines,keeptogether,keepTogether  keep all lines of the paragraph together (no page break within).  ex:--prop keepLines=true
docx paragraph         PROP  pageBreakBefore        bool     ops:[as---]  aliases:pagebreakbefore,break  force a page break before this paragraph.  ex:--prop pageBreakBefore=true
docx paragraph         PROP  widowControl           bool     ops:[as---]  aliases:widowcontrol  widow/orphan control.  ex:--prop widowControl=true
docx paragraph         PROP  wordWrap               bool     ops:[as---]  aliases:wordwrap  Latin-word break behaviour in CJK paragraphs. Set false to allow ASCII text/whitespace to participate in CJK character …  ex:--prop wordWrap=false
docx paragraph         PROP  contextualSpacing      bool     ops:[asg--]  aliases:contextualspacing  suppress space between paragraphs of the same style. Applied on Add/Set to paragraph pPr; also valid on Style.  ex:--prop contextualSpacing=true
docx paragraph         PROP  effective.size         font-size ops:[--g--]  inheritance-resolved font size (read-only) — derived from the first run's style chain → paragraph style → docDefaults.
docx paragraph         PROP  effective.size.src     string   ops:[--g--]  source pointer for effective.size.
docx paragraph         PROP  effective.font.ascii   string   ops:[--g--]  inheritance-resolved Latin/ASCII font slot (read-only).
docx paragraph         PROP  effective.font.ascii.src string   ops:[--g--]  source pointer for effective.font.ascii.
docx paragraph         PROP  effective.font.eastAsia string   ops:[--g--]  inheritance-resolved East-Asian font slot (read-only).
docx paragraph         PROP  effective.font.eastAsia.src string   ops:[--g--]  source pointer for effective.font.eastAsia.
docx paragraph         PROP  effective.font.hAnsi   string   ops:[--g--]  inheritance-resolved High-ANSI font slot (read-only).
docx paragraph         PROP  effective.font.hAnsi.src string   ops:[--g--]  source pointer for effective.font.hAnsi.
docx paragraph         PROP  effective.font.cs      string   ops:[--g--]  inheritance-resolved complex-script font slot (read-only).
docx paragraph         PROP  effective.font.cs.src  string   ops:[--g--]  source pointer for effective.font.cs.
docx paragraph         PROP  effective.bold         bool     ops:[--g--]  inheritance-resolved bold (read-only).
docx paragraph         PROP  effective.bold.src     string   ops:[--g--]  source pointer for effective.bold.
docx paragraph         PROP  effective.italic       bool     ops:[--g--]  inheritance-resolved italic (read-only).
docx paragraph         PROP  effective.italic.src   string   ops:[--g--]  source pointer for effective.italic.
docx paragraph         PROP  effective.color        color    ops:[--g--]  inheritance-resolved font color (read-only). #RRGGBB or scheme color name.
docx paragraph         PROP  effective.color.src    string   ops:[--g--]  source pointer for effective.color.
docx paragraph         PROP  effective.underline    string   ops:[--g--]  inheritance-resolved underline style (read-only).
docx paragraph         PROP  effective.underline.src string   ops:[--g--]  source pointer for effective.underline.
docx paragraph         PROP  effective.rtl          bool     ops:[--g--]  inheritance-resolved right-to-left flag (read-only). Emitted even when 'rtl' is set directly so callers can compare dir…
docx paragraph         PROP  effective.rtl.src      string   ops:[--g--]  source pointer for effective.rtl.
docx paragraph         PROP  numFmt                 string   ops:[--g--]  raw numbering format (e.g. bullet, decimal, lowerLetter). Emitted only when present.
docx paragraph         PROP  shading.val            string   ops:[--g--]  shading pattern value (decomposed from `shd`). Add/Set use `shd`.
docx paragraph         PROP  shading.fill           string   ops:[--g--]  shading fill color hex (decomposed from `shd`).
docx paragraph         PROP  shading.color          string   ops:[--g--]  shading foreground color hex.
docx paragraph         PROP  paraId                 string   ops:[--g--]  paragraph stable id (source of @paraId in stable path). Emitted only when present.
docx paragraph         PROP  outlineLvl             number   ops:[--g--]  outline level (0-9). Emitted only when present.
docx paragraph         PROP  tabs                   array    ops:[--g--]  tab stops array. Emitted only when present.
docx paragraph         PROP  pbdr.top               string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  pbdr.bottom            string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  pbdr.left              string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  pbdr.right             string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  pbdr.between           string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  pbdr.bar               string   ops:[-----]  paragraph border edge descriptor. Emitted only when present.
docx paragraph         PROP  firstLineChars         number   ops:[--g--]  first-line indent in 1/100 character units (CT_Ind @firstLineChars). Word's chars-relative variant of firstLineIndent.
docx paragraph         PROP  hangingChars           number   ops:[--g--]  hanging indent in 1/100 character units (CT_Ind @hangingChars). Word's chars-relative variant of hangingIndent.
docx paragraph         PROP  indent                 length   ops:[asg--]  aliases:leftindent,leftIndent  left indentation. Routed through SpacingConverter — accepts twips int or unit-qualified (2cm/0.5in/24pt). Aliases: left…  ex:--prop indent=2cm
docx paragraph         PROP  lineSpacing            string   ops:[asg--]  aliases:linespacing  multiplier (e.g. 1.5x, 150%) or fixed length (e.g. 18pt)  ex:--prop lineSpacing=1.5x
docx paragraph         PROP  text                   string   ops:[asg--]  Sets plain text on the paragraph by creating an implicit single run. Do not also add a 'run' child with text on the sam…  ex:--prop text="Hello"
docx picture           ELEM  ops:[asgqr]  paths:/body/p[N]/pic[M]
docx picture           PROP  behindText             bool     ops:[--g--]  true when the picture floats behind text (anchor @behindDoc=1).
docx picture           PROP  hPosition              length   ops:[--g--]  absolute horizontal anchor position in cm (positionH/posOffset).
docx picture           PROP  hRelative              string   ops:[--g--]  horizontal anchor reference frame (e.g. page, margin, column, character).
docx picture           PROP  width                  length   ops:[asg--]  width — cm length (extent.Cy/Cx in EMU formatted to cm).  ex:--prop width=5
docx picture           PROP  height                 length   ops:[asg--]  height — cm length (extent.Cy/Cx in EMU formatted to cm).  ex:--prop height=5
docx picture           PROP  fallback               string   ops:[a----]  optional PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is generated.  ex:--prop fallback=/path/to/fallback.png
docx picture           PROP  id                     number   ops:[--g--]  OOXML shape id; source of the @id in the stable path /picture[@id=ID].
docx picture           PROP  alt                    string   ops:[asg--]  aliases:altText,alttext,description  alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.  ex:--prop alt="Logo"
docx picture           PROP  contentType            string   ops:[--g--]  OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced b…
docx picture           PROP  fileSize               number   ops:[--g--]  embedded image file size in bytes (length of the image part stream).
docx picture           PROP  src                    string   ops:[as---]  aliases:path  image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relation…  ex:--prop src=/path/to/image.png
docx ptab              ELEM  ops:[asgqr]  paths:/body/p[@paraId=X]/r[N];/header[N]/p[M]/r[K];/footer[N]/p[M]/r[K]
docx ptab              PROP  align                  enum     ops:[asg--]  values:left|center|right  aliases:alignment  ptab alignment attribute  ex:--prop align=center
docx ptab              PROP  relativeTo             enum     ops:[asg--]  values:margin|indent  aliases:relativeto  ptab relativeTo attribute  ex:--prop relativeTo=margin
docx ptab              PROP  leader                 enum     ops:[asg--]  values:none|dot|hyphen|middleDot|underscore  ptab leader attribute  ex:--prop leader=dot
docx run               ELEM  ops:[asg-r]  paths:/body/p[@paraId=ID]/r[N];/body/p[N]/r[N]
docx run               PROP  highlight              color    ops:[asg--]  Word built-in highlight color. Accepts named colors (yellow, green, cyan, magenta, blue, red, ...).  ex:--prop highlight=yellow
docx run               PROP  strike                 bool     ops:[asg--]  aliases:strikethrough,font.strike,font.strikethrough  single strikethrough.  ex:--prop strike=true
docx run               PROP  dstrike                bool     ops:[asg--]  aliases:doublestrike,doubleStrike  double strikethrough.  ex:--prop dstrike=true
docx run               PROP  caps                   bool     ops:[asg--]  aliases:allCaps  render text in all caps (display only; underlying text unchanged).  ex:--prop caps=true
docx run               PROP  smallcaps              bool     ops:[asg--]  aliases:smallCaps  render lowercase as small caps.  ex:--prop smallcaps=true
docx run               PROP  vanish                 bool     ops:[asg--]  hidden text (not rendered, but present in the file).  ex:--prop vanish=true
docx run               PROP  outline                bool     ops:[asg--]  outline (text effect).  ex:--prop outline=true
docx run               PROP  shadow                 bool     ops:[asg--]  shadow (text effect).  ex:--prop shadow=true
docx run               PROP  emboss                 bool     ops:[asg--]  emboss (text effect).  ex:--prop emboss=true
docx run               PROP  imprint                bool     ops:[asg--]  imprint / engrave (text effect).  ex:--prop imprint=true
docx run               PROP  noproof                bool     ops:[asg--]  aliases:noProof  exclude this run from spell/grammar checking.  ex:--prop noproof=true
docx run               PROP  rtl                    bool     ops:[as---]  right-to-left text (legacy alias of 'direction'). Get surfaces this as direction=rtl|ltr.  ex:--prop rtl=true
docx run               PROP  direction              enum     ops:[asg--]  values:ltr|rtl  aliases:dir  run reading direction. Use 'rtl' for Arabic / Hebrew, 'ltr' to clear. Canonical key for run direction; matches paragrap…  ex:--prop direction=rtl
docx run               PROP  font.cs                string   ops:[asg--]  aliases:font.complexscript,font.complex  Complex-script font slot (rFonts/cs) — Arabic / Hebrew / Thai typefaces.  ex:--prop font.cs="Arabic Typesetting"
docx run               PROP  font.ea                string   ops:[asg--]  aliases:font.eastasia,font.eastasian  East-Asian font slot (rFonts/eastAsia) — Chinese / Japanese / Korean typefaces.  ex:--prop font.ea="メイリオ"
docx run               PROP  font.latin             string   ops:[asg--]  Latin font slots (rFonts/ascii + hAnsi) — ASCII / Western text.  ex:--prop font.latin=Calibri
docx run               PROP  bold.cs                bool     ops:[asg--]  aliases:font.bold.cs,boldcs  complex-script bold (<w:bCs/>). Word renders Arabic / Hebrew bold via this flag, NOT <w:b/>. Required for Arabic bold t…  ex:--prop bold.cs=true
docx run               PROP  italic.cs              bool     ops:[asg--]  aliases:font.italic.cs,italiccs  complex-script italic (<w:iCs/>). Same role as bold.cs for italic styling on Arabic / Hebrew text.  ex:--prop italic.cs=true
docx run               PROP  size.cs                font-size ops:[asg--]  aliases:font.size.cs,sizecs  complex-script font size (<w:szCs/>). Independent from the bare 'size' (<w:sz/>) which only sizes Latin text.  ex:--prop size.cs=14pt
docx run               PROP  lang.latin             string   ops:[-sg--]  aliases:lang,lang.val  Latin-script language tag (<w:lang w:val=.../>). e.g. en-US, fr-FR.  ex:--prop lang.latin=en-US
docx run               PROP  lang.ea                string   ops:[-sg--]  aliases:lang.eastAsia,lang.eastAsian  EastAsian-script language tag (<w:lang w:eastAsia=.../>). e.g. zh-CN, ja-JP.  ex:--prop lang.ea=zh-CN
docx run               PROP  lang.cs                string   ops:[-sg--]  aliases:lang.complexScript,lang.bidi  ComplexScript language tag (<w:lang w:bidi=.../>). e.g. ar-SA, he-IL.  ex:--prop lang.cs=ar-SA
docx run               PROP  vertAlign              enum     ops:[as---]  values:superscript|super|subscript|sub|baseline  aliases:vertalign  vertical text alignment. Values: superscript|super, subscript|sub, baseline.  ex:--prop vertAlign=superscript
docx run               PROP  charSpacing            length   ops:[asg--]  aliases:charspacing,letterspacing,letterSpacing,spacing  character spacing (letter spacing) in points. Stored as twips × 20.  ex:--prop charSpacing=1pt
docx run               PROP  shading                color    ops:[asg--]  aliases:shd  background shading color or '<pattern>;<fill>;<color>' triplet.  ex:--prop shading=FFFF00
docx run               PROP  textOutline            string   ops:[asg--]  aliases:textoutline  w14 text outline 'WIDTHpt-COLOR' (e.g. '1pt-FF0000'). Width first, color second; '-' or ';' separator.  ex:--prop textOutline=1pt-FF0000
docx run               PROP  textFill               string   ops:[asg--]  aliases:textfill  w14 text fill (color or gradient spec).  ex:--prop textFill=FF0000
docx run               PROP  w14shadow              string   ops:[asg--]  w14 text shadow effect.  ex:--prop w14shadow=FF0000
docx run               PROP  w14glow                string   ops:[asg--]  w14 text glow effect.  ex:--prop w14glow=FF0000
docx run               PROP  w14reflection          string   ops:[asg--]  w14 text reflection effect.  ex:--prop w14reflection=true
docx run               PROP  effective.size.src     string   ops:[-----]  source pointer for effective.size — path of the writing layer (e.g. "/styles/Heading1", "/docDefaults"). Documented but…
docx run               PROP  effective.font.ascii   string   ops:[--g--]  inheritance-resolved Latin/ASCII font slot (read-only).
docx run               PROP  effective.font.ascii.src string   ops:[-----]  source pointer for effective.font.ascii. Documented but not emitted today.
docx run               PROP  effective.font.eastAsia string   ops:[--g--]  inheritance-resolved East-Asian font slot (read-only).
docx run               PROP  effective.font.eastAsia.src string   ops:[-----]  source pointer for effective.font.eastAsia. Documented but not emitted today.
docx run               PROP  effective.font.hAnsi   string   ops:[--g--]  inheritance-resolved High-ANSI font slot (read-only).
docx run               PROP  effective.font.hAnsi.src string   ops:[-----]  source pointer for effective.font.hAnsi. Documented but not emitted today.
docx run               PROP  effective.font.cs      string   ops:[--g--]  inheritance-resolved complex-script font slot (read-only).
docx run               PROP  effective.font.cs.src  string   ops:[-----]  source pointer for effective.font.cs. Documented but not emitted today.
docx run               PROP  effective.bold.src     string   ops:[-----]  source pointer for effective.bold. Documented but not emitted today.
docx run               PROP  effective.italic       bool     ops:[--g--]  inheritance-resolved italic (read-only). Surfaced only when the run does not set 'italic' directly.
docx run               PROP  effective.italic.src   string   ops:[-----]  source pointer for effective.italic. Documented but not emitted today.
docx run               PROP  effective.color.src    string   ops:[-----]  source pointer for effective.color. Documented but not emitted today.
docx run               PROP  effective.underline    string   ops:[--g--]  inheritance-resolved underline style (read-only).
docx run               PROP  effective.underline.src string   ops:[-----]  source pointer for effective.underline. Documented but not emitted today.
docx run               PROP  effective.rtl          bool     ops:[--g--]  inheritance-resolved right-to-left flag (read-only). Emitted even when 'rtl' is set directly so callers can compare dir…
docx run               PROP  effective.rtl.src      string   ops:[--g--]  source pointer for effective.rtl.
docx run               PROP  dirty                  bool     ops:[--g--]  true when the run is flagged as dirty (rPr/dirty=1) — Word treats it as needing reflow on next open.
docx run               PROP  font.ascii             string   ops:[--g--]  individual rFonts @ascii slot readback. On Add/Set use the unified `font.latin` key (which writes both ascii + hAnsi).
docx run               PROP  font.eastAsia          string   ops:[--g--]  individual rFonts @eastAsia slot readback. On Add/Set use the `font.ea` key.
docx run               PROP  font.hAnsi             string   ops:[--g--]  individual rFonts @hAnsi slot readback. On Add/Set use the unified `font.latin` key (which writes both ascii + hAnsi).
docx run               PROP  subscript              bool     ops:[asg--]  vertical alignment = subscript. Mutually exclusive with superscript.  ex:--prop subscript=true
docx run               PROP  superscript            bool     ops:[asg--]  vertical alignment = superscript. Mutually exclusive with subscript.  ex:--prop superscript=true
docx run               PROP  effective.bold         bool     ops:[--g--]  resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on…
docx run               PROP  effective.color        color    ops:[--g--]  resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set dire…
docx run               PROP  effective.size         font-size ops:[--g--]  inheritance-resolved font size (read-only). Surfaced when the run does not set 'size' directly; resolved through run st…
docx run               PROP  underline              enum     ops:[asg--]  values:single|double|dotted|dash|wave|none|thick|dottedHeavy|dashLong|dashLongHeavy|dashDotHeavy|wavyHeavy|wavyDouble  aliases:font.underline  underline style. Common values: single, double, dotted, dash, wave, none.  ex:--prop underline=single
docx run               PROP  bold                   bool     ops:[asg--]  aliases:font.bold  true | false  ex:--prop bold=true
docx run               PROP  color                  color    ops:[asg--]  aliases:font.color  #RRGGBB uppercase  ex:--prop color=#FF0000
docx run               PROP  font                   string   ops:[as---]  aliases:fontname,fontFamily,font.name  bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readb…  ex:--prop font=Calibri
docx run               PROP  italic                 bool     ops:[asg--]  aliases:font.italic  true | false  ex:--prop italic=true
docx run               PROP  size                   font-size ops:[asg--]  aliases:fontsize,fontSize,font.size  unit-qualified, e.g. "14pt"  ex:--prop size=11
docx run               PROP  text                   string   ops:[asg--]  plain text of run  ex:--prop text="bold word"
docx sdt               ELEM  ops:[asgqr]  paths:/sdt[N];/body/p[N]/sdt[M]
docx sdt               PROP  type                   enum     ops:[a-g--]  values:text|richtext|dropdown|combobox|date  SDT variant. Only text/richtext/dropdown/combobox/date are supported at add-time. picture/checkbox are not implemented …  ex:--prop type=text
docx sdt               PROP  tag                    string   ops:[asg--]  machine-readable tag for data-binding.  ex:--prop tag=customerName
docx sdt               PROP  alias                  string   ops:[asg--]  human-readable display name shown in Word.  ex:--prop alias="Customer Name"
docx sdt               PROP  text                   string   ops:[asg--]  placeholder/initial content.  ex:--prop text="[Enter name]"
docx sdt               PROP  id                     number   ops:[--g--]  OOXML SdtId value; source of @sdtId in stable path /sdt[@sdtId=N].
docx sdt               PROP  editable               bool     ops:[--g--]  false when SdtContentLockingValues.SdtContentLocked is set on this content control.
docx section           ELEM  ops:[asgqr]  paths:/section[N];/body/sectPr[N]
docx section           PROP  type                   enum     ops:[asg--]  values:nextPage|continuous|evenPage|oddPage|nextColumn  section break type. Only applies to mid-document sections at /section[N]; the body-level path / refers to the final sec…  ex:--prop type=nextPage
docx section           PROP  pageWidth              length   ops:[asg--]  aliases:pagewidth,width  unit-qualified cm (e.g. "21cm")  ex:--prop pageWidth=21cm
docx section           PROP  pageHeight             length   ops:[asg--]  aliases:pageheight,height  unit-qualified cm (e.g. "29.7cm")  ex:--prop pageHeight=29.7cm
docx section           PROP  orientation            enum     ops:[asg--]  values:portrait|landscape  innerText of PageOrientationValues  ex:--prop orientation=landscape
docx section           PROP  marginTop              length   ops:[asg--]  unit-qualified cm  ex:--prop marginTop=2.5cm
docx section           PROP  marginBottom           length   ops:[asg--]  unit-qualified cm  ex:--prop marginBottom=2.5cm
docx section           PROP  marginLeft             length   ops:[asg--]  unit-qualified cm  ex:--prop marginLeft=3cm
docx section           PROP  marginRight            length   ops:[asg--]  unit-qualified cm  ex:--prop marginRight=3cm
docx section           PROP  columns                int      ops:[asg--]  aliases:columns.count  number of text columns. Add accepts combined form "N" or "N,SPACE" (e.g. "2,1cm"); separate space override via alias "c…  ex:--prop columns=2
docx section           PROP  columnSpace            length   ops:[asg--]  aliases:columns.space  space between columns. Canonical key. Legacy alias 'columns.space' still accepted on Add/Set.  ex:--prop columnSpace=1cm
docx section           PROP  titlePage              bool     ops:[asg--]  aliases:titlepage,titlepg  enable distinct first-page header/footer for the section (writes <w:titlePg/>).  ex:--prop titlePage=true
docx section           PROP  pageNumFmt             enum     ops:[asg--]  values:decimal|lowerRoman|upperRoman|lowerLetter|upperLetter|hindiNumbers|hindiVowels|hindiConsonants|hindiCounting|arabicAlpha|arabicAbjad|thaiNumbers|thaiLetters|thaiCounting|chineseCounting|chineseCountingThousand|chineseLegalSimplified|japaneseCounting|japaneseLegal|japaneseDigitalTen|koreanCounting|koreanLegal|koreanDigital|ideographDigital|ideographTraditional|ideographZodiac|none  aliases:pagenumfmt,pagenumberformat,pagenumberfmt  page-number numeric format (writes w:pgNumType/@w:fmt). Common: decimal / lowerRoman / upperRoman / lowerLetter / upper…  ex:--prop pageNumFmt=lowerRoman
docx section           PROP  direction              enum     ops:[asg--]  values:ltr|rtl  aliases:dir,bidi  section reading direction (writes <w:bidi/> on sectPr). Flips page side, header/footer anchors, and gutter for Arabic /…  ex:--prop direction=rtl
docx section           PROP  rtlGutter              bool     ops:[asg--]  aliases:rtlgutter  places the binding gutter on the right side (writes <w:rtlGutter/> on sectPr). Used together with direction=rtl for Ara…  ex:--prop rtlGutter=true
docx section           PROP  pageStart              int      ops:[asg--]  aliases:pagestart,pagenumberstart,pagenumstart  starting page number for the section (writes w:pgNumType/@w:start). Use 'none'/'off' to clear.  ex:--prop pageStart=1
docx section           PROP  lineNumbers            enum     ops:[asg--]  values:continuous|restartPage|restartSection  one of values  ex:--prop lineNumbers=continuous
docx section           PROP  lineNumberCountBy      int      ops:[asg--]  aliases:linenumbercountby  line numbering interval (every Nth line gets a number). Companion to lineNumbers; only emitted when > 1.  ex:--prop lineNumbers=continuous --prop lineNumberCountBy=5
docx section           PROP  headerRef              string   ops:[--g--]  path to primary (default) header part. Convenience shortcut equal to headerRef.default when present.
docx section           PROP  headerRef.default      string   ops:[--g--]  path to default-type header part.
docx section           PROP  headerRef.first        string   ops:[--g--]  path to first-page-only header part.
docx section           PROP  headerRef.even         string   ops:[--g--]  path to even-page header part.
docx section           PROP  footerRef              string   ops:[--g--]  path to primary (default) footer part. Convenience shortcut equal to footerRef.default when present.
docx section           PROP  footerRef.default      string   ops:[--g--]  path to default-type footer part.
docx section           PROP  footerRef.first        string   ops:[--g--]  path to first-page-only footer part.
docx section           PROP  footerRef.even         string   ops:[--g--]  path to even-page footer part.
docx section           PROP  colSpaces              string   ops:[--g--]  per-column space overrides — comma-separated EMU/twips values, one per column. Surfaces when columns carry individual @…
docx section           PROP  columns.equalWidth     bool     ops:[--g--]  sectPr cols @equalWidth flag — true when all columns share the same width.
docx section           PROP  columns.separator      bool     ops:[--g--]  sectPr cols @sep flag — vertical separator line drawn between columns.
docx style             ELEM  ops:[asgqr]  paths:/styles/StyleId
docx style             PROP  id                     string   ops:[a-g--]  aliases:styleId,styleid  w:styleId (unique, immutable identity). Aliases fall through to 'name' when 'id' is omitted. Renaming after Add would r…  ex:--prop id=MyAccent
docx style             PROP  name                   string   ops:[asg--]  aliases:styleName,stylename  display name. Defaults to 'id' when omitted.  ex:--prop name="My Accent"
docx style             PROP  type                   enum     ops:[a-g--]  values:paragraph|character|table|numbering  one of values (innerText of StyleValues)  ex:--prop type=paragraph
docx style             PROP  basedOn                string   ops:[asg--]  aliases:basedon  parent style id to inherit from. Must be an existing w:styleId (not display name). Inherited properties are overridden …  ex:--prop basedOn=Normal
docx style             PROP  basedOn.path           string   ops:[--g--]  resolved path to the parent style node (get-only). Shortcut: use basedOn to Set.
docx style             PROP  next                   string   ops:[asg--]  next-paragraph style id.  ex:--prop next=Normal
docx style             PROP  align                  enum     ops:[asg--]  values:left|center|right|justify|both|distribute  aliases:alignment  one of values  ex:--prop align=center
docx style             PROP  spaceBefore            length   ops:[asg--]  aliases:spacebefore  unit-qualified  ex:--prop spaceBefore=12pt
docx style             PROP  spaceAfter             length   ops:[asg--]  aliases:spaceafter  unit-qualified  ex:--prop spaceAfter=6pt
docx style             PROP  font                   string   ops:[asg--]  font name  ex:--prop font="Calibri"
docx style             PROP  size                   font-size ops:[asg--]  font size. Accepts bare number or pt-suffixed.  ex:--prop size=14
docx style             PROP  bold                   bool     ops:[asg--]  true/false  ex:--prop bold=true
docx style             PROP  italic                 bool     ops:[asg--]  true/false  ex:--prop italic=true
docx style             PROP  color                  color    ops:[asg--]  font color. Accepts #RRGGBB, RRGGBB, named colors (red, blue…), rgb(r,g,b), or 3-char shorthand (F00).  ex:--prop color=#FF0000
docx style             PROP  underline              string   ops:[asg--]  underline style (true/false, single, double, thick, dotted, dash, wavy, none, ...). Applied to the style's rPr.  ex:--prop underline=single
docx style             PROP  strike                 bool     ops:[asg--]  aliases:strikethrough  single-line strikethrough on the style's rPr.  ex:--prop strike=true
docx style             PROP  dstrike                bool     ops:[asg--]  aliases:doublestrike  double-line strikethrough on the style's rPr.  ex:--prop dstrike=true
docx style             PROP  highlight              string   ops:[asg--]  highlight color (yellow, green, cyan, magenta, blue, red, darkBlue, darkCyan, darkGreen, darkMagenta, darkRed, darkYell…  ex:--prop highlight=yellow
docx style             PROP  caps                   bool     ops:[asg--]  all-caps display on the style's rPr.  ex:--prop caps=true
docx style             PROP  smallCaps              bool     ops:[asg--]  aliases:smallcaps  small-caps display on the style's rPr.  ex:--prop smallCaps=true
docx style             PROP  vanish                 bool     ops:[asg--]  aliases:hidden  hidden text on the style's rPr.  ex:--prop vanish=true
docx style             PROP  rtl                    bool     ops:[asg--]  right-to-left run layout on the style's rPr.  ex:--prop rtl=true
docx style             PROP  vertAlign              enum     ops:[asg--]  values:superscript|subscript|baseline  aliases:vertalign,verticalAlign  vertical text alignment (superscript/subscript) on the style's rPr.  ex:--prop vertAlign=superscript
docx style             PROP  charSpacing            length   ops:[asg--]  aliases:charspacing,letterSpacing,letterspacing  character spacing (letter-spacing) on the style's rPr.  ex:--prop charSpacing=2pt
docx style             PROP  shading                color    ops:[asg--]  aliases:shd  background shading fill color on the style's rPr (or pPr for paragraph styles).  ex:--prop shading=#FFFF00
docx style             PROP  lineSpacing            string   ops:[asg--]  aliases:linespacing  line spacing — multiplier (1.5x, 150%) or fixed (18pt). Applied to the style's pPr.  ex:--prop lineSpacing=1.5x
docx style             PROP  contextualSpacing      bool     ops:[asg--]  aliases:contextualspacing  suppress spacing between paragraphs of the same style.  ex:--prop contextualSpacing=true
docx style             PROP  outlineLvl             int      ops:[asg--]  aliases:outlinelvl,outlineLevel,outlinelevel  outline level (0-9, 0=Heading 1). Drives TOC and Navigator. Applied to the style's pPr.  ex:--prop outlineLvl=0
docx style             PROP  kinsoku                bool     ops:[asg--]  kinsoku (CJK line-break rules) toggle. Applied to the style's pPr.  ex:--prop kinsoku=true
docx style             PROP  snapToGrid             bool     ops:[as---]  aliases:snaptogrid  snap to document grid for CJK layout. Applied to the style's pPr. Add/Set only — Get does not surface this back today.  ex:--prop snapToGrid=false
docx style             PROP  wordWrap               bool     ops:[as---]  aliases:wordwrap  allow word-break for non-CJK text inside CJK lines. Applied to the style's pPr. Add/Set only — Get does not surface thi…  ex:--prop wordWrap=true
docx style             PROP  autoSpaceDE            bool     ops:[asg--]  aliases:autospacede  auto spacing between East-Asian and Latin text. Applied to the style's pPr.  ex:--prop autoSpaceDE=true
docx style             PROP  autoSpaceDN            bool     ops:[asg--]  aliases:autospacedn  auto spacing between East-Asian text and numbers. Applied to the style's pPr.  ex:--prop autoSpaceDN=true
docx style             PROP  bidi                   bool     ops:[asg--]  right-to-left paragraph direction. Applied to the style's pPr.  ex:--prop bidi=true
docx style             PROP  direction              enum     ops:[asg--]  values:rtl|ltr  aliases:dir  Paragraph reading direction (Arabic / Hebrew). 'rtl' writes <w:bidi/> on the style pPr; equivalent to bidi=true in cano…  ex:--prop direction=rtl
docx style             PROP  overflowPunct          bool     ops:[asg--]  aliases:overflowpunct  allow punctuation to hang outside the text margin (CJK). Applied to the style's pPr.  ex:--prop overflowPunct=true
docx style             PROP  topLinePunct           bool     ops:[as---]  aliases:toplinepunct  compress punctuation at the start of a line (CJK). Applied to the style's pPr. Add/Set only — Get does not surface this…  ex:--prop topLinePunct=true
docx style             PROP  suppressAutoHyphens    bool     ops:[as---]  aliases:suppressautohyphens  disable automatic hyphenation in this style. Add/Set only — Get does not surface this back today.  ex:--prop suppressAutoHyphens=true
docx style             PROP  suppressLineNumbers    bool     ops:[as---]  aliases:suppresslinenumbers  exclude this paragraph style from line numbering. Add/Set only — Get does not surface this back today.  ex:--prop suppressLineNumbers=true
docx style             PROP  keepNext               bool     ops:[asg--]  aliases:keepnext  keep this paragraph on the same page as the next.  ex:--prop keepNext=true
docx style             PROP  keepLines              bool     ops:[asg--]  aliases:keeplines  keep all lines of this paragraph together on one page.  ex:--prop keepLines=true
docx style             PROP  pageBreakBefore        bool     ops:[asg--]  aliases:pagebreakbefore  force a page break before each paragraph using this style.  ex:--prop pageBreakBefore=true
docx style             PROP  widowControl           bool     ops:[asg--]  aliases:widowcontrol  prevent widows and orphans (single isolated lines).  ex:--prop widowControl=true
docx style             PROP  pbdr                   string   ops:[-s---]  aliases:border  paragraph border. Sub-keys: pbdr.top / pbdr.bottom / pbdr.left / pbdr.right / pbdr.between / pbdr.bar / pbdr.all. Value…  ex:--prop pbdr.bottom=single:6:#FF0000
docx style             PROP  numId                  int      ops:[asg--]  aliases:numid  numbering instance ID this style references. Paragraphs using --prop style=<id> inherit numbering through ResolveNumPrF…  ex:--prop numId=3
docx style             PROP  ilvl                   int      ops:[asg--]  aliases:numLevel,numlevel  list level (0-8) for the style-borne numPr.  ex:--prop ilvl=0
docx style             PROP  effective.alignment    string   ops:[--g--]  resolved paragraph alignment after walking basedOn → linked → docDefaults.
docx style             PROP  effective.alignment.src string   ops:[--g--]  source pointer for effective.alignment (style id chain).
docx style             PROP  effective.direction    string   ops:[--g--]  resolved paragraph reading direction (rtl|ltr).
docx style             PROP  effective.direction.src string   ops:[--g--]  source pointer for effective.direction.
docx style             PROP  effective.highlight    string   ops:[--g--]  resolved highlight color name (yellow|green|cyan|...) inherited from the style chain.
docx style             PROP  effective.lineSpacing  string   ops:[--g--]  resolved line spacing (`<N>x` or `<N>pt`).
docx style             PROP  effective.lineSpacing.src string   ops:[--g--]  source pointer for effective.lineSpacing.
docx style             PROP  effective.spaceBefore  string   ops:[--g--]  resolved space-before (unit-qualified).
docx style             PROP  effective.spaceBefore.src string   ops:[--g--]  source pointer for effective.spaceBefore.
docx style             PROP  effective.spaceAfter   string   ops:[--g--]  resolved space-after (unit-qualified).
docx style             PROP  effective.spaceAfter.src string   ops:[--g--]  source pointer for effective.spaceAfter.
docx style             PROP  effective.strike       bool     ops:[--g--]  true when strike-through is inherited from the style chain.
docx styles            ELEM  ops:[a-gq-]  paths:/styles
docx styles            PROP  count                  number   ops:[--g--]  total number of style definitions in styles.xml.
docx table             ELEM  ops:[asgqr]  paths:/body/tbl[N]
docx table             PROP  colWidths              string   ops:[a-g--]  aliases:colwidths  comma-separated per-column widths in twips. Aliases: colwidths.  ex:--prop colWidths=3000,2000,5000
docx table             PROP  direction              enum     ops:[asg--]  values:rtl|ltr  aliases:dir,bidi  Reading direction (Arabic / Hebrew). 'rtl' writes <w:bidiVisual/> on tblPr (mirrors column order); 'ltr' clears it. Dis…  ex:--prop direction=rtl
docx table             PROP  align                  enum     ops:[asg--]  values:left|center|right  aliases:alignment  one of values  ex:--prop align=center
docx table             PROP  indent                 int      ops:[asg--]  table indent in twips.  ex:--prop indent=200
docx table             PROP  cellSpacing            int      ops:[asg--]  aliases:cellspacing  space between cells in twips. Alias: cellspacing.  ex:--prop cellSpacing=40
docx table             PROP  layout                 enum     ops:[asg--]  values:fixed|autofit  one of values  ex:--prop layout=fixed
docx table             PROP  padding                int      ops:[as---]  default cell padding (all four sides) in twips. Add/Set only — Get does not surface the table-default cell margin today.  ex:--prop padding=100
docx table             PROP  border.all             string   ops:[as---]  aliases:border  shorthand: applies the border to every edge of every cell. PPT OOXML has no table-level border element — this fans out …  ex:--prop border.all="single;1pt;FF0000"
docx table             PROP  border.bottom          string   ops:[as---]  outer bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DAS…  ex:--prop border.bottom="single;2pt;000000"
docx table             PROP  border.horizontal      string   ops:[as---]  aliases:border.insideh,border.insideH  inside-horizontal dividers (between rows). Fans out to bottom of rows 1..N-1 plus top of rows 2..N. PPT has no native i…  ex:--prop border.horizontal="single;1pt;CCCCCC"
docx table             PROP  border.left            string   ops:[as---]  outer left edge: applies to the left of column-1 cells in every row only. Format same as border.all. Cross-format note:…  ex:--prop border.left="single;1pt;808080"
docx table             PROP  border.right           string   ops:[as---]  outer right edge: applies to the right of last-column cells in every row only. Format same as border.all. Cross-format …  ex:--prop border.right="single;1pt;808080"
docx table             PROP  border.top             string   ops:[as---]  outer top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH C…  ex:--prop border.top="single;2pt;000000"
docx table             PROP  border.vertical        string   ops:[as---]  aliases:border.insidev,border.insideV  inside-vertical dividers (between columns). Fans out to right of cols 1..M-1 plus left of cols 2..M. Alias: border.insi…  ex:--prop border.vertical="single;1pt;CCCCCC"
docx table             PROP  cols                   int      ops:[a-g--]  number of columns (ignored if 'data' is supplied).  ex:--prop cols=3
docx table             PROP  data                   string   ops:[a----]  inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.  ex:--prop data="A,B;1,2"
docx table             PROP  rows                   int      ops:[a-g--]  number of rows (ignored if 'data' is supplied).  ex:--prop rows=3
docx table             PROP  width                  string   ops:[asg--]  table width in twips (Dxa) or percent ('50%' → Pct).  ex:--prop width=10cm
docx table             PROP  style                  string   ops:[asg--]  aliases:tableStyle,tableStyleId  table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, no…  ex:--prop style=medium2
docx table-cell        ELEM  ops:[asgqr]  paths:/body/tbl[N]/tr[R]/tc[C]
docx table-cell        PROP  width                  int      ops:[asg--]  cell width in twips (Dxa).  ex:--prop width=2500
docx table-cell        PROP  font                   string   ops:[-sg--]  aliases:fontname,fontFamily  font family applied to every run in every paragraph in the cell (set-only; apply after add).  ex:--prop font="Times New Roman"
docx table-cell        PROP  size                   font-size ops:[-sg--]  aliases:fontsize  font size applied to every run in the cell. Accepts raw number (points), '14pt', '10.5pt' (set-only; apply after add).  ex:--prop size=14pt
docx table-cell        PROP  bold                   bool     ops:[-sg--]  bold applied to every run in the cell (set-only; apply after add).  ex:--prop bold=true
docx table-cell        PROP  italic                 bool     ops:[-sg--]  italic applied to every run in the cell (set-only; apply after add).  ex:--prop italic=true
docx table-cell        PROP  underline              enum     ops:[-sg--]  values:none|single|double|thick|dotted|dash|wave|words  underline style applied to every run in the cell (set-only; apply after add).  ex:--prop underline=single
docx table-cell        PROP  strike                 bool     ops:[-sg--]  strike-through applied to every run in the cell (set-only; apply after add).  ex:--prop strike=true
docx table-cell        PROP  color                  color    ops:[-sg--]  run text color applied to every run in the cell (set-only; apply after add).  ex:--prop color=FF0000
docx table-cell        PROP  highlight              color    ops:[-sg--]  text highlight color. Mapped to Word's named highlight palette (yellow, green, cyan, magenta, blue, red, darkBlue, …) (…  ex:--prop highlight=yellow
docx table-cell        PROP  align                  enum     ops:[-sg--]  values:left|center|right|justify|both|distribute  aliases:alignment  horizontal paragraph alignment applied to every paragraph in the cell (set-only; apply after add).  ex:--prop align=center
docx table-cell        PROP  valign                 enum     ops:[-sg--]  values:top|center|bottom  vertical alignment of cell contents (set-only; apply after add).  ex:--prop valign=center
docx table-cell        PROP  colspan                int      ops:[-sg--]  aliases:gridspan  number of grid columns this cell spans. Aliases: gridspan. Adjusts cell width to the sum of spanned grid columns and re…  ex:--prop colspan=2
docx table-cell        PROP  fitText                bool     ops:[-s---]  aliases:fittext  enable w:fitText on every run so text is squeezed to the cell width (set-only; apply after add).  ex:--prop fitText=true
docx table-cell        PROP  textDirection          enum     ops:[-sg--]  values:lrtb|btlr|tbrl|horizontal|vertical|vertical-rl|tbrl-r|lrtb-r|tblr-r  aliases:textdir  text flow direction inside the cell. Aliases: textdir (set-only; apply after add).  ex:--prop textDirection=btlr
docx table-cell        PROP  direction              enum     ops:[asg--]  values:rtl|ltr  aliases:dir,bidi  Reading direction (Arabic / Hebrew). 'rtl' writes <w:bidi/> on every cell paragraph, <w:rtl/> on each paragraph mark, a…  ex:--prop direction=rtl
docx table-cell        PROP  nowrap                 bool     ops:[-sg--]  disable text wrapping inside the cell (set-only; apply after add).  ex:--prop nowrap=true
docx table-cell        PROP  padding.top            number   ops:[-sg--]  top cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.  ex:--prop padding.top=100
docx table-cell        PROP  padding.bottom         number   ops:[-sg--]  bottom cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.  ex:--prop padding.bottom=100
docx table-cell        PROP  padding.left           number   ops:[-sg--]  left cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.  ex:--prop padding.left=100
docx table-cell        PROP  padding.right          number   ops:[-sg--]  right cell margin in twips (integer; 1 twip = 1/20 pt, e.g. 100 = 5pt). Raw integer only — no unit suffix.  ex:--prop padding.right=100
docx table-cell        PROP  border.all             string   ops:[as---]  aliases:border  all four cell edges. Format: 'WIDTH[ DASH][ COLOR]' (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' (style igno…  ex:--prop border.all="single;1pt;FF0000"
docx table-cell        PROP  border.bottom          string   ops:[-s---]  bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLO…  ex:--prop border.bottom="single;1pt;808080"
docx table-cell        PROP  border.left            string   ops:[-s---]  left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR'…  ex:--prop border.left="single;1pt;808080"
docx table-cell        PROP  border.right           string   ops:[-s---]  right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR…  ex:--prop border.right="single;1pt;808080"
docx table-cell        PROP  border.tl2br           string   ops:[as---]  diagonal from top-left to bottom-right (a:lnTlToBr). Format same as border.all. Cross-format note: docx only accepts th…  ex:--prop border.tl2br="single;1pt;FF0000"
docx table-cell        PROP  border.top             string   ops:[-s---]  top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' …  ex:--prop border.top="single;2pt;000000"
docx table-cell        PROP  border.tr2bl           string   ops:[as---]  diagonal from top-right to bottom-left (a:lnBlToTr). Format same as border.all. Cross-format note: docx only accepts th…  ex:--prop border.tr2bl="single;1pt;FF0000"
docx table-cell        PROP  fill                   color    ops:[asg--]  aliases:background,shd,shading  cell background fill. Accepts a solid color (hex, named, rgb(...)), 'none' for explicit no-fill, or a gradient string '…  ex:--prop fill=FFFF00
docx table-cell        PROP  text                   string   ops:[asg--]  single-run text content placed in a fresh paragraph.  ex:--prop text="Hello"
docx table-row         ELEM  ops:[asgqr]  paths:/body/tbl[N]/tr[R]
docx table-row         PROP  height.exact           length   ops:[as---]  row height in twips (Exact rule, cannot grow). Add/Set only — Get does not surface a separate exact-height key; inspect…  ex:--prop height.exact=500
docx table-row         PROP  header                 bool     ops:[asg--]  repeat row as table header on every page.  ex:--prop header=true
docx table-row         PROP  height.rule            string   ops:[--g--]  row height rule readback — `exact` when the row enforces a fixed height, otherwise absent (auto/atLeast).
docx table-row         PROP  cols                   int      ops:[a----]  override column count for the new row (defaults to table grid column count).  ex:--prop cols=4
docx table-row         PROP  height                 length   ops:[asg--]  row height in EMU-parseable length. Defaults to first-row height or ~1cm.  ex:--prop height=1cm
docx toc               ELEM  ops:[asgqr]  paths:/toc;/tableofcontents
docx toc               PROP  levels                 string   ops:[asg--]  heading range (e.g. '1-3').  ex:--prop levels=1-3
docx toc               PROP  title                  string   ops:[asg--]  optional caption above the TOC.  ex:--prop title="Contents"
docx toc               PROP  hyperlinks             bool     ops:[asg--]  generate clickable links.  ex:--prop hyperlinks=true
docx toc               PROP  pageNumbers            bool     ops:[asg--]  aliases:pagenumbers  include page numbers in TOC entries (Add/Set use lowercase alias 'pagenumbers').  ex:--prop pageNumbers=false
docx trackedchange     ELEM  ops:[--gq-]  paths:/body/p[N]/ins[M];/body/p[N]/del[M]
docx trackedchange     PROP  type                   enum     ops:[--g--]  values:ins|del|moveTo|moveFrom  revision type (read-only)  ex:--prop type=ins
docx trackedchange     PROP  text                   string   ops:[--g--]  text content for ins / content marker for del (read-only).
docx trackedchange     PROP  author                 string   ops:[--g--]  revision author (read-only)
docx trackedchange     PROP  date                   string   ops:[--g--]  ISO-8601 timestamp (read-only).
docx watermark         ELEM  ops:[asgqr]  paths:/watermark
docx watermark         PROP  text                   string   ops:[asg--]  watermark text (text variant).  ex:--prop text=DRAFT
docx watermark         PROP  image                  string   ops:[as---]  aliases:src,path  image source for image watermark. Aliases: src, path.  ex:--prop image=/path/to/logo.png
docx watermark         PROP  color                  color    ops:[asg--]  #-prefixed hex  ex:--prop color=#C0C0C0
docx watermark         PROP  font                   string   ops:[asg--]  font name  ex:--prop font=Calibri
docx watermark         PROP  rotation               int      ops:[asg--]  degrees. Defaults to -45 for diagonal.  ex:--prop rotation=-45
docx watermark         PROP  opacity                string   ops:[asg--]  opacity 0..1 float as string (e.g. 0.5). Verbatim VML attribute injection.  ex:--prop opacity=.5
docx watermark         PROP  size                   string   ops:[asg--]  font size for text watermark (pt). Default 1pt (auto-fit).  ex:--prop size=72pt
docx watermark         PROP  width                  string   ops:[asg--]  watermark shape width (pt/in/cm).  ex:--prop width=415pt
docx watermark         PROP  height                 string   ops:[asg--]  watermark shape height (pt/in/cm).  ex:--prop height=207.5pt
xlsx aboveaverage      ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx aboveaverage      PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx aboveaverage      PROP  aboveAverage           bool     ops:[a-g--]  aliases:above,aboveaverage  highlight above-average values (default true). Set false for below-average.  ex:--prop aboveAverage=true
xlsx aboveaverage      PROP  stdDev                 number   ops:[a----]  standard-deviation count (1, 2, ...) above/below the mean.  ex:--prop stdDev=1
xlsx aboveaverage      PROP  equalAverage           bool     ops:[a----]  include cells equal to the mean.  ex:--prop equalAverage=true
xlsx aboveaverage      PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFFF00
xlsx aboveaverage      PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx aboveaverage      PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx aboveaverage      PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx aboveaverage      PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx aboveaverage      PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx aboveaverage      PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx autofilter        ELEM  ops:[asgqr]  paths:/SheetName/autofilter
xlsx autofilter        PROP  range                  string   ops:[asg--]  aliases:ref  cell range the filter applies to. Required.  ex:--prop range=A1:F100
xlsx autofilter        PROP  criteria0              string   ops:[a----]  column 0 filter criterion. Use dotted key: --prop criteria0.OP=VAL. OP ∈ equals/notEquals/contains/doesNotContain/begin…  ex:--prop criteria0.equals=Red
xlsx cell              ELEM  ops:[asgqr]  paths:/<sheetName>/<A1Ref>;/Sheet1/A1;/Sheet1/B2:C3
xlsx cell              PROP  value                  string   ops:[asg--]  literal cell value — string, number, or date. Numeric strings are stored as numbers. Readback lives in DocumentNode.Tex…  ex:--prop value="Hello"
xlsx cell              PROP  formula                string   ops:[asg--]  cell formula, without leading =  ex:--prop formula="SUM(A1:A10)"
xlsx cell              PROP  numberformat           string   ops:[asg--]  aliases:format,numfmt  Excel number format string  ex:--prop numberformat="#,##0.00"
xlsx cell              PROP  font.bold              bool     ops:[asg--]  aliases:bold  bold font weight on the cell.  ex:--prop bold=true
xlsx cell              PROP  font.italic            bool     ops:[asg--]  aliases:italic  italic style on the cell.  ex:--prop italic=true
xlsx cell              PROP  font.name              string   ops:[asg--]  aliases:font,fontname  font family name. Aliases: font, fontname.  ex:--prop font="Calibri"
xlsx cell              PROP  font.size              font-size ops:[asg--]  aliases:size,fontsize  unit-qualified, e.g. "11pt"  ex:--prop size=11pt
xlsx cell              PROP  font.color             color    ops:[asg--]  font color on the cell. Note: the bare 'color' alias is intentionally rejected on cells due to ambiguity with 'fill' (b…  ex:--prop font.color=FF0000
xlsx cell              PROP  fill                   color    ops:[asg--]  aliases:bgcolor  cell background fill. Solid color (hex / named / rgb(...)) or a linear gradient as 'COLOR1-COLOR2[-ANGLE]' / 'gradient;…  ex:--prop fill=FFFF00
xlsx cell              PROP  strike                 bool     ops:[asg--]  aliases:strikethrough,font.strike  single strikethrough on the cell text.  ex:--prop strike=true
xlsx cell              PROP  underline              enum     ops:[asg--]  values:single|double|singleAccounting|doubleAccounting|none  aliases:font.underline  underline style on the cell text.  ex:--prop underline=single
xlsx cell              PROP  locked                 bool     ops:[as---]  cell protection: lock the cell against edits when the sheet is protected. Default Excel behavior is locked=true. Add/Se…  ex:--prop locked=false
xlsx cell              PROP  protection.locked      bool     ops:[--g--]  cell protection lock state. Get-only readback (dotted form). For Add/Set use the flat `locked` key.
xlsx cell              PROP  protection.hidden      bool     ops:[--g--]  hide formula in protected sheet. Get-only readback.
xlsx cell              PROP  numFmtId               number   ops:[--g--]  raw OOXML number format id (supplementary; prefer `numberformat`). Emitted only when numFmtId > 0.
xlsx cell              PROP  phonetic               string   ops:[--g--]  phonetic guide text from SST PhoneticRun. Emitted only when present.
xlsx cell              PROP  quotePrefix            bool     ops:[--g--]  leading apostrophe quote-prefix flag. Emitted only when set.
xlsx cell              PROP  alignment.horizontal   enum     ops:[asg--]  values:left|center|right|justify|fill|distributed  aliases:halign  horizontal text alignment. Alias: halign.  ex:--prop alignment.horizontal=center
xlsx cell              PROP  alignment.vertical     enum     ops:[asg--]  values:top|center|bottom  aliases:valign  vertical text alignment. Alias: valign.  ex:--prop alignment.vertical=center
xlsx cell              PROP  alignment.wrapText     bool     ops:[asg--]  aliases:wrap,wrapText  wrap text within the cell. Aliases: wrap, wrapText.  ex:--prop alignment.wrapText=true
xlsx cell              PROP  alignment.readingOrder enum     ops:[asg--]  values:context|ltr|rtl  aliases:readingorder,readingOrder,direction,dir  cell text reading direction (OOXML 0=context, 1=ltr, 2=rtl). Use 'rtl' for Arabic / Hebrew, 'ltr' to force left-to-righ…  ex:--prop alignment.readingOrder=rtl
xlsx cell              PROP  merge                  string   ops:[as---]  merge range applied post-cell-creation (parity with `set`). Accepts a single A1 range (A1:C3) or comma-separated ranges…  ex:--prop merge=A1:C3
xlsx cell              PROP  ref                    string   ops:[a----]  aliases:address  target A1 cell reference (alternative to encoding the address in the path tail).  ex:--prop ref=B2
xlsx cell              PROP  link                   string   ops:[asg--]  hyperlink target attached to the cell. Accepts external URL (https://, http://, mailto:, file://, onenote:, tel:) or in…  ex:--prop link=https://example.com
xlsx cell              PROP  tooltip                string   ops:[as---]  aliases:screenTip,screentip  ScreenTip text shown on hover for an existing hyperlink. Pair with link= during Add, or apply to a cell that already ha…  ex:--prop link=https://example.com --prop tooltip="Open in browser"
xlsx cell              PROP  type                   enum     ops:[asg--]  values:string|number|boolean|date|error|richtext  force a cell type. Normally inferred from value/formula. Add/Set accept the listed values only; SST-backed shared strin…  ex:--prop value=01234 --prop type=string
xlsx cell              PROP  runs                   string   ops:[a----]  rich-text runs as JSON array (e.g. '[{"text":"Hello","bold":true}]'). Used when type=richtext.  ex:--prop type=richtext --prop runs='[{"text":"Bold","bold":true}]'
xlsx cell              PROP  clear                  bool     ops:[as---]  clear the cell value/formula before applying new content.  ex:--prop clear=true
xlsx cell              PROP  arrayformula           string   ops:[as---]  dynamic-array formula spilled into ref range (without leading '=').  ex:--prop arrayformula="A1:A10*2" --prop ref=B1:B10
xlsx cell              PROP  cachedValue            string   ops:[--g--]  cached display value computed by the formula evaluator. Surfaces only on Get/Query for formula cells; absent on plain-v…
xlsx cell              PROP  alignment.indent       number   ops:[--g--]  cell alignment indent units (CT_CellAlignment @indent). Use the flat `indent` key on Add/Set.
xlsx cell              PROP  alignment.shrinkToFit  bool     ops:[--g--]  cell alignment shrinkToFit flag.
xlsx cell              PROP  alignment.textRotation number   ops:[--g--]  cell alignment text rotation in degrees (CT_CellAlignment @textRotation).
xlsx cell              PROP  font.subscript         bool     ops:[--g--]  font vertical-alignment subscript flag (legacy alias of cell-level `subscript`).
xlsx cell              PROP  font.superscript       bool     ops:[--g--]  font vertical-alignment superscript flag (legacy alias of cell-level `superscript`).
xlsx cell              PROP  border.diagonal        string   ops:[--g--]  diagonal border line style (CT_Border/diagonal @style — thin, medium, thick, dashed, etc.).
xlsx cell              PROP  border.diagonal.color  color    ops:[--g--]  diagonal border color.
xlsx cell              PROP  border.diagonalDown    bool     ops:[--g--]  true when the cell shows a top-left → bottom-right diagonal border.
xlsx cell              PROP  border.diagonalUp      bool     ops:[--g--]  true when the cell shows a bottom-left → top-right diagonal border.
xlsx cell              PROP  arrayref               string   ops:[--g--]  array-formula spill range (CellFormula @ref). Surfaces on the master cell of an array formula.
xlsx cell              PROP  mergeAnchor            bool     ops:[--g--]  true when this cell is the top-left anchor of a merged range. Empty merged-region cells receive mergeAnchor=false; the …
xlsx cell              PROP  empty                  bool     ops:[--g--]  true when the cell has neither display text nor a formula. Useful for distinguishing styled-but-empty cells from data c…
xlsx cell              PROP  richtext               bool     ops:[--g--]  true when the cell stores rich-text runs (multi-format text). Surfaces alongside `runs` in Get output.
xlsx cell              PROP  subscript              bool     ops:[--g--]  cell-level run subscript flag (when cell is rich text with a single run).
xlsx cell              PROP  superscript            bool     ops:[--g--]  cell-level run superscript flag (when cell is rich text with a single run).
xlsx cellis            ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx cellis            PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A10
xlsx cellis            PROP  operator               enum     ops:[a-g--]  values:greaterThan|lessThan|greaterThanOrEqual|lessThanOrEqual|equal|notEqual|between|notBetween  comparison operator. Aliases: gt/lt/gte/lte/eq/ne/=, etc.  ex:--prop operator=greaterThan
xlsx cellis            PROP  value                  string   ops:[a-g--]  aliases:formula,value1  primary comparison value (literal or formula). Required.  ex:--prop value=50
xlsx cellis            PROP  value2                 string   ops:[a-g--]  aliases:formula2,maxvalue  secondary value, only used by between/notBetween.  ex:--prop value2=100
xlsx cellis            PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFFF00
xlsx cellis            PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx cellis            PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx cellis            PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx cellis            PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx cellis            PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx cellis            PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx cfextended        ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx cfextended        PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx cfextended        PROP  type                   enum     ops:[a----]  values:belowAverage|containsBlanks|notContainsBlanks|containsErrors|notContainsErrors|contains|notContains|beginsWith|endsWith  subtype selector. Required.  ex:--prop type=containsBlanks
xlsx cfextended        PROP  text                   string   ops:[a-g--]  substring for contains/notContains/beginsWith/endsWith subtypes.  ex:--prop text=error
xlsx cfextended        PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFCCCC
xlsx cfextended        PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx cfextended        PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx cfextended        PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx cfextended        PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx cfextended        PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx cfextended        PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx chart             ELEM  ops:[asgqr]  paths:/SheetName/chart[N]
xlsx chart             PROP  radarStyle             string   ops:[asg--]  aliases:radarstyle  radar chart style token (standard | marker | filled).  ex:--prop radarstyle=filled
xlsx chart             PROP  roundedCorners         string   ops:[asg--]  aliases:roundedcorners  chartSpace roundedCorners flag (true|false).  ex:--prop roundedcorners=true
xlsx chart             PROP  valAxisVisible         bool     ops:[asg--]  aliases:valaxis.visible,valaxisvisible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level o…  ex:--prop valaxisvisible=false
xlsx chart             PROP  view3d.perspective     number   ops:[--g--]  3-D chart perspective (0..240).
xlsx chart             PROP  view3d.rotateX         number   ops:[--g--]  3-D chart X rotation in degrees (-90..90).
xlsx chart             PROP  view3d.rotateY         number   ops:[--g--]  3-D chart Y rotation in degrees (0..360).
xlsx chart             PROP  anchor                 string   ops:[as---]  absolute placement on slide; cm-based 'x,y,w,h' or named anchor token.  ex:--prop anchor=D2:J18
xlsx chart             PROP  dispunits              string   ops:[as---]  aliases:displayunits  value-axis display units divisor. Values: none, hundreds, thousands, tenThousands|10000, hundredThousands|100000, milli…  ex:--prop dispunits=thousands
xlsx chart             PROP  x                      length   ops:[asg--]  absolute X position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop x=2cm
xlsx chart             PROP  y                      length   ops:[asg--]  absolute Y position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop y=3cm
xlsx chart             PROP  seriesCount            number   ops:[--g--]  number of data series in the chart (extended cx:chart only).
xlsx chart             PROP  areafill               string   ops:[as---]  aliases:area.fill  fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.  ex:--prop areafill=4472C4-A5C8FF:90
xlsx chart             PROP  autotitledeleted       bool     ops:[as---]  suppress the auto-generated 'Chart Title' placeholder.  ex:--prop autotitledeleted=true
xlsx chart             PROP  axisfont               string   ops:[as---]  aliases:axis.font  convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options  ex:--prop axisfont=10:8B949E:Helvetica
xlsx chart             PROP  axisline               string   ops:[as---]  aliases:axis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options  ex:--prop axisline=666666:1
xlsx chart             PROP  axismax                number   ops:[as---]  aliases:max  convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismax=1000
xlsx chart             PROP  axismin                number   ops:[as---]  aliases:min  convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismin=0
xlsx chart             PROP  axisnumfmt             string   ops:[as---]  aliases:axisnumberformat  convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level optio…  ex:--prop axisnumfmt="#,##0"
xlsx chart             PROP  axisorientation        string   ops:[as---]  aliases:axisreverse  convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options  ex:--prop axisorientation=true
xlsx chart             PROP  axisposition           string   ops:[as---]  aliases:axispos  convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-lev…  ex:--prop axisposition=top
xlsx chart             PROP  axistitle              string   ops:[as---]  aliases:vtitle  convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options  ex:--prop axistitle="Revenue"
xlsx chart             PROP  axisvisible            bool     ops:[as---]  aliases:axis.delete,axis.visible  convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options  ex:--prop axisvisible=false
xlsx chart             PROP  bubbleScale            number   ops:[asg--]  aliases:bubblescale  bubble chart scale (% of default).  ex:--prop bubblescale=100
xlsx chart             PROP  catAxisVisible         bool     ops:[asg--]  aliases:cataxis.visible,cataxisvisible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-leve…  ex:--prop cataxisvisible=false
xlsx chart             PROP  catTitle               string   ops:[asg--]  aliases:htitle,cattitle  category axis title text.  ex:--prop cattitle="Quarter"
xlsx chart             PROP  cataxisline            string   ops:[as---]  aliases:cataxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for ful…  ex:--prop cataxisline=333333:1
xlsx chart             PROP  categories             string   ops:[asg--]  comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)  ex:--prop categories=A,B,C
xlsx chart             PROP  chartFill              color    ops:[--g--]  chart-level fill color readback.
xlsx chart             PROP  chartType              enum     ops:[asg--]  values:bar|column|line|pie|doughnut|area|scatter|bubble|radar|stock|combo|waterfall|funnel|treemap|sunburst|boxWhisker|histogram|pareto  aliases:type,col,donut,xy,spider,ohlc,wf,charttype  normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)  ex:--prop chartType=column
xlsx chart             PROP  chartareafill          string   ops:[as---]  aliases:chartfill  chart-area background fill. Solid color, gradient, or 'none'.  ex:--prop chartareafill=FFFFFF
xlsx chart             PROP  chartborder            string   ops:[as---]  aliases:chartarea.border  chart-area outer border line. Same format as plotborder.  ex:--prop chartborder=000000:1
xlsx chart             PROP  colorrule              string   ops:[as---]  aliases:conditionalcolor,colorRule  conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.  ex:--prop colorrule=0:FF0000:00AA00
xlsx chart             PROP  colors                 string   ops:[a----]  comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) overr…  ex:--prop colors="4472C4,ED7D31,A5A5A5"
xlsx chart             PROP  combosplit             number   ops:[a----]  combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.  ex:--prop combosplit=2
xlsx chart             PROP  combotypes             string   ops:[as---]  aliases:combo.types  rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.  ex:--prop combotypes="column,column,line"
xlsx chart             PROP  crossBetween           string   ops:[asg--]  aliases:crossbetween  category axis cross-between behavior (between / midCat).  ex:--prop crossBetween=between
xlsx chart             PROP  crosses                string   ops:[asg--]  where the value axis crosses the category axis. Values: autoZero (default), max, min.  ex:--prop crosses=max
xlsx chart             PROP  crossesAt              number   ops:[asg--]  aliases:crossesat  value-axis crossesAt value readback.  ex:--prop crossesat=0
xlsx chart             PROP  data                   string   ops:[a----]  inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after crea…  ex:--prop data="Sales:10,20,30"
xlsx chart             PROP  dataLabels             string   ops:[asg--]  aliases:datalabels,labels  show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also a…  ex:--prop dataLabels=value
xlsx chart             PROP  dataRange              string   ops:[a----]  aliases:datarange,range  external workbook range source for series; Add-time only.  ex:--prop dataRange=Sheet1!A1:D5
xlsx chart             PROP  dataTable              bool     ops:[asg--]  aliases:datatable  show data table beneath the chart (with default borders + legend keys).  ex:--prop dataTable=true
xlsx chart             PROP  decreaseColor          color    ops:[a----]  waterfall: negative bar color. Add-time only.  ex:--prop decreaseColor=FF0000
xlsx chart             PROP  dispBlanksAs           enum     ops:[-sg--]  values:gap|zero|span  how empty cells render (gap leaves a hole, zero plots as 0, span connects across).  ex:--prop dispBlanksAs=gap
xlsx chart             PROP  droplines              string   ops:[as---]  drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.  ex:--prop droplines=true
xlsx chart             PROP  errbars                string   ops:[as---]  aliases:errorbars  error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' remov…  ex:--prop errbars=fixedVal:5
xlsx chart             PROP  explosion              number   ops:[asg--]  aliases:explode  pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.  ex:--prop explosion=10
xlsx chart             PROP  firstSliceAngle        number   ops:[asg--]  aliases:sliceangle,firstsliceangle  pie/doughnut first slice angle (degrees).  ex:--prop firstsliceangle=90
xlsx chart             PROP  gapdepth               number   ops:[as---]  depth gap between series in 3D bar/line/area charts (percent).  ex:--prop gapdepth=150
xlsx chart             PROP  gapwidth               number   ops:[asg--]  aliases:gap  gap between bar/column groups, 0..500 (percent of bar width).  ex:--prop gapwidth=150
xlsx chart             PROP  gradient               string   ops:[asg--]  aliases:gradientfill  gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.  ex:--prop gradient=FF0000-0000FF
xlsx chart             PROP  gradients              string   ops:[as---]  per-series gradient fills, semicolon-separated; one entry per series.  ex:--prop gradients="FF0000-0000FF;00FF00-FFFF00"
xlsx chart             PROP  gridlines              bool     ops:[asg--]  aliases:majorgridlines  value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none'…  ex:--prop gridlines=true
xlsx chart             PROP  height                 length   ops:[asg--]  chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop height=10cm
xlsx chart             PROP  hilowlines             string   ops:[as---]  high-low lines on line/stock chart. Same format as droplines.  ex:--prop hilowlines=true
xlsx chart             PROP  holeSize               number   ops:[asg--]  aliases:holesize  doughnut hole size readback.  ex:--prop holesize=50
xlsx chart             PROP  increaseColor          color    ops:[a----]  waterfall: positive bar color. Add-time only.  ex:--prop increaseColor=00AA00
xlsx chart             PROP  invertifneg            bool     ops:[as---]  aliases:invertifnegative  if true, draw negative bars in an inverted (lighter) color.  ex:--prop invertifneg=true
xlsx chart             PROP  labelPos               string   ops:[asg--]  aliases:labelpos,labelposition  data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bes…  ex:--prop labelPos=outsideEnd
xlsx chart             PROP  labelfont              string   ops:[as---]  data label text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop labelfont=9:333333:Calibri
xlsx chart             PROP  labeloffset            number   ops:[as---]  category-axis label offset 0..1000 (percent of font height); category axis only.  ex:--prop labeloffset=100
xlsx chart             PROP  labelrotation          number   ops:[as---]  aliases:xaxis.labelrotation,valaxis.labelrotation,yaxis.labelrotation,xaxislabelrotation,valaxislabelrotation,yaxislabelrotation  tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./vala…  ex:--prop labelrotation=-45
xlsx chart             PROP  leaderlines            bool     ops:[as---]  aliases:showleaderlines  show/hide leader lines connecting data labels to slices (pie/doughnut).  ex:--prop leaderlines=true
xlsx chart             PROP  legend                 enum     ops:[asg--]  values:true|false|none|top|bottom|left|right|topRight|tr  legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and und…  ex:--prop legend=bottom
xlsx chart             PROP  legend.overlay         bool     ops:[asg--]  aliases:legendoverlay  if true, legend overlays the plot area instead of reserving space.  ex:--prop legend.overlay=true
xlsx chart             PROP  legendFont             string   ops:[asg--]  aliases:legendfont,legend.font  legend text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop legendFont=10:CCCCCC:Arial
xlsx chart             PROP  linedash               string   ops:[as---]  aliases:dash  line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.  ex:--prop linedash=dash
xlsx chart             PROP  linewidth              number   ops:[as---]  line width in points (applies to every series line).  ex:--prop linewidth=2
xlsx chart             PROP  logbase                number   ops:[as---]  aliases:logscale,yaxisscale  value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log s…  ex:--prop logbase=10
xlsx chart             PROP  majorTickMark          string   ops:[asg--]  aliases:majortick,majortickmark  major tick mark style (out / in / cross / none).  ex:--prop majorTickMark=out
xlsx chart             PROP  majorunit              number   ops:[as---]  value-axis major gridline / tick spacing.  ex:--prop majorunit=200
xlsx chart             PROP  marker                 string   ops:[as---]  aliases:markers  marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or '…  ex:--prop marker=circle
xlsx chart             PROP  markersize             number   ops:[as---]  marker size 2..72 (line/scatter/radar series only).  ex:--prop markersize=8
xlsx chart             PROP  minorGridlines         bool     ops:[asg--]  aliases:minorgridlines  value-axis minor gridlines; same format as gridlines.  ex:--prop minorGridlines=true
xlsx chart             PROP  minorTickMark          string   ops:[asg--]  aliases:minortick,minortickmark  minor tick mark style (out / in / cross / none).  ex:--prop minorTickMark=none
xlsx chart             PROP  minorunit              number   ops:[as---]  value-axis minor gridline / tick spacing.  ex:--prop minorunit=50
xlsx chart             PROP  overlap                number   ops:[asg--]  bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).  ex:--prop overlap=0
xlsx chart             PROP  plotFill               color    ops:[asg--]  aliases:plotareafill,plotfill  plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.  ex:--prop plotFill=FAFAFA
xlsx chart             PROP  plotborder             string   ops:[as---]  aliases:plotarea.border  plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.  ex:--prop plotborder=CCCCCC:0.5
xlsx chart             PROP  plotvisonly            bool     ops:[as---]  aliases:plotvisibleonly  if true, skip plotting hidden worksheet rows/columns.  ex:--prop plotvisonly=true
xlsx chart             PROP  preset                 string   ops:[as---]  aliases:theme,style.preset  named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).  ex:--prop preset=minimal
xlsx chart             PROP  referenceline          string   ops:[as---]  aliases:refline,targetline  horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'…  ex:--prop referenceline=100:FF0000:Target
xlsx chart             PROP  scatterstyle           string   ops:[as---]  scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.  ex:--prop scatterstyle=smoothMarker
xlsx chart             PROP  secondaryaxis          string   ops:[as---]  aliases:secondary  comma-separated 1-based series indices to plot on a secondary value axis.  ex:--prop secondaryaxis=2
xlsx chart             PROP  seriesoutline          string   ops:[as---]  aliases:series.outline  series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.  ex:--prop seriesoutline=000000:0.5
xlsx chart             PROP  seriesshadow           string   ops:[as---]  aliases:series.shadow  outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.  ex:--prop seriesshadow=000000-5-45-3-50
xlsx chart             PROP  serlines               string   ops:[as---]  aliases:serieslines  series lines on stacked bar charts (true/false).  ex:--prop serlines=true
xlsx chart             PROP  shape                  string   ops:[as---]  aliases:barshape  3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.  ex:--prop shape=cylinder
xlsx chart             PROP  showMarker             bool     ops:[-sg--]  show markers on line/scatter series at chart level.  ex:--prop showMarker=true
xlsx chart             PROP  shownegbubbles         bool     ops:[as---]  render negative-valued bubbles. Bubble charts only.  ex:--prop shownegbubbles=true
xlsx chart             PROP  sizerepresents         string   ops:[as---]  how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.  ex:--prop sizerepresents=area
xlsx chart             PROP  smooth                 bool     ops:[asg--]  smooth lines on line/scatter charts. Reported unsupported for other chart types.  ex:--prop smooth=true
xlsx chart             PROP  style                  number   ops:[asg--]  aliases:styleid  built-in chart style id 1..48; pass 'none' to clear.  ex:--prop style=2
xlsx chart             PROP  tickLabelPos           string   ops:[asg--]  aliases:ticklabelposition,ticklabelpos  tick label position (high / low / nextTo / none).  ex:--prop tickLabelPos=nextTo
xlsx chart             PROP  ticklabelskip          number   ops:[as---]  aliases:tickskip  draw tick labels every Nth category (category axis).  ex:--prop ticklabelskip=2
xlsx chart             PROP  title                  string   ops:[asg--]  chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.colo…  ex:--prop title="Q1"
xlsx chart             PROP  title.bold             bool     ops:[--g--]  title bold flag (readback only)
xlsx chart             PROP  title.color            color    ops:[--g--]  title font color (readback only, #RRGGBB)
xlsx chart             PROP  title.font             string   ops:[--g--]  title font name (readback only)
xlsx chart             PROP  title.size             font-size ops:[--g--]  title font size (readback only, e.g. 14pt)
xlsx chart             PROP  totalColor             color    ops:[a----]  waterfall: subtotal/total bar color. Add-time only.  ex:--prop totalColor=4472C4
xlsx chart             PROP  transparency           number   ops:[as---]  aliases:opacity,alpha  series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=7…  ex:--prop transparency=30
xlsx chart             PROP  trendline              string   ops:[asg--]  add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponent…  ex:--prop trendline=linear
xlsx chart             PROP  updownbars             string   ops:[as---]  up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.  ex:--prop updownbars=true
xlsx chart             PROP  valaxisline            string   ops:[as---]  aliases:valaxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full a…  ex:--prop valaxisline=333333:1
xlsx chart             PROP  varyColors             bool     ops:[-sg--]  vary colors by data point (single-series charts).  ex:--prop varyColors=true
xlsx chart             PROP  view3d                 string   ops:[asg--]  aliases:camera,perspective  3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key f…  ex:--prop view3d=15,20,30
xlsx chart             PROP  width                  length   ops:[asg--]  chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop width=18cm
xlsx chart-axis        ELEM  ops:[-sg--]  paths:/SheetName/chart[N]/axis[@role=ROLE]
xlsx chart-axis        PROP  role                   string   ops:[--g--]  axis role token — value, value2, category, series. Surfaces on Get to identify which axis this node represents.
xlsx chart-axis        PROP  dispUnits              enum     ops:[-sg--]  values:hundreds|thousands|tenThousands|hundredThousands|millions|tenMillions|hundredMillions|billions|trillions  display units for value axis labels. Applies to role=value|value2.  ex:--prop dispUnits=thousands
xlsx chart-axis        PROP  majorUnit              number   ops:[-sg--]  major tick interval on the value axis. Applies to role=value|value2.  ex:--prop majorUnit=20
xlsx chart-axis        PROP  minorUnit              number   ops:[-sg--]  minor tick interval on the value axis. Applies to role=value|value2.  ex:--prop minorUnit=5
xlsx chart-axis        PROP  axisFont               string   ops:[--g--]  axis text font readback.
xlsx chart-axis        PROP  axisMax                number   ops:[--g--]  value-axis maximum readback (also surfaced via max on axis-by-role path).
xlsx chart-axis        PROP  axisMin                number   ops:[--g--]  value-axis minimum readback (also surfaced via min on axis-by-role path).
xlsx chart-axis        PROP  axisNumFmt             string   ops:[--g--]  axis number format string.
xlsx chart-axis        PROP  axisOrientation        string   ops:[--g--]  axis scaling orientation (e.g. maxMin when reversed).
xlsx chart-axis        PROP  axisTitle              string   ops:[--g--]  value-axis title readback (chart-level convenience; axis-by-role uses 'title').
xlsx chart-axis        PROP  format                 string   ops:[-sg--]  number format string  ex:--prop format="#,##0"
xlsx chart-axis        PROP  labelOffset            number   ops:[--g--]  category axis label offset (% of default 100).
xlsx chart-axis        PROP  labelRotation          number   ops:[-sg--]  tick label rotation in degrees  ex:--prop labelRotation=-45
xlsx chart-axis        PROP  logBase                number   ops:[-sg--]  logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop logBase=10
xlsx chart-axis        PROP  majorGridlines         bool     ops:[-sg--]  show or hide major gridlines. Applies to all roles.  ex:--prop majorGridlines=true
xlsx chart-axis        PROP  max                    number   ops:[-sg--]  maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop max=1000
xlsx chart-axis        PROP  min                    number   ops:[-sg--]  minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop min=0
xlsx chart-axis        PROP  minorGridlines         bool     ops:[-sg--]  show or hide minor gridlines. Applies to all roles.  ex:--prop minorGridlines=false
xlsx chart-axis        PROP  tickLabelSkip          number   ops:[--g--]  category axis label skip interval (>1 means tick labels are sparser).
xlsx chart-axis        PROP  title                  string   ops:[-sg--]  axis title text. Applies to all roles (category, value). Pass 'none' to remove.  ex:--prop title="Revenue"
xlsx chart-axis        PROP  visible                bool     ops:[-sg--]  show or hide the axis. Applies to all roles.  ex:--prop visible=false
xlsx chart-series      ELEM  ops:[asg-r]  paths:/SheetName/chart[N]/series[K]
xlsx chart-series      PROP  valuesRef              string   ops:[--g--]  A1 cell range backing the series values.
xlsx chart-series      PROP  trendline.dispEq       bool     ops:[--g--]  trendline displayEquation flag.
xlsx chart-series      PROP  trendline.dispRSqr     bool     ops:[--g--]  trendline displayRSquaredValue flag.
xlsx chart-series      PROP  alpha                  number   ops:[--g--]  series fill alpha readback in OOXML units (0..100000 = 0..100%). Distinct from chart-level `transparency` which is the …
xlsx chart-series      PROP  outlineColor           color    ops:[--g--]  per-series outline color readback.
xlsx chart-series      PROP  categories             string   ops:[asg--]  per-series category override; range reference only.  ex:--prop series1.categories="Sheet1!$A$2:$A$5"
xlsx chart-series      PROP  categoriesRef          string   ops:[--g--]  A1 cell range backing the category labels.
xlsx chart-series      PROP  color                  color    ops:[asg--]  series fill color.  ex:--prop series1.color=#4472C4
xlsx chart-series      PROP  dataLabels.numFmt      string   ops:[--g--]  per-series data label number format readback.
xlsx chart-series      PROP  dataLabels.separator   string   ops:[--g--]  per-series data label separator string readback.
xlsx chart-series      PROP  errBars                string   ops:[--g--]  error bar value type token (e.g. cust, fixedVal, stdDev).
xlsx chart-series      PROP  invertIfNeg            bool     ops:[--g--]  invert color for negative values (per-series readback).
xlsx chart-series      PROP  lineDash               enum     ops:[-sg--]  values:solid|sysDash|sysDot|sysDashDot|lgDash|lgDashDot|lgDashDotDot|dash|dashDot|dot|longDash  aliases:dash  series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash…  ex:--prop lineDash=dash
xlsx chart-series      PROP  lineWidth              number   ops:[-sg--]  series line width in points (e.g. 1.5).  ex:--prop lineWidth=1.5
xlsx chart-series      PROP  marker                 string   ops:[-sg--]  per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports …  ex:--prop marker=circle
xlsx chart-series      PROP  markerSize             number   ops:[-sg--]  marker size in points (2–72). Applies when marker is not 'none'.  ex:--prop markerSize=8
xlsx chart-series      PROP  name                   string   ops:[asg--]  aliases:title  series name shown in legend and data labels.  ex:--prop name="Q1"
xlsx chart-series      PROP  nameRef                string   ops:[--g--]  A1 cell reference backing the series name.
xlsx chart-series      PROP  scatterStyle           string   ops:[--g--]  scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
xlsx chart-series      PROP  secondaryAxis          bool     ops:[--g--]  true when the chart has more than one value axis (this series uses the secondary).
xlsx chart-series      PROP  smooth                 bool     ops:[-sg--]  smooth line interpolation for line/scatter series.  ex:--prop smooth=true
xlsx chart-series      PROP  values                 string   ops:[asg--]  comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)  ex:--prop series1.values="120,150,180"
xlsx colbreak          ELEM  ops:[asgqr]  paths:/SheetName/colbreak[N]
xlsx colbreak          PROP  col                    string   ops:[a----]  aliases:column,index  column index or letter. Aliases: column, index.  ex:--prop col=F
xlsx colorscale        ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx colorscale        PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A10
xlsx colorscale        PROP  minColor               color    ops:[a-g--]  aliases:mincolor  low-end color (default F8696B).  ex:--prop minColor=F8696B
xlsx colorscale        PROP  maxColor               color    ops:[a-g--]  aliases:maxcolor  high-end color (default 63BE7B).  ex:--prop maxColor=63BE7B
xlsx colorscale        PROP  midColor               color    ops:[a-g--]  aliases:midcolor  midpoint color (omit for 2-stop scale).  ex:--prop midColor=FFEB84
xlsx colorscale        PROP  midpoint               number   ops:[a----]  aliases:midPoint  midpoint percentile (default 50). Only meaningful when midcolor is set.  ex:--prop midpoint=50
xlsx colorscale        PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx colorscale        PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx colorscale        PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx colorscale        PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx column            ELEM  ops:[asgqr]  paths:/SheetName/col[X]
xlsx column            PROP  name                   string   ops:[a----]  column letter to insert at (e.g. 'C'). If omitted, uses index position or appends.  ex:--prop name=C
xlsx column            PROP  width                  length   ops:[asg--]  column width in Excel character units. Accepts bare number or unit-qualified.  ex:--prop width=20
xlsx column            PROP  hidden                 bool     ops:[asg--]  hide column.  ex:--prop hidden=true
xlsx column            PROP  outline                int      ops:[-s---]  aliases:outlinelevel,group  outline/group level 0-7. Currently Set-only. Aliases: outlineLevel, group.  ex:--prop outline=1
xlsx column            PROP  collapsed              bool     ops:[-s---]  collapse column group. Currently Set-only.  ex:--prop collapsed=true
xlsx column            PROP  customWidth            bool     ops:[--g--]  Get-only readback. True when the column has an explicit width set (i.e. width is not the sheet default). Mirrors OOXML …
xlsx column            PROP  autofit                bool     ops:[-s---]  auto-fit width to cell content. Set-only by design (meaningless at Add since new column has no data).  ex:--prop autofit=true
xlsx comment           ELEM  ops:[asgqr]  paths:/SheetName/comment[N];/SheetName/CellRef/comment
xlsx comment           PROP  ref                    string   ops:[asg--]  target cell address (e.g. B2).  ex:--prop ref=B2
xlsx comment           PROP  author                 string   ops:[asg--]  Author attribute  ex:--prop author="Alice"
xlsx comment           PROP  text                   string   ops:[asg--]  comment body. Required.  ex:--prop text="Check formula"
xlsx conditionalformatting  ELEM  ops:[asgqr]  paths:/SheetName/cf[N]
xlsx conditionalformatting  PROP  type                   enum     ops:[asg--]  values:cellIs|colorScale|dataBar|iconSet|containsText|notContainsText|beginsWith|endsWith|top|topN|top10|topPercent|bottom|bottomN|bottomPercent|aboveAverage|belowAverage|duplicateValues|uniqueValues|containsBlanks|containsErrors|notContainsBlanks|notContainsErrors|formula|dateOccurring|today|yesterday|tomorrow|thisWeek|lastWeek|nextWeek|thisMonth|lastMonth|nextMonth  aliases:rule  CF rule type.  ex:--prop type=cellIs
xlsx conditionalformatting  PROP  ref                    string   ops:[asg--]  aliases:range,sqref  target cell range.  ex:--prop ref=A1:A10
xlsx conditionalformatting  PROP  fill                   color    ops:[asg--]  background fill color for matched cells. Use this for cellIs, text, top/bottom, and formula rules.  ex:--prop fill=FFFF00
xlsx conditionalformatting  PROP  operator               string   ops:[asg--]  operator for cellIs/text rules.  ex:--prop operator=greaterThan
xlsx conditionalformatting  PROP  value                  string   ops:[asg--]  aliases:formula1,formula  threshold / comparison value.  ex:--prop value=100
xlsx conditionalformatting  PROP  color                  color    ops:[asg--]  bar color for dataBar rules only. For cellIs/text/formula rules, use 'fill' instead.  ex:--prop color=#FFFF00
xlsx conditionalformatting  PROP  value2                 string   ops:[asg--]  aliases:maxvalue  second threshold for between/notBetween cellIs rules. Alias: maxvalue.  ex:--prop value=10 --prop value2=20
xlsx conditionalformatting  PROP  text                   string   ops:[asg--]  needle for containsText/notContainsText/beginsWith/endsWith rules.  ex:--prop type=containsText --prop text=ERROR
xlsx conditionalformatting  PROP  rank                   number   ops:[asg--]  aliases:top,bottomN  rank for top/bottom N rules. Aliases: top, bottomN.  ex:--prop type=topN --prop rank=10
xlsx conditionalformatting  PROP  percent                bool     ops:[asg--]  treat 'rank' as a percentile rather than count (top/bottom rules).  ex:--prop type=top --prop rank=10 --prop percent=true
xlsx conditionalformatting  PROP  bottom                 bool     ops:[asg--]  select bottom-N instead of top-N (top/bottom rules).  ex:--prop type=bottom --prop rank=5
xlsx conditionalformatting  PROP  aboveAverage           bool     ops:[a-g--]  aliases:above  aboveAverage rule: true=above, false=below. Alias: above.  ex:--prop type=aboveAverage --prop aboveAverage=true
xlsx conditionalformatting  PROP  stdDev                 number   ops:[a----]  stdDev offset for aboveAverage rules (1 = 1σ above mean). Add-time only — Get does not surface this back today.  ex:--prop stdDev=1
xlsx conditionalformatting  PROP  equalAverage           bool     ops:[a----]  include the mean in aboveAverage matching. Add-time only — Get does not surface this back today.  ex:--prop equalAverage=true
xlsx conditionalformatting  PROP  period                 string   ops:[a-g--]  aliases:timePeriod,timeperiod  time-period token for dateOccurring rules (today, yesterday, tomorrow, thisWeek, lastWeek, nextWeek, thisMonth, lastMon…  ex:--prop type=dateOccurring --prop period=lastWeek
xlsx conditionalformatting  PROP  min                    string   ops:[a-g--]  data-bar minimum value (numeric or 'auto'). Used by dataBar rules.  ex:--prop type=dataBar --prop min=0 --prop max=100
xlsx conditionalformatting  PROP  max                    string   ops:[a-g--]  data-bar maximum value (numeric or 'auto'). Used by dataBar rules.  ex:--prop type=dataBar --prop max=100
xlsx conditionalformatting  PROP  showValue              bool     ops:[asg--]  aliases:showvalue  show numeric label alongside data bar / icon set. Alias: showvalue.  ex:--prop showValue=false
xlsx conditionalformatting  PROP  negativeColor          color    ops:[a-g--]  data-bar fill color for negative values.  ex:--prop negativeColor=#FF0000
xlsx conditionalformatting  PROP  axisColor              color    ops:[a-g--]  data-bar axis color (separator between positive and negative bars).  ex:--prop axisColor=#000000
xlsx conditionalformatting  PROP  axisPosition           enum     ops:[a----]  values:automatic|middle|none  data-bar axis position. Default: automatic. Add-time only — Get does not surface this back today.  ex:--prop axisPosition=middle
xlsx conditionalformatting  PROP  minColor               color    ops:[asg--]  aliases:mincolor  color-scale color at the minimum stop. Alias: mincolor.  ex:--prop type=colorScale --prop minColor=#F8696B
xlsx conditionalformatting  PROP  maxColor               color    ops:[asg--]  aliases:maxcolor  color-scale color at the maximum stop. Alias: maxcolor.  ex:--prop maxColor=#63BE7B
xlsx conditionalformatting  PROP  midColor               color    ops:[a-g--]  aliases:midcolor  color-scale color at the midpoint stop. Alias: midcolor.  ex:--prop midColor=#FFEB84
xlsx conditionalformatting  PROP  midPoint               string   ops:[a----]  aliases:midpoint  color-scale midpoint value (numeric or percentile). Alias: midpoint. Add-time only — Get does not surface this back tod…  ex:--prop midPoint=50
xlsx conditionalformatting  PROP  iconset                string   ops:[asg--]  aliases:icons  icon-set name (e.g. 3TrafficLights1, 3Arrows, 5Rating). Alias: icons.  ex:--prop type=iconSet --prop iconset=3TrafficLights1
xlsx conditionalformatting  PROP  reverse                bool     ops:[asg--]  reverse the icon-set ordering.  ex:--prop reverse=true
xlsx conditionalformatting  PROP  formula                string   ops:[asg--]  formulaCf expression (without leading '=').  ex:--prop type=formula --prop formula=ISERROR(A1)
xlsx conditionalformatting  PROP  ruleType               string   ops:[--g--]  Get-only readback of the underlying OOXML CT_CfRule@type (e.g. cellIs, colorScale, dataBar, iconSet, expression, top10,…
xlsx conditionalformatting  PROP  cfType                 enum     ops:[--g--]  values:dataBar|colorScale|iconSet|formula|topN|aboveAverage|duplicateValues|uniqueValues|containsText|cellIs|timePeriod  Get-only readback of the high-level CF family (camelCase). Set by Get based on which OOXML child element is present on …
xlsx conditionalformatting  PROP  dxfId                  int      ops:[--g--]  Get-only readback of the differential format index referenced by this rule (links to the workbook-level dxfs table).
xlsx containstext      ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx containstext      PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx containstext      PROP  text                   string   ops:[a-g--]  substring to match (case-insensitive). Required.  ex:--prop text=error
xlsx containstext      PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFCCCC
xlsx containstext      PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx containstext      PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx containstext      PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx containstext      PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx containstext      PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx containstext      PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx databar           ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx databar           PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A10
xlsx databar           PROP  min                    string   ops:[a----]  data bar lower bound (omit for auto-min).  ex:--prop min=0
xlsx databar           PROP  max                    string   ops:[a----]  data bar upper bound (omit for auto-max).  ex:--prop max=100
xlsx databar           PROP  color                  color    ops:[a-g--]  primary bar color (default 638EC6).  ex:--prop color=4472C4
xlsx databar           PROP  showValue              bool     ops:[a-g--]  show cell value alongside the bar (default true).  ex:--prop showValue=false
xlsx databar           PROP  negativeColor          color    ops:[a-g--]  negative-value bar color (x14 extension, default FF0000).  ex:--prop negativeColor=FF0000
xlsx databar           PROP  axisColor              color    ops:[a-g--]  axis color (x14 extension, default 000000).  ex:--prop axisColor=000000
xlsx databar           PROP  axisPosition           enum     ops:[a----]  values:automatic|middle|none  axis position for negative values (x14 extension, default automatic).  ex:--prop axisPosition=middle
xlsx databar           PROP  minLength              number   ops:[a-g--]  minimum bar length (% of cell, default 0).  ex:--prop minLength=10
xlsx databar           PROP  maxLength              number   ops:[a-g--]  maximum bar length (% of cell, default 100).  ex:--prop maxLength=90
xlsx databar           PROP  direction              enum     ops:[a-g--]  values:leftToRight|rightToLeft|context|ltr|rtl  bar direction (x14 extension).  ex:--prop direction=leftToRight
xlsx databar           PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx databar           PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx databar           PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx databar           PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx dateoccurring     ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx dateoccurring     PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx dateoccurring     PROP  period                 enum     ops:[a-g--]  values:today|yesterday|tomorrow|last7Days|thisWeek|lastWeek|nextWeek|thisMonth|lastMonth|nextMonth  aliases:timePeriod,timeperiod  time period token (default today).  ex:--prop period=last7Days
xlsx dateoccurring     PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFCCCC
xlsx dateoccurring     PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx dateoccurring     PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx dateoccurring     PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx dateoccurring     PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx dateoccurring     PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx dateoccurring     PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx duplicatevalues   ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx duplicatevalues   PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx duplicatevalues   PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFCCCC
xlsx duplicatevalues   PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx duplicatevalues   PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx duplicatevalues   PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx duplicatevalues   PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx duplicatevalues   PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx duplicatevalues   PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx formulacf         ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx formulacf         PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A10
xlsx formulacf         PROP  formula                string   ops:[a-g--]  formula expression evaluated per-cell (without leading '='). Required.  ex:--prop formula="$A1>100"
xlsx formulacf         PROP  fill                   color    ops:[a----]  background fill color applied via differential format (dxf).  ex:--prop fill=FFFF00
xlsx formulacf         PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx formulacf         PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx formulacf         PROP  font.italic            bool     ops:[a----]  italic via dxf.  ex:--prop font.italic=true
xlsx formulacf         PROP  font.underline         bool     ops:[a----]  underline via dxf.  ex:--prop font.underline=true
xlsx formulacf         PROP  font.strike            bool     ops:[a----]  strikethrough via dxf.  ex:--prop font.strike=true
xlsx formulacf         PROP  font.size              font-size ops:[a----]  font size via dxf.  ex:--prop font.size=12pt
xlsx formulacf         PROP  font.name              string   ops:[a----]  font family via dxf.  ex:--prop font.name=Arial
xlsx formulacf         PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx formulacf         PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx formulacf         PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx formulacf         PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx hyperlink         ELEM  ops:[--gq-]  paths:/SheetName/CellRef
xlsx hyperlink         PROP  url                    string   ops:[--g--]  external URL readback (read-only at this element). For cell-level Set use cell `link=URL`.
xlsx hyperlink         PROP  ref                    string   ops:[--g--]  target cell range. Readback only (from <hyperlink ref=.../>).
xlsx hyperlink         PROP  location               string   ops:[--g--]  internal sheet/cell target (Sheet1!A1). Readback only here; create via cell `link=` property.
xlsx hyperlink         PROP  display                string   ops:[--g--]  display text. Readback only here; set via cell `display=` property.
xlsx hyperlink         PROP  tooltip                string   ops:[--g--]  hover tooltip. Readback only here; set via cell `tooltip=` property.  ex:--prop tooltip="Next section"
xlsx iconset           ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx iconset           PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range  ex:--prop ref=A1:A10
xlsx iconset           PROP  iconset                enum     ops:[a-g--]  values:3arrows|3arrowsGray|3flags|3trafficLights1|3trafficLights2|3signs|3symbols|3symbols2|4arrows|4arrowsGray|4rating|4redToBlack|4trafficLights|5arrows|5arrowsGray|5rating|5quarters  aliases:icons  icon set name  ex:--prop iconset=3arrows
xlsx iconset           PROP  reverse                bool     ops:[a----]  reverse icon order  ex:--prop reverse=true
xlsx iconset           PROP  showValue              bool     ops:[a----]  show cell value alongside icon (default true)  ex:--prop showValue=false
xlsx iconset           PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx iconset           PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx iconset           PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx namedrange        ELEM  ops:[asgqr]  paths:/namedrange[@name=NAME];/namedrange[NAME];/namedrange[N]
xlsx namedrange        PROP  name                   string   ops:[asg--]  defined-name identifier. Required (or inferred from path).  ex:--prop name=Revenue
xlsx namedrange        PROP  ref                    string   ops:[asg--]  aliases:refersTo,formula  refersTo expression. Aliases: refersTo, formula. Do not include leading '='.  ex:--prop ref=Sheet1!$A$1:$C$10
xlsx namedrange        PROP  scope                  string   ops:[asg--]  sheet name for local scope, or 'workbook' (default).  ex:--prop scope=workbook
xlsx namedrange        PROP  comment                string   ops:[asg--]  free-text description shown in Excel's Name Manager.  ex:--prop comment="Q4 totals"
xlsx namedrange        PROP  volatile               bool     ops:[asg--]  force recalculation of the defined name on every workbook change (Excel volatile flag).  ex:--prop volatile=true
xlsx ole               ELEM  ops:[asgqr]  paths:/SheetName/ole[N]
xlsx ole               PROP  anchor                 string   ops:[asg--]  aliases:ref  anchor descriptor  ex:--prop anchor=B2:F7
xlsx ole               PROP  shapeId                number   ops:[--g--]  VML shape id of the OLE container (xlsx legacy drawing).
xlsx ole               PROP  contentType            string   ops:[--g--]  MIME type of the embedded part.
xlsx ole               PROP  fileSize               number   ops:[--g--]  embedded payload bytes.
xlsx ole               PROP  objectType             string   ops:[--g--]  OLE object type marker (always 'ole').
xlsx ole               PROP  preview                string   ops:[a----]  preview thumbnail image source. Add-time only — Set ignores this key.  ex:--prop preview=/path/to/thumb.png
xlsx ole               PROP  progId                 string   ops:[asg--]  aliases:progid  OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.  ex:--prop progId=Word.Document.12
xlsx ole               PROP  src                    string   ops:[as---]  aliases:path  embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embe…  ex:--prop src=/path/to/data.docx
xlsx pagebreak         ELEM  ops:[asgqr]  paths:/SheetName/rowbreak[N];/SheetName/colbreak[N]
xlsx pagebreak         PROP  row                    int      ops:[a----]  row index — routes to rowbreak. Add-time only — Set is not supported (re-add to relocate). Get does not surface this ba…  ex:--prop row=20
xlsx pagebreak         PROP  col                    string   ops:[a----]  aliases:column  column index/letter — routes to colbreak. Alias: column. Add-time only — Set is not supported (re-add to relocate). Get…  ex:--prop col=F
xlsx picture           ELEM  ops:[asgqr]  paths:/SheetName/picture[N]
xlsx picture           PROP  crop                   string   ops:[--g--]  Crop in percent (0-100). 1 value = symmetric, 2 values = vertical,horizontal, 4 values = left,top,right,bottom. Excel r…  ex:--prop crop=10
xlsx picture           PROP  title                  string   ops:[a----]  OOXML @title attribute on cNvPr (distinct from alt).  ex:--prop title="Logo"
xlsx picture           PROP  decorative             bool     ops:[a----]  Mark the picture as decorative (a16:decorative ext under cNvPr). Excludes it from screen-reader alt-text traversal.  ex:--prop decorative=true
xlsx picture           PROP  rotation               string   ops:[as---]  Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.  ex:--prop rotation=45
xlsx picture           PROP  flip                   string   ops:[as---]  Compact flip token: 'h' / 'v' / 'both' / 'hv' / 'vh' / 'horizontal' / 'vertical'.  ex:--prop flip=h
xlsx picture           PROP  flipH                  bool     ops:[as---]  Flip horizontally (Office-API-style alias of flip=h).  ex:--prop flipH=true
xlsx picture           PROP  flipV                  bool     ops:[as---]  Flip vertically (Office-API-style alias of flip=v).  ex:--prop flipV=true
xlsx picture           PROP  flipBoth               bool     ops:[a----]  Flip both axes (alias of flip=both).  ex:--prop flipBoth=true
xlsx picture           PROP  opacity                string   ops:[a----]  Picture opacity. Accepts percent (50, '50%') or fraction (0.5). 100 / 100% / 1.0 = fully opaque.  ex:--prop opacity=50
xlsx picture           PROP  hyperlink              string   ops:[a----]  aliases:link  Picture-level hyperlink. External URL (https://...) or in-document jump (#SheetName!A1).  ex:--prop hyperlink=https://example.com
xlsx picture           PROP  anchor                 string   ops:[a----]  Cell-range anchor (e.g. 'B2:E6') or anchorMode token ('oneCell'/'twoCell'/'absolute'). Cell-range form implies twoCell …  ex:--prop anchor=B2:E6
xlsx picture           PROP  anchorMode             string   ops:[a----]  Explicit anchor mode: 'oneCell' / 'twoCell' / 'absolute'. Overrides any anchor= mode token.  ex:--prop anchorMode=oneCell
xlsx picture           PROP  shadow                 string   ops:[-s---]  Outer shadow effect. 'none' to clear, or a color/spec accepted by DrawingEffectsHelper.  ex:--prop shadow=#808080
xlsx picture           PROP  glow                   string   ops:[-s---]  Glow effect color/spec. 'none' to clear.  ex:--prop glow=#4472C4
xlsx picture           PROP  reflection             string   ops:[-s---]  Reflection effect. 'none' to clear.  ex:--prop reflection=true
xlsx picture           PROP  softEdge               string   ops:[-s---]  aliases:softedge  Soft edge effect radius. 'none' to clear.  ex:--prop softEdge=5
xlsx picture           PROP  crop.l                 string   ops:[as---]  Crop from left edge as a percentage (e.g. 10 = 10%, '10%' also accepted). Internally stored in 1/1000 percent units.  ex:--prop crop.l=10
xlsx picture           PROP  crop.r                 string   ops:[as---]  Crop from right edge as a percentage.  ex:--prop crop.r=10
xlsx picture           PROP  crop.t                 string   ops:[as---]  Crop from top edge as a percentage.  ex:--prop crop.t=10
xlsx picture           PROP  crop.b                 string   ops:[as---]  Crop from bottom edge as a percentage.  ex:--prop crop.b=10
xlsx picture           PROP  srcRect                string   ops:[as---]  Compound crop spec, e.g. 'l=10,r=10,t=5,b=5'. Equivalent to crop.l/crop.r/crop.t/crop.b.  ex:--prop srcRect=l=10,r=10,t=5,b=5
xlsx picture           PROP  anchoredTo             string   ops:[--g--]  anchor descriptor — sheet/cell-range path the picture is anchored to.
xlsx picture           PROP  relId                  string   ops:[--g--]  relationship id of the embedded image part (rId-style token).
xlsx picture           PROP  mergeAnchor            bool     ops:[--g--]  true when the picture is anchored to a merged-cell region.
xlsx picture           PROP  x                      length   ops:[asg--]  x as TwoCellAnchor column/row index (xlsx cell-anchor positioning, integer).  ex:--prop x=0
xlsx picture           PROP  y                      length   ops:[asg--]  y as TwoCellAnchor column/row index (xlsx cell-anchor positioning, integer).  ex:--prop y=0
xlsx picture           PROP  width                  integer  ops:[asg--]  width — TwoCellAnchor column/row span (xlsx cell-anchor positioning, integer)  ex:--prop width=5
xlsx picture           PROP  height                 integer  ops:[asg--]  height — TwoCellAnchor column/row span (xlsx cell-anchor positioning, integer)  ex:--prop height=5
xlsx picture           PROP  cropBottom             string   ops:[as---]  aliases:cropbottom  Crop from bottom edge as percent (0-100). Aliases: cropbottom.  ex:--prop cropBottom=10
xlsx picture           PROP  cropLeft               string   ops:[as---]  aliases:cropleft  Crop from left as fraction (<=1) or percent (>1). E.g. cropLeft=0.1 or cropLeft=10 both mean 10%.  ex:--prop cropLeft=0.1
xlsx picture           PROP  cropRight              string   ops:[as---]  aliases:cropright  Crop from right edge as percent (0-100). Aliases: cropright.  ex:--prop cropRight=10
xlsx picture           PROP  cropTop                string   ops:[as---]  aliases:croptop  Crop from top edge as percent (0-100). Aliases: croptop.  ex:--prop cropTop=10
xlsx picture           PROP  name                   string   ops:[a-g--]  Override the auto-generated 'Picture {id}' label on cNvPr @name.  ex:--prop name="hero-image"
xlsx picture           PROP  fallback               string   ops:[a----]  optional PNG fallback for SVG sources. When omitted, a 1x1 transparent PNG is generated.  ex:--prop fallback=/path/to/fallback.png
xlsx picture           PROP  alt                    string   ops:[asg--]  aliases:altText,alttext,description  alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.  ex:--prop alt="Logo"
xlsx picture           PROP  contentType            string   ops:[--g--]  OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced b…
xlsx picture           PROP  fileSize               number   ops:[--g--]  embedded image file size in bytes (length of the image part stream).
xlsx picture           PROP  src                    string   ops:[as---]  aliases:path  image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relation…  ex:--prop src=/path/to/image.png
xlsx pivottable        ELEM  ops:[asgqr]  paths:/SheetName/pivottable[N]
xlsx pivottable        PROP  source                 string   ops:[asg--]  aliases:src  source range. Alias: src. External workbook refs rejected.  ex:--prop source=Sheet1!A1:D100
xlsx pivottable        PROP  position               string   ops:[a----]  aliases:pos  anchor cell (e.g. H1). Alias: pos. Auto-placed after source if omitted.  ex:--prop position=H1
xlsx pivottable        PROP  name                   string   ops:[asg--]  pivot table name (identifier).  ex:--prop name=RevenueByRegion
xlsx pivottable        PROP  style                  string   ops:[asg--]  built-in or workbook custom pivot style name (e.g. PivotStyleMedium9).  ex:--prop style=PivotStyleMedium9
xlsx pivottable        PROP  rows                   string   ops:[asg--]  aliases:row,rowField,rowFields  row-axis field names, comma-separated (e.g. 'Region,Category'). Aliases: row, rowField, rowFields.  ex:--prop rows=Region,Category
xlsx pivottable        PROP  cols                   string   ops:[asg--]  aliases:col,column,columns,colField,colFields,columnField,columnFields  column-axis field names, comma-separated. Aliases: col, column, columns, colField, colFields, columnField, columnFields.  ex:--prop cols=Date
xlsx pivottable        PROP  filters                string   ops:[asg--]  aliases:filter,filterField,filterFields  page/filter-axis field names, comma-separated. Aliases: filter, filterField, filterFields.  ex:--prop filters=Year
xlsx pivottable        PROP  values                 string   ops:[asg--]  aliases:value,valueField,valueFields  value-axis fields as 'Field:agg' tuples, comma-separated (e.g. 'Sales:sum,Qty:avg'). agg one of sum, avg, count, max, m…  ex:--prop values=Sales:sum,Qty:avg
xlsx pivottable        PROP  aggregate              string   ops:[as---]  default aggregate for value fields when omitted from --prop values. One of sum, avg, count, max, min, product, stdev, s…  ex:--prop aggregate=avg
xlsx pivottable        PROP  showDataAs             string   ops:[as---]  aliases:showdataas  value-field display mode: normal, percentOfTotal, percentOfRow, percentOfCol, percentOfParent, runningTotal, rankAscend…  ex:--prop showDataAs=percentOfTotal
xlsx pivottable        PROP  topN                   string   ops:[a----]  aliases:topn  keep only top-N row keys ranked by first value field's aggregate. Integer >= 1; filter applied to source rows pre-cache…  ex:--prop topN=10
xlsx pivottable        PROP  sort                   enum     ops:[as---]  values:asc|desc|locale|locale-desc|none  axis-label sort. 'none' (or empty) clears sort.  ex:--prop sort=desc
xlsx pivottable        PROP  layout                 enum     ops:[asg--]  values:compact|outline|tabular  report layout mode. Default: compact.  ex:--prop layout=tabular
xlsx pivottable        PROP  labelFilter            string   ops:[a----]  aliases:labelfilter  row-level pre-cache label filter as 'field:type:value' (e.g. 'Region:beginsWith:N'). Type one of equals, notEquals, beg…  ex:--prop labelFilter=Region:beginsWith:N
xlsx pivottable        PROP  calculatedField        string   ops:[a----]  aliases:calculatedfield,calculatedfields  user-defined formula field as 'Name:=Formula' (e.g. 'Margin:=Sales-Cost'). Use calculatedField1, calculatedField2, ... …  ex:--prop calculatedField=Margin:=Sales-Cost
xlsx pivottable        PROP  repeatLabels           bool     ops:[asg--]  aliases:repeatlabels,repeatItemLabels,repeatAllLabels,fillDownLabels  repeat outer-axis item labels on every row (fillDown). Aliases: repeatItemLabels, repeatAllLabels, fillDownLabels.  ex:--prop repeatLabels=true
xlsx pivottable        PROP  blankRows              bool     ops:[asg--]  aliases:blankrows,insertBlankRow,insertBlankRows,blankRow,blankLine,blankLines  insert a blank row after each outer item group. Aliases: insertBlankRow, insertBlankRows, blankRow, blankLine, blankLin…  ex:--prop blankRows=true
xlsx pivottable        PROP  grandTotals            enum     ops:[as---]  values:both|none|rows|cols|on|off|true|false  aliases:grandtotals  grand-total visibility. 'rows' = show grand-total row only; 'cols' = show grand-total column only; 'both'/'on'/'true' =…  ex:--prop grandTotals=both
xlsx pivottable        PROP  rowGrandTotals         bool     ops:[asg--]  aliases:rowgrandtotals  show row-axis grand totals. Independent of colGrandTotals.  ex:--prop rowGrandTotals=true
xlsx pivottable        PROP  colGrandTotals         bool     ops:[asg--]  aliases:colgrandtotals,columnGrandTotals  show column-axis grand totals. Alias: columnGrandTotals.  ex:--prop colGrandTotals=true
xlsx pivottable        PROP  grandTotalCaption      string   ops:[asg--]  aliases:grandtotalcaption  label text for the Grand Total row/column (default 'Grand Total').  ex:--prop grandTotalCaption="Total"
xlsx pivottable        PROP  subtotals              enum     ops:[asg--]  values:on|off|true|false|show|hide|yes|no|1|0  show/hide outer-level subtotal rows.  ex:--prop subtotals=off
xlsx pivottable        PROP  defaultSubtotal        bool     ops:[as---]  aliases:defaultsubtotal  default-subtotal flag for new pivot fields (per-field <pivotField defaultSubtotal=...>).  ex:--prop defaultSubtotal=true
xlsx pivottable        PROP  showRowStripes         bool     ops:[asg--]  aliases:showrowstripes,bandedRows  banded-row striping in the pivot style. Alias: bandedRows.  ex:--prop showRowStripes=true
xlsx pivottable        PROP  showColStripes         bool     ops:[asg--]  aliases:showcolstripes,showColumnStripes,bandedCols,bandedColumns  banded-column striping in the pivot style. Aliases: showColumnStripes, bandedCols, bandedColumns.  ex:--prop showColStripes=true
xlsx pivottable        PROP  showRowHeaders         bool     ops:[asg--]  aliases:showrowheaders  show row-axis header formatting (pivotTableStyleInfo).  ex:--prop showRowHeaders=true
xlsx pivottable        PROP  showColHeaders         bool     ops:[asg--]  aliases:showcolheaders,showColumnHeaders  show column-axis header formatting. Alias: showColumnHeaders.  ex:--prop showColHeaders=true
xlsx pivottable        PROP  showLastColumn         bool     ops:[asg--]  aliases:showlastcolumn  highlight the last column in the pivot style.  ex:--prop showLastColumn=true
xlsx pivottable        PROP  showDrill              bool     ops:[a----]  aliases:showdrill  show expand/collapse (+/-) buttons on every pivot field. Add-time only — Set ignores this key.  ex:--prop showDrill=false
xlsx pivottable        PROP  mergeLabels            bool     ops:[a----]  aliases:mergelabels  merge+center repeated outer-axis item cells (<pivotTableDefinition mergeItem='1'>). Add-time only — Set ignores this ke…  ex:--prop mergeLabels=true
xlsx pivottable        PROP  cacheId                number   ops:[--g--]  pivot cache index (read-only; assigned by Excel when the pivot table is created).
xlsx pivottable        PROP  fieldCount             number   ops:[--g--]  total number of pivot fields in the source range (read-only).
xlsx pivottable        PROP  dataFieldCount         number   ops:[--g--]  number of data field aggregations (read-only; equals the count of dataField{N} entries).
xlsx pivottable        PROP  dataField{N}           string   ops:[--g--]  per-data-field readback (1-indexed: dataField1, dataField2, …) packed as 'name:aggFunc:fieldIdx'. Get also returns `dat…
xlsx pivottable        PROP  dataField{N}.showAs    enum     ops:[--g--]  values:percent_of_total|percent_of_row|percent_of_col|running_total|difference|percent_diff|index  data field showAs token (read-only). Values are canonicalized from OOXML ShowDataAs.
xlsx pivottable        PROP  location               string   ops:[--g--]  target cell range where the pivot table is rendered (e.g. D1:E4).
xlsx pivottable        PROP  collapsedFields        string   ops:[--g--]  comma-separated names of fields with collapsed items.
xlsx pivottable        PROP  axisAsDataField        bool     ops:[--g--]  comma-separated names of fields acting as data field on axis.
xlsx pivottable        PROP  sortByField            string   ops:[--g--]  comma-separated 'field:direction' sort tuples.
xlsx range             ELEM  ops:[-sgq-]  paths:/SheetName/A1:C10
xlsx range             PROP  merge                  bool     ops:[-sg--]  merge all cells in the range into a single cell. Set merge=false to unmerge — the range must exactly match an existing …  ex:--prop merge=true
xlsx range             PROP  font.bold              bool     ops:[-s---]  broadcast bold to every cell.  ex:--prop font.bold=true
xlsx range             PROP  fill                   color    ops:[-s---]  broadcast fill color.  ex:--prop fill=#FFFF00
xlsx range             PROP  numberformat           string   ops:[-s---]  aliases:format  broadcast number format code.  ex:--prop numberformat="#,##0.00"
xlsx range             PROP  alignment.horizontal   enum     ops:[-s---]  values:left|center|right|justify|general|fill|centerContinuous  aliases:halign  n/a (broadcast)  ex:--prop alignment.horizontal=center
xlsx row               ELEM  ops:[asgqr]  paths:/SheetName/row[N]
xlsx row               PROP  cols                   int      ops:[a----]  number of empty cells to seed in the new row.  ex:--prop cols=5
xlsx row               PROP  height                 length   ops:[asg--]  row height in points.  ex:--prop height=24
xlsx row               PROP  hidden                 bool     ops:[asg--]  hide row.  ex:--prop hidden=true
xlsx row               PROP  outline                int      ops:[-s---]  aliases:outlinelevel,group  outline/group level 0-7. Aliases: outlineLevel, group. Set accepts `outline`/`outlineLevel`/`group`; Get readback uses …  ex:--prop outline=1
xlsx row               PROP  outlineLevel           number   ops:[--g--]  row outline grouping level (0 = ungrouped, 1..7 = nested group depth). Get-only readback of the value set via `outline`.
xlsx row               PROP  collapsed              bool     ops:[-s---]  collapse row group. Currently Set-only.  ex:--prop collapsed=true
xlsx row               PROP  customHeight           bool     ops:[--g--]  true when the row carries an explicit height (Row @customHeight). Get-only flag.
xlsx rowbreak          ELEM  ops:[asgqr]  paths:/SheetName/rowbreak[N]
xlsx rowbreak          PROP  row                    int      ops:[a----]  aliases:index  1-based row index where the break occurs. Alias: index.  ex:--prop row=20
xlsx run               ELEM  ops:[asgqr]  paths:/SheetName/CellRef/r[N]
xlsx run               PROP  subscript              bool     ops:[asg--]  vertical alignment = subscript. Mutually exclusive with superscript.  ex:--prop subscript=true
xlsx run               PROP  superscript            bool     ops:[asg--]  vertical alignment = superscript. Mutually exclusive with subscript.  ex:--prop superscript=true
xlsx run               PROP  bold                   bool     ops:[asg--]  aliases:font.bold  true | false  ex:--prop bold=true
xlsx run               PROP  color                  color    ops:[asg--]  aliases:font.color  #RRGGBB uppercase  ex:--prop color=#FF0000
xlsx run               PROP  font                   string   ops:[as---]  aliases:fontname,fontFamily,font.name  bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readb…  ex:--prop font=Calibri
xlsx run               PROP  italic                 bool     ops:[asg--]  aliases:font.italic  true | false  ex:--prop italic=true
xlsx run               PROP  size                   font-size ops:[asg--]  aliases:fontsize,fontSize,font.size  unit-qualified, e.g. "14pt"  ex:--prop size=11
xlsx run               PROP  text                   string   ops:[asg--]  plain text of run  ex:--prop text="bold word"
xlsx shape             ELEM  ops:[asgqr]  paths:/SheetName/shape[N]
xlsx shape             PROP  anchor                 string   ops:[a----]  aliases:ref  cell range anchor (e.g. B2:F7) — Add-only. Set uses x/y/width/height; Get readback emits x/y/width/height instead of ce…  ex:--prop anchor=B2:F7
xlsx shape             PROP  gradientFill           string   ops:[a----]  Two/three-stop linear gradient, e.g. 'C1-C2[-C3][:angle]'. Mutually exclusive with fill (gradientFill wins).  ex:--prop gradientFill=FF0000-0000FF:90
xlsx shape             PROP  geometry               string   ops:[asg--]  aliases:preset,shape  geometry preset name (rect, ellipse, roundRect, triangle, rightArrow, etc.). Unknown presets fall back to rect with a s…  ex:--prop geometry=ellipse
xlsx shape             PROP  flip                   string   ops:[as---]  Compact flip token: 'h' / 'v' / 'both' / 'hv' / 'vh' / 'none'.  ex:--prop flip=h
xlsx shape             PROP  flipBoth               bool     ops:[as---]  Flip both axes.  ex:--prop flipBoth=true
xlsx shape             PROP  x                      length   ops:[asg--]  aliases:left  x as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.  ex:--prop x=2
xlsx shape             PROP  y                      string   ops:[asg--]  aliases:top  y as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.  ex:--prop y=3
xlsx shape             PROP  width                  string   ops:[asg--]  aliases:w  width as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.  ex:--prop width=4
xlsx shape             PROP  height                 string   ops:[asg--]  aliases:h  height as TwoCellAnchor column/row index. xlsx cell-anchor positioning, integer.  ex:--prop height=3
xlsx shape             PROP  align                  string   ops:[asg--]  Paragraph alignment: 'left' / 'center' (c/ctr) / 'right' (r) / 'justify'.  ex:--prop align=center
xlsx shape             PROP  bold                   bool     ops:[asg--]  aliases:font.bold  Bold runs. Bare alias of font.bold.  ex:--prop bold=true
xlsx shape             PROP  color                  color    ops:[asg--]  aliases:font.color  Text color. Bare alias of font.color.  ex:--prop color=#FF0000
xlsx shape             PROP  fill                   color    ops:[asg--]  aliases:background  Solid fill color, or 'none' for no fill (text-only shapes route effects to text-level rPr).  ex:--prop fill=#FFFF00
xlsx shape             PROP  flipH                  bool     ops:[as---]  aliases:flipHorizontal  Flip horizontally (Office-API alias of flip=h).  ex:--prop flipH=true
xlsx shape             PROP  flipV                  bool     ops:[as---]  aliases:flipVertical  Flip vertically (Office-API alias of flip=v).  ex:--prop flipV=true
xlsx shape             PROP  font                   string   ops:[asg--]  aliases:font.name  default font family for shape text. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / …  ex:--prop font=Arial
xlsx shape             PROP  glow                   string   ops:[asg--]  glow effect. Pass a color (e.g. '4472C4') or 'true' (defaults to accent blue).  ex:--prop glow=#4472C4
xlsx shape             PROP  italic                 bool     ops:[asg--]  aliases:font.italic  Italic runs. Bare alias of font.italic.  ex:--prop italic=true
xlsx shape             PROP  line                   string   ops:[asg--]  aliases:border,linecolor,lineColor  Outline color (or 'none'). Form: 'color[:width[:style]]', e.g. 'FF0000:1.5:dash'. width in points; style: solid|dash|do…  ex:--prop line=#000000
xlsx shape             PROP  margin                 length   ops:[asg--]  uniform internal padding (text inset) for shape body.  ex:--prop margin=4
xlsx shape             PROP  name                   string   ops:[asg--]  Override the auto-generated 'Shape {id}' label on cNvPr @name.  ex:--prop name="banner"
xlsx shape             PROP  reflection             string   ops:[as---]  reflection effect. Accepts 'true' to enable a default reflection.  ex:--prop reflection=true
xlsx shape             PROP  rotation               string   ops:[asg--]  aliases:rot,rotate  Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.  ex:--prop rotation=45
xlsx shape             PROP  shadow                 string   ops:[asg--]  outer shadow effect. Pass a color (e.g. '000000') or 'true' (defaults to black). Routed to text-level rPr for text-only…  ex:--prop shadow=#808080
xlsx shape             PROP  size                   font-size ops:[asg--]  aliases:fontSize,fontsize,font.size  font size  ex:--prop size=14
xlsx shape             PROP  softEdge               string   ops:[as---]  aliases:softedge  Soft edge radius, or 'none' to clear.  ex:--prop softEdge=5
xlsx shape             PROP  text                   string   ops:[asg--]  plain text content of the shape  ex:--prop text="Note"
xlsx shape             PROP  underline              string   ops:[asg--]  aliases:font.underline  Underline style: 'true'/'single'/'sng', 'double'/'dbl', 'none'/'false'. Bare alias of font.underline.  ex:--prop underline=single
xlsx shape             PROP  valign                 string   ops:[asg--]  Vertical anchor: 'top' (t) / 'center' (ctr/middle/c/m) / 'bottom' (b).  ex:--prop valign=middle
xlsx sheet             ELEM  ops:[asgqr]  paths:/<sheetName>;/Sheet1;/Sheet2
xlsx sheet             PROP  name                   string   ops:[asg--]  sheet tab name. Returned path is /<name>; readback goes through DocumentNode.Path / .Preview rather than Format[].  ex:--prop name=Summary
xlsx sheet             PROP  autoFilter             string   ops:[asg--]  aliases:autofilter  range to apply AutoFilter on (e.g. A1:D10). `true` enables on used range.  ex:--prop autoFilter=A1:D10
xlsx sheet             PROP  tabColor               color    ops:[asg--]  sheet tab color.  ex:--prop tabColor=4472C4
xlsx sheet             PROP  hidden                 bool     ops:[asg--]  hide the sheet at creation or after the fact.  ex:--prop hidden=true
xlsx sheet             PROP  freeze                 string   ops:[-sg--]  freeze panes anchor (cell ref). A2 freezes row 1; B1 freezes column A; B2 freezes row 1 + column A. `none` / `false` / …  ex:--prop freeze=A2
xlsx sheet             PROP  direction              enum     ops:[-sg--]  values:rtl|ltr  aliases:rtl,rightToLeft,righttoleft,sheet.direction  RTL sheet layout (Arabic / Hebrew) — column A renders on the right, column scroll direction inverts. Maps to <sheetView…  ex:--prop direction=rtl
xlsx sheet             PROP  zoom                   number   ops:[--g--]  sheetView zoom percentage (10-400). Emitted only when non-default (≠100).
xlsx sheet             PROP  gridlines              bool     ops:[--g--]  sheetView gridline visibility. Emitted only when hidden (false); default-on is omitted (CONSISTENCY(default-omission)).
xlsx sheet             PROP  headings               bool     ops:[--g--]  row/column header visibility. Emitted only when hidden (false); default-on is omitted (CONSISTENCY(default-omission)).
xlsx sheet             PROP  visibility             enum     ops:[--g--]  values:hidden|veryHidden  workbook-level sheet state when not visible. Emitted alongside hidden=true; absent for default-visible sheets.
xlsx sheet             PROP  protect                bool     ops:[-sg--]  sheet protection state. On Set: pass `true` to enable protection, `false` to disable. Use the separate `password` prope…
xlsx sheet             PROP  password               string   ops:[-s---]  Excel legacy password hash for sheet protection (ECMA-376 14.7.1). On Set: pass plaintext password to hash and apply, o…  ex:--prop password=secret123
xlsx sheet             PROP  printTitleRows         string   ops:[-s---]  rows to repeat at top of every printed page (e.g. 1:1).  ex:--prop printTitleRows=1:1
xlsx sheet             PROP  printTitleCols         string   ops:[-s---]  columns to repeat at left of every printed page (e.g. A:A).  ex:--prop printTitleCols=A:A
xlsx sheet             PROP  orientation            string   ops:[--g--]  PageSetup orientation (portrait | landscape). Emitted only when set on the sheet.
xlsx sheet             PROP  paperSize              number   ops:[--g--]  PageSetup paper-size code (OOXML enumeration; e.g. 1=Letter, 9=A4).
xlsx sheet             PROP  fitToPage              string   ops:[--g--]  PageSetup fit-to-page width x height (e.g. '1x1' = fit to one page).
xlsx sheet             PROP  printArea              string   ops:[-sg--]  defined-name _xlnm.Print_Area for this sheet. Get returns the A1 range with the leading 'SheetName!' prefix stripped. O…  ex:--prop printArea=A1:C20
xlsx sheet             PROP  margin.top             string   ops:[--g--]  PageMargins top margin in inches (e.g. '0.75in').
xlsx sheet             PROP  margin.bottom          string   ops:[--g--]  PageMargins bottom margin in inches.
xlsx sheet             PROP  margin.left            string   ops:[--g--]  PageMargins left margin in inches.
xlsx sheet             PROP  margin.right           string   ops:[--g--]  PageMargins right margin in inches.
xlsx sheet             PROP  margin.header          string   ops:[--g--]  PageMargins header margin in inches (distance from top edge to header).
xlsx sheet             PROP  margin.footer          string   ops:[--g--]  PageMargins footer margin in inches (distance from bottom edge to footer).
xlsx sheet             PROP  header                 string   ops:[-sg--]  odd-page header text (HeaderFooter/OddHeader). Excel format codes (&L, &C, &R, &P, &D, etc.) pass through verbatim.
xlsx sheet             PROP  footer                 string   ops:[-sg--]  odd-page footer text (HeaderFooter/OddFooter). Excel format codes pass through verbatim.
xlsx sheet             PROP  sort                   string   ops:[-sg--]  sort the sheet by one or more columns. Set input: comma-separated `Col [dir]` tokens, direction optional, defaults to a…  ex:--prop sort=A
xlsx sheet             PROP  rowBreaks              string   ops:[--g--]  manual horizontal page breaks. Comma-separated row indices (1-based) where each break sits above that row.
xlsx sheet             PROP  colBreaks              string   ops:[--g--]  manual vertical page breaks. Comma-separated column indices (1-based) where each break sits to the left of that column.
xlsx slicer            ELEM  ops:[asgqr]  paths:/SheetName/slicer[N]
xlsx slicer            PROP  pivotTable             string   ops:[asg--]  aliases:pivot,source,tableName  path or reference to an existing pivot table. Bare names resolve against the host sheet's pivots.  ex:--prop pivotTable=/Sheet1/pivottable[1]
xlsx slicer            PROP  field                  string   ops:[a-g--]  aliases:column  pivot field name. Must match an existing cacheField (case-insensitive). Add-time only — Set ignores this key (slicers a…  ex:--prop field=Region
xlsx slicer            PROP  caption                string   ops:[asg--]  user-facing caption shown in the slicer header. Defaults to the field name.  ex:--prop caption='Filter by Region'
xlsx slicer            PROP  name                   string   ops:[asg--]  slicer name. Sanitized; defaults to 'Slicer_<fieldName>'.  ex:--prop name=RegionSlicer
xlsx slicer            PROP  rowHeight              number   ops:[asg--]  row height of each slicer item, in EMU. Default 225425 (~17.5pt).  ex:--prop rowHeight=250000
xlsx slicer            PROP  columnCount            number   ops:[asg--]  number of columns in the slicer button grid. Range 1..20000.  ex:--prop columnCount=2
xlsx slicer            PROP  pivotCacheId           number   ops:[--g--]  extension pivot cache id (x14 cacheField extension). Read-only — auto-assigned at slicer creation.
xlsx slicer            PROP  itemCount              number   ops:[--g--]  total number of items (buttons) in the slicer cache. Read-only — derived from the pivot's shared items.
xlsx slicer            PROP  cache                  string   ops:[--g--]  slicer cache name (Slicer @cache attribute).
xlsx sort              ELEM  ops:[-sg--]  paths:/SheetName;/SheetName/A1:D50
xlsx sort              PROP  sort                   string   ops:[-sg--]  sort spec: 'COL [DIR][, COL [DIR] ...]'. COL is a column letter (A, B, AA..XFD). DIR is asc (default) or desc. Comma-se…  ex:--prop sort=B
xlsx sort              PROP  sortHeader             bool     ops:[-s---]  treat first row as header (excluded from reorder).  ex:--prop sortHeader=true
xlsx sparkline         ELEM  ops:[asgqr]  paths:/SheetName/sparkline[N]
xlsx sparkline         PROP  type                   enum     ops:[asg--]  values:line|column|stacked|winloss|win-loss  sparkline chart kind. 'stacked'/'winloss' both map to OOXML stacked.  ex:--prop type=line
xlsx sparkline         PROP  dataRange              string   ops:[asg--]  aliases:datarange,range,data  source data range (e.g. A1:A10).  ex:--prop dataRange=A1:A10
xlsx sparkline         PROP  location               string   ops:[asg--]  aliases:cell,ref  target cell address.  ex:--prop location=B1
xlsx sparkline         PROP  color                  color    ops:[asg--]  series line/column color. Defaults to #4472C4.  ex:--prop color=#FF0000
xlsx sparkline         PROP  negativeColor          color    ops:[asg--]  aliases:negativecolor  color used when 'negative' flag is on (winLoss/highlight negative points).  ex:--prop negativeColor=#FF0000
xlsx sparkline         PROP  markers                bool     ops:[asg--]  show data-point markers (line sparklines only).  ex:--prop markers=true
xlsx sparkline         PROP  highPoint              bool     ops:[asg--]  aliases:highpoint  highlight the maximum point.  ex:--prop highPoint=true
xlsx sparkline         PROP  lowPoint               bool     ops:[asg--]  aliases:lowpoint  highlight the minimum point.  ex:--prop lowPoint=true
xlsx sparkline         PROP  firstPoint             bool     ops:[asg--]  aliases:firstpoint  highlight the first point.  ex:--prop firstPoint=true
xlsx sparkline         PROP  lastPoint              bool     ops:[asg--]  aliases:lastpoint  highlight the last point.  ex:--prop lastPoint=true
xlsx sparkline         PROP  negative               bool     ops:[asg--]  highlight negative points using negativeColor.  ex:--prop negative=true
xlsx sparkline         PROP  highMarkerColor        color    ops:[a----]  aliases:highmarkercolor  marker color for the high point. Add-only; not modifiable via Set.  ex:--prop highMarkerColor=#00B050
xlsx sparkline         PROP  lowMarkerColor         color    ops:[a----]  aliases:lowmarkercolor  marker color for the low point. Add-only.  ex:--prop lowMarkerColor=#FF0000
xlsx sparkline         PROP  firstMarkerColor       color    ops:[a----]  aliases:firstmarkercolor  marker color for the first point. Add-only.  ex:--prop firstMarkerColor=#4472C4
xlsx sparkline         PROP  lastMarkerColor        color    ops:[a----]  aliases:lastmarkercolor  marker color for the last point. Add-only.  ex:--prop lastMarkerColor=#4472C4
xlsx sparkline         PROP  markersColor           color    ops:[a----]  aliases:markerscolor  marker color for all non-extreme points. Add-only.  ex:--prop markersColor=#808080
xlsx sparkline         PROP  lineWeight             number   ops:[asg--]  aliases:lineweight  line stroke weight in points (line sparklines only).  ex:--prop lineWeight=1.5
xlsx table             ELEM  ops:[asgqr]  paths:/SheetName/table[N]
xlsx table             PROP  ref                    string   ops:[asg--]  aliases:range  cell range reference (A1:C10). Required. Alias: range.  ex:--prop ref=A1:C10
xlsx table             PROP  displayName            string   ops:[asg--]  Excel UI display name. Defaults to name.  ex:--prop displayName=SalesData
xlsx table             PROP  headerRow              bool     ops:[asg--]  aliases:showHeader  show header row. Alias: showHeader.  ex:--prop headerRow=true
xlsx table             PROP  totalRow               bool     ops:[asg--]  aliases:showTotals  show total row. Alias: showTotals.  ex:--prop totalRow=true
xlsx table             PROP  autoExpand             bool     ops:[a----]  auto-expand range downward through contiguous non-empty rows at Add time.  ex:--prop autoExpand=true
xlsx table             PROP  showFirstColumn        bool     ops:[asg--]  aliases:firstColumn  highlight the first column with the table style. Alias: firstColumn.  ex:--prop showFirstColumn=true
xlsx table             PROP  showLastColumn         bool     ops:[asg--]  aliases:lastColumn  highlight the last column with the table style. Alias: lastColumn.  ex:--prop showLastColumn=true
xlsx table             PROP  showRowStripes         bool     ops:[asg--]  aliases:showBandedRows,bandedRows,bandRows  alternate-row banding from the table style. Default: true. Aliases: showBandedRows, bandedRows, bandRows.  ex:--prop showRowStripes=false
xlsx table             PROP  showColumnStripes      bool     ops:[asg--]  aliases:showBandedColumns,bandedColumns,bandedCols,showColStripes,bandCols  alternate-column banding from the table style. Default: false. Aliases: showBandedColumns, bandedColumns, bandedCols, s…  ex:--prop showColumnStripes=true
xlsx table             PROP  columns                string   ops:[a-g--]  comma-separated column header names overriding A1, B1, ... defaults.  ex:--prop columns=Name,Qty,Price
xlsx table             PROP  totalsRowFunction      string   ops:[a----]  comma-separated per-column totals row functions (none|sum|average|count|countNums|max|min|stdDev|var|custom). Effective…  ex:--prop totalsRowFunction=none,sum,average
xlsx table             PROP  totalFunction          string   ops:[--g--]  per-column totals-row function readback (surfaces on the column child node).
xlsx table             PROP  totalLabel             string   ops:[--g--]  per-column totals-row label readback (surfaces on the column child node).
xlsx table             PROP  name                   string   ops:[asg--]  NonVisualDrawingProperties Name (used for stable @name addressing).  ex:--prop name=SalesData
xlsx table             PROP  style                  string   ops:[asg--]  aliases:tableStyle,tableStyleId  table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, no…  ex:--prop style=medium2
xlsx topn              ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx topn              PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx topn              PROP  rank                   number   ops:[a-g--]  aliases:top,bottomN,value  number (or percent) of items to highlight. Default 10. Required >= 1.  ex:--prop rank=10
xlsx topn              PROP  percent                bool     ops:[a-g--]  interpret rank as a percentage (true) or absolute count (false, default).  ex:--prop percent=true
xlsx topn              PROP  bottom                 bool     ops:[a-g--]  highlight bottom-N instead of top-N (default false).  ex:--prop bottom=true
xlsx topn              PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFFF00
xlsx topn              PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx topn              PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx topn              PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx topn              PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx topn              PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx topn              PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx uniquevalues      ELEM  ops:[a-g--]  paths:/SheetName/cf[N]
xlsx uniquevalues      PROP  ref                    string   ops:[a-g--]  aliases:sqref,range  target cell range.  ex:--prop ref=A1:A100
xlsx uniquevalues      PROP  fill                   color    ops:[a----]  background fill via dxf.  ex:--prop fill=FFFF00
xlsx uniquevalues      PROP  font.color             color    ops:[a----]  font color via dxf.  ex:--prop font.color=FF0000
xlsx uniquevalues      PROP  font.bold              bool     ops:[a----]  bold via dxf.  ex:--prop font.bold=true
xlsx uniquevalues      PROP  stopIfTrue             bool     ops:[a----]  stop evaluating subsequent CF rules when this rule applies.  ex:--prop stopIfTrue=true
xlsx uniquevalues      PROP  ruleType               string   ops:[--g--]  raw OOXML rule type string (e.g. "dataBar"). Emitted on every CF rule.
xlsx uniquevalues      PROP  cfType                 string   ops:[--g--]  normalized CF type string. Emitted on every CF rule.
xlsx uniquevalues      PROP  dxfId                  number   ops:[--g--]  differential format id referencing dxf styles. Emitted only when present on the rule.
xlsx validation        ELEM  ops:[asgqr]  paths:/SheetName/dataValidation[N]
xlsx validation        PROP  type                   enum     ops:[asg--]  values:list|whole|decimal|date|time|textlength|custom  validation type  ex:--prop type=list
xlsx validation        PROP  ref                    string   ops:[asg--]  aliases:sqref  target cell range. Aliases: sqref.  ex:--prop ref=A1:A10
xlsx validation        PROP  allowBlank             bool     ops:[asg--]  allow blank cells. Default: true.  ex:--prop allowBlank=false
xlsx validation        PROP  showError              bool     ops:[asg--]  show error message on invalid input. Default: true.  ex:--prop showError=true
xlsx validation        PROP  showInput              bool     ops:[asg--]  show input prompt when cell selected. Default: true.  ex:--prop showInput=true
xlsx validation        PROP  errorTitle             string   ops:[asg--]  title of the error popup.  ex:--prop errorTitle="Bad value"
xlsx validation        PROP  promptTitle            string   ops:[asg--]  title of the input prompt popup.  ex:--prop promptTitle="Hint"
xlsx validation        PROP  errorStyle             enum     ops:[a-g--]  values:stop|warning|information  severity of error popup. Default: stop. Aliases: warn=warning, info=information.  ex:--prop errorStyle=warning
xlsx validation        PROP  inCellDropdown         bool     ops:[a-g--]  show in-cell dropdown arrow for type=list. Default: true. Inverse of OOXML showDropDown.  ex:--prop inCellDropdown=false
xlsx validation        PROP  showDropDown           bool     ops:[a----]  raw OOXML showDropDown flag (INVERTED: true = HIDE arrow). Prefer inCellDropdown for clarity.  ex:--prop showDropDown=true
xlsx validation        PROP  operator               enum     ops:[asg--]  values:between|notBetween|equal|notEqual|greaterThan|greaterThanOrEqual|lessThan|lessThanOrEqual  operator name  ex:--prop operator=between
xlsx validation        PROP  formula1               string   ops:[asg--]  formula1 content  ex:--prop formula1="Yes,No,Maybe"
xlsx validation        PROP  formula2               string   ops:[asg--]  formula2 content  ex:--prop formula2=100
xlsx validation        PROP  prompt                 string   ops:[asg--]  message shown when cell selected.  ex:--prop prompt="Enter 1-100"
xlsx validation        PROP  error                  string   ops:[asg--]  error message on invalid input.  ex:--prop error="Invalid value"
xlsx workbook          ELEM  ops:[-sgq-]  paths:/
xlsx workbook          PROP  defaultFont            string   ops:[-----]  aliases:fontName,fontname  default font for all cells (fontname alias). Not implemented in ExcelHandler — Add/Set/Get all return n/a today; manage…  ex:--prop defaultFont=Calibri
xlsx workbook          PROP  defaultFontSize        length   ops:[-----]  aliases:fontSize,fontsize  default font size. Not implemented in ExcelHandler — Add/Set/Get all return n/a today; manage cell fonts directly.  ex:--prop defaultFontSize=11
xlsx workbook          PROP  author                 string   ops:[-sg--]  aliases:creator  document author (core properties).  ex:--prop author="Alice"
xlsx workbook          PROP  title                  string   ops:[-sg--]  title string  ex:--prop title="Q1 Report"
xlsx workbook          PROP  calc.mode              enum     ops:[-sg--]  values:auto|manual|autoExceptTables  aliases:calcmode  workbook formula calculation mode. 'auto' recalculates on every change, 'manual' requires F9, 'autoExceptTables' skips …  ex:--prop calc.mode=manual
xlsx workbook          PROP  calc.iterate           bool     ops:[-sg--]  aliases:iterate  enable iterative calculation for circular references.  ex:--prop calc.iterate=true
xlsx workbook          PROP  calc.iterateCount      number   ops:[-sg--]  maximum number of iterations when calc.iterate is enabled.  ex:--prop calc.iterateCount=100
xlsx workbook          PROP  calc.iterateDelta      number   ops:[-sg--]  maximum change between iterations to consider the calculation converged.  ex:--prop calc.iterateDelta=0.001
xlsx workbook          PROP  calc.fullPrecision     bool     ops:[-sg--]  if true, calculations use full precision rather than the displayed value.  ex:--prop calc.fullPrecision=true
xlsx workbook          PROP  lastModifiedBy         string   ops:[-sg--]  aliases:lastmodifiedby  from docProps/core.xml lastModifiedBy field.  ex:--prop lastModifiedBy="Alice"
xlsx workbook          PROP  created                string   ops:[--g--]  creation timestamp ISO-8601.
xlsx workbook          PROP  modified               string   ops:[--g--]  last modification timestamp ISO-8601.
xlsx workbook          PROP  extended.application   string   ops:[--g--]  from docProps/app.xml application identifier (e.g. "Microsoft Excel").
xlsx workbook          PROP  category               string   ops:[-sg--]  docProps/core.xml Category field.  ex:--prop category=Reports
xlsx workbook          PROP  description            string   ops:[-sg--]  docProps/core.xml Description field.  ex:--prop description="Annual revenue summary"
xlsx workbook          PROP  keywords               string   ops:[-sg--]  docProps/core.xml Keywords field.  ex:--prop keywords="finance,2026"
xlsx workbook          PROP  revision               string   ops:[-sg--]  docProps/core.xml Revision field.  ex:--prop revision=3
xlsx workbook          PROP  activeTab              number   ops:[--g--]  workbook BookViews activeTab — index of the sheet active when the file opens.
xlsx workbook          PROP  firstSheet             number   ops:[--g--]  workbook BookViews firstSheet — index of the leftmost visible sheet.
xlsx workbook          PROP  calc.fullCalcOnLoad    bool     ops:[--g--]  CalculationProperties FullCalculationOnLoad flag — force a full recalc when the workbook opens.
xlsx workbook          PROP  calc.refMode           string   ops:[--g--]  CalculationProperties ReferenceMode (A1 or R1C1).
xlsx workbook          PROP  workbook.backupFile    bool     ops:[--g--]  WorkbookProperties BackupFile flag — Excel keeps a backup .bak alongside saves.
xlsx workbook          PROP  workbook.codeName      string   ops:[--g--]  WorkbookProperties CodeName — VBA project workbook codename (e.g. ThisWorkbook).
xlsx workbook          PROP  workbook.date1904      bool     ops:[--g--]  WorkbookProperties Date1904 flag — true means dates use the 1904 epoch (Mac legacy).
xlsx workbook          PROP  extended.applicationVersion string   ops:[--g--]  docProps/app.xml AppVersion field.
xlsx workbook          PROP  extended.characters    number   ops:[--g--]  docProps/app.xml Characters count.
xlsx workbook          PROP  extended.company       string   ops:[-sg--]  docProps/app.xml Company field.
xlsx workbook          PROP  extended.lines         number   ops:[--g--]  docProps/app.xml Lines count.
xlsx workbook          PROP  extended.manager       string   ops:[-sg--]  docProps/app.xml Manager field.
xlsx workbook          PROP  extended.pages         number   ops:[--g--]  docProps/app.xml Pages count.
xlsx workbook          PROP  extended.paragraphs    number   ops:[--g--]  docProps/app.xml Paragraphs count.
xlsx workbook          PROP  extended.template      string   ops:[-sg--]  docProps/app.xml Template field.
xlsx workbook          PROP  extended.totalTime     number   ops:[--g--]  docProps/app.xml TotalTime field (minutes).
xlsx workbook          PROP  extended.words         number   ops:[--g--]  docProps/app.xml Words count.
xlsx workbook          PROP  subject                string   ops:[-sg--]  subject string  ex:--prop subject=Finance
xlsx workbook          PROP  theme.color.accent1    color    ops:[-sg--]  theme accent color 1.
xlsx workbook          PROP  theme.color.accent2    color    ops:[-sg--]  theme accent color 2.
xlsx workbook          PROP  theme.color.accent3    color    ops:[-sg--]  theme accent color 3.
xlsx workbook          PROP  theme.color.accent4    color    ops:[-sg--]  theme accent color 4.
xlsx workbook          PROP  theme.color.accent5    color    ops:[-sg--]  theme accent color 5.
xlsx workbook          PROP  theme.color.accent6    color    ops:[-sg--]  theme accent color 6.
xlsx workbook          PROP  theme.color.dk1        color    ops:[-sg--]  theme color slot dk1 (dark 1 / default text).
xlsx workbook          PROP  theme.color.dk2        color    ops:[-sg--]  theme color slot dk2 (dark 2).
xlsx workbook          PROP  theme.color.folHlink   color    ops:[-sg--]  theme followed-hyperlink color.
xlsx workbook          PROP  theme.color.hlink      color    ops:[-sg--]  theme hyperlink color.
xlsx workbook          PROP  theme.color.lt1        color    ops:[-sg--]  theme color slot lt1 (light 1 / default background).
xlsx workbook          PROP  theme.color.lt2        color    ops:[-sg--]  theme color slot lt2 (light 2).
xlsx workbook          PROP  theme.colorScheme      string   ops:[--g--]  color scheme name (a:clrScheme/@name).
xlsx workbook          PROP  theme.font.major.eastAsia string   ops:[-sg--]  major (heading) East Asian typeface.
xlsx workbook          PROP  theme.font.major.latin string   ops:[-sg--]  major (heading) Latin typeface.
xlsx workbook          PROP  theme.font.minor.eastAsia string   ops:[-sg--]  minor (body) East Asian typeface.
xlsx workbook          PROP  theme.font.minor.latin string   ops:[-sg--]  minor (body) Latin typeface.
xlsx workbook          PROP  theme.fontScheme       string   ops:[--g--]  font scheme name (a:fontScheme/@name).
xlsx workbook          PROP  theme.formatScheme     string   ops:[--g--]  format scheme name (a:fmtScheme/@name).
xlsx workbook          PROP  theme.name             string   ops:[--g--]  theme display name (a:theme/@name).
pptx animation         ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]/animation[K]
pptx animation         PROP  effect                 enum     ops:[asg--]  values:appear|fade|fly|zoom|wipe|bounce|float|swivel|split|wheel|checkerboard|blinds|dissolve|flash|box|circle|diamond|plus|strips|wedge|random|spin|grow|wave  animation preset. spin/grow/wave require class=emphasis; appear/fade/fly/zoom/wipe/bounce/float/swivel/split/wheel/chec…  ex:--prop effect=fade
pptx animation         PROP  class                  enum     ops:[asg--]  values:entrance|exit|emphasis  animation category — entrance, exit, or emphasis. spin/grow/wave only work with emphasis.  ex:--prop class=entrance
pptx animation         PROP  trigger                enum     ops:[asg--]  values:onClick|withPrevious|afterPrevious  trigger mode  ex:--prop trigger=onClick
pptx animation         PROP  duration               number   ops:[asg--]  aliases:dur  Animation duration in milliseconds (integer, e.g. 500 = 0.5s).  ex:--prop duration=500
pptx animation         PROP  delay                  number   ops:[asg--]  Delay before starting in milliseconds (integer, e.g. 500 = 0.5s).  ex:--prop delay=200
pptx animation         PROP  direction              string   ops:[as---]  direction for directional effects (in/out/left/right/up/down).  ex:--prop direction=in
pptx animation         PROP  presetId               number   ops:[--g--]  raw OOXML preset id for the animation effect. Emitted when the effect has a recognized preset.
pptx animation         PROP  easein                 number   ops:[--g--]  acceleration percentage (0..100) — fraction of the duration spent ramping up.
pptx animation         PROP  easeout                number   ops:[--g--]  deceleration percentage (0..100) — fraction of the duration spent ramping down.
pptx animation         PROP  motionPath             string   ops:[--g--]  motion-path SVG-like path string (animMotion @path) for path animations.
pptx chart             ELEM  ops:[asgqr]  paths:/slide[N]/chart[@id=ID];/slide[N]/chart[N]
pptx chart             PROP  direction              string   ops:[-s---]  aliases:rtl  Chart-level reading direction. rtl stamps a:rtl="1" on chartSpace c:txPr lvl1pPr so default text bodies (axis labels, d…  ex:--prop direction=rtl
pptx chart             PROP  id                     number   ops:[--g--]  OOXML chart shape id; source of @id in the stable path /chart[@id=ID].
pptx chart             PROP  name                   string   ops:[a-g--]  shape name (DocProperties.Name).  ex:--prop name="Sales Chart"
pptx chart             PROP  anchor                 string   ops:[as---]  absolute placement on slide; cm-based 'x,y,w,h' or named anchor token.  ex:--prop anchor=D2:J18
pptx chart             PROP  dispunits              string   ops:[as---]  aliases:displayunits  value-axis display units divisor. Values: none, hundreds, thousands, tenThousands|10000, hundredThousands|100000, milli…  ex:--prop dispunits=thousands
pptx chart             PROP  x                      length   ops:[asg--]  absolute X position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop x=2cm
pptx chart             PROP  y                      length   ops:[asg--]  absolute Y position from sheet origin; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop y=3cm
pptx chart             PROP  radarstyle             string   ops:[as---]  radar chart subtype. Values: standard|line, marker, filled|fill.  ex:--prop radarstyle=filled
pptx chart             PROP  roundedcorners         bool     ops:[as---]  round the chart-area outer corners.  ex:--prop roundedcorners=true
pptx chart             PROP  valaxisvisible         bool     ops:[as---]  aliases:valaxis.visible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=value); see chart-axis schema for full axis-level o…  ex:--prop valaxisvisible=false
pptx chart             PROP  areafill               string   ops:[as---]  aliases:area.fill  fill applied to every series shape. Solid color or gradient 'c1-c2[:angle]'.  ex:--prop areafill=4472C4-A5C8FF:90
pptx chart             PROP  autotitledeleted       bool     ops:[as---]  suppress the auto-generated 'Chart Title' placeholder.  ex:--prop autotitledeleted=true
pptx chart             PROP  axisfont               string   ops:[as---]  aliases:axis.font  convenience shortcut for /chart[N]/axis[@role=...] axisFont; see chart-axis schema for full axis-level options  ex:--prop axisfont=10:8B949E:Helvetica
pptx chart             PROP  axisline               string   ops:[as---]  aliases:axis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash; see chart-axis schema for full axis-level options  ex:--prop axisline=666666:1
pptx chart             PROP  axismax                number   ops:[as---]  aliases:max  convenience shortcut for /chart[N]/axis[@role=...] max (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismax=1000
pptx chart             PROP  axismin                number   ops:[as---]  aliases:min  convenience shortcut for /chart[N]/axis[@role=...] min (on value/value2); see chart-axis schema for full axis-level opt…  ex:--prop axismin=0
pptx chart             PROP  axisnumfmt             string   ops:[as---]  aliases:axisnumberformat  convenience shortcut for /chart[N]/axis[@role=...] axisNumFmt / format; see chart-axis schema for full axis-level optio…  ex:--prop axisnumfmt="#,##0"
pptx chart             PROP  axisorientation        string   ops:[as---]  aliases:axisreverse  convenience shortcut for /chart[N]/axis[@role=...] axisOrientation; see chart-axis schema for full axis-level options  ex:--prop axisorientation=true
pptx chart             PROP  axisposition           string   ops:[as---]  aliases:axispos  convenience shortcut for /chart[N]/axis[@role=...] tickLabelPos / crossBetween; see chart-axis schema for full axis-lev…  ex:--prop axisposition=top
pptx chart             PROP  axistitle              string   ops:[as---]  aliases:vtitle  convenience shortcut for /chart[N]/axis[@role=...] title (value-axis); see chart-axis schema for full axis-level options  ex:--prop axistitle="Revenue"
pptx chart             PROP  axisvisible            bool     ops:[as---]  aliases:axis.delete,axis.visible  convenience shortcut for /chart[N]/axis[@role=...] visible; see chart-axis schema for full axis-level options  ex:--prop axisvisible=false
pptx chart             PROP  bubbleScale            number   ops:[asg--]  aliases:bubblescale  bubble chart scale (% of default).  ex:--prop bubblescale=100
pptx chart             PROP  catAxisVisible         bool     ops:[asg--]  aliases:cataxis.visible,cataxisvisible  convenience shortcut for /chart[N]/axis[@role=...] visible (on role=category); see chart-axis schema for full axis-leve…  ex:--prop cataxisvisible=false
pptx chart             PROP  catTitle               string   ops:[asg--]  aliases:htitle,cattitle  category axis title text.  ex:--prop cattitle="Quarter"
pptx chart             PROP  cataxisline            string   ops:[as---]  aliases:cataxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=category); see chart-axis schema for ful…  ex:--prop cataxisline=333333:1
pptx chart             PROP  categories             string   ops:[asg--]  comma-separated category labels, OR a cell range reference (e.g. Sheet1!A2:A5)  ex:--prop categories=A,B,C
pptx chart             PROP  chartFill              color    ops:[--g--]  chart-level fill color readback.
pptx chart             PROP  chartType              enum     ops:[asg--]  values:bar|column|line|pie|doughnut|area|scatter|bubble|radar|stock|combo|waterfall|funnel|treemap|sunburst|boxWhisker|histogram|pareto  aliases:type,col,donut,xy,spider,ohlc,wf,charttype  normalized chartType string without modifiers (modifiers surface as separate flags in later iterations)  ex:--prop chartType=column
pptx chart             PROP  chartareafill          string   ops:[as---]  aliases:chartfill  chart-area background fill. Solid color, gradient, or 'none'.  ex:--prop chartareafill=FFFFFF
pptx chart             PROP  chartborder            string   ops:[as---]  aliases:chartarea.border  chart-area outer border line. Same format as plotborder.  ex:--prop chartborder=000000:1
pptx chart             PROP  colorrule              string   ops:[as---]  aliases:conditionalcolor,colorRule  conditional per-data-point color. Format: 'threshold:belowColor:aboveColor'.  ex:--prop colorrule=0:FF0000:00AA00
pptx chart             PROP  colors                 string   ops:[a----]  comma-separated series fill colors, positional (1st color → series 1). Per-series dotted keys (series1.color=...) overr…  ex:--prop colors="4472C4,ED7D31,A5A5A5"
pptx chart             PROP  combosplit             number   ops:[a----]  combo chart split index: first N series use primary chart type, rest use secondary. Add-time only.  ex:--prop combosplit=2
pptx chart             PROP  combotypes             string   ops:[as---]  aliases:combo.types  rebuild as combo chart with per-series chart types (column,line,area,...). Comma-separated, one per series.  ex:--prop combotypes="column,column,line"
pptx chart             PROP  crossBetween           string   ops:[asg--]  aliases:crossbetween  category axis cross-between behavior (between / midCat).  ex:--prop crossBetween=between
pptx chart             PROP  crosses                string   ops:[asg--]  where the value axis crosses the category axis. Values: autoZero (default), max, min.  ex:--prop crosses=max
pptx chart             PROP  crossesAt              number   ops:[asg--]  aliases:crossesat  value-axis crossesAt value readback.  ex:--prop crossesat=0
pptx chart             PROP  data                   string   ops:[a----]  inline series spec 'Name:1,2,3' or 'Name1:1,2,3;Name2:4,5,6'. Add-time only; use per-series chart-series Set after crea…  ex:--prop data="Sales:10,20,30"
pptx chart             PROP  dataLabels             string   ops:[asg--]  aliases:datalabels,labels  show/hide data labels. Use 'none' to hide; otherwise comma list of flags: value, percent, category, series, all (also a…  ex:--prop dataLabels=value
pptx chart             PROP  dataRange              string   ops:[a----]  aliases:datarange,range  external workbook range source for series; Add-time only.  ex:--prop dataRange=Sheet1!A1:D5
pptx chart             PROP  dataTable              bool     ops:[asg--]  aliases:datatable  show data table beneath the chart (with default borders + legend keys).  ex:--prop dataTable=true
pptx chart             PROP  decreaseColor          color    ops:[a----]  waterfall: negative bar color. Add-time only.  ex:--prop decreaseColor=FF0000
pptx chart             PROP  dispBlanksAs           enum     ops:[-sg--]  values:gap|zero|span  how empty cells render (gap leaves a hole, zero plots as 0, span connects across).  ex:--prop dispBlanksAs=gap
pptx chart             PROP  droplines              string   ops:[as---]  drop lines on line chart. true|false toggle or line spec 'color[:width[:dash]]'; 'none' removes.  ex:--prop droplines=true
pptx chart             PROP  errbars                string   ops:[as---]  aliases:errorbars  error bars on each series. Format: 'type:value' where type ∈ fixedVal, percentage, stdDev, stdErr, custom. 'none' remov…  ex:--prop errbars=fixedVal:5
pptx chart             PROP  explosion              number   ops:[asg--]  aliases:explode  pie/doughnut slice explosion 0..400 (percent of radius); 0 removes.  ex:--prop explosion=10
pptx chart             PROP  firstSliceAngle        number   ops:[asg--]  aliases:sliceangle,firstsliceangle  pie/doughnut first slice angle (degrees).  ex:--prop firstsliceangle=90
pptx chart             PROP  gapdepth               number   ops:[as---]  depth gap between series in 3D bar/line/area charts (percent).  ex:--prop gapdepth=150
pptx chart             PROP  gapwidth               number   ops:[asg--]  aliases:gap  gap between bar/column groups, 0..500 (percent of bar width).  ex:--prop gapwidth=150
pptx chart             PROP  gradient               string   ops:[asg--]  aliases:gradientfill  gradient fill applied to every series. Format: 'c1-c2[-c3][:angle]' (angle in degrees). Errors if chart has no series.  ex:--prop gradient=FF0000-0000FF
pptx chart             PROP  gradients              string   ops:[as---]  per-series gradient fills, semicolon-separated; one entry per series.  ex:--prop gradients="FF0000-0000FF;00FF00-FFFF00"
pptx chart             PROP  gridlines              bool     ops:[asg--]  aliases:majorgridlines  value-axis major gridlines. true|false toggle, or line spec 'color', 'color:width', 'color:width:dash' to style; 'none'…  ex:--prop gridlines=true
pptx chart             PROP  height                 length   ops:[asg--]  chart frame height; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop height=10cm
pptx chart             PROP  hilowlines             string   ops:[as---]  high-low lines on line/stock chart. Same format as droplines.  ex:--prop hilowlines=true
pptx chart             PROP  holeSize               number   ops:[asg--]  aliases:holesize  doughnut hole size readback.  ex:--prop holesize=50
pptx chart             PROP  increaseColor          color    ops:[a----]  waterfall: positive bar color. Add-time only.  ex:--prop increaseColor=00AA00
pptx chart             PROP  invertifneg            bool     ops:[as---]  aliases:invertifnegative  if true, draw negative bars in an inverted (lighter) color.  ex:--prop invertifneg=true
pptx chart             PROP  labelPos               string   ops:[asg--]  aliases:labelpos,labelposition  data label position. Values: center|ctr, insideEnd|inEnd|inside, insideBase|inBase|base, outsideEnd|outEnd|outside, bes…  ex:--prop labelPos=outsideEnd
pptx chart             PROP  labelfont              string   ops:[as---]  data label text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop labelfont=9:333333:Calibri
pptx chart             PROP  labeloffset            number   ops:[as---]  category-axis label offset 0..1000 (percent of font height); category axis only.  ex:--prop labeloffset=100
pptx chart             PROP  labelrotation          number   ops:[as---]  aliases:xaxis.labelrotation,valaxis.labelrotation,yaxis.labelrotation,xaxislabelrotation,valaxislabelrotation,yaxislabelrotation  tick-label rotation in degrees (-90..90). Bare 'labelrotation' targets both axes; xaxis.* targets category, yaxis./vala…  ex:--prop labelrotation=-45
pptx chart             PROP  leaderlines            bool     ops:[as---]  aliases:showleaderlines  show/hide leader lines connecting data labels to slices (pie/doughnut).  ex:--prop leaderlines=true
pptx chart             PROP  legend                 enum     ops:[asg--]  values:true|false|none|top|bottom|left|right|topRight|tr  legend position. 'none'/'false' hides; otherwise place at top|t, bottom|b, left|l, right|r, topRight|tr. Hyphen and und…  ex:--prop legend=bottom
pptx chart             PROP  legend.overlay         bool     ops:[asg--]  aliases:legendoverlay  if true, legend overlays the plot area instead of reserving space.  ex:--prop legend.overlay=true
pptx chart             PROP  legendFont             string   ops:[asg--]  aliases:legendfont,legend.font  legend text font. Format: 'size:color:fontname' (any segment optional).  ex:--prop legendFont=10:CCCCCC:Arial
pptx chart             PROP  linedash               string   ops:[as---]  aliases:dash  line dash style for every series. Values: solid, dash, dashDot, dot, lgDash, lgDashDot, sysDash, sysDot, sysDashDot.  ex:--prop linedash=dash
pptx chart             PROP  linewidth              number   ops:[as---]  line width in points (applies to every series line).  ex:--prop linewidth=2
pptx chart             PROP  logbase                number   ops:[as---]  aliases:logscale,yaxisscale  value-axis logarithmic base (2..1000 typically). Shorthand: true|yes|log|1 → base 10; false|none|linear|0 removes log s…  ex:--prop logbase=10
pptx chart             PROP  majorTickMark          string   ops:[asg--]  aliases:majortick,majortickmark  major tick mark style (out / in / cross / none).  ex:--prop majorTickMark=out
pptx chart             PROP  majorunit              number   ops:[as---]  value-axis major gridline / tick spacing.  ex:--prop majorunit=200
pptx chart             PROP  marker                 string   ops:[as---]  aliases:markers  marker symbol for line/scatter/radar series only (other types silently skipped). Format: 'symbol' or 'symbol:size' or '…  ex:--prop marker=circle
pptx chart             PROP  markersize             number   ops:[as---]  marker size 2..72 (line/scatter/radar series only).  ex:--prop markersize=8
pptx chart             PROP  minorGridlines         bool     ops:[asg--]  aliases:minorgridlines  value-axis minor gridlines; same format as gridlines.  ex:--prop minorGridlines=true
pptx chart             PROP  minorTickMark          string   ops:[asg--]  aliases:minortick,minortickmark  minor tick mark style (out / in / cross / none).  ex:--prop minorTickMark=none
pptx chart             PROP  minorunit              number   ops:[as---]  value-axis minor gridline / tick spacing.  ex:--prop minorunit=50
pptx chart             PROP  overlap                number   ops:[asg--]  bar/column overlap within a group, -100..100 (negative = gap, positive = overlap).  ex:--prop overlap=0
pptx chart             PROP  plotFill               color    ops:[asg--]  aliases:plotareafill,plotfill  plot-area background fill. Solid color, gradient 'c1-c2[:angle]', or 'none'.  ex:--prop plotFill=FAFAFA
pptx chart             PROP  plotborder             string   ops:[as---]  aliases:plotarea.border  plot-area border line. Format: 'color', 'color:width', 'color:width:dash'; or 'none'.  ex:--prop plotborder=CCCCCC:0.5
pptx chart             PROP  plotvisonly            bool     ops:[as---]  aliases:plotvisibleonly  if true, skip plotting hidden worksheet rows/columns.  ex:--prop plotvisonly=true
pptx chart             PROP  preset                 string   ops:[as---]  aliases:theme,style.preset  named style bundle. Values: minimal, dark, corporate, magazine, dashboard, colorful, monochrome (alias mono).  ex:--prop preset=minimal
pptx chart             PROP  referenceline          string   ops:[as---]  aliases:refline,targetline  horizontal reference / target line. Format: 'value' or 'value:color' or 'value:color:label' or 'value:color:label:dash'…  ex:--prop referenceline=100:FF0000:Target
pptx chart             PROP  scatterstyle           string   ops:[as---]  scatter chart subtype. Values: line|lineOnly, lineMarker, marker|markerOnly, smooth|smoothLine, smoothMarker.  ex:--prop scatterstyle=smoothMarker
pptx chart             PROP  secondaryaxis          string   ops:[as---]  aliases:secondary  comma-separated 1-based series indices to plot on a secondary value axis.  ex:--prop secondaryaxis=2
pptx chart             PROP  seriesoutline          string   ops:[as---]  aliases:series.outline  series outline. Format: 'color', 'color:width', or 'color:width:dash' (also accepts '-' separator); 'none' removes.  ex:--prop seriesoutline=000000:0.5
pptx chart             PROP  seriesshadow           string   ops:[as---]  aliases:series.shadow  outer shadow on every series shape. Format: 'COLOR-BLUR-ANGLE-DIST-OPACITY'; 'none' removes.  ex:--prop seriesshadow=000000-5-45-3-50
pptx chart             PROP  serlines               string   ops:[as---]  aliases:serieslines  series lines on stacked bar charts (true/false).  ex:--prop serlines=true
pptx chart             PROP  shape                  string   ops:[as---]  aliases:barshape  3D bar shape. Values: box|cuboid, cone, coneToMax, cylinder, pyramid, pyramidToMax. Bar3D charts only.  ex:--prop shape=cylinder
pptx chart             PROP  showMarker             bool     ops:[-sg--]  show markers on line/scatter series at chart level.  ex:--prop showMarker=true
pptx chart             PROP  shownegbubbles         bool     ops:[as---]  render negative-valued bubbles. Bubble charts only.  ex:--prop shownegbubbles=true
pptx chart             PROP  sizerepresents         string   ops:[as---]  how bubble size value is mapped. Values: area (default), width|w. Bubble charts only.  ex:--prop sizerepresents=area
pptx chart             PROP  smooth                 bool     ops:[asg--]  smooth lines on line/scatter charts. Reported unsupported for other chart types.  ex:--prop smooth=true
pptx chart             PROP  style                  number   ops:[asg--]  aliases:styleid  built-in chart style id 1..48; pass 'none' to clear.  ex:--prop style=2
pptx chart             PROP  tickLabelPos           string   ops:[asg--]  aliases:ticklabelposition,ticklabelpos  tick label position (high / low / nextTo / none).  ex:--prop tickLabelPos=nextTo
pptx chart             PROP  ticklabelskip          number   ops:[as---]  aliases:tickskip  draw tick labels every Nth category (category axis).  ex:--prop ticklabelskip=2
pptx chart             PROP  title                  string   ops:[asg--]  chart title text; pass 'none' to remove an existing title. Get also returns sub-keys title.font, title.size, title.colo…  ex:--prop title="Q1"
pptx chart             PROP  title.bold             bool     ops:[--g--]  title bold flag (readback only)
pptx chart             PROP  title.color            color    ops:[--g--]  title font color (readback only, #RRGGBB)
pptx chart             PROP  title.font             string   ops:[--g--]  title font name (readback only)
pptx chart             PROP  title.size             font-size ops:[--g--]  title font size (readback only, e.g. 14pt)
pptx chart             PROP  totalColor             color    ops:[a----]  waterfall: subtotal/total bar color. Add-time only.  ex:--prop totalColor=4472C4
pptx chart             PROP  transparency           number   ops:[as---]  aliases:opacity,alpha  series fill transparency (0..100, percent). 'transparency' is inverse of 'opacity'/'alpha' (transparency=30 ≡ opacity=7…  ex:--prop transparency=30
pptx chart             PROP  trendline              string   ops:[asg--]  add trendline to every series. Format: 'type[:order]' or 'type:forward:backward'. Types: linear (default), exp|exponent…  ex:--prop trendline=linear
pptx chart             PROP  updownbars             string   ops:[as---]  up/down bars on line chart. true | 'gapWidth:upColor:downColor' | 'none'/'false'.  ex:--prop updownbars=true
pptx chart             PROP  valaxisline            string   ops:[as---]  aliases:valaxis.line  convenience shortcut for /chart[N]/axis[@role=...] lineWidth/lineDash (on role=value); see chart-axis schema for full a…  ex:--prop valaxisline=333333:1
pptx chart             PROP  varyColors             bool     ops:[-sg--]  vary colors by data point (single-series charts).  ex:--prop varyColors=true
pptx chart             PROP  view3d                 string   ops:[asg--]  aliases:camera,perspective  3D view angles. Format: 'rotX,rotY,perspective' (any tail optional) or single integer for perspective only. Named-key f…  ex:--prop view3d=15,20,30
pptx chart             PROP  width                  length   ops:[asg--]  chart frame width; accepts cm/in/pt/EMU. Ignored if anchor= is set.  ex:--prop width=18cm
pptx chart-axis        ELEM  ops:[-sg--]  paths:/slide[N]/chart[N]/axis[@role=ROLE]
pptx chart-axis        PROP  dispUnits              enum     ops:[-sg--]  values:hundreds|thousands|tenThousands|hundredThousands|millions|tenMillions|hundredMillions|billions|trillions  display units for value axis labels. Applies to role=value|value2.  ex:--prop dispUnits=thousands
pptx chart-axis        PROP  majorUnit              number   ops:[-sg--]  major tick interval on the value axis. Applies to role=value|value2.  ex:--prop majorUnit=20
pptx chart-axis        PROP  minorUnit              number   ops:[-sg--]  minor tick interval on the value axis. Applies to role=value|value2.  ex:--prop minorUnit=5
pptx chart-axis        PROP  axisFont               string   ops:[--g--]  axis text font readback.
pptx chart-axis        PROP  axisMax                number   ops:[--g--]  value-axis maximum readback (also surfaced via max on axis-by-role path).
pptx chart-axis        PROP  axisMin                number   ops:[--g--]  value-axis minimum readback (also surfaced via min on axis-by-role path).
pptx chart-axis        PROP  axisNumFmt             string   ops:[--g--]  axis number format string.
pptx chart-axis        PROP  axisOrientation        string   ops:[--g--]  axis scaling orientation (e.g. maxMin when reversed).
pptx chart-axis        PROP  axisTitle              string   ops:[--g--]  value-axis title readback (chart-level convenience; axis-by-role uses 'title').
pptx chart-axis        PROP  format                 string   ops:[-sg--]  number format string  ex:--prop format="#,##0"
pptx chart-axis        PROP  labelOffset            number   ops:[--g--]  category axis label offset (% of default 100).
pptx chart-axis        PROP  labelRotation          number   ops:[-sg--]  tick label rotation in degrees  ex:--prop labelRotation=-45
pptx chart-axis        PROP  logBase                number   ops:[-sg--]  logarithmic base for value axis scale. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop logBase=10
pptx chart-axis        PROP  majorGridlines         bool     ops:[-sg--]  show or hide major gridlines. Applies to all roles.  ex:--prop majorGridlines=true
pptx chart-axis        PROP  max                    number   ops:[-sg--]  maximum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop max=1000
pptx chart-axis        PROP  min                    number   ops:[-sg--]  minimum scale of the value axis. Only valid for role=value or role=value2; ignored on category axes.  ex:--prop min=0
pptx chart-axis        PROP  minorGridlines         bool     ops:[-sg--]  show or hide minor gridlines. Applies to all roles.  ex:--prop minorGridlines=false
pptx chart-axis        PROP  tickLabelSkip          number   ops:[--g--]  category axis label skip interval (>1 means tick labels are sparser).
pptx chart-axis        PROP  title                  string   ops:[-sg--]  axis title text. Applies to all roles (category, value). Pass 'none' to remove.  ex:--prop title="Revenue"
pptx chart-axis        PROP  visible                bool     ops:[-sg--]  show or hide the axis. Applies to all roles.  ex:--prop visible=false
pptx chart-series      ELEM  ops:[asg-r]  paths:/slide[N]/chart[@id=ID]/series[@id=ID];/slide[N]/chart[N]/series[N]
pptx chart-series      PROP  alpha                  number   ops:[--g--]  series fill alpha readback in OOXML units (0..100000 = 0..100%). Distinct from chart-level `transparency` which is the …
pptx chart-series      PROP  outlineColor           color    ops:[--g--]  per-series outline color readback.
pptx chart-series      PROP  categories             string   ops:[asg--]  per-series category override; range reference only.  ex:--prop series1.categories="Sheet1!$A$2:$A$5"
pptx chart-series      PROP  categoriesRef          string   ops:[--g--]  A1 cell range backing the category labels.
pptx chart-series      PROP  color                  color    ops:[asg--]  series fill color.  ex:--prop series1.color=#4472C4
pptx chart-series      PROP  dataLabels.numFmt      string   ops:[--g--]  per-series data label number format readback.
pptx chart-series      PROP  dataLabels.separator   string   ops:[--g--]  per-series data label separator string readback.
pptx chart-series      PROP  errBars                string   ops:[--g--]  error bar value type token (e.g. cust, fixedVal, stdDev).
pptx chart-series      PROP  invertIfNeg            bool     ops:[--g--]  invert color for negative values (per-series readback).
pptx chart-series      PROP  lineDash               enum     ops:[-sg--]  values:solid|sysDash|sysDot|sysDashDot|lgDash|lgDashDot|lgDashDotDot|dash|dashDot|dot|longDash  aliases:dash  series line dash style. Set accepts user-friendly aliases (dash/dot/dashDot/longDash); Get returns OOXML token (sysDash…  ex:--prop lineDash=dash
pptx chart-series      PROP  lineWidth              number   ops:[-sg--]  series line width in points (e.g. 1.5).  ex:--prop lineWidth=1.5
pptx chart-series      PROP  marker                 string   ops:[-sg--]  per-series marker symbol. Values: circle, dash, diamond, dot, picture, plus, square, star, triangle, x, none. Supports …  ex:--prop marker=circle
pptx chart-series      PROP  markerSize             number   ops:[-sg--]  marker size in points (2–72). Applies when marker is not 'none'.  ex:--prop markerSize=8
pptx chart-series      PROP  name                   string   ops:[asg--]  aliases:title  series name shown in legend and data labels.  ex:--prop name="Q1"
pptx chart-series      PROP  nameRef                string   ops:[--g--]  A1 cell reference backing the series name.
pptx chart-series      PROP  scatterStyle           string   ops:[--g--]  scatter sub-style (line/lineMarker/marker/smooth/smoothMarker/none).
pptx chart-series      PROP  secondaryAxis          bool     ops:[--g--]  true when the chart has more than one value axis (this series uses the secondary).
pptx chart-series      PROP  smooth                 bool     ops:[-sg--]  smooth line interpolation for line/scatter series.  ex:--prop smooth=true
pptx chart-series      PROP  values                 string   ops:[asg--]  comma-separated numbers, OR a cell range reference (Sheet1!B2:B13)  ex:--prop series1.values="120,150,180"
pptx comment           ELEM  ops:[asgqr]  paths:/slide[N]/comment[M]
pptx comment           PROP  index                  int      ops:[--g--]  Per-author monotonic index, assigned by the engine.
pptx comment           PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=2cm
pptx comment           PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=2cm
pptx comment           PROP  direction              string   ops:[a----]  aliases:dir,rtl  Reading direction for the comment text. rtl prepends U+200F (RIGHT-TO-LEFT MARK) so Arabic / Hebrew comments render wit…  ex:--prop direction=rtl
pptx comment           PROP  date                   string   ops:[asg--]  ISO-8601 timestamp. Defaults to DateTime.UtcNow.  ex:--prop date=2025-01-15T10:30:00Z
pptx comment           PROP  initials               string   ops:[asg--]  author initials. Defaults to derived from author name when omitted.  ex:--prop initials=AT
pptx comment           PROP  author                 string   ops:[asg--]  Author attribute  ex:--prop author="Alice"
pptx comment           PROP  text                   string   ops:[asg--]  comment body. Required.  ex:--prop text="Check formula"
pptx connector         ELEM  ops:[asgqr]  paths:/slide[N]/connector[M]
pptx connector         PROP  shape                  enum     ops:[asg--]  values:straight|elbow|curve  Connector geometry preset. Add/Set accept the short names (straight, elbow, curve) or OOXML full names (straightConnect…  ex:--prop shape=straight
pptx connector         PROP  from                   string   ops:[as---]  start-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as retur…  ex:--prop from=/slide[1]/shape[1]
pptx connector         PROP  to                     string   ops:[as---]  end-point shape reference (Add/Set only). Accepts /slide[N]/shape[M] (positional) or /slide[N]/shape[@id=M] (as returne…  ex:--prop to=/slide[1]/shape[2]
pptx connector         PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=1in
pptx connector         PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=1in
pptx connector         PROP  width                  length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop width=2in
pptx connector         PROP  height                 length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop height=1in
pptx connector         PROP  color                  color    ops:[asg--]  #-prefixed uppercase hex  ex:--prop color=#000000
pptx connector         PROP  lineWidth              length   ops:[asg--]  aliases:linewidth,line.width  pt-qualified string  ex:--prop lineWidth=2pt
pptx connector         PROP  lineDash               enum     ops:[asg--]  values:solid|dot|dash|dashDot|longDash|longDashDot|sysDot|sysDash  aliases:linedash  OOXML preset dash name  ex:--prop lineDash=dash
pptx connector         PROP  headEnd                enum     ops:[asg--]  values:none|triangle|arrow|stealth|diamond|oval  aliases:headend  OOXML LineEndValues token (canonical)  ex:--prop headEnd=triangle
pptx connector         PROP  tailEnd                enum     ops:[asg--]  values:none|triangle|arrow|stealth|diamond|oval  aliases:tailend  OOXML LineEndValues token (canonical)  ex:--prop tailEnd=arrow
pptx connector         PROP  id                     number   ops:[--g--]  OOXML shape id; source of the @id in the stable path /connector[@id=ID].
pptx connector         PROP  name                   string   ops:[asg--]  connector name  ex:--prop name="Arrow1"
pptx connector         PROP  startShape             number   ops:[--g--]  shape id of the start connection endpoint.
pptx connector         PROP  startIdx               number   ops:[--g--]  connection point index on start shape (0-based; omitted when 0).
pptx connector         PROP  endShape               number   ops:[--g--]  shape id of the end connection endpoint.
pptx connector         PROP  endIdx                 number   ops:[--g--]  connection point index on end shape (0-based; omitted when 0).
pptx equation          ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]/oMath[K]
pptx equation          PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=2cm
pptx equation          PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=2cm
pptx equation          PROP  width                  length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop width=10cm
pptx equation          PROP  height                 length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop height=3cm
pptx equation          PROP  formula                string   ops:[as---]  aliases:text  math expression. Aliases: text.  ex:--prop formula="x^2 + y^2 = z^2"
pptx group             ELEM  ops:[asgqr]  paths:/slide[N]/group[M]
pptx group             PROP  shapes                 string   ops:[a----]  comma-separated shape indices (1,2,3) or paths (/slide[N]/shape[M] or /slide[N]/shape[@id=ID]). Required.  ex:--prop shapes=1,2
pptx group             PROP  name                   string   ops:[asg--]  group name. Defaults to 'Group N'.  ex:--prop name="Logos"
pptx group             PROP  zorder                 number   ops:[-----]  1-based z-order in slide shape tree.
pptx group             PROP  x                      length   ops:[--g--]  horizontal offset (group origin). Readback in cm via EmuConverter.
pptx group             PROP  y                      length   ops:[--g--]  vertical offset.
pptx group             PROP  width                  length   ops:[--g--]  group bounding box width.
pptx group             PROP  height                 length   ops:[--g--]  group bounding box height.
pptx hyperlink         ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]/hyperlink;/slide[N]/shape[M]/p[K]/r[L]/hyperlink
pptx hyperlink         PROP  link                   string   ops:[asg--]  aliases:url  external URL or internal target. pptx Set/Get canonical key on shape/run is 'link'. Alias: url.  ex:--prop link=https://example.com
pptx hyperlink         PROP  slide                  int      ops:[asg--]  internal target slide index (1-based).  ex:--prop slide=3
pptx media             ELEM  ops:[asgqr]  paths:/slide[N]/video[M];/slide[N]/audio[M]
pptx media             PROP  src                    string   ops:[as---]  aliases:path  media source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key (no Format["src"] o…  ex:--prop src=/path/to/video.mp4
pptx media             PROP  poster                 string   ops:[as---]  custom thumbnail image path.  ex:--prop poster=/path/to/thumb.png
pptx media             PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=1in
pptx media             PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=1in
pptx media             PROP  width                  length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop width=4in
pptx media             PROP  height                 length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop height=3in
pptx media             PROP  volume                 int      ops:[asg--]  playback volume 0-100.  ex:--prop volume=80
pptx media             PROP  autoPlay               bool     ops:[asg--]  aliases:autoplay  true/false  ex:--prop autoPlay=true
pptx media             PROP  trimStart              string   ops:[asg--]  aliases:trimstart  trim from media start (e.g. '00:00:01.500' or millisecond count). Alias: trimstart.  ex:--prop trimStart=00:00:01.500
pptx media             PROP  trimEnd                string   ops:[asg--]  aliases:trimend  trim from media end. Alias: trimend.  ex:--prop trimEnd=00:00:10.000
pptx model3d           ELEM  ops:[asgqr]  paths:/slide[N]/model3d[M]
pptx model3d           PROP  src                    string   ops:[as---]  aliases:path  .glb source (file path, URL, data-URI). Non-glb rejected. Accepted on add/set only; Get does NOT surface this key (no F…  ex:--prop src=/path/to/model.glb
pptx model3d           PROP  x                      length   ops:[asg--]  aliases:left  length in cm (e.g. "2cm")  ex:--prop x=2cm
pptx model3d           PROP  y                      length   ops:[asg--]  aliases:top  length in cm (e.g. "2cm")  ex:--prop y=2cm
pptx model3d           PROP  width                  length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop width=10cm
pptx model3d           PROP  height                 length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop height=10cm
pptx notes             ELEM  ops:[asgqr]  paths:/slide[N]/notes
pptx notes             PROP  text                   string   ops:[asg--]  notes body text.  ex:--prop text="Emphasize slide 3 data"
pptx notes             PROP  direction              enum     ops:[as---]  values:ltr|rtl  aliases:dir,rtl  Reading direction for the notes body. Sets <a:pPr rtl="1"/> on every paragraph and rtlCol="1" on the body shape's bodyP…  ex:--prop direction=rtl
pptx notes             PROP  lang                   string   ops:[as---]  BCP-47 language tag applied to every run in the notes body (a:rPr/@lang). Mirrors the shape Set vocabulary.  ex:--prop lang=ar-SA
pptx ole               ELEM  ops:[asgqr]  paths:/slide[N]/ole[M]
pptx ole               PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=2cm
pptx ole               PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=2cm
pptx ole               PROP  contentType            string   ops:[--g--]  MIME type of the embedded part.
pptx ole               PROP  fileSize               number   ops:[--g--]  embedded payload bytes.
pptx ole               PROP  objectType             string   ops:[--g--]  OLE object type marker (always 'ole').
pptx ole               PROP  height                 length   ops:[asg--]  unit-qualified length from inline style (e.g. "5cm")  ex:--prop height=8cm
pptx ole               PROP  width                  length   ops:[asg--]  unit-qualified length from inline style (e.g. "5cm")  ex:--prop width=10cm
pptx ole               PROP  preview                string   ops:[a----]  preview thumbnail image source. Add-time only — Set ignores this key.  ex:--prop preview=/path/to/thumb.png
pptx ole               PROP  progId                 string   ops:[asg--]  aliases:progid  OLE ProgID (e.g. 'Excel.Sheet.12'). Usually inferred from src extension.  ex:--prop progId=Word.Document.12
pptx ole               PROP  src                    string   ops:[as---]  aliases:path  embedded object source — file path, URL, or data-URI; accepted on add/set only. Get does NOT surface this key; the embe…  ex:--prop src=/path/to/data.docx
pptx paragraph         ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]/p[K]
pptx paragraph         PROP  align                  enum     ops:[asg--]  values:left|center|right|justify  aliases:alignment,halign  canonical 'align'  ex:--prop align=center
pptx paragraph         PROP  level                  int      ops:[asg--]  list indent level 0-8.  ex:--prop level=1
pptx paragraph         PROP  marginLeft             length   ops:[--g--]  left text margin (CT_TextParagraphProperties @marL).
pptx paragraph         PROP  marginRight            length   ops:[--g--]  right text margin (CT_TextParagraphProperties @marR).
pptx paragraph         PROP  indent                 length   ops:[asg--]  aliases:leftindent,leftIndent  left indentation. Routed through SpacingConverter — accepts twips int or unit-qualified (2cm/0.5in/24pt). Aliases: left…  ex:--prop indent=2cm
pptx paragraph         PROP  lineSpacing            string   ops:[asg--]  aliases:linespacing  multiplier (e.g. 1.5x, 150%) or fixed length (e.g. 18pt)  ex:--prop lineSpacing=1.5x
pptx paragraph         PROP  text                   string   ops:[asg--]  Sets plain text on the paragraph by creating an implicit single run. Do not also add a 'run' child with text on the sam…  ex:--prop text="Hello"
pptx picture           ELEM  ops:[asgqr]  paths:/slide[N]/picture[M]
pptx picture           PROP  mediaType              string   ops:[--g--]  logical media kind derived from VideoFromFile / AudioFromFile presence under the picture. One of `picture`, `video`, `a…
pptx picture           PROP  x                      length   ops:[asg--]  x offset in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop x=0
pptx picture           PROP  y                      length   ops:[asg--]  y offset in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop y=0
pptx picture           PROP  width                  length   ops:[asg--]  width — EMU/length form (e.g. 1.5cm). Required if not inferred from native ratio.  ex:--prop width=5
pptx picture           PROP  height                 length   ops:[asg--]  height — EMU/length form (e.g. 1.5cm). Required if not inferred from native ratio.  ex:--prop height=5
pptx picture           PROP  crop                   string   ops:[asg--]  Crop in percent (0-100). 1 value = symmetric, 2 values = vertical,horizontal, 4 values = left,top,right,bottom.  ex:--prop crop=10
pptx picture           PROP  cropBottom             string   ops:[as---]  aliases:cropbottom  Crop from bottom edge as percent (0-100). Aliases: cropbottom.  ex:--prop cropBottom=10
pptx picture           PROP  cropLeft               string   ops:[as---]  aliases:cropleft  Crop from left as fraction (<=1) or percent (>1). E.g. cropLeft=0.1 or cropLeft=10 both mean 10%.  ex:--prop cropLeft=0.1
pptx picture           PROP  cropRight              string   ops:[as---]  aliases:cropright  Crop from right edge as percent (0-100). Aliases: cropright.  ex:--prop cropRight=10
pptx picture           PROP  cropTop                string   ops:[as---]  aliases:croptop  Crop from top edge as percent (0-100). Aliases: croptop.  ex:--prop cropTop=10
pptx picture           PROP  name                   string   ops:[a-g--]  Override the auto-generated 'Picture {id}' label on cNvPr @name.  ex:--prop name="hero-image"
pptx picture           PROP  id                     number   ops:[--g--]  OOXML shape id; source of the @id in the stable path /picture[@id=ID].
pptx picture           PROP  alt                    string   ops:[asg--]  aliases:altText,alttext,description  alternative text (DocProperties.Description). Defaults to the source file name on add. Aliases: alttext, description.  ex:--prop alt="Logo"
pptx picture           PROP  contentType            string   ops:[--g--]  OOXML content-type of the embedded image part (e.g. `image/png`, `image/jpeg`). Read from the package part referenced b…
pptx picture           PROP  fileSize               number   ops:[--g--]  embedded image file size in bytes (length of the image part stream).
pptx picture           PROP  src                    string   ops:[as---]  aliases:path  image source (file path, URL, data-URI); accepted on add/set only. Get does NOT surface this key; the embedded relation…  ex:--prop src=/path/to/image.png
pptx placeholder       ELEM  ops:[asgqr]  paths:/slide[N]/placeholder[M];/slide[N]/shape[M]
pptx placeholder       PROP  phType                 enum     ops:[asg--]  values:title|body|subtitle|date|footer|slidenum|header|picture|chart|table|diagram|media|obj|clipart  aliases:phtype,type  placeholder type. Required.  ex:--prop phType=title
pptx placeholder       PROP  name                   string   ops:[asg--]  placeholder name. Defaults to '{type} Placeholder {id}'.  ex:--prop name="Title 1"
pptx placeholder       PROP  text                   string   ops:[asg--]  optional initial text content.  ex:--prop text="Slide title"
pptx placeholder       PROP  phIndex                number   ops:[--g--]  placeholder index within the slide layout (PlaceholderShape/@idx). Disambiguates same-typed placeholders (e.g. two `bod…
pptx placeholder       PROP  effective.direction    enum     ops:[--g--]  values:rtl|ltr  resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' …
pptx placeholder       PROP  effective.size         length   ops:[--g--]  resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set direct…
pptx placeholder       PROP  effective.font         string   ops:[--g--]  resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set direct…
pptx placeholder       PROP  effective.color        color    ops:[--g--]  resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set dire…
pptx placeholder       PROP  effective.bold         bool     ops:[--g--]  resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on…
pptx placeholder       PROP  isTitle                bool     ops:[--g--]  true when the shape is the title placeholder (phType=title or ctrTitle).
pptx placeholder       PROP  inheritedFrom          string   ops:[--g--]  placeholder inheritance source — `layout` when the placeholder definition lives on the parent slide layout (not the sli…
pptx presentation      ELEM  ops:[-sgq-]  paths:/
pptx presentation      PROP  title                  string   ops:[-sg--]  title string  ex:--prop title="Q4 Review"
pptx presentation      PROP  author                 string   ops:[-sg--]  aliases:creator  author string  ex:--prop author="Alice"
pptx presentation      PROP  keywords               string   ops:[-sg--]  keywords string  ex:--prop keywords="tag1,tag2"
pptx presentation      PROP  description            string   ops:[-sg--]  description string  ex:--prop description="Abstract"
pptx presentation      PROP  category               string   ops:[-sg--]  category string  ex:--prop category=Marketing
pptx presentation      PROP  lastModifiedBy         string   ops:[-sg--]  aliases:lastmodifiedby  last-modified author  ex:--prop lastModifiedBy="Bob"
pptx presentation      PROP  revision               string   ops:[-sg--]  revision string  ex:--prop revision=3
pptx presentation      PROP  created                string   ops:[--g--]  creation timestamp from docProps/core.xml.
pptx presentation      PROP  modified               string   ops:[--g--]  last-modified timestamp from docProps/core.xml.
pptx presentation      PROP  slideWidth             string   ops:[--g--]  slide width from <p:sldSz/@cx>, formatted via FormatEmu.
pptx presentation      PROP  slideHeight            string   ops:[--g--]  slide height from <p:sldSz/@cy>, formatted via FormatEmu.
pptx presentation      PROP  slideSize              string   ops:[--g--]  slide size preset name derived from <p:sldSz/@type>.
pptx presentation      PROP  defaultFont            string   ops:[--g--]  default minor (body) font from the first slide master's theme FontScheme.
pptx presentation      PROP  extended.application   string   ops:[--g--]  from docProps/app.xml application identifier (e.g. "Microsoft PowerPoint").
pptx presentation      PROP  compatMode             bool     ops:[--g--]  presentation @compatMode flag — true when the file is in legacy-compatibility mode.
pptx presentation      PROP  firstSlideNum          number   ops:[--g--]  presentation @firstSlideNum — slide number of the first slide (default 1).
pptx presentation      PROP  print.colorMode        string   ops:[--g--]  PrintingProperties color mode (e.g. clr | gray | bw).
pptx presentation      PROP  print.frameSlides      bool     ops:[--g--]  PrintingProperties FrameSlides flag — print a thin border around each slide.
pptx presentation      PROP  print.hiddenSlides     bool     ops:[--g--]  PrintingProperties HiddenSlides flag — include hidden slides in printed output.
pptx presentation      PROP  extended.applicationVersion string   ops:[--g--]  docProps/app.xml AppVersion field.
pptx presentation      PROP  extended.characters    number   ops:[--g--]  docProps/app.xml Characters count.
pptx presentation      PROP  extended.company       string   ops:[-sg--]  docProps/app.xml Company field.
pptx presentation      PROP  extended.lines         number   ops:[--g--]  docProps/app.xml Lines count.
pptx presentation      PROP  extended.manager       string   ops:[-sg--]  docProps/app.xml Manager field.
pptx presentation      PROP  extended.pages         number   ops:[--g--]  docProps/app.xml Pages count.
pptx presentation      PROP  extended.paragraphs    number   ops:[--g--]  docProps/app.xml Paragraphs count.
pptx presentation      PROP  extended.template      string   ops:[-sg--]  docProps/app.xml Template field.
pptx presentation      PROP  extended.totalTime     number   ops:[--g--]  docProps/app.xml TotalTime field (minutes).
pptx presentation      PROP  extended.words         number   ops:[--g--]  docProps/app.xml Words count.
pptx presentation      PROP  subject                string   ops:[-sg--]  subject string  ex:--prop subject=Finance
pptx presentation      PROP  theme.color.accent1    color    ops:[-sg--]  theme accent color 1.
pptx presentation      PROP  theme.color.accent2    color    ops:[-sg--]  theme accent color 2.
pptx presentation      PROP  theme.color.accent3    color    ops:[-sg--]  theme accent color 3.
pptx presentation      PROP  theme.color.accent4    color    ops:[-sg--]  theme accent color 4.
pptx presentation      PROP  theme.color.accent5    color    ops:[-sg--]  theme accent color 5.
pptx presentation      PROP  theme.color.accent6    color    ops:[-sg--]  theme accent color 6.
pptx presentation      PROP  theme.color.dk1        color    ops:[-sg--]  theme color slot dk1 (dark 1 / default text).
pptx presentation      PROP  theme.color.dk2        color    ops:[-sg--]  theme color slot dk2 (dark 2).
pptx presentation      PROP  theme.color.folHlink   color    ops:[-sg--]  theme followed-hyperlink color.
pptx presentation      PROP  theme.color.hlink      color    ops:[-sg--]  theme hyperlink color.
pptx presentation      PROP  theme.color.lt1        color    ops:[-sg--]  theme color slot lt1 (light 1 / default background).
pptx presentation      PROP  theme.color.lt2        color    ops:[-sg--]  theme color slot lt2 (light 2).
pptx presentation      PROP  theme.colorScheme      string   ops:[--g--]  color scheme name (a:clrScheme/@name).
pptx presentation      PROP  theme.font.major.eastAsia string   ops:[-sg--]  major (heading) East Asian typeface.
pptx presentation      PROP  theme.font.major.latin string   ops:[-sg--]  major (heading) Latin typeface.
pptx presentation      PROP  theme.font.minor.eastAsia string   ops:[-sg--]  minor (body) East Asian typeface.
pptx presentation      PROP  theme.font.minor.latin string   ops:[-sg--]  minor (body) Latin typeface.
pptx presentation      PROP  theme.fontScheme       string   ops:[--g--]  font scheme name (a:fontScheme/@name).
pptx presentation      PROP  theme.formatScheme     string   ops:[--g--]  format scheme name (a:fmtScheme/@name).
pptx presentation      PROP  theme.name             string   ops:[--g--]  theme display name (a:theme/@name).
pptx run               ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]/p[K]/r[L]
pptx run               PROP  cap                    enum     ops:[asg--]  values:none|small|all  aliases:allCaps,allcaps,smallCaps,smallcaps  none | small | all  ex:--prop cap=all
pptx run               PROP  effective.font         string   ops:[--g--]  resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set direct…
pptx run               PROP  effective.bold         bool     ops:[--g--]  resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on…
pptx run               PROP  effective.color        color    ops:[--g--]  resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set dire…
pptx run               PROP  effective.size         font-size ops:[--g--]  inheritance-resolved font size (read-only). Surfaced when the run does not set 'size' directly; resolved through run st…
pptx run               PROP  underline              enum     ops:[asg--]  values:single|double|dotted|dash|wave|none|thick|dottedHeavy|dashLong|dashLongHeavy|dashDotHeavy|wavyHeavy|wavyDouble  aliases:font.underline  underline style. Common values: single, double, dotted, dash, wave, none.  ex:--prop underline=single
pptx run               PROP  bold                   bool     ops:[asg--]  aliases:font.bold  true | false  ex:--prop bold=true
pptx run               PROP  color                  color    ops:[asg--]  aliases:font.color  #RRGGBB uppercase  ex:--prop color=#FF0000
pptx run               PROP  font                   string   ops:[as---]  aliases:fontname,fontFamily,font.name  bare font family — write-only convenience that sets ASCII+HighAnsi+EastAsia to the same value. Get normalizes the readb…  ex:--prop font=Calibri
pptx run               PROP  italic                 bool     ops:[asg--]  aliases:font.italic  true | false  ex:--prop italic=true
pptx run               PROP  size                   font-size ops:[asg--]  aliases:fontsize,fontSize,font.size  unit-qualified, e.g. "14pt"  ex:--prop size=11
pptx run               PROP  text                   string   ops:[asg--]  plain text of run  ex:--prop text="bold word"
pptx shape             ELEM  ops:[asgqr]  paths:/slide[N]/shape[@id=ID];/slide[N]/shape[N]
pptx shape             PROP  opacity                number   ops:[asg--]  fill opacity (0.0 - 1.0). Requires a fill to attach to — opacity alone (without fill/gradient/pattern) has no effect in…  ex:--prop opacity=0.5 --prop fill=FF0000
pptx shape             PROP  geometry               string   ops:[asg--]  aliases:preset,shape  Preset shape geometry (default: rect).  ex:--prop geometry=ellipse
pptx shape             PROP  font.latin             string   ops:[asg--]  Latin-script font slot only (a:latin). Use to target ASCII/European text without overwriting CJK / complex-script slots.  ex:--prop font.latin=Calibri
pptx shape             PROP  font.ea                string   ops:[asg--]  aliases:font.eastasia,font.eastasian  East-Asian font slot (a:ea) — Chinese / Japanese / Korean text.  ex:--prop font.ea="メイリオ"
pptx shape             PROP  font.cs                string   ops:[asg--]  aliases:font.complexscript,font.complex  Complex-script font slot (a:cs) — Arabic / Hebrew / Thai etc.  ex:--prop font.cs="Arabic Typesetting"
pptx shape             PROP  direction              enum     ops:[asg--]  values:ltr|rtl  aliases:dir,rtl  paragraph reading direction (a:pPr rtl). Use 'rtl' for Arabic / Hebrew layouts.  ex:--prop direction=rtl
pptx shape             PROP  strike                 bool     ops:[asg--]  aliases:strikethrough,font.strike,font.strikethrough  strikethrough on shape text.  ex:--prop strike=true
pptx shape             PROP  cap                    enum     ops:[asg--]  values:none|small|all  aliases:allCaps,allcaps,smallCaps,smallcaps  letter-case rendering mode for shape text (rPr/cap).  ex:--prop cap=all
pptx shape             PROP  lang                   string   ops:[asg--]  aliases:altLang,altlang  BCP-47 language tag on first run rPr (drawingML rPr/@lang).  ex:--prop lang=en-US
pptx shape             PROP  spacing                number   ops:[asg--]  aliases:spc,charspacing,letterspacing  character spacing in 1/100 pt (drawingML rPr/@spc).  ex:--prop spacing=200
pptx shape             PROP  kern                   number   ops:[as---]  minimum kerning size in 1/100 pt (drawingML rPr/@kern). Add/Set only — Get does not surface this back today.  ex:--prop kern=1200
pptx shape             PROP  autoFit                enum     ops:[asg--]  values:normal|shape|none  aliases:autofit  text body auto-fit mode. 'normal' shrinks text to fit; 'shape' resizes the shape to fit text; 'none' overflows. Aliases…  ex:--prop autoFit=normal
pptx shape             PROP  lineSpacing            string   ops:[asg--]  aliases:linespacing  line spacing for shape paragraphs (multiplier or pt).  ex:--prop lineSpacing=1.5x
pptx shape             PROP  spaceBefore            length   ops:[asg--]  aliases:spacebefore  unit-qualified pt  ex:--prop spaceBefore=6pt
pptx shape             PROP  spaceAfter             length   ops:[asg--]  aliases:spaceafter  unit-qualified pt  ex:--prop spaceAfter=6pt
pptx shape             PROP  gradient               string   ops:[asg--]  gradient fill spec. Linear: 'C1-C2[-ANGLE]' or 'LINEAR;C1;C2;ANGLE'. Radial: 'radial:C1-C2[-FOCUS]' (focus: tl/tr/bl/br…  ex:--prop gradient="FF0000-0000FF"
pptx shape             PROP  pattern                string   ops:[asg--]  pattern fill: 'preset' or 'preset:fg' or 'preset:fg:bg' (defaults: fg=000000, bg=FFFFFF).  ex:--prop pattern="diagBrick:FF0000:FFFFFF"
pptx shape             PROP  image                  string   ops:[asg--]  aliases:imagefill  image (blip) fill: path to a local image file used as the shape fill.  ex:--prop image=/path/to/photo.png
pptx shape             PROP  lineWidth              length   ops:[asg--]  aliases:linewidth  outline width.  ex:--prop lineWidth=1pt
pptx shape             PROP  list                   string   ops:[as---]  aliases:liststyle  list style for shape paragraphs (bullet|ordered|none).  ex:--prop list=bullet
pptx shape             PROP  link                   string   ops:[as---]  hyperlink URL or anchor for shape click action.  ex:--prop link=https://example.com
pptx shape             PROP  tooltip                string   ops:[as---]  tooltip / screen-tip text for hyperlink.  ex:--prop tooltip="click here"
pptx shape             PROP  animation              string   ops:[as---]  aliases:animate  animation effect spec.  ex:--prop animation=fade
pptx shape             PROP  effective.direction    enum     ops:[--g--]  values:rtl|ltr  resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' …
pptx shape             PROP  effective.size         length   ops:[--g--]  resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set direct…
pptx shape             PROP  effective.font         string   ops:[--g--]  resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set direct…
pptx shape             PROP  effective.color        color    ops:[--g--]  resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set dire…
pptx shape             PROP  effective.bold         bool     ops:[--g--]  resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on…
pptx shape             PROP  id                     number   ops:[--g--]  OOXML shape id; source of the @id in the stable path /shape[@id=ID].
pptx shape             PROP  zorder                 number   ops:[--g--]  1-based z-order in slide shape tree.
pptx shape             PROP  bevel                  string   ops:[--g--]  3-D top bevel descriptor (preset[:width:height], e.g. `circle:6:6`). Surfaces when sp3d.bevelT is present.
pptx shape             PROP  bevelBottom            string   ops:[--g--]  3-D bottom bevel descriptor (sp3d.bevelB).
pptx shape             PROP  depth                  length   ops:[--g--]  3-D extrusion height (sp3d @extrusionH) in points.
pptx shape             PROP  lighting               string   ops:[--g--]  3-D scene lighting rig name (e.g. threePt, balanced, soft).
pptx shape             PROP  material               string   ops:[--g--]  3-D preset material (e.g. metal, plastic, matte).
pptx shape             PROP  lineOpacity            number   ops:[--g--]  shape outline alpha as fraction (0..1). Surfaces when the outline carries an a:alpha child.
pptx shape             PROP  x                      length   ops:[asg--]  aliases:left  x in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop x=2
pptx shape             PROP  y                      string   ops:[asg--]  aliases:top  y in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop y=3
pptx shape             PROP  width                  string   ops:[asg--]  aliases:w  width in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop width=4
pptx shape             PROP  height                 string   ops:[asg--]  aliases:h  height in EMU/length form (e.g. 2cm). pptx absolute positioning.  ex:--prop height=3
pptx shape             PROP  align                  string   ops:[asg--]  Paragraph alignment: 'left' / 'center' (c/ctr) / 'right' (r) / 'justify'.  ex:--prop align=center
pptx shape             PROP  bold                   bool     ops:[asg--]  aliases:font.bold  Bold runs. Bare alias of font.bold.  ex:--prop bold=true
pptx shape             PROP  color                  color    ops:[asg--]  aliases:font.color  Text color. Bare alias of font.color.  ex:--prop color=#FF0000
pptx shape             PROP  fill                   color    ops:[asg--]  aliases:background  Solid fill color, or 'none' for no fill (text-only shapes route effects to text-level rPr).  ex:--prop fill=#FFFF00
pptx shape             PROP  flipH                  bool     ops:[as---]  aliases:flipHorizontal  Flip horizontally (Office-API alias of flip=h).  ex:--prop flipH=true
pptx shape             PROP  flipV                  bool     ops:[as---]  aliases:flipVertical  Flip vertically (Office-API alias of flip=v).  ex:--prop flipV=true
pptx shape             PROP  font                   string   ops:[asg--]  aliases:font.name  default font family for shape text. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / …  ex:--prop font=Arial
pptx shape             PROP  glow                   string   ops:[asg--]  glow effect. Pass a color (e.g. '4472C4') or 'true' (defaults to accent blue).  ex:--prop glow=#4472C4
pptx shape             PROP  italic                 bool     ops:[asg--]  aliases:font.italic  Italic runs. Bare alias of font.italic.  ex:--prop italic=true
pptx shape             PROP  line                   string   ops:[asg--]  aliases:border,linecolor,lineColor  Outline color (or 'none'). Form: 'color[:width[:style]]', e.g. 'FF0000:1.5:dash'. width in points; style: solid|dash|do…  ex:--prop line=#000000
pptx shape             PROP  margin                 length   ops:[asg--]  uniform internal padding (text inset) for shape body.  ex:--prop margin=4
pptx shape             PROP  name                   string   ops:[asg--]  Override the auto-generated 'Shape {id}' label on cNvPr @name.  ex:--prop name="banner"
pptx shape             PROP  reflection             string   ops:[as---]  reflection effect. Accepts 'true' to enable a default reflection.  ex:--prop reflection=true
pptx shape             PROP  rotation               string   ops:[asg--]  aliases:rot,rotate  Rotation in degrees (positive = clockwise). Stored OOXML-internal as 60000ths of a degree on Transform2D @rot.  ex:--prop rotation=45
pptx shape             PROP  shadow                 string   ops:[asg--]  outer shadow effect. Pass a color (e.g. '000000') or 'true' (defaults to black). Routed to text-level rPr for text-only…  ex:--prop shadow=#808080
pptx shape             PROP  size                   font-size ops:[asg--]  aliases:fontSize,fontsize,font.size  font size  ex:--prop size=14
pptx shape             PROP  softEdge               string   ops:[as---]  aliases:softedge  Soft edge radius, or 'none' to clear.  ex:--prop softEdge=5
pptx shape             PROP  text                   string   ops:[asg--]  plain text content of the shape  ex:--prop text="Note"
pptx shape             PROP  underline              string   ops:[asg--]  aliases:font.underline  Underline style: 'true'/'single'/'sng', 'double'/'dbl', 'none'/'false'. Bare alias of font.underline.  ex:--prop underline=single
pptx shape             PROP  valign                 string   ops:[asg--]  Vertical anchor: 'top' (t) / 'center' (ctr/middle/c/m) / 'bottom' (b).  ex:--prop valign=middle
pptx slide             ELEM  ops:[asgqr]  paths:/slide[N]
pptx slide             PROP  layout                 string   ops:[asg--]  slide layout name (e.g. 'Title Slide', 'Title and Content'). Resolved against the presentation's slide masters.  ex:--prop layout="Title Slide"
pptx slide             PROP  title                  string   ops:[asg--]  title text. Creates a Title shape at Add time.  ex:--prop title="Introduction"
pptx slide             PROP  text                   string   ops:[a----]  content body text. Creates a Content text shape at Add time.  ex:--prop text="Body text"
pptx slide             PROP  background             color    ops:[asg--]  slide background. Accepts hex color, 'transparent', or 'image:/path'.  ex:--prop background=#FFFFFF
pptx slide             PROP  transition             string   ops:[asg--]  transition name (fade, push, wipe, morph, etc.). 'morph...' triggers auto-prefixing of shape names.  ex:--prop transition=fade
pptx slide             PROP  advanceTime            number   ops:[asg--]  aliases:advancetime  auto-advance time in milliseconds (integer). e.g. 5000 = 5 seconds.  ex:--prop advanceTime=5000
pptx slide             PROP  advanceClick           bool     ops:[asg--]  aliases:advanceclick  advance on click.  ex:--prop advanceClick=true
pptx slide             PROP  notes                  string   ops:[-sg--]  slide notes text. Set-only at creation time.  ex:--prop notes="Speaker notes here"
pptx slide             PROP  hidden                 bool     ops:[--g--]  true when the slide is hidden from slideshow (Slide/@show=false). Surfaces only on Get/Query.
pptx slide             PROP  layoutType             string   ops:[--g--]  slide layout type name as encoded on the underlying SlideLayout (e.g. blank, title, titleOnly, twoContent, obj, txAndOb…
pptx slide             PROP  background.alpha       number   ops:[--g--]  slide background fill alpha as percent (0..100). Surfaces when the resolved fill carries an alpha channel.
pptx slide             PROP  background.crop        string   ops:[--g--]  slide background image crop quad in `l,t,r,b` percent units (CT_RelativeRect).
pptx slide             PROP  background.mode        string   ops:[--g--]  slide background image fill mode — `tile` or `center`. Absent for stretch (default).
pptx slide             PROP  background.ref         number   ops:[--g--]  theme background reference index — bgRef/@idx (1001/1002/1003 etc.) when the slide inherits from the theme.
pptx slide             PROP  background.scale       number   ops:[--g--]  tile-fill scale percent (sx, both axes). Surfaces with background.mode=tile.
pptx slide             PROP  matchedShapes          number   ops:[--g--]  morph transition: number of shapes from the previous slide that matched on the current slide.
pptx slide             PROP  morphMode              string   ops:[--g--]  morph transition mode (byObject default, or other p:morph @option token).
pptx slide             PROP  morphShapes            number   ops:[--g--]  morph transition: number of candidate shapes considered for matching on this slide.
pptx slidelayout       ELEM  ops:[--gq-]  paths:/slidemaster[N]/slidelayout[M];/slidelayout[M]
pptx slidelayout       PROP  name                   string   ops:[--g--]  layout display name (e.g. 'Title Slide').
pptx slidelayout       PROP  type                   string   ops:[--g--]  layout type (title, obj, twoObj, etc.).
pptx slidemaster       ELEM  ops:[--gq-]  paths:/slidemaster[N]
pptx slidemaster       PROP  name                   string   ops:[--g--]  master part name from NonVisualDrawingProperties.
pptx slidemaster       PROP  layoutCount            number   ops:[--g--]  number of slide layouts associated with this master.
pptx slidemaster       PROP  theme                  string   ops:[--g--]  name of the theme attached to this master, when the theme has a name.
pptx slidemaster       PROP  shapeCount             number   ops:[--g--]  count of background shapes (Shape + Picture) on the master's shape tree.
pptx table             ELEM  ops:[asgqr]  paths:/slide[N]/table[@id=ID];/slide[N]/table[@name=NAME];/slide[N]/table[M]
pptx table             PROP  id                     number   ops:[--g--]  OOXML graphic frame id (cNvPr id). pptx-only readback.
pptx table             PROP  x                      length   ops:[asg--]  left offset in EMU-parseable length.  ex:--prop x=1in
pptx table             PROP  y                      length   ops:[asg--]  cm-formatted length  ex:--prop y=1in
pptx table             PROP  height                 length   ops:[asg--]  cm-formatted length  ex:--prop height=5cm
pptx table             PROP  rowHeight              length   ops:[a----]  aliases:rowheight  uniform row height (EMU). If unspecified, derived from 'height' / rows.  ex:--prop rowHeight=1cm
pptx table             PROP  headerFill             color    ops:[a----]  aliases:headerfill  solid fill color applied to row 0 (header).  ex:--prop headerFill=#4472C4
pptx table             PROP  bodyFill               color    ops:[a----]  aliases:bodyfill  solid fill color applied to rows 1..N (body).  ex:--prop bodyFill=#EEECE1
pptx table             PROP  firstRow               bool     ops:[--g--]  tblPr @firstRow flag — header-row styling enabled.
pptx table             PROP  lastRow                bool     ops:[--g--]  tblPr @lastRow flag — total-row styling enabled.
pptx table             PROP  firstCol               bool     ops:[--g--]  tblPr @firstCol flag — first-column styling enabled.
pptx table             PROP  lastCol                bool     ops:[--g--]  tblPr @lastCol flag — last-column styling enabled.
pptx table             PROP  bandedRows             bool     ops:[--g--]  tblPr @bandRow flag — alternating row banding from the table style.
pptx table             PROP  bandedCols             bool     ops:[--g--]  tblPr @bandCol flag — alternating column banding from the table style.
pptx table             PROP  border.all             string   ops:[asg--]  aliases:border  shorthand: applies the border to every edge of every cell. PPT OOXML has no table-level border element — this fans out …  ex:--prop border.all="1pt solid FF0000"
pptx table             PROP  border.bottom          string   ops:[asg--]  outer bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DAS…  ex:--prop border.bottom="2pt solid 000000"
pptx table             PROP  border.horizontal      string   ops:[as---]  aliases:border.insideh,border.insideH  inside-horizontal dividers (between rows). Fans out to bottom of rows 1..N-1 plus top of rows 2..N. PPT has no native i…  ex:--prop border.horizontal="1pt solid CCCCCC"
pptx table             PROP  border.left            string   ops:[asg--]  outer left edge: applies to the left of column-1 cells in every row only. Format same as border.all. Cross-format note:…  ex:--prop border.left="1pt solid 808080"
pptx table             PROP  border.right           string   ops:[asg--]  outer right edge: applies to the right of last-column cells in every row only. Format same as border.all. Cross-format …  ex:--prop border.right="1pt solid 808080"
pptx table             PROP  border.top             string   ops:[asg--]  outer top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH C…  ex:--prop border.top="2pt solid 000000"
pptx table             PROP  border.vertical        string   ops:[as---]  aliases:border.insidev,border.insideV  inside-vertical dividers (between columns). Fans out to right of cols 1..M-1 plus left of cols 2..M. Alias: border.insi…  ex:--prop border.vertical="1pt solid CCCCCC"
pptx table             PROP  name                   string   ops:[asg--]  NonVisualDrawingProperties Name (used for stable @name addressing).  ex:--prop name=SalesData
pptx table             PROP  cols                   int      ops:[a-g--]  number of columns (ignored if 'data' is supplied).  ex:--prop cols=3
pptx table             PROP  data                   string   ops:[a----]  inline CSV-ish data ('H1,H2;R1C1,R1C2') or CSV file/URL/data-URI resolvable by FileSource.  ex:--prop data="A,B;1,2"
pptx table             PROP  rows                   int      ops:[a-g--]  number of rows (ignored if 'data' is supplied).  ex:--prop rows=3
pptx table             PROP  width                  string   ops:[asg--]  table width in twips (Dxa) or percent ('50%' → Pct).  ex:--prop width=10cm
pptx table             PROP  style                  string   ops:[asg--]  aliases:tableStyle,tableStyleId  table style name or GUID (accepted aliases: tableStyle, tableStyleId). Valid names: medium1..4, light1..3, dark1..2, no…  ex:--prop style=medium2
pptx table-cell        ELEM  ops:[asgqr]  paths:/slide[N]/table[M]/tr[R]/tc[C]
pptx table-cell        PROP  baseline               number   ops:[--g--]  first run baseline offset for the cell text (percent units; positive=raised).
pptx table-cell        PROP  gridSpan               number   ops:[--g--]  horizontal merge span — number of grid columns this cell spans (>=2 means merged across).
pptx table-cell        PROP  hmerge                 bool     ops:[--g--]  true on cells continued from a horizontal merge anchor (CT_TableCell @hMerge).
pptx table-cell        PROP  image.relId            string   ops:[--g--]  relationship id of an embedded image used as the cell's blip fill.
pptx table-cell        PROP  border.all             string   ops:[asg--]  aliases:border  all four cell edges. Format: 'WIDTH[ DASH][ COLOR]' (e.g. '1pt solid FF0000') or 'STYLE;WIDTH;COLOR[;DASH]' (style igno…  ex:--prop border.all="1pt solid FF0000"
pptx table-cell        PROP  border.bottom          string   ops:[-sg--]  bottom border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLO…  ex:--prop border.bottom="1pt solid 808080"
pptx table-cell        PROP  border.left            string   ops:[-sg--]  left border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR'…  ex:--prop border.left="1pt solid 808080"
pptx table-cell        PROP  border.right           string   ops:[-sg--]  right border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR…  ex:--prop border.right="1pt solid 808080"
pptx table-cell        PROP  border.tl2br           string   ops:[as---]  diagonal from top-left to bottom-right (a:lnTlToBr). Format same as border.all. Cross-format note: docx only accepts th…  ex:--prop border.tl2br="1pt solid FF0000"
pptx table-cell        PROP  border.top             string   ops:[-sg--]  top border. Format: STYLE[;SIZE[;COLOR[;SPACE]]]. Cross-format note: pptx accepts a space-separated 'WIDTH DASH COLOR' …  ex:--prop border.top="2pt solid 000000"
pptx table-cell        PROP  border.tr2bl           string   ops:[as---]  diagonal from top-right to bottom-left (a:lnBlToTr). Format same as border.all. Cross-format note: docx only accepts th…  ex:--prop border.tr2bl="1pt solid FF0000"
pptx table-cell        PROP  fill                   color    ops:[asg--]  aliases:background,shd,shading  cell background fill. Accepts a solid color (hex, named, rgb(...)), 'none' for explicit no-fill, or a gradient string '…  ex:--prop fill=FFFF00
pptx table-cell        PROP  text                   string   ops:[asg--]  single-run text content placed in a fresh paragraph.  ex:--prop text="Hello"
pptx table-column      ELEM  ops:[asgqr]  paths:/slide[N]/table[M]/col[C]
pptx table-column      PROP  width                  length   ops:[asg--]  column width in EMU-parseable length. Defaults to average of existing columns or ~2.54cm.  ex:--prop width=3cm
pptx table-column      PROP  text                   string   ops:[a----]  seed text inserted into every new cell of this column.  ex:--prop text=Header
pptx table-row         ELEM  ops:[asgqr]  paths:/slide[N]/table[M]/tr[R]
pptx table-row         PROP  cols                   int      ops:[a----]  override column count for the new row (defaults to table grid column count).  ex:--prop cols=4
pptx table-row         PROP  height                 length   ops:[asg--]  row height in EMU-parseable length. Defaults to first-row height or ~1cm.  ex:--prop height=1cm
pptx textbox           ELEM  ops:[asgqr]  paths:/slide[N]/shape[M]
pptx textbox           PROP  text                   string   ops:[asg--]  plain text content of the textbox  ex:--prop text="Hello"
pptx textbox           PROP  font                   string   ops:[asg--]  aliases:fontname,fontFamily  font family. Bare 'font' targets Latin + EastAsian; for per-script control (Japanese / Korean / Arabic) use font.latin,…  ex:--prop font=Calibri
pptx textbox           PROP  font.latin             string   ops:[asg--]  Latin-script font slot (a:latin) only.  ex:--prop font.latin=Calibri
pptx textbox           PROP  font.ea                string   ops:[asg--]  aliases:font.eastasia,font.eastasian  East-Asian font slot (a:ea) — Chinese / Japanese / Korean text.  ex:--prop font.ea="メイリオ"
pptx textbox           PROP  font.cs                string   ops:[asg--]  aliases:font.complexscript,font.complex  Complex-script font slot (a:cs) — Arabic / Hebrew / Thai etc.  ex:--prop font.cs="Arabic Typesetting"
pptx textbox           PROP  direction              enum     ops:[asg--]  values:ltr|rtl  aliases:dir,rtl  paragraph reading direction (a:pPr rtl). Use 'rtl' for Arabic / Hebrew layouts.  ex:--prop direction=rtl
pptx textbox           PROP  size                   font-size ops:[asg--]  aliases:fontsize  font size  ex:--prop size=14
pptx textbox           PROP  bold                   bool     ops:[asg--]  true | false  ex:--prop bold=true
pptx textbox           PROP  italic                 bool     ops:[asg--]  true | false  ex:--prop italic=true
pptx textbox           PROP  color                  color    ops:[asg--]  text color  ex:--prop color=0000FF
pptx textbox           PROP  fill                   color    ops:[asg--]  aliases:background  textbox background fill  ex:--prop fill=FFFF00
pptx textbox           PROP  align                  enum     ops:[asg--]  values:left|center|right|justify  text horizontal alignment  ex:--prop align=center
pptx textbox           PROP  width                  length   ops:[asg--]  length in cm  ex:--prop width=5cm
pptx textbox           PROP  height                 length   ops:[asg--]  length in cm  ex:--prop height=3cm
pptx textbox           PROP  x                      length   ops:[asg--]  horizontal position of the textbox  ex:--prop x=2cm
pptx textbox           PROP  y                      length   ops:[asg--]  vertical position of the textbox  ex:--prop y=3cm
pptx textbox           PROP  effective.direction    enum     ops:[--g--]  values:rtl|ltr  resolved reading direction inherited from placeholder→layout→master→presentation defaults. Suppressed when 'direction' …
pptx textbox           PROP  effective.size         length   ops:[--g--]  resolved font size inherited from placeholder→layout→master→presentation defaults. Suppressed when 'size' is set direct…
pptx textbox           PROP  effective.font         string   ops:[--g--]  resolved font name inherited from placeholder→layout→master→presentation defaults. Suppressed when 'font' is set direct…
pptx textbox           PROP  effective.color        color    ops:[--g--]  resolved text color inherited from placeholder→layout→master→presentation defaults. Suppressed when 'color' is set dire…
pptx textbox           PROP  effective.bold         bool     ops:[--g--]  resolved bold inherited from placeholder→layout→master→presentation defaults. Suppressed when 'bold' is set directly on…
pptx textbox           PROP  autoFit                enum     ops:[asg--]  values:none|normal|shape|noAutofit|spAutoFit  aliases:autofit  auto-fit mode for the textbox text body. Alias: autofit.  ex:--prop autoFit=shape
pptx textbox           PROP  id                     number   ops:[--g--]  OOXML shape id; source of the @id in the stable path /shape[@id=ID].
pptx textbox           PROP  zorder                 number   ops:[--g--]  1-based z-order in slide shape tree.
pptx theme             ELEM  ops:[-sgq-]  paths:/theme
pptx theme             PROP  headingFont            string   ops:[-sg--]  aliases:majorFont,majorfont,major  major (heading) Latin typeface.  ex:--prop headingFont="Calibri Light"
pptx theme             PROP  bodyFont               string   ops:[-sg--]  aliases:minorFont,minorfont,minor  minor (body) Latin typeface.  ex:--prop bodyFont=Calibri
pptx theme             PROP  headingFont.ea         string   ops:[-sg--]  aliases:majorFont.ea,majorfont.ea  major (heading) East Asian typeface (CJK).  ex:--prop headingFont.ea="Yu Gothic"
pptx theme             PROP  headingFont.cs         string   ops:[-sg--]  aliases:majorFont.cs,majorfont.cs  major (heading) Complex Script typeface (Arabic/Hebrew/Thai).  ex:--prop headingFont.cs=Arial
pptx theme             PROP  bodyFont.ea            string   ops:[-sg--]  aliases:minorFont.ea,minorfont.ea  minor (body) East Asian typeface (CJK).  ex:--prop bodyFont.ea="Yu Gothic"
pptx theme             PROP  bodyFont.cs            string   ops:[-sg--]  aliases:minorFont.cs,minorfont.cs  minor (body) Complex Script typeface (Arabic/Hebrew/Thai).  ex:--prop bodyFont.cs="Times New Roman"
pptx theme             PROP  dk1                    color    ops:[-sg--]  aliases:dark1  dark 1 — default text color in the theme color scheme.  ex:--prop dk1=#000000
pptx theme             PROP  lt1                    color    ops:[-sg--]  aliases:light1  light 1 — default background color in the theme color scheme.  ex:--prop lt1=#FFFFFF
pptx theme             PROP  dk2                    color    ops:[-sg--]  aliases:dark2  dark 2 — secondary dark / dark accent color in the theme color scheme.  ex:--prop dk2=#44546A
pptx theme             PROP  lt2                    color    ops:[-sg--]  aliases:light2  light 2 — secondary light / light accent color in the theme color scheme.  ex:--prop lt2=#E7E6E6
pptx theme             PROP  accent1                color    ops:[-sg--]  theme accent color 1.  ex:--prop accent1=#4472C4
pptx theme             PROP  accent2                color    ops:[-sg--]  theme accent color 2.  ex:--prop accent2=#ED7D31
pptx theme             PROP  accent3                color    ops:[-sg--]  theme accent color 3.  ex:--prop accent3=#A5A5A5
pptx theme             PROP  accent4                color    ops:[-sg--]  theme accent color 4.  ex:--prop accent4=#FFC000
pptx theme             PROP  accent5                color    ops:[-sg--]  theme accent color 5.  ex:--prop accent5=#5B9BD5
pptx theme             PROP  accent6                color    ops:[-sg--]  theme accent color 6.  ex:--prop accent6=#70AD47
pptx theme             PROP  hyperlink              color    ops:[-sg--]  aliases:hlink  theme hyperlink color.  ex:--prop hyperlink=#0563C1
pptx theme             PROP  followedhyperlink      color    ops:[-sg--]  aliases:folhlink  theme followed (visited) hyperlink color.  ex:--prop followedhyperlink=#954F72
pptx theme             PROP  name                   string   ops:[--g--]  theme color scheme name (e.g. 'Office'). Emitted when the theme carries a named color scheme.
pptx transition        ELEM  ops:[-sg--]  paths:/slide[N]
pptx transition        PROP  transition             enum     ops:[-sg--]  values:morph|fade|push|wipe|split|cut|random|wheel|blinds|checker|comb|cover|dissolve|flash|fly|plus|strips|wedge|zoom  transition type token  ex:--prop transition=morph
pptx transition        PROP  advanceTime            string   ops:[-sg--]  auto-advance after time (ms, or 'none' to clear)  ex:--prop advanceTime=3000
pptx transition        PROP  advanceClick           bool     ops:[-sg--]  advance on click (default true)  ex:--prop advanceClick=true
pptx zoom              ELEM  ops:[asgqr]  paths:/slide[N]/zoom[M]
pptx zoom              PROP  target                 int      ops:[asg--]  aliases:slide  target slide number (1-based). Required. Alias: slide.  ex:--prop target=3
pptx zoom              PROP  x                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop x=2cm
pptx zoom              PROP  y                      length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop y=2cm
pptx zoom              PROP  width                  length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop width=8cm
pptx zoom              PROP  height                 length   ops:[asg--]  length in cm (e.g. "2cm")  ex:--prop height=4.5cm
pptx zoom              PROP  name                   string   ops:[asg--]  zoom frame name. Defaults to 'Slide Zoom N'.  ex:--prop name="Section 2"
pptx zoom              PROP  returnToParent         bool     ops:[asg--]  aliases:returntoparent  return to parent slide after zoom plays.  ex:--prop returnToParent=true
pptx zoom              PROP  transitionDur          int      ops:[asg--]  aliases:transitiondur  transition duration in ms. Defaults to 1000.  ex:--prop transitionDur=1500
```
