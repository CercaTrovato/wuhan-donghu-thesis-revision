#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import annotations

import argparse
import shutil
import tempfile
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile
import xml.etree.ElementTree as ET


W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
W = f"{{{W_NS}}}"
FORBIDDEN_DEFAULT = ("spacing", "w", "kern", "position", "fitText")
BOLD_TAGS = ("b", "bCs")


def remove_child(parent: ET.Element, local_name: str) -> int:
    removed = 0
    tag = W + local_name
    for child in list(parent):
        if child.tag == tag:
            parent.remove(child)
            removed += 1
    return removed


def clean_document_xml(xml_bytes: bytes, *, remove_bold: bool = False) -> tuple[bytes, dict[str, int]]:
    ET.register_namespace("w", W_NS)
    root = ET.fromstring(xml_bytes)
    stats = {name: 0 for name in FORBIDDEN_DEFAULT}
    if remove_bold:
        for name in BOLD_TAGS:
            stats[name] = 0

    for tbl in root.findall(".//" + W + "tbl"):
        for rpr in tbl.findall(".//" + W + "rPr"):
            for name in FORBIDDEN_DEFAULT:
                stats[name] += remove_child(rpr, name)
            if remove_bold:
                for name in BOLD_TAGS:
                    stats[name] += remove_child(rpr, name)
    return ET.tostring(root, encoding="utf-8", xml_declaration=True), stats


def rewrite_docx(src: Path, dst: Path, *, remove_bold: bool = False) -> dict[str, int]:
    with ZipFile(src, "r") as zin:
        document_xml = zin.read("word/document.xml")
        new_document_xml, stats = clean_document_xml(document_xml, remove_bold=remove_bold)
        with tempfile.NamedTemporaryFile(delete=False, suffix=".docx") as tmp:
            tmp_path = Path(tmp.name)
        try:
            with ZipFile(tmp_path, "w", ZIP_DEFLATED) as zout:
                for item in zin.infolist():
                    if item.filename == "word/document.xml":
                        zout.writestr(item, new_document_xml)
                    else:
                        zout.writestr(item, zin.read(item.filename))
            shutil.move(str(tmp_path), dst)
        finally:
            if tmp_path.exists():
                tmp_path.unlink()
    return stats


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Remove table run-level properties that cause stretched or scattered Word/PDF table text."
    )
    parser.add_argument("docx", type=Path)
    parser.add_argument("--output", type=Path, help="Output DOCX. Defaults to in-place rewrite.")
    parser.add_argument("--remove-bold", action="store_true", help="Also remove w:b and w:bCs from table runs.")
    args = parser.parse_args()

    if not args.docx.exists():
        raise SystemExit(f"DOCX not found: {args.docx}")
    output = args.output or args.docx
    if output.resolve() == args.docx.resolve():
        backup = args.docx.with_suffix(".before_table_run_cleanup.docx")
        shutil.copy2(args.docx, backup)
        source = backup
    else:
        source = args.docx

    stats = rewrite_docx(source, output, remove_bold=args.remove_bold)
    print("TABLE_RUN_PROPERTY_CLEANUP=PASS")
    print(f"DOCX={output}")
    for name, count in stats.items():
        print(f"REMOVED_{name}={count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
