#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import annotations

import argparse
from pathlib import Path
from zipfile import ZipFile
import xml.etree.ElementTree as ET


W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"


def read_visible_text(docx: Path) -> str:
    with ZipFile(docx) as zf:
        xml = zf.read("word/document.xml")
    root = ET.fromstring(xml)
    return "".join(t.text or "" for t in root.findall(".//" + W + "t"))


def main() -> int:
    parser = argparse.ArgumentParser(description="Lightweight scoped revision checks for required/residual text.")
    parser.add_argument("docx", type=Path)
    parser.add_argument("--must-contain", action="append", default=[])
    parser.add_argument("--must-not-contain", action="append", default=[])
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()

    if not args.docx.exists():
        raise SystemExit(f"DOCX not found: {args.docx}")
    text = read_visible_text(args.docx)
    failures: list[str] = []
    for token in args.must_contain:
        if token not in text:
            failures.append(f"MISSING: {token}")
    for token in args.must_not_contain:
        if token in text:
            failures.append(f"FORBIDDEN_PRESENT: {token}")

    lines = [
        f"DOCX={args.docx}",
        f"VISIBLE_TEXT_CHARS={len(text)}",
        f"MUST_CONTAIN={len(args.must_contain)}",
        f"MUST_NOT_CONTAIN={len(args.must_not_contain)}",
    ]
    if failures:
        lines.append("REVISION_SCOPE_CHECK=FAIL")
        lines.extend(failures)
        output = "\n".join(lines)
        if args.report:
            args.report.write_text(output + "\n", encoding="utf-8")
        print(output)
        return 1

    lines.append("REVISION_SCOPE_CHECK=PASS")
    output = "\n".join(lines)
    if args.report:
        args.report.write_text(output + "\n", encoding="utf-8")
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
