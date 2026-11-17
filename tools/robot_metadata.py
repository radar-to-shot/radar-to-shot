"""Read optional submission identity from compiler-compatible comment headers.

The parser does not modify the robot program. Explicit stable IDs connect renamed
files and updated versions to the same author/robot history; paths remain useful
for replay and for submissions that predate the metadata convention.
"""
from __future__ import annotations

from pathlib import PurePosixPath
import re
import unicodedata

FIELDS = {"author", "name", "version", "author-id", "robot-id"}
REQUIRED_FIELDS = {"author", "name", "version"}
ID_PATTERN = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*")
VERSION_PATTERN = re.compile(r"[A-Za-z0-9][A-Za-z0-9._+-]{0,31}")


def _display(value: str, field: str) -> str:
    value = value.strip()
    if not value or len(value) > 64 or not all(character.isprintable() for character in value):
        raise ValueError(f"Metadata @{field} must contain 1–64 printable characters")
    return value


def _identity(value: str | None, display: str, field: str) -> str:
    if value is None:
        # Derivation is convenient for a first submission. Explicit IDs are
        # recommended because display names and punctuation can change later.
        plain = unicodedata.normalize("NFKD", display).encode("ascii", "ignore").decode()
        value = re.sub(r"[^a-z0-9]+", "-", plain.lower()).strip("-")
    else:
        value = value.strip().lower()
    if not 1 <= len(value) <= 48 or not ID_PATTERN.fullmatch(value):
        raise ValueError(
            f"Metadata @{field} must be a 1–48 character ASCII slug: letters, digits, "
            "and single hyphens between words; supply an explicit ID if the name cannot form one"
        )
    return value


def extract_metadata(source: str, path_id: str) -> dict:
    """Extract author/name/version and stable identities, with a legacy fallback.

    All ``; @...`` lines are reserved for metadata and must appear before the
    first program statement. Ordinary comments and blank lines may be interleaved
    in this opening header. Unknown, repeated, misplaced, or incomplete fields
    raise ValueError instead of silently changing an author's history identity.
    """
    if not isinstance(source, str) or not isinstance(path_id, str) or not path_id:
        raise ValueError("Metadata extraction needs source text and a nonempty path ID")
    values = {}
    in_header = True
    for line_number, line in enumerate(source.removeprefix("\ufeff").splitlines(), 1):
        stripped = line.strip()
        if re.match(r";\s*@", stripped):
            if not in_header:
                raise ValueError(f"Metadata must precede program statements (line {line_number})")
            match = re.fullmatch(r";\s*@([A-Za-z][A-Za-z-]*):\s*(.*)", stripped)
            if not match:
                raise ValueError(f"Malformed metadata field on line {line_number}; use '; @field: value'")
            field, value = match.group(1).lower(), match.group(2).strip()
            if field not in FIELDS:
                raise ValueError(f"Unknown metadata field @{field} on line {line_number}")
            if field in values:
                raise ValueError(f"Repeated metadata field @{field} on line {line_number}")
            values[field] = value
        elif stripped and not stripped.startswith(";"):
            in_header = False

    if not values:
        filename = PurePosixPath(path_id).name
        if PurePosixPath(filename).suffix.lower() in (".bot", ".robot", ".txt"):
            filename = PurePosixPath(filename).stem
        return {"author": "Unattributed", "author_id": None, "robot_name": filename,
                "robot_id": "legacy:" + path_id, "version": "unversioned",
                "metadata_source": "legacy"}

    missing = REQUIRED_FIELDS - values.keys()
    if missing:
        raise ValueError("Incomplete metadata header; missing " +
                         ", ".join("@" + field for field in sorted(missing)))
    author = _display(values["author"], "author")
    robot_name = _display(values["name"], "name")
    version = values["version"]
    if not VERSION_PATTERN.fullmatch(version):
        raise ValueError("Metadata @version must be 1–32 letters/digits or . _ + -; start with a letter or digit")
    author_id = _identity(values.get("author-id"), author, "author-id")
    robot_slug = _identity(values.get("robot-id"), robot_name, "robot-id")
    return {"author": author, "author_id": author_id, "robot_name": robot_name,
            "robot_id": author_id + "/" + robot_slug, "version": version,
            "metadata_source": "header"}
