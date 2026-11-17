"""Record the weekly five-way leaders in a separate, reproducible GIF showcase.

The exhibition never contributes rating evidence. Frames use observed native
snapshots; accelerated playback samples the whole battle without truncating it.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import selectors
import subprocess
import sys
import tempfile
import time

from PIL import Image, ImageDraw, ImageFont

from battle_runner import ROOT, read_robot, write_result

MAX_FRAMES = 240
MAX_GIF_BYTES = 4 * 1024 * 1024
WIDTH, HEIGHT = 768, 782


def showcase_seed(week: str, order: list[str]) -> int:
    data = json.dumps(["robotwar-showcase-v1", week, order], ensure_ascii=True,
                      separators=(",", ":")).encode()
    return 1 + int.from_bytes(hashlib.sha256(data).digest()[:8], "big") % 0x7FFFFFFE


def select_finalists(report: dict) -> list[dict]:
    if report.get("status") != "completed":
        raise ValueError("A showcase requires a completed weekly league")
    # The table already orders equal displayed ratings by identity. Reusing its
    # order makes the fifth-place cutoff explicit and reproducible.
    rows = report.get("modes", {}).get("5", {}).get("standings", [])
    if len(rows) < 5:
        return []
    finalists = rows[:5]
    if len({row["id"] for row in finalists}) != 5:
        raise ValueError("The five-way leaderboard contains duplicate finalists")
    return finalists


class NativeSession:
    """A bounded JSONL conversation, including timeout-safe writes and cleanup."""

    def __init__(self, binary: Path, timeout=30):
        self.timeout = timeout
        self.stderr = tempfile.TemporaryFile()
        try:
            self.process = subprocess.Popen([str(Path(binary).resolve()), "jsonl"],
                                            stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                            stderr=self.stderr, bufsize=0)
        except Exception:
            self.stderr.close()
            raise
        os.set_blocking(self.process.stdin.fileno(), False)
        os.set_blocking(self.process.stdout.fileno(), False)
        self.buffer = bytearray()

    def request(self, request: dict) -> dict:
        pending = memoryview((json.dumps(request, ensure_ascii=True) + "\n").encode())
        deadline = time.monotonic() + self.timeout
        with selectors.DefaultSelector() as selector:
            selector.register(self.process.stdin, selectors.EVENT_WRITE)
            selector.register(self.process.stdout, selectors.EVENT_READ)
            while True:
                if not pending and b"\n" in self.buffer:
                    line, _, self.buffer = self.buffer.partition(b"\n")
                    try:
                        result = json.loads(line)
                    except ValueError:
                        raise RuntimeError("Showcase engine returned invalid JSON") from None
                    if "exception" in result:
                        raise RuntimeError(f"Showcase engine rejected the request: {result['exception']}")
                    return result
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    raise TimeoutError("Showcase engine request exceeded its time limit")
                for key, _ in selector.select(remaining):
                    try:
                        if key.fileobj is self.process.stdin:
                            pending = pending[os.write(key.fd, pending):]
                            if not pending:
                                selector.unregister(self.process.stdin)
                        else:
                            chunk = os.read(key.fd, 65536)
                            if not chunk:
                                raise RuntimeError("Showcase engine ended before returning a result")
                            self.buffer.extend(chunk)
                            if len(self.buffer) > 4 * 1024 * 1024:
                                raise RuntimeError("Showcase engine response exceeded 4 MiB")
                    except (BrokenPipeError, ConnectionResetError):
                        raise RuntimeError("Showcase engine connection closed unexpectedly") from None

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        if self.process.poll() is None:
            self.process.terminate()
        try:
            self.process.wait(timeout=2)
        except subprocess.TimeoutExpired:
            self.process.kill()
            self.process.wait()
        self.process.stdin.close()
        self.process.stdout.close()
        self.stderr.close()


def capture(request: dict, binary: Path, *, max_frames=MAX_FRAMES, timeout=120) -> tuple[list[dict], dict, int]:
    if not 3 <= max_frames <= MAX_FRAMES:
        raise ValueError(f"max_frames must be between 3 and {MAX_FRAMES}")
    ticks = request["ticks"]
    if type(ticks) is not int or not 1 <= ticks <= 1_000_000:
        raise ValueError("Showcase tick limit must be an integer from 1 to 1000000")
    interval = max(1, math.ceil(ticks / (max_frames - 1)))
    deadline = time.monotonic() + timeout
    frames = []
    with NativeSession(binary, timeout=min(30, timeout)) as session:
        state = session.request({"kind": "battle_start", **request})
        frames.append({key: state[key] for key in ("tick", "alive", "done", "view")})
        while not state["done"]:
            target = min(ticks, state["tick"] + interval)
            while state["tick"] < target and not state["done"]:
                if time.monotonic() >= deadline:
                    raise TimeoutError("Showcase capture exceeded its overall time limit")
                previous = state["tick"]
                state = session.request({"kind": "battle_step", "ticks": min(100, target - previous)})
                if state["tick"] <= previous or state["tick"] > ticks:
                    raise RuntimeError("Showcase engine did not advance consistently")
            frames.append({key: state[key] for key in ("tick", "alive", "done", "view")})
        session.request({"kind": "battle_stop"})
    final = {key: value for key, value in state.items() if key not in ("done", "view")}
    return frames, final, interval


def _font(size, bold=False):
    name = "DejaVuSans-Bold.ttf" if bold else "DejaVuSans.ttf"
    for path in (Path("/usr/share/fonts/truetype/dejavu") / name, Path(name)):
        try:
            return ImageFont.truetype(str(path), size)
        except OSError:
            pass
    return ImageFont.load_default(size=size)


def _fit_text(draw, value, font, width):
    text = "".join(character if character.isprintable() else " " for character in str(value))
    if draw.textlength(text, font=font) <= width:
        return text
    while text and draw.textlength(text + "…", font=font) > width:
        text = text[:-1]
    return text + "…"


def render_frame(frame, finalists, week, interval, *, final=False):
    """A new monochrome renderer inspired by the original Macintosh game."""
    image = Image.new("L", (WIDTH, HEIGHT), 246)
    draw = ImageDraw.Draw(image)
    title, regular, small, badge = _font(23, True), _font(16), _font(13), _font(15, True)
    draw.rounded_rectangle((12, 12, WIDTH - 13, HEIGHT - 13), radius=5, fill=255, outline=24, width=2)
    for y in range(22, 44, 4):
        draw.line((25, y, WIDTH - 26, y), fill=110)
    draw.rectangle((157, 17, WIDTH - 158, 48), fill=255)
    draw.text((WIDTH / 2, 33), "ROBOT WARRIORS", font=title, fill=16, anchor="mm")
    status = "FINAL STATE" if final else "FIVE-WAY SHOWCASE"
    draw.text((28, 61), f"{week}  /  {status}", font=badge, fill=24)
    draw.text((WIDTH - 28, 61), f"{frame['tick'] / 10:.1f}s  ·  {interval}× playback",
              font=small, fill=70, anchor="ra")

    scale, left, top = 1.5, 98, 90
    point = lambda x, y: (round(left + x * scale), round(top + y * scale))
    draw.rectangle((left, top, *point(381, 313)), fill=255, outline=0, width=2)
    for event in frame["view"].get("events", []):
        if event["kind"] == 1:
            x, y = point(event["x"], event["y"])
            for radius in (6, 12):
                draw.ellipse((x - radius, y - radius, x + radius, y + radius), outline=115, width=1)
    for number, robot in enumerate(frame["view"]["robots"], 1):
        x, y = point(robot["x"], robot["y"])
        ink = 120 if robot.get("cloak") or not robot["active"] else 16
        if robot["active"]:
            if number % 3 == 1:
                draw.rectangle((x - 7, y - 7, x + 7, y + 7), outline=ink, fill=255, width=2)
            elif number % 3 == 2:
                draw.polygon(((x, y - 9), (x + 9, y), (x, y + 9), (x - 9, y)), fill=255, outline=ink, width=2)
            else:
                draw.ellipse((x - 8, y - 8, x + 8, y + 8), outline=ink, fill=255, width=2)
            for angle, length, width in ((robot["aim"], 16, 2), (robot["direction"], 11, 1)):
                radians = math.radians(angle)
                draw.line((x, y, x + math.sin(radians) * length,
                           y - math.cos(radians) * length), fill=ink, width=width)
            draw.ellipse((x - 1, y - 1, x + 1, y + 1), fill=ink)
        else:
            draw.line((x - 5, y - 5, x + 5, y + 5), fill=ink, width=2)
            draw.line((x - 5, y + 5, x + 5, y - 5), fill=ink, width=2)
        draw.text((max(left + 4, min(left + 554, x + 11)), max(top + 4, y - 20)),
                  str(number), font=badge, fill=ink)
        shell = robot.get("shell", {})
        if shell.get("active"):
            sx, sy = point(shell["x"], shell["y"])
            draw.ellipse((sx - 3, sy - 3, sx + 3, sy + 3), fill=0)

    draw.text((30, 581), "ROBOT / VERSION", font=small, fill=85)
    draw.text((333, 581), "AUTHOR", font=small, fill=85)
    draw.text((560, 581), "DAMAGE", font=small, fill=85, anchor="ra")
    draw.text((641, 581), "FUEL", font=small, fill=85, anchor="ra")
    draw.text((738, 581), "STATE", font=small, fill=85, anchor="ra")
    for index, (entrant, robot) in enumerate(zip(finalists, frame["view"]["robots"])):
        y = 608 + index * 28
        if index % 2 == 0:
            draw.rectangle((24, y - 5, 744, y + 22), fill=244)
        draw.rounded_rectangle((28, y - 1, 49, y + 19), radius=3, fill=24 if robot["active"] else 140)
        draw.text((38, y + 9), str(index + 1), font=small, fill=255, anchor="mm")
        label = f"{entrant.get('robot_name', entrant['id'])} · {entrant.get('version', 'unversioned')}"
        draw.text((58, y), _fit_text(draw, label, regular, 264), font=regular, fill=24)
        draw.text((333, y), _fit_text(draw, entrant.get("author", "Unattributed"), regular, 152), font=regular, fill=65)
        draw.text((560, y), f"{robot['damage']}%", font=regular, fill=24, anchor="ra")
        draw.text((641, y), f"{robot['fuel']:,}", font=regular, fill=24, anchor="ra")
        draw.text((738, y), "ALIVE" if robot["active"] else "OUT", font=badge, fill=24, anchor="ra")
    if final:
        survivors = [i for i, robot in enumerate(frame["view"]["robots"]) if robot["active"]]
        verdict = (f"{finalists[survivors[0]].get('robot_name', finalists[survivors[0]]['id'])} wins"
                   if len(survivors) == 1 else "Draw · time limit" if survivors else "Draw · mutual destruction")
        footer = verdict + "  |  Exhibition only · ratings unchanged"
    else:
        footer = "Observed native snapshots · lighter robots are cloaked · exhibition only"
    draw.text((WIDTH / 2, 752), _fit_text(draw, footer, small, WIDTH - 50), font=small, fill=65, anchor="mm")
    palette = Image.new("P", (1, 1))
    palette.putpalette([value for level in range(256) for value in (min(level, 15) * 17,) * 3])
    return image.convert("RGB").quantize(palette=palette, dither=Image.Dither.NONE)


def _write_gif(frames, finalists, week, interval, destination):
    rendered = [render_frame(frame, finalists, week, interval, final=index == len(frames) - 1)
                for index, frame in enumerate(frames)]
    durations = [100] * len(rendered)
    durations[0], durations[-1] = 500, 2400
    rendered[0].save(destination, format="GIF", save_all=True, append_images=rendered[1:],
                     duration=durations, loop=0, optimize=True, disposal=1)
    if destination.stat().st_size > MAX_GIF_BYTES:
        destination.unlink()
        raise RuntimeError("Showcase GIF exceeds 4 MiB; refusing an oversized Discord attachment")


def generate_showcase(report: dict, output_dir: Path, binary: Path, *, max_frames=MAX_FRAMES) -> dict:
    output_dir = Path(output_dir).resolve()
    if output_dir == ROOT or ROOT.is_relative_to(output_dir) or output_dir.is_relative_to(ROOT / "robots"):
        raise ValueError("Showcase output must not overwrite robot sources")
    output_dir.mkdir(parents=True, exist_ok=True)
    for name in ("showcase.gif", "showcase.json"):
        (output_dir / name).unlink(missing_ok=True)
    finalists = select_finalists(report)
    if not finalists:
        result = {"status": "skipped", "reason": "Fewer than five eligible robots in the five-way standings"}
        write_result(result, output_dir / "showcase.json")
        return result
    binary = Path(binary).resolve()
    engine_hash = hashlib.sha256(binary.read_bytes()).hexdigest()
    if engine_hash != report.get("engine_sha256"):
        raise ValueError("Showcase binary differs from the engine used for this league")
    entries = {entry["id"]: entry for entry in report["participants"]}
    robots, identities = [], []
    root = (ROOT / "robots").resolve()
    for row in finalists:
        path = (root / row["id"]).resolve()
        if not path.is_relative_to(root) or not path.is_file():
            raise ValueError("Showcase finalist path must be an existing robot below robots/")
        entry = entries[row["id"]]
        actual_hash = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual_hash != entry["source_sha256"]:
            raise ValueError(f"Showcase source changed since the league: {row['id']}")
        robots.append({**read_robot(path, report["config"]["encoding"]), "name": row["id"]})
        identities.append({"id": row["id"], "source_sha256": actual_hash,
                           "robot_name": row.get("robot_name", row["id"]),
                           "author": row.get("author", "Unattributed"),
                           "version": row.get("version", "unversioned"), "rating": row["rating"]})
    order = [row["id"] for row in finalists]
    seed = showcase_seed(report["week"], order)
    request = {"robots": robots, "seed": seed, "ticks": report["config"]["ticks"],
               "stop_when_finished": True, "include_rng_seed": True, "events": False}
    frames, final, interval = capture(request, binary, max_frames=max_frames)
    temporary = output_dir / ".showcase.gif.tmp"
    try:
        _write_gif(frames, identities, report["week"], interval, temporary)
        os.replace(temporary, output_dir / "showcase.gif")
    finally:
        temporary.unlink(missing_ok=True)
    survivors = [robot["name"] for robot in final["robots"] if robot["active"]]
    gif = (output_dir / "showcase.gif").read_bytes()
    result = {"status": "completed", "gif_file": "showcase.gif", "replay_file": "showcase.json",
              "week": report["week"], "seed": seed, "order": order, "participants": identities,
              "tick_limit": request["ticks"], "tick": final["tick"], "alive": final["alive"],
              "winner": survivors[0] if len(survivors) == 1 else None,
              "termination": "last_survivor" if len(survivors) == 1 else "tick_limit" if survivors else "mutual_destruction",
              "exhibition_only": True, "selection": "First five rows in the final five-way standings; existing tie order is retained",
              "sampling_interval_ticks": interval, "frame_count": len(frames), "frame_duration_ms": 100,
              "intro_hold_ms": 500, "final_hold_ms": 2400,
              "playback_duration_ms": 2900 + max(0, len(frames) - 2) * 100,
              "gif_bytes": len(gif), "gif_sha256": hashlib.sha256(gif).hexdigest(),
              "engine_sha256": engine_hash,
              "final_state_sha256": hashlib.sha256(json.dumps(final, sort_keys=True, separators=(",", ":")).encode()).hexdigest()}
    write_result({"schema_version": 1, **result, "final_state": final, "frames": frames}, output_dir / "showcase.json")
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report-dir", type=Path, default=ROOT / "build/weekly")
    parser.add_argument("--binary", type=Path, default=ROOT / "build/robotwar")
    args = parser.parse_args(argv)
    try:
        report = json.loads((args.report_dir / "leaderboard.json").read_text())
        result = generate_showcase(report, args.report_dir, args.binary)
        for name in ("leaderboard.json", "results.json"):
            path = args.report_dir / name
            if path.exists():
                stored = json.loads(path.read_text())
                stored["showcase"] = result
                write_result(stored, path)
        print(json.dumps(result, indent=2))
        return 0
    except (OSError, ValueError, RuntimeError, TimeoutError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
