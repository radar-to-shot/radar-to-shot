"""Render and deliver a bounded Discord leaderboard without logging its secret."""
from __future__ import annotations

import argparse
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


def display_name(value: str) -> str:
    # Keep robot-controlled text inside a code block. Mentions are also disabled
    # in the payload; replacing control characters prevents forged table lines.
    return "".join(character if character.isprintable() and character not in "`<>@"
                   else "_" for character in value)[:48]


def payload(report: dict, run_url: str) -> dict:
    if report.get("status") != "completed" or not report.get("overall"):
        raise ValueError("Only a completed, nonempty leaderboard can be posted")
    if not re.fullmatch(r"https://github\.com/[\w.-]+/[\w.-]+/actions/runs/\d+", run_url):
        raise ValueError("run-url must identify a GitHub Actions run")
    tables = [("Overall · equal weight per battle size", report["overall"])] + [
        (f"{size}-robot battles", mode["standings"]) for size, mode in report["modes"].items()]
    embeds = []
    for title, rows in tables:
        lines = ["Rank Rating Robot"]
        for row in rows[:10]:
            lines.append(f"{row['rank']:>4} {row['rating']:>6.1f} {display_name(row['id'])}"
                         + (" *" if row["provisional"] else ""))
        embeds.append({"title": title, "description": "```text\n" + "\n".join(lines) + "\n```",
                       "color": 0x18594E})
    excluded = sum("error" in entry for entry in report["participants"])
    unavailable = report["unavailable_modes"]
    content = (f"**Robot Warriors · {report['week']}**\n"
               f"{len(report['overall'])} ranked robots · {report['battle_count']:,} battles · "
               f"fresh Elo-style ratings\n{run_url}\n"
               "Top 10 per table; complete standings attached. * = provisional.")
    if excluded:
        content += f"\n{excluded} invalid script(s) are unranked; see attachments."
    if unavailable:
        content += "\nToo few robots for: " + ", ".join(f"{size}-way" for size in unavailable) + "."
    result = {"content": content, "allowed_mentions": {"parse": []}, "embeds": embeds,
              "attachments": [{"id": 0, "filename": "leaderboard.json"},
                              {"id": 1, "filename": "leaderboard.md"}]}
    if len(content) > 2000 or len(embeds) > 10 or sum(
            len(embed["title"]) + len(embed["description"]) for embed in embeds) > 6000:
        raise ValueError("Leaderboard exceeds Discord message limits")
    return result


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
    if len(files) != 2 or sum(map(len, files)) > 8 * 1024 * 1024:
        raise ValueError("Discord attachments exceed the conservative 8 MiB limit")
    boundary = "robotwar-" + uuid.uuid4().hex
    chunks = [f'--{boundary}\r\nContent-Disposition: form-data; name="payload_json"\r\n'
              'Content-Type: application/json\r\n\r\n'.encode() + json.dumps(message).encode() + b"\r\n"]
    for index, (name, data) in enumerate(zip(("leaderboard.json", "leaderboard.md"), files)):
        chunks.append((f'--{boundary}\r\nContent-Disposition: form-data; name="files[{index}]"; '
                       f'filename="{name}"\r\nContent-Type: application/octet-stream\r\n\r\n').encode()
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
        files = [(args.report_dir / name).read_bytes() for name in ("leaderboard.json", "leaderboard.md")]
        message = payload(json.loads(files[0]), args.run_url)
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
