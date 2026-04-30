# Code Figure Revision

## Common Problems

- Code figures look like pasted plain text, not IDE screenshots.
- Chinese comments render as boxes, question marks, or mojibake.
- Font is too small or the screenshot is blurry.
- Source snippet does not match implemented code.

## Evidence Rule

Choose snippets from actual source files. Record source path, caption, rendered image path, and font set in a manifest.

Recommended manifest:

```text
output/figures/code_figures_manifest.json
```

## IDE-Like Rendering Baseline

Use a light editor look:

- white editor background
- top window bar
- file tab
- line numbers
- monospaced code
- simple syntax highlighting
- readable comments

Known good parameters from the reference project:

- image width: `1600`
- code font size: `24`
- line number font size: `22`
- small chrome font size: `18`
- line height: `34`
- document insertion width: `Inches(5.8)`

Font fallback:

- Code: `CascadiaMono.ttf`, `CascadiaCode.ttf`, `consola.ttf`
- Code bold: `CascadiaCode.ttf`, `consolab.ttf`, `CascadiaMono.ttf`, `consola.ttf`
- CJK: `NotoSansSC-VF.ttf`, `msyh.ttc`, `simhei.ttf`, `simsun.ttc`
- CJK bold: `NotoSansSC-VF.ttf`, `msyhbd.ttc`, `simhei.ttf`, `simsun.ttc`

Render mixed text by selecting CJK font for characters with `ord(ch) > 127`.

## Validation

```powershell
python wuhan-donghu-thesis\scripts\verify_code_figure_text.py output\figures\code_figures_manifest.json
```

Then inspect PDF-rendered pages containing representative code figures. A manifest pass does not guarantee Word scaling looks good.
