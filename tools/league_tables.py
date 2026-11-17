"""Render Discord-ready leaderboard tables as compact, readable PNG panels.

Discord does not render Markdown tables as grids. These attachments provide a
visual table while the accompanying JSON and Markdown retain every row and full
identity. The renderer never fetches fonts or assets from the network.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
import math
import os
from pathlib import Path
import tempfile
import unicodedata

from PIL import Image, ImageDraw, ImageFont

WIDTH = 1440
MARGIN = 48
MAX_ROWS = 10
MAX_PNG_BYTES = 2 * 1024 * 1024
BACKGROUND = "#f5f2e9"
PAPER = "#fffffc"
INK = "#183d35"
TEAL = "#176454"
MUTED = "#68756d"
GRID = "#cbd3c6"
ALTERNATE = "#f0f3ec"
HIGHLIGHT = "#e3efe5"
WARM = "#ba603d"

PANELS = (
    ("leaderboard-current.png", "This week's leading robots and authors",
     "Overall robot and author standings, with ratings, movement and battle statistics."),
    ("leaderboard-formats.png", "Head-to-head and multiplayer standings",
     "Separate top-ten tables for 2-, 3-, 4- and 5-robot battles."),
    ("leaderboard-history.png", "Leading authors and robots over time",
     "Historical leaders, weekly appearances, first-place weeks and best ranks."),
)


def _font(size: int, *, bold=False, mono=False):
    family = "DejaVuSansMono" if mono else "DejaVuSans"
    name = family + ("-Bold" if bold else "") + ".ttf"
    candidates = (
        Path("/usr/share/fonts/truetype/dejavu") / name,
        Path("/usr/share/fonts/dejavu-sans-fonts") / name,
        Path(name),
    )
    for candidate in candidates:
        try:
            return ImageFont.truetype(str(candidate), size)
        except OSError:
            continue
    # Pillow's bundled scalable default needs no OS font installation.
    return ImageFont.load_default(size=size)


FONTS = {
    "title": _font(43, bold=True),
    "heading": _font(29, bold=True),
    "body": _font(23),
    "strong": _font(23, bold=True),
    "small": _font(18),
    "header": _font(18, bold=True),
    "number": _font(22, mono=True),
    "compact": _font(20),
    "compact_strong": _font(20, bold=True),
    "compact_number": _font(20, mono=True),
}


def _text(value) -> str:
    """Keep metadata on one visual line, including hostile control characters."""
    if value is None:
        return ""
    return " ".join("".join(
        character if unicodedata.category(character)[0] != "C" else " "
        for character in str(value)
    ).split())


def _fit(draw, value, font, width):
    value = _text(value)
    if draw.textlength(value, font=font) <= width:
        return value
    ellipsis = "…"
    if draw.textlength(ellipsis, font=font) > width:
        return ""
    low, high = 0, len(value)
    while low < high:
        middle = (low + high + 1) // 2
        if draw.textlength(value[:middle] + ellipsis, font=font) <= width:
            low = middle
        else:
            high = middle - 1
    return value[:low].rstrip() + ellipsis


def _number(value, decimals=0):
    try:
        value = float(value)
    except (ValueError, TypeError):
        return "—"
    return f"{value:,.{decimals}f}" if math.isfinite(value) else "—"


def _percent(value):
    try:
        value = float(value)
    except (ValueError, TypeError):
        return "—"
    return f"{100 * value:.0f}%" if math.isfinite(value) and 0 <= value <= 1 else "—"


def _movement(value):
    try:
        value = int(value)
    except (ValueError, TypeError, OverflowError):
        return "new"
    return f"↑{value}" if value > 0 else f"↓{-value}" if value < 0 else "—"


def _robot(row):
    return row.get("robot_name") or row.get("name") or row.get("id") or "Unnamed robot"


def _identity(row, *, historical=False):
    author = row.get("author") or "Unattributed"
    version = row.get("version") or "unversioned"
    version = _text(version)
    if version not in ("unversioned", "legacy") and not version.lower().startswith("v"):
        version = "v" + version
    return str(author) + " · " + version


def _record(row):
    if any(row.get(key) is None for key in ("wins", "draws", "losses")):
        return "—"
    return "–".join(_count(row[key], threshold=1000) for key in ("wins", "draws", "losses"))


def _count(value, *, threshold=10_000):
    try:
        value = float(value)
    except (ValueError, TypeError):
        return "—"
    if not math.isfinite(value):
        return "—"
    return f"{value / 1000:.0f}k" if abs(value) >= threshold else f"{value:,.0f}"


@dataclass(frozen=True)
class Column:
    heading: str
    width: int
    key: str
    align: str = "right"


def _put(draw, box, value, *, font="body", color=INK, align="left"):
    left, top, width, height = box
    selected = FONTS[font]
    label = _fit(draw, value, selected, max(0, width))
    measured = draw.textlength(label, font=selected)
    x = left + (width - measured if align == "right" else (width - measured) / 2 if align == "center" else 0)
    draw.text((x, top + height / 2), label, fill=color, font=selected, anchor="lm")


def _canvas(height, title, subtitle, week):
    image = Image.new("RGB", (WIDTH, height), BACKGROUND)
    draw = ImageDraw.Draw(image)
    draw.rectangle((0, 0, WIDTH, 9), fill=TEAL)
    # A small angular robot mark echoes the original monochrome arena symbols.
    draw.polygon(((MARGIN, 44), (MARGIN + 12, 32), (MARGIN + 24, 44), (MARGIN + 12, 56)),
                 outline=INK, width=2)
    draw.line((MARGIN + 12, 32, MARGIN + 12, 22), fill=INK, width=2)
    _put(draw, (MARGIN + 37, 22, 700, 38), "ROBOT WARRIORS / WEEKLY LEAGUE", font="header")
    _put(draw, (WIDTH - MARGIN - 250, 22, 250, 38), week or "Weekly standings", font="header", align="right")
    _put(draw, (MARGIN, 68, WIDTH - 2 * MARGIN, 54), title, font="title")
    _put(draw, (MARGIN, 126, WIDTH - 2 * MARGIN, 30), subtitle, font="compact", color=MUTED)
    return image, draw


def _footer(draw, height, first, second):
    draw.line((MARGIN, height - 77, WIDTH - MARGIN, height - 77), fill=GRID, width=1)
    _put(draw, (MARGIN, height - 68, WIDTH - 2 * MARGIN, 24), first, font="small", color=MUTED)
    _put(draw, (MARGIN, height - 42, WIDTH - 2 * MARGIN, 24), second, font="small", color=MUTED)


def _table_height(rows, row_height=66):
    return 90 + max(1, min(MAX_ROWS, len(rows))) * row_height


def _table(draw, x, y, width, title, rows, columns, *, identity="robot", row_height=66,
           compact=False, empty="No eligible entries this week."):
    rows = rows[:MAX_ROWS]
    height = _table_height(rows, row_height)
    draw.rounded_rectangle((x, y, x + width, y + height), radius=12, fill=PAPER, outline=GRID, width=1)
    _put(draw, (x + 20, y + 8, width - 40, 40), title, font="heading")
    header_y = y + 50
    draw.rectangle((x + 1, header_y, x + width - 1, header_y + 40), fill=TEAL)
    scale = width / sum(column.width for column in columns)
    bounds, offset = [], 0
    for column in columns:
        right = round(offset + column.width * scale)
        left = round(offset)
        bounds.append((x + left, right - left, column))
        _put(draw, (x + left + 12, header_y, right - left - 24, 40), column.heading,
             font="header", color=PAPER, align=column.align)
        offset += column.width * scale
    if not rows:
        _put(draw, (x + 24, header_y + 40, width - 48, row_height), empty,
             font="compact" if compact else "body", color=MUTED)
        return height
    for index, row in enumerate(rows):
        top = header_y + 40 + index * row_height
        fill = HIGHLIGHT if row.get("rank") == 1 else ALTERNATE if index % 2 else PAPER
        draw.rectangle((x + 1, top, x + width - 1, top + row_height - 1), fill=fill)
        if index:
            draw.line((x + 1, top, x + width - 1, top), fill=GRID)
        for left, column_width, column in bounds:
            key = column.key
            box = (left + 12, top, column_width - 24, row_height)
            font = "compact_number" if compact else "number"
            color = INK
            if key == "identity":
                name = _robot(row) if identity == "robot" else row.get("author") or row.get("author_id") or "Unattributed"
                name_font = "compact_strong" if compact else "strong"
                suffix = " *" if row.get("provisional") else ""
                if identity == "robot":
                    _put(draw, (box[0], top + 7, box[2], 28), str(name) + suffix, font=name_font)
                    _put(draw, (box[0], top + 34, box[2], 23), _identity(row), font="small", color=MUTED)
                else:
                    _put(draw, box, str(name) + suffix, font=name_font)
                continue
            if key in ("rating", "points"):
                value = _number(row.get(key), 1).replace(",", "") if key == "rating" else _number(row.get(key), 1)
            elif key in ("win_rate", "survival_rate"):
                value = _percent(row.get(key))
            elif key == "average_place":
                value = _number(row.get(key), 2)
            elif key == "record":
                value = _record(row)
                font = "small" if compact else "compact_number"
            elif key == "rank_change":
                value = _movement(row.get(key))
                try:
                    color = TEAL if float(row.get(key, 0)) > 0 else WARM if float(row.get(key, 0)) < 0 else MUTED
                except (TypeError, ValueError):
                    color = MUTED
            elif key == "last_seen":
                value, font = row.get(key) or "—", "small"
            else:
                value = _count(row.get(key))
            _put(draw, box, value, font=font, color=color, align=column.align)
        for left, _, _ in bounds[1:]:
            draw.line((left, top, left, top + row_height), fill=GRID)
    return height


def _current(report):
    robots, authors = report.get("overall", []), report.get("authors", [])
    robot_height, author_height = _table_height(robots), _table_height(authors, 56)
    height = 185 + robot_height + 30 + author_height + 100
    subtitle = (f"{len(robots)} ranked robots · {len(authors)} attributed authors · "
                f"{_number(report.get('battle_count'))} battles · fresh ratings every week")
    image, draw = _canvas(height, "The weekly field", subtitle, report.get("week"))
    columns = [Column("#", 65, "rank"), Column("Robot / author · version", 399, "identity", "left"),
               Column("Rating", 110, "rating"), Column("Δ rank", 88, "rank_change"),
               Column("Games", 90, "games"), Column("Win %", 90, "win_rate"),
               Column("Alive %", 90, "survival_rate"), Column("Avg place", 120, "average_place"),
               Column("W–D–L", 152, "record")]
    _table(draw, MARGIN, 185, WIDTH - 2 * MARGIN, "Leading robots · overall", robots, columns)
    columns = [Column("#", 70, "rank"), Column("Author", 460, "identity", "left"),
               Column("Best rating", 150, "rating"), Column("Δ rank", 120, "rank_change"),
               Column("Robots", 110, "robots"), Column("Games", 130, "games"),
               Column("Wins", 110, "wins"), Column("Win %", 144, "win_rate")]
    _table(draw, MARGIN, 185 + robot_height + 30, WIDTH - 2 * MARGIN,
           "Leading authors · this week", authors, columns, identity="author", row_height=56,
           empty="No attributed authors yet. Add the submission metadata header to your robot.")
    _footer(draw, height, "Overall weights formats equally. Author rating = their strongest robot. ↑ / ↓ compares the previous recorded week.",
            "W–D–L = wins, draws, losses. Alive % = survives the final tick. k = thousand. * Provisional. Full standings attached.")
    return image


def _formats(report):
    modes = report.get("modes", {})
    rows = [modes.get(str(size), {}).get("standings", []) for size in range(2, 6)]
    heights = [max(_table_height(rows[start], 64), _table_height(rows[start + 1], 64)) for start in (0, 2)]
    height = 185 + sum(heights) + 28 + 100
    image, draw = _canvas(height, "Four ways to compete", "Compare head-to-head strength with multiplayer survival.", report.get("week"))
    gap = 28
    width = (WIDTH - 2 * MARGIN - gap) // 2
    # Individual mode tables prioritize an identifiable robot, rating and actual
    # win/survival rates; the overall panel provides the wider W–D–L breakdown.
    columns = [Column("#", 56, "rank"), Column("Robot / author", 250, "identity", "left"),
               Column("Rating", 112, "rating"), Column("Games", 104, "games"),
               Column("Win", 76, "win_rate"), Column("Alive", 90, "survival_rate")]
    for index, size in enumerate(range(2, 6)):
        x = MARGIN + (index % 2) * (width + gap)
        y = 185 + (heights[0] + gap if index >= 2 else 0)
        title = "2 robots · head-to-head" if size == 2 else f"{size} robots · free-for-all"
        _table(draw, x, y, width, title, rows[index], columns, row_height=64, compact=True,
               empty="Not enough eligible robots for this format.")
    _footer(draw, height, "Each robot gets equal game counts within a format; every group rotates through all execution slots.",
            "Rating measures survival placement. Win % requires being the sole survivor. * Provisional. Full names and versions are attached.")
    return image


def _history(report):
    history = report.get("history") or {}
    authors, robots = history.get("authors", []), history.get("robots", [])
    author_height, robot_height = _table_height(authors, 56), _table_height(robots)
    height = 185 + author_height + 30 + robot_height + 100
    weeks = history.get("weeks", 0)
    subtitle = (f"{_number(weeks)} recorded {'week' if weeks == 1 else 'weeks'} · one weekly result per stable author and robot identity"
                if weeks else "Weekly history begins with the first saved league result.")
    image, draw = _canvas(height, "The long game", subtitle, report.get("week"))
    columns = [Column("#", 70, "rank"), Column("Author", 450, "identity", "left"),
               Column("Points", 150, "points"), Column("Weeks", 120, "weeks"),
               Column("#1 weeks", 140, "weekly_wins"), Column("Best rank", 140, "best_rank"),
               Column("Last seen", 174, "last_seen")]
    _table(draw, MARGIN, 185, WIDTH - 2 * MARGIN, "Leading authors · history", authors, columns,
           identity="author", row_height=56, empty="No author history yet. Attribution keeps results connected across weeks.")
    columns[1] = Column("Robot / author · latest version", 450, "identity", "left")
    _table(draw, MARGIN, 185 + author_height + 30, WIDTH - 2 * MARGIN,
           "Leading robots · history", robots, columns,
           empty="No robot history yet. Stable robot IDs connect future versions to the same record.")
    _footer(draw, height, "Historical points follow the league's weekly scoring rules. #1 weeks includes shared first places.",
            "Fresh weekly ratings still reset each week. Historical identity follows stable IDs, not filenames or version strings.")
    return image


def render_tables(report: dict, output_dir: Path) -> list[dict]:
    """Write three compact PNG attachments and return their Discord descriptors."""
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    for filename, _, _ in PANELS:
        (output_dir / filename).unlink(missing_ok=True)
    if report.get("status") != "completed" or not report.get("overall"):
        raise ValueError("Only a completed, nonempty leaderboard can be rendered")
    result = []
    for (filename, title, description), render in zip(PANELS, (_current, _formats, _history)):
        image = render(report)
        temporary = None
        try:
            with tempfile.NamedTemporaryFile(dir=output_dir, prefix=".league-table-", suffix=".png", delete=False) as stream:
                temporary = Path(stream.name)
            image.save(temporary, format="PNG", optimize=True)
            os.replace(temporary, output_dir / filename)
        finally:
            image.close()
            if temporary is not None:
                temporary.unlink(missing_ok=True)
        result.append({"filename": filename, "title": title, "description": description})
    if sum((output_dir / item["filename"]).stat().st_size for item in result) > MAX_PNG_BYTES:
        for item in result:
            (output_dir / item["filename"]).unlink(missing_ok=True)
        raise ValueError("Leaderboard table images exceed the 2 MiB Discord attachment budget")
    return result


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report-dir", type=Path, default=Path("build/weekly"))
    args = parser.parse_args(argv)
    report = json.loads((args.report_dir / "leaderboard.json").read_text(encoding="utf-8"))
    print(json.dumps(render_tables(report, args.report_dir), indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
