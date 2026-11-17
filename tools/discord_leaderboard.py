"""Render and deliver a bounded Discord leaderboard without logging its secret."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import time
from urllib.error import HTTPError, URLError
from urllib.parse import parse_qs, urlencode, urlsplit, urlunsplit
from urllib.request import HTTPRedirectHandler, Request, build_opener
import uuid

MAX_ATTACHMENT_BYTES = 8 * 1024 * 1024
TABLE_FILES = ("leaderboard-current.png", "leaderboard-formats.png", "leaderboard-history.png")
MIME_TYPES = {
    "leaderboard.json": "application/json",
    "leaderboard.md": "text/markdown; charset=utf-8",
    **{name: "image/png" for name in TABLE_FILES},
    "showcase.gif": "image/gif",
}


def display_name(value: str, limit: int = 48) -> str:
    # Keep robot-controlled text inside a code block. Mentions are also disabled
    # in the payload; replacing control characters prevents forged table lines.
    text = "".join(character if character.isprintable() and character not in "`<>@"
                   else "_" for character in str(value))
    return text if len(text) <= limit else text[:limit - 1] + "…"


def robot_label(row: dict) -> str:
    label = display_name(row.get("robot_name") or row["id"], 40)
    version = row.get("version")
    if version and version != "unversioned":
        label += " v" + display_name(version, 20)
    author = row.get("author")
    if author:
        label += " · " + display_name(author, 36)
    return label


def leaders_line(rows: list[dict], *, authors=False) -> str:
    leaders = [row for row in rows if row["rank"] == 1]
    if not leaders:
        return "Author standings await attributed submissions." if authors else ""
    labels = [display_name(row.get("author") or row.get("author_id"), 60) if authors
              else robot_label(row) for row in leaders[:2]]
    kind = "Author" if authors else "Robot"
    line = f"{kind} {'leader' if len(leaders) == 1 else 'leaders'}: " + ", ".join(
        f"`{label}`" for label in labels)
    if len(leaders) > len(labels):
        line += f" (+{len(leaders) - len(labels)} tied)"
    return line


def text_tables(report: dict) -> list[dict]:
    """Readable fallback for archived reports that predate rendered tables."""
    tables = [("Overall · equal weight per battle size", report["overall"])] + [
        (f"{size}-robot battles", mode["standings"]) for size, mode in report["modes"].items()]
    embeds = []
    for title, rows in tables:
        lines = ["Rank Rating Games Win% Robot / author"]
        for row in rows[:10]:
            rate = row.get("win_rate")
            rate_text = f"{100 * rate:.0f}%" if rate is not None else "—"
            lines.append(f"{row['rank']:>4} {row['rating']:>6.1f} {row.get('games', 0):>5} "
                         f"{rate_text:>4} {display_name(robot_label(row), 48)}"
                         + (" *" if row.get("provisional") else ""))
        embeds.append({"title": title, "description": "```text\n" + "\n".join(lines) + "\n```",
                       "color": 0x333333})
    return embeds


def _message_limits(message: dict) -> None:
    # Counting UTF-16 code units is conservative for Discord's string limits,
    # including metadata containing characters outside the basic Unicode plane.
    units = lambda text: len(text.encode("utf-16-le")) // 2
    embeds = message["embeds"]
    if (units(message["content"]) > 2000 or len(embeds) > 10 or
            any(units(embed["title"]) > 256 or units(embed["description"]) > 4096 for embed in embeds) or
            sum(units(embed["title"]) + units(embed["description"]) for embed in embeds) > 6000):
        raise ValueError("Leaderboard exceeds Discord message limits")


def payload(report: dict, run_url: str) -> dict:
    if not isinstance(report, dict) or report.get("status") != "completed" or not report.get("overall"):
        raise ValueError("Only a completed, nonempty leaderboard can be posted")
    if not re.fullmatch(r"https://github\.com/[\w.-]+/[\w.-]+/actions/runs/\d+", run_url):
        raise ValueError("run-url must identify a GitHub Actions run")
    attachments = [{"id": 0, "filename": "leaderboard.json"},
                   {"id": 1, "filename": "leaderboard.md"}]
    if "table_images" in report:
        images = report["table_images"]
        if (not isinstance(images, list) or len(images) != len(TABLE_FILES)
                or any(not isinstance(image, dict) or not isinstance(image.get("filename"), str)
                       for image in images)
                or {image.get("filename") for image in images} != set(TABLE_FILES)):
            raise ValueError("The complete set of three leaderboard table images is required")
        embeds = []
        for image in images:
            title, description = image.get("title"), image.get("description")
            if not isinstance(title, str) or not isinstance(description, str):
                raise ValueError("Leaderboard image titles and descriptions must be text")
            attachments.append({"id": len(attachments), "filename": image["filename"],
                                "description": display_name(description, 512)})
            embeds.append({"title": title, "description": description, "color": 0x333333,
                           "image": {"url": "attachment://" + image["filename"]}})
        if "showcase" not in report:
            raise ValueError("The weekly report must declare its showcase result before posting")
    else:
        embeds = text_tables(report)
    showcase = report.get("showcase")
    if showcase is not None:
        if not isinstance(showcase, dict) or showcase.get("status") not in ("completed", "skipped"):
            raise ValueError("Only a completed or explicitly skipped showcase can be posted")
        if showcase["status"] == "completed":
            if showcase.get("gif_file") != "showcase.gif":
                raise ValueError("A completed showcase must declare showcase.gif")
            if (type(showcase.get("seed")) is not int or not 0 <= showcase["seed"] <= 0xFFFFFFFF
                    or type(showcase.get("tick")) is not int or not 0 <= showcase["tick"] <= 1_000_000):
                raise ValueError("A completed showcase must include its seed and final tick")
            rows = {row["id"]: row for row in report["overall"]}
            winner = showcase.get("winner")
            if winner is not None and winner not in rows:
                raise ValueError("Showcase winner is not a ranked robot")
            outcome = (f"Winner: `{robot_label(rows[winner])}`." if winner is not None
                       else "No sole survivor; the exhibition finished without a winner.")
            description = ("The five-way table's top five play one extra battle. "
                           "This exhibition does not affect ratings.\n"
                           f"{outcome}\nSeed {showcase['seed']} · {showcase['tick']:,} ticks · "
                           "accelerated playback")
            attachments.append({"id": len(attachments), "filename": "showcase.gif",
                                "description": "Animated five-way exhibition featuring this week's top five robots."})
            embeds.append({"title": "Top-five showdown", "description": description, "color": 0x555555,
                           "image": {"url": "attachment://showcase.gif"}})
        elif not isinstance(showcase.get("reason"), str) or not showcase["reason"].strip():
            raise ValueError("A skipped showcase must explain why it could not run")
    excluded = sum("error" in entry for entry in report["participants"])
    unavailable = report["unavailable_modes"]
    content = (f"**Robot Warriors · {report['week']}**\n"
               f"{len(report['overall'])} ranked robots · {report['battle_count']:,} battles · "
               f"fresh Elo-style ratings\n{run_url}\n"
               "\n" + leaders_line(report["overall"]) + "\n")
    if "authors" in report:
        content += leaders_line(report["authors"], authors=True) + "\n"
    content += "Top 10 per table; full names, versions and statistics are attached. * = provisional."
    if excluded:
        content += f"\n{excluded} invalid script(s) are unranked; see attachments."
    if unavailable:
        content += "\nToo few robots for: " + ", ".join(f"{size}-way" for size in unavailable) + "."
    if showcase and showcase["status"] == "skipped":
        content += "\nShowcase skipped: " + display_name(showcase["reason"], 160)
    result = {"content": content, "allowed_mentions": {"parse": []}, "embeds": embeds,
              "attachments": attachments}
    _message_limits(result)
    return result


def attachment_names(message: dict) -> list[str]:
    # Preserve the original two-file transport ABI for callers predating the
    # attachment manifest. New payloads always declare their complete manifest.
    attachments = message.get("attachments", [{"id": 0, "filename": "leaderboard.json"},
                                               {"id": 1, "filename": "leaderboard.md"}])
    if not isinstance(attachments, list) or not 1 <= len(attachments) <= 10:
        raise ValueError("Discord accepts between one and ten declared attachments")
    names = []
    for index, item in enumerate(attachments):
        if (not isinstance(item, dict) or type(item.get("id")) is not int or item["id"] != index
                or not isinstance(item.get("filename"), str)
                or item.get("filename") not in MIME_TYPES):
            raise ValueError("Invalid Discord attachment manifest")
        names.append(item["filename"])
    if len(set(names)) != len(names):
        raise ValueError("Discord attachment filenames must be unique")
    return names


def validate_files(message: dict, files: list[bytes]) -> list[str]:
    names = attachment_names(message)
    if len(files) != len(names) or any(not isinstance(data, bytes) for data in files):
        raise ValueError("Every declared Discord attachment must have matching bytes")
    if sum(map(len, files)) > MAX_ATTACHMENT_BYTES:
        raise ValueError("Discord attachments exceed the conservative 8 MiB limit")
    for name, data in zip(names, files):
        if name.endswith(".png") and not data.startswith(b"\x89PNG\r\n\x1a\n"):
            raise ValueError(f"Declared table image is not a PNG: {name}")
        if name.endswith(".gif") and data[:6] not in (b"GIF87a", b"GIF89a"):
            raise ValueError("Declared showcase is not a GIF")
    for embed in message.get("embeds", []):
        image_url = embed.get("image", {}).get("url", "")
        if image_url and (not image_url.startswith("attachment://") or image_url[13:] not in names
                          or not MIME_TYPES[image_url[13:]].startswith("image/")):
            raise ValueError("Every Discord embed image must reference a declared attachment")
    return names


def prepare_delivery(report_dir: Path, run_url: str) -> tuple[dict, list[bytes]]:
    report_dir = Path(report_dir)
    report_path = report_dir / "leaderboard.json"
    if report_path.is_symlink() or not report_path.is_file():
        raise ValueError("leaderboard.json must be a regular report file")
    if report_path.stat().st_size > MAX_ATTACHMENT_BYTES:
        raise ValueError("Discord report exceeds the conservative 8 MiB limit")
    report_bytes = report_path.read_bytes()
    report = json.loads(report_bytes)
    message = payload(report, run_url)
    files, total = [], 0
    for name in attachment_names(message):
        path = report_dir / name
        if path.is_symlink() or not path.is_file():
            raise ValueError(f"Missing declared attachment or unsupported symbolic link: {name}")
        total += path.stat().st_size
        if total > MAX_ATTACHMENT_BYTES:
            raise ValueError("Discord attachments exceed the conservative 8 MiB limit")
        files.append(report_bytes if name == "leaderboard.json" else path.read_bytes())
    names = validate_files(message, files)
    showcase = report.get("showcase", {})
    if showcase.get("status") == "completed" and "gif_sha256" in showcase:
        expected = showcase["gif_sha256"]
        actual = hashlib.sha256(files[names.index("showcase.gif")]).hexdigest()
        if not isinstance(expected, str) or not re.fullmatch(r"[0-9a-f]{64}", expected) or actual != expected:
            raise ValueError("Showcase GIF does not match the recorded battle artifact hash")
    return message, files


def webhook_url(secret: str) -> str:
    url = urlsplit(secret)
    if (url.scheme != "https" or url.netloc != "discord.com" or url.fragment
            or not re.fullmatch(r"/api(?:/v\d+)?/webhooks/\d+/[A-Za-z0-9._-]+", url.path)):
        raise ValueError("DISCORD_WEBHOOK_URL must be an HTTPS discord.com webhook URL")
    query = parse_qs(url.query, keep_blank_values=True)
    if set(query) - {"thread_id", "wait"} or any(
            len(values) != 1 for values in query.values()):
        raise ValueError("Unsupported Discord webhook query parameters")
    if "thread_id" in query and not query["thread_id"][0].isdigit():
        raise ValueError("Discord thread_id must be numeric")
    query["wait"] = ["true"]
    return urlunsplit((url.scheme, url.netloc, url.path, urlencode(query, doseq=True), ""))


class NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, request, response, code, message, headers, new_url):
        return None


def send(secret: str, message: dict, files: list[bytes], *, opener=None, sleep=time.sleep) -> str:
    url = webhook_url(secret)
    names = validate_files(message, files)
    boundary = "robotwar-" + uuid.uuid4().hex
    chunks = [f'--{boundary}\r\nContent-Disposition: form-data; name="payload_json"\r\n'
              'Content-Type: application/json\r\n\r\n'.encode() + json.dumps(message).encode() + b"\r\n"]
    for index, (name, data) in enumerate(zip(names, files)):
        chunks.append((f'--{boundary}\r\nContent-Disposition: form-data; name="files[{index}]"; '
                       f'filename="{name}"\r\nContent-Type: {MIME_TYPES[name]}\r\n\r\n').encode()
                      + data + b"\r\n")
    body = b"".join(chunks) + f"--{boundary}--\r\n".encode()
    opener = opener or build_opener(NoRedirect())
    request = Request(url, data=body, headers={"Content-Type": f"multipart/form-data; boundary={boundary}",
                                             "User-Agent": "RobotWarWeeklyLeague/1"}, method="POST")
    for attempt in range(4):
        try:
            with opener.open(request, timeout=30) as response:
                result = json.load(response)
            if not isinstance(result.get("id"), str) or not result["id"].isdigit():
                raise RuntimeError("Discord did not confirm a message ID; inspect the channel before retrying")
            return result["id"]
        except HTTPError as error:
            # A 429 explicitly means the request was not accepted. Retrying other
            # errors/timeouts could duplicate a message whose response was lost.
            if error.code == 429 and attempt < 3:
                try:
                    delay = float(json.loads(error.read()).get("retry_after", 1))
                except (ValueError, TypeError):
                    raise RuntimeError("Discord returned an invalid rate-limit response") from None
                if not 0 <= delay <= 30:
                    raise RuntimeError("Discord requested a longer retry delay; try again later") from None
                sleep(delay + 0.1)
                continue
            raise RuntimeError(f"Discord delivery failed (HTTP {error.code}); webhook URL withheld") from None
        except (URLError, TimeoutError, OSError, ValueError):
            raise RuntimeError("Discord response could not be confirmed; inspect the channel before retrying") from None
    raise RuntimeError("Discord delivery did not complete")


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report-dir", type=Path, default=Path("build/weekly"))
    parser.add_argument("--run-url", required=True)
    parser.add_argument("--dry-run", action="store_true", help="Print the message payload without posting")
    args = parser.parse_args(argv)
    try:
        message, files = prepare_delivery(args.report_dir, args.run_url)
        if args.dry_run:
            print(json.dumps(message, indent=2))
            return 0
        secret = os.environ.get("DISCORD_WEBHOOK_URL", "")
        if not secret:
            raise ValueError("Set the DISCORD_WEBHOOK_URL repository Actions secret for the target channel")
        print(f"Discord leaderboard posted; message ID {send(secret, message, files)}")
        return 0
    except (OSError, ValueError, RuntimeError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
