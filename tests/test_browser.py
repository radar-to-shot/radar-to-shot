#!/usr/bin/env python3
"""Exercise the actual Pages app and WASM worker in Chromium, at a project URL."""

from __future__ import annotations

import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import json
from pathlib import Path
import re
import threading
import unittest
from urllib.parse import urlsplit

from playwright.sync_api import expect, sync_playwright

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / "build/site"
ARTIFACTS = ROOT / "build/browser"
BROWSER = None
PREFIX = "/radar-to-shot/"
IDLE = "loop\ngoto loop\n"
SELF_SHOOTER = "FIRE_RATE 4\nloop\n0 to shot\ngoto loop\n"


class ProjectHandler(SimpleHTTPRequestHandler):
    def log_message(self, *args):
        pass

    def do_GET(self):
        if not urlsplit(self.path).path.startswith(PREFIX):
            self.send_error(404, "Assets must resolve below the Pages project path")
            return
        super().do_GET()

    def translate_path(self, path):
        return super().translate_path("/" + path.removeprefix(PREFIX))


class BrowserTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not (SITE / "index.html").is_file():
            raise RuntimeError("Build the static site before running browser tests")
        ARTIFACTS.mkdir(parents=True, exist_ok=True)
        cls.server = ThreadingHTTPServer(("127.0.0.1", 0), partial(ProjectHandler, directory=str(SITE)))
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()
        cls.origin = f"http://127.0.0.1:{cls.server.server_port}"
        cls.url = cls.origin + PREFIX
        cls.playwright = sync_playwright().start()
        cls.browser = cls.playwright.chromium.launch(**({"executable_path": BROWSER} if BROWSER else {}))

    @classmethod
    def tearDownClass(cls):
        cls.browser.close()
        cls.playwright.stop()
        cls.server.shutdown()
        cls.server.server_close()

    def setUp(self):
        self.context = self.browser.new_context(viewport={"width": 1440, "height": 1100}, accept_downloads=True)
        self.page = self.context.new_page()
        self.errors = []
        self.external = []
        self.page.on("pageerror", lambda error: self.errors.append(str(error)))
        self.context.on("request", lambda request: self.external.append(request.url)
                        if request.url.startswith("http") and not request.url.startswith(self.origin + "/") else None)
        self.page.goto(self.url)
        self.page.wait_for_function("() => Boolean(window.robotwar)")
        self.page.evaluate("() => window.robotwar.ready()")
        expect(self.page.locator(".participant-checkbox")).to_have_count(2)

    def tearDown(self):
        try:
            self.assertFalse(self.errors, f"Uncaught browser errors: {self.errors}")
            self.assertFalse(self.external, f"The workbench unexpectedly contacted another host: {self.external}")
        finally:
            self.context.close()

    def upload(self, sources):
        files = [{"name": name, "mimeType": "text/plain", "buffer": source.encode("utf-8")}
                 for name, source in sources]
        self.page.locator("#upload-input").set_input_files(files)
        for name, _ in sources:
            label = name.rsplit(".", 1)[0]
            expect(self.page.get_by_role("checkbox", name=f"Include {label} in battle", exact=True)).to_be_visible()

    def choose_custom_pair(self, first=SELF_SHOOTER, second=IDLE):
        for checkbox in self.page.locator(".participant-checkbox").all():
            checkbox.uncheck()
        self.upload([("Shooter.robot", first), ("Survivor.robot", second)])
        expect(self.page.locator(".participant-checkbox:checked")).to_have_count(2)

    def result_download(self):
        with self.page.expect_download() as download_info:
            self.page.locator("#download-result-button").click()
        download = download_info.value
        return json.loads(Path(download.path()).read_text())

    def test_static_reference_and_agent_brief_work_without_javascript(self):
        context = self.browser.new_context(java_script_enabled=False)
        try:
            page = context.new_page()
            page.goto(self.url)
            reference = page.locator("#language-reference").inner_text()
            for word in ("ALLOCATE", "DEFINE", "GOSUB", "ENDINT", "TIME_INT_MASK", "RANDOM", "CLOAKING"):
                self.assertIn(word, reference)
            self.assertGreater(len(reference), 18000)
            self.assertIn("window.robotwar", page.locator("#agent-brief").inner_text())
            for name in ("agent-brief.txt", "language.md", "original-manual.pdf"):
                response = page.request.get(self.url + "docs/" + name)
                self.assertEqual(response.status, 200, name)
            self.assertGreater(page.locator("#language-reference .toc a").count(), 8)
            # Verify every local documentation link and every section anchor.
            for target in page.locator("#language-reference a").evaluate_all("links => links.map(a => a.getAttribute('href'))"):
                if target.startswith("#"):
                    self.assertEqual(page.locator(f'[id="{target[1:]}"]').count(), 1, target)
                elif target.startswith("./docs/"):
                    self.assertEqual(page.request.get(self.url + target[2:]).status, 200, target)
        finally:
            context.close()

    def test_samples_upload_edit_compile_and_source_download(self):
        expected_names = sorted(path.name for path in (ROOT / "robots/examples").iterdir() if path.is_file())
        labels = self.page.locator("#sample-select option").all_text_contents()
        self.assertEqual(sorted(labels), expected_names)
        self.page.locator("#sample-select").select_option(label="Seeker")
        self.page.locator("#add-sample-button").click()
        expect(self.page.get_by_role("checkbox", name="Include Seeker in battle", exact=True)).to_be_checked()
        self.upload([("Café.robot", "; café\r\n" + IDLE.replace("\n", "\r\n"))])
        self.page.locator("#compile-button").click()
        expect(self.page.locator("#compile-status")).to_contain_text("instructions")
        self.page.locator("#source-editor").fill("ALLOCATE\n")
        self.page.locator("#compile-button").click()
        expect(self.page.locator("#compile-feedback")).to_have_class(re.compile(".*error.*"))
        self.page.locator("#source-editor").fill(IDLE)
        self.page.locator("#compile-button").click()
        expect(self.page.locator("#compile-status")).to_contain_text("instructions")
        with self.page.expect_download() as download_info:
            self.page.locator("#download-source-button").click()
        self.assertEqual(Path(download_info.value.path()).read_text(), IDLE)

    def test_all_five_samples_can_participate_and_sixth_is_not_selected(self):
        for name in ("Run Away", "Seeker", "Wall Crawler"):
            self.page.locator("#sample-select").select_option(label=name)
            self.page.locator("#add-sample-button").click()
        expect(self.page.locator(".participant-checkbox:checked")).to_have_count(5)
        self.upload([("Extra.robot", IDLE)])
        expect(self.page.locator(".participant-checkbox:checked")).to_have_count(5)
        self.page.locator("#watch-battle").uncheck()
        self.page.locator("#ticks-input").fill("3")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#download-result-button")).to_be_enabled()
        result = self.result_download()
        self.assertEqual(len(result["robots"]), 5)
        self.assertEqual(result["tick"], 3)

    def test_browser_api_matches_original_fixture_and_recovers_from_errors(self):
        corpus = json.loads((ROOT / "tests/golden/battle_runner.json").read_text())
        fixture = next(case for case in corpus["vectors"] if case["id"] == "battle_runner_last_survivor_two")
        request = {"seed": fixture["input"]["seed"], "ticks": fixture["input"]["ticks"],
                   "robots": [{"name": robot["name"], "source": bytes.fromhex(robot["source_hex"]).decode("mac_roman")}
                              for robot in fixture["input"]["robots"]]}
        first = self.page.evaluate("input => window.robotwar.battle(input)", request)
        self.assertEqual(first, fixture["expected"])
        self.assertEqual(first, self.page.evaluate("input => window.robotwar.battle(input)", request))
        errors = self.page.evaluate("""async () => {
          const messages=[];
          for (const operation of [
            () => robotwar.request({kind:'unknown'}),
            () => robotwar.compile('; 🚀\\nloop\\ngoto loop\\n'),
            () => robotwar.request({kind:'compile',source:'x'.repeat(600000)})
          ]) { try { await operation(); } catch(e) { messages.push(e.message); } }
          return messages;
        }""")
        self.assertEqual(len(errors), 3)
        self.assertEqual(self.page.evaluate("source => robotwar.compile(source)", IDLE)["error"], "")
        self.assertFalse(self.page.evaluate("crossOriginIsolated"), "The site must work without custom Pages headers")

    def test_live_battle_updates_arena_and_matches_fast_result(self):
        self.choose_custom_pair()
        self.page.locator("#watch-battle").check()
        self.page.locator("#battle-speed").select_option("16")
        self.page.locator("#ticks-input").fill("100")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#download-result-button")).to_be_enabled(timeout=15000)
        actual = self.result_download()
        self.assertTrue(actual.pop("done"))
        view = actual.pop("view")
        self.assertEqual((view["width"], view["height"]), (381, 313))
        self.assertEqual([(robot["x"], robot["y"]) for robot in view["robots"]],
                         [tuple(robot["registers"][:2]) for robot in actual["robots"]])
        expected = self.page.evaluate("input => robotwar.battle(input)", {
            "robots": [{"name": "Shooter", "source": SELF_SHOOTER}, {"name": "Survivor", "source": IDLE}],
            "seed": 1, "ticks": 100,
        })
        self.assertEqual(actual, expected)
        self.assertEqual(actual["tick"], 30)
        expect(self.page.locator("#outcome-title")).to_contain_text("Survivor")
        expect(self.page.locator("#arena-empty")).to_be_hidden()
        self.assertGreater(self.page.locator("#arena-robots > g").count(), 0)
        self.page.locator("#results").scroll_into_view_if_needed()
        self.page.screenshot(path=str(ARTIFACTS / "desktop-battle.png"))

    def test_cancellation_keeps_page_responsive_and_clears_previous_winner(self):
        self.choose_custom_pair(IDLE, IDLE)
        self.page.locator("#watch-battle").uncheck()
        self.page.locator("#ticks-input").fill("2")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#download-result-button")).to_be_enabled()
        self.page.locator("#seed-input").fill("-1")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#app-error")).to_contain_text("Random seed")
        expect(self.page.locator("#download-result-button")).to_be_disabled()
        expect(self.page.locator("#result-content")).to_be_hidden()
        self.page.locator("#seed-input").fill("1")
        self.page.locator("#watch-battle").check()
        self.page.locator("#battle-speed").select_option("1")
        self.page.locator("#ticks-input").fill("1000")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#arena")).to_have_attribute("aria-label", re.compile("Live battlefield after [1-9]"))
        self.page.locator("#cancel-button").click()
        expect(self.page.locator("#battle-status")).to_contain_text("cancelled")
        expect(self.page.locator("#download-result-button")).to_be_disabled()
        self.page.evaluate("() => robotwar.ready()")
        expect(self.page.locator("#battle-status")).to_contain_text("cancelled")
        self.assertEqual(self.page.evaluate("source => robotwar.compile(source)", IDLE)["error"], "")
        self.assertNotIn("wins.", self.page.locator("#result-content").inner_text())
        self.page.locator("#source-editor").fill("ALLOCATE\n")
        self.page.locator("#run-button").click()
        expect(self.page.locator("#app-error")).to_contain_text("could not compile")
        expect(self.page.locator("#download-result-button")).to_be_disabled()

    def test_immediate_reload_preserves_last_source_edit(self):
        source = IDLE + "; final edit before reload\n"
        with self.page.expect_navigation():
            self.page.evaluate("""source => {
              const editor=document.getElementById('source-editor');
              editor.value=source;
              editor.dispatchEvent(new Event('input',{bubbles:true}));
              location.reload();
            }""", source)
        self.page.wait_for_function("() => Boolean(window.robotwar)")
        self.page.evaluate("() => robotwar.ready()")
        expect(self.page.locator("#source-editor")).to_have_value(source)

    def test_pending_sample_load_cannot_change_a_running_roster(self):
        pending = []
        self.page.route("**/samples/Seeker.robot", lambda route: pending.append(route))
        self.page.locator("#sample-select").select_option(label="Seeker")
        with self.page.expect_request("**/samples/Seeker.robot"):
            self.page.locator("#add-sample-button").click()
        expect(self.page.locator("#run-button")).to_be_disabled()
        self.page.locator("#run-button").evaluate("button => button.click()")
        expect(self.page.locator("#cancel-button")).to_be_hidden()
        expect(self.page.locator(".participant-checkbox:checked")).to_have_count(2)
        self.assertEqual(len(pending), 1)
        pending[0].fulfill(status=200, body=(ROOT / "robots/examples/Seeker").read_bytes(),
                           content_type="text/plain")
        expect(self.page.get_by_role("checkbox", name="Include Seeker in battle", exact=True)).to_be_checked()
        expect(self.page.locator(".participant-checkbox:checked")).to_have_count(3)
        expect(self.page.locator("#run-button")).to_be_enabled()

    def test_mac_roman_upload_mobile_layout_and_literal_filename(self):
        self.page.locator(".upload-options summary").click()
        self.page.locator("#upload-encoding").select_option("macintosh")
        self.page.locator("#upload-input").set_input_files({
            "name": "<img onerror=alert(1)>.robot", "mimeType": "text/plain",
            "buffer": ("; café\r" + IDLE.replace("\n", "\r")).encode("mac_roman"),
        })
        expect(self.page.locator("#robot-name")).to_have_value("<img onerror=alert(1)>")
        self.assertEqual(self.page.locator("#robot-list img").count(), 0)
        self.page.locator("#compile-button").click()
        expect(self.page.locator("#compile-status")).to_contain_text("instructions")
        self.page.set_viewport_size({"width": 390, "height": 844})
        self.assertLessEqual(self.page.evaluate("document.documentElement.scrollWidth"), 391)
        self.page.locator("#workbench").scroll_into_view_if_needed()
        self.page.screenshot(path=str(ARTIFACTS / "mobile-workbench.png"))
        self.page.locator("#language").scroll_into_view_if_needed()
        self.assertLessEqual(self.page.evaluate("document.documentElement.scrollWidth"), 391)


def main():
    global SITE, ARTIFACTS, BROWSER
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--site-dir", type=Path, default=SITE)
    parser.add_argument("--artifacts-dir", type=Path, default=ARTIFACTS)
    parser.add_argument("--browser", help="Optional Chromium executable (otherwise Playwright's pinned build)")
    args, remaining = parser.parse_known_args()
    SITE, ARTIFACTS, BROWSER = args.site_dir.resolve(), args.artifacts_dir.resolve(), args.browser
    unittest.main(argv=[__file__, *remaining], verbosity=2)


if __name__ == "__main__":
    main()
